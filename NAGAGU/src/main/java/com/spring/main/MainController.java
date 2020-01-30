package com.spring.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.spring.member.KakaoController;
import com.spring.member.MemberService;
import com.spring.member.MemberVO;
import com.spring.member.NaverLoginBO;

@Controller
public class MainController {
	
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired(required = false)
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired(required = false)
	private MemberService memberService;
	
	@Autowired
	private MainService Mainservice;
	
	@RequestMapping(value = "/index.ma", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView Index(Model model, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
	    String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	    System.out.println("네이버:" + naverAuthUrl);
	    model.addAttribute("naver_url", naverAuthUrl);
      
	    //카카오 인증 url을 view로 전달
	    String kakaoUrI = KakaoController.getAuthorizationUri(session);
	    System.out.println("카카오: "+ kakaoUrI);
	    model.addAttribute("kakao_url", kakaoUrI);

        //네이버 
        mav.setViewName("index");
        
        
		return mav;
	}
	
	//네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/callback.ma", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request)
            throws IOException, ParseException {
    	
    	int email_check = 0;
    	int result = 0;
    	MemberVO memberVO = new MemberVO();
    	
    	//정보동의 취소시 이전페이지로 이동
    	if(code.equals("0")) {
    		return "index.ma";
    	}
        System.out.println("여기는 callback");
        
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        
        model.addAttribute("result", apiResult);
        System.out.println("result"+apiResult);
        /* 네이버 로그인 성공 페이지 View 호출 */
        
        //2. String형식인 apiResult를 json형태로 바꿈
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(apiResult);
        JSONObject jsonObj = (JSONObject) obj;
        
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		String nickname = (String) response_obj.get("nickname");
		String img = (String) response_obj.get("profile_image");
		String email = (String) response_obj.get("email");
		String name = (String) response_obj.get("name");
		
		System.out.println(nickname+" "+img+"  "+email+" "+name);
		
		try {
			memberVO.setMEMBER_NICK(nickname);
			memberVO.setMEMBER_EMAIL(email);
			
			email_check = memberService.email_chk(memberVO);
			
			if(email_check == 0 ) {	//이메일 중복이 없을 때 
				ArrayList<MemberVO> memberList = memberService.get_nick_list();
				
				for(int i=0; i<memberList.size(); i++) {
					if(nickname.equals(memberList.get(i).getMEMBER_NICK())) {
						//닉네임 중복
						double random =  Math.random() * 10000;
						nickname += (int)random;
						
						memberVO.setMEMBER_NICK(nickname);
					}
					break;
				}
				
				memberVO.setMEMBER_PICTURE(img);
				memberVO.setMEMBER_NAME(name);
				memberVO.setMEMBER_PASS("naver_pw");
				memberVO.setMEMBER_STATUS(1);
				result = memberService.insert_sns_member(memberVO);
				
				if(result != 0) {	//성공
					session.setAttribute("MEMBER_EMAIL", memberVO.getMEMBER_EMAIL());
					session.setAttribute("MEMBER_PASS", memberVO.getMEMBER_PASS());
				} else {
					System.out.println("sns 회원가입 컨트롤러 실패");
				}
			} else {	//등록된 회원
				session.setAttribute("MEMBER_EMAIL", memberVO.getMEMBER_EMAIL());
				
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
        return "redirect:/index.ma";
    }
    
    //카카오 로그인 성공
    @RequestMapping(value = "/kakaologin.ma", method = { RequestMethod.GET, RequestMethod.POST })
    public String kakaoLogin(Model model, @RequestParam String code, HttpSession session, HttpServletRequest request)
            throws Exception {
    	int email_check = 0;
    	int result = 0;
    	MemberVO memberVO = new MemberVO();
    	//결과값을 node에 담아줌
    	JsonNode node = KakaoController.getAccessToken(code);
    	//accessToken에 사용자의 로그인한 모든 정보가 들어있음
    	JsonNode accessToken = node.get("access_token");
    	//사용자의 정보
    	JsonNode userInfo = KakaoController.getKaKaoUserInfo(accessToken);
    	
    	String email = null;
    	String img = null;
    	String nickname = null;
    	
    	//유저정보 카카오에서 가져오기 Get properties
    	JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		email = kakao_account.path("email").asText();
		nickname = properties.path("nickname").asText();
		img = properties.path("profile_image").asText();
		System.out.println(nickname+" "+img+"  "+email);
	
		try {
			memberVO.setMEMBER_NICK(nickname);
			memberVO.setMEMBER_EMAIL(email);
			memberVO.setMEMBER_NAME(nickname);
			
			email_check = memberService.email_chk(memberVO);
			
			if(email_check == 0 ) {	//이메일 중복이 없을 때 
				ArrayList<MemberVO> memberList = memberService.get_nick_list();
				
				for(int i=0; i<memberList.size(); i++) {
					if(nickname.equals(memberList.get(i).getMEMBER_NICK())) {
						//닉네임 중복
						double random =  Math.random() * 10000;
						nickname += (int)random;
						
						memberVO.setMEMBER_NICK(nickname);
						break;
					}
				}
				
				memberVO.setMEMBER_PICTURE(img);
				memberVO.setMEMBER_PASS("kakao_pw");
				memberVO.setMEMBER_STATUS(1);
				result = memberService.insert_sns_member(memberVO);
				
				if(result != 0) {	//성공
					session.setAttribute("MEMBER_EMAIL", memberVO.getMEMBER_EMAIL());
					session.setAttribute("MEMBER_PASS", memberVO.getMEMBER_PASS());
				} else {
					System.out.println("sns 회원가입 컨트롤러 실패");
				}
			} else {	//등록된 회원
				session.setAttribute("MEMBER_EMAIL", memberVO.getMEMBER_EMAIL());
				
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/index.ma";
	}
	
	@RequestMapping(value = "/signup.ma")
	public String signup() {
		
		return "signup";
	}
	
	@RequestMapping(value = "/memberInsert.ma")
	public String memberInsert(MemberVO memberVO, RedirectAttributes redirect, HttpServletRequest request) {
		String email  = request.getParameter("MEMBER_EMAIL");
		int result = memberService.insert_member(memberVO);
		
		redirect.addAttribute("MEMBER_EMAIL", email);
		
		if(result != 0) {
			return ("redirect:/mailSending.ma");
		}
		
		return("redirect:/signup.ma");	//실패시 회원가입 창으로 이동
	}
	
	// mailSending 코드
    @RequestMapping(value = "/mailSending.ma")
    public String mailSending(HttpServletRequest request, @RequestParam("MEMBER_EMAIL") String email) {
     
      String setfrom = "jieunkim.itit@gmail.com";  //host 메일 주소
      String title = "NAGAGU 인증메일";	//메일 이름
      String content= "http://localhost:8000/NAGAGU/mealLink.ma?MEMBER_EMAIL=" + email;	//내용
     
      try {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper 
                          = new MimeMessageHelper(message, true, "UTF-8");
   
        messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
        messageHelper.setTo(email);     // 받는사람 이메일
        messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
        messageHelper.setText(content);  // 메일 내용
       
        mailSender.send(message);
        
        
      } catch(Exception e){
        System.out.println(e);
      }
     
      return "redirect:/index.ma";
    }
    
    @RequestMapping(value = "/mealLink.ma", method = RequestMethod.GET)
    public String mealLink(HttpServletRequest request, HttpServletResponse response, MemberVO memberVO) {
    	String member_email = request.getParameter("MEMBER_EMAIL");
    	memberVO.setMEMBER_EMAIL(member_email);
    	
    	response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer;
        
        try {
           writer = response.getWriter();
           int res = memberService.emailLink_chk(memberVO);
           
           if(res == 1) {
        	   writer.write("<script>alert('인증 성공'); location.href='index.ma';</script>");
           }
           
        } catch (Exception e) {
           e.printStackTrace(); 
        }
     
        return null;
    }
    
    @RequestMapping("/logout.ma")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        ModelAndView mv = new ModelAndView("redirect:/");
        
        return mv;
    }
    
    
    @RequestMapping(value = "/summernote.ma", method=RequestMethod.POST)
	public @ResponseBody String handlerFileUpload(MultipartHttpServletRequest request) {
		String img_name = null;
		MultipartFile file = request.getFile("file");
		System.out.println(file.getOriginalFilename());
		
		String url = "C:/Project138/upload/";
		
		try {
			String uploadedFile = Mainservice.summernote(url, file);
			
			img_name = "/communityupload/image/"+uploadedFile;
			System.out.println(img_name);
			
			return img_name;
		}
		catch (Exception e) {
			
			e.printStackTrace();
			return img_name;
		}
	}
}
