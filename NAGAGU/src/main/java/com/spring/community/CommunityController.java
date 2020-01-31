package com.spring.community;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.member.MemberServiceImpl;
import com.spring.member.MemberVO;
@Controller
public class CommunityController {
	
	@Autowired
	private CommunityServiceImpl communityService;
	@Autowired
	private MemberServiceImpl memberService;
	@RequestMapping(value = "/community.cm")
	public String CommunityList(PicsVO picsVO, Model model,MemberVO memberVO, HttpServletRequest request, HttpSession session) {
		
		//페이지
		int page = 1;
		int limit = 9;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int startrow = (page - 1) * 9 + 1; // 읽기 시작할 row 번호.
		int endrow = startrow + limit - 1; //읽을 마지막 row 번호.
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startrow", startrow);
		map.put("endrow", endrow);
				
		// 리스트 가져오기		
		ArrayList<PicsVO> picsList =null;		
		int listcount = 0;
		

		
		//초기값 설정
		String sort= "new";
		String PICS_REVIEW = "0";
		String PICS_CATEGORY = "all";
		//jsp에서 값이 있으면 받아와서 셋팅
		if(request.getParameter("PICS_CATEGORY") != null) {
			PICS_CATEGORY = request.getParameter("PICS_CATEGORY");
		}
		if(request.getParameter("PICS_REVIEW") != null) {
			PICS_REVIEW = request.getParameter("PICS_REVIEW");
		}
		if(request.getParameter("sort") != null) {
			sort = request.getParameter("sort");
		}
		//출력 확인, 맵에 저장(XML에서 사용)
		map.put("PICS_CATEGORY",PICS_CATEGORY);			
		map.put("PICS_REVIEW",PICS_REVIEW);
		map.put("sort",sort);
		
			
		
		//-------------------------------------------검색 옵션
		String keyword ="";
		String option = "";
		if(request.getParameter("keyword")!=null) {
			 keyword = request.getParameter("keyword");
		}
		if(request.getParameter("search_option")!=null) {
			 option = request.getParameter("search_option");
		}
		map.put("option", option);
		map.put("keyword", keyword);
		
		listcount = communityService.getPicsCount(map);
		picsList = communityService.getPicsAll(map);
		
		//-------------------------------------------멤버,멤버프로필사진 가져오기
		ArrayList<MemberVO> memberList =null;		
		memberList = memberService.getMemberList(map);
		//-------------------------------------------

		System.out.print("PICS_CATEGORY= "+ PICS_CATEGORY+"  ");
		System.out.print("PICS_REVIEW =" +PICS_REVIEW+"  ");		
		System.out.print("SORT =" +sort+"  ");
		System.out.print("option검색 = "+option+"  ");
		System.out.println("keyword검색 = "+keyword);

		
		//총 페이지 수
		int maxpage = (int)((double)listcount / limit + 0.95); // 0.95를 더해서 올림 처리
		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1; // 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
		int endpage =startpage + 10 - 1; // 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등..)
		
		if (endpage > maxpage)
			endpage = maxpage;
		//-----------------------------------------------------------------------------------------------------------------
		//멤버디테일 구하기(이메일)
		memberVO.setMEMBER_EMAIL((String)session.getAttribute("MEMBER_EMAIL"));
		MemberVO memberDetailbyEmail = memberService.getMemberDetailbyEmail(memberVO);
		System.out.println(memberVO.getMEMBER_PICTURE());
		model.addAttribute("memberDetailbyEmail",memberDetailbyEmail);
		model.addAttribute("page", page);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("picsList", picsList);
		model.addAttribute("pics_category", PICS_CATEGORY);
		model.addAttribute("pics_review", PICS_REVIEW);
		model.addAttribute("sort", sort);
		model.addAttribute("memberList", memberList);
		
		return "Community/communityList"; 
	}
	
	@RequestMapping(value = "/community_detail.cm")
	public String CommunityDetail(PicsVO picsVO, Model model,MemberVO memberVO, HttpServletRequest request) {
		
		PicsVO picsDetail = communityService.getPicsDetail(picsVO);	
		ArrayList<PicsVO> memberPicsList = communityService.getPicsOfMemberUpload(picsVO);
		MemberVO memberDetail = memberService.getMemberDetail(memberVO);
		System.out.println(memberVO.getMEMBER_PICTURE());
		//댓글 리스트
		//ArrayList<PicsCommentDB> commentList = picsCommentService.getCommentList(picsVO.getPICS_NUM());
		
		model.addAttribute("picsDetail",picsDetail);		
		model.addAttribute("memberDetail",memberDetail);
		model.addAttribute("memberPicsList",memberPicsList);
	//	model.addAttribute("commentList",commentList);
		return "Community/detail";
	}
	@RequestMapping(value = "/community_write.cm")
	public String CommunityWrite(PicsVO picsVO, Model model,MemberVO memberVO, HttpServletRequest request) {		
		MemberVO memberDetail = memberService.getMemberDetail(memberVO);
		model.addAttribute("memberDetail",memberDetail);
		return "Community/write";	
	}
	@RequestMapping(value = "/community_writeAction.cm")
	public String insetPics(MultipartHttpServletRequest request) throws Exception, IOException {	
	
		//picsVO만들어서 값 넣기
		PicsVO picsVO = new PicsVO();
		
		picsVO.setPICS_MEMBER(Integer.parseInt((request.getParameter("PICS_MEMBER"))));
		picsVO.setPICS_NICK(request.getParameter("PICS_NICK"));
		picsVO.setPICS_CATEGORY(request.getParameter("PICS_CATEGORY"));
		picsVO.setPICS_CONTENT_1(request.getParameter("PICS_CONTENT_1"));
		picsVO.setPICS_CONTENT_2(request.getParameter("PICS_CONTENT_2"));
		picsVO.setPICS_CONTENT_3(request.getParameter("PICS_CONTENT_3"));
		picsVO.setPICS_REVIEW(request.getParameter("PICS_REVIEW"));
		picsVO.setPICS_TAG(request.getParameter("PICS_TAG"));
		picsVO.setPICS_REF(1);
		//공방매퍼로 SELECT 필요		
		picsVO.setPICS_WORKSHOP("개인");
		if(request.getParameter("PICS_WORKSHOP")!=null) {
			picsVO.setPICS_WORKSHOP(request.getParameter("PICS_WORKSHOP"));
		}		

		
		
		//파일업로드 시작=-------------------------------------------------
		String uploadPath="C:\\Project138\\upload\\";
	    //사진 개수만큼 파일업로드 시작=-------------------------------------------------
		for (int i = 1; i < 4; i++) {
			if (!request.getFile("PICS_FILE_" + i).isEmpty()) {
				MultipartFile mf = request.getFile("PICS_FILE_" + i);
				String originalFileExtnesion = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtnesion;
				// 파일저장
				if (mf.getSize() != 0) {
					mf.transferTo(new File(uploadPath + storedFileName));
				}
				if (i == 1) {
					picsVO.setPICS_FILE_1(storedFileName);
				}
				if (i == 2) {
					picsVO.setPICS_FILE_2(storedFileName);
				}
				if (i == 3) {
					picsVO.setPICS_FILE_3(storedFileName);
				}
			}
		}
		communityService.insertPics(picsVO);
		return "redirect:./community.cm";	
	}
	@RequestMapping(value = "/community_delete.cm")
	public String community_delete(PicsVO picsVO, HttpServletRequest request) {		
		int result = communityService.deletePics(picsVO);		
		if(result==1) {
			System.out.println("삭제성공");			
		}
		return "redirect:./community.cm";	
	}
	@RequestMapping(value = "/community_update.cm")
	public String community_update(PicsVO picsVO, Model model,MemberVO memberVO) {
		MemberVO memberDetail = memberService.getMemberDetail(memberVO);
		PicsVO picsDetail = communityService.getPicsDetail(picsVO);
		model.addAttribute("memberDetail",memberDetail);
		model.addAttribute("picsDetail",picsDetail);
		return "Community/update";	
	}
	@RequestMapping(value = "/community_updateAction.cm")
	public String updatePics(MultipartHttpServletRequest request) throws Exception, IOException {	
	
		//picsVO만들어서 값 넣기
		PicsVO picsVO = new PicsVO();		
		picsVO.setPICS_NUM(Integer.parseInt(request.getParameter("PICS_NUM")));
		picsVO.setPICS_CATEGORY(request.getParameter("PICS_CATEGORY"));
		picsVO.setPICS_CONTENT_1(request.getParameter("PICS_CONTENT_1"));
		picsVO.setPICS_CONTENT_2(request.getParameter("PICS_CONTENT_2"));
		picsVO.setPICS_CONTENT_3(request.getParameter("PICS_CONTENT_3"));
		picsVO.setPICS_REVIEW(request.getParameter("PICS_REVIEW"));
		picsVO.setPICS_TAG(request.getParameter("PICS_TAG"));		
		//공방매퍼로 SELECT 필요		
		picsVO.setPICS_WORKSHOP("개인");
		if(request.getParameter("PICS_WORKSHOP")!=null) {
			picsVO.setPICS_WORKSHOP(request.getParameter("PICS_WORKSHOP"));
		}		
		
		//파일업로드 시작=-------------------------------------------------
		String uploadPath="C:\\Project138\\upload\\";
		
	    //사진 개수만큼 파일업로드 시작=-------------------------------------------------
		for (int i = 1; i < 4; i++) {
			MultipartFile mf = request.getFile("PICS_FILE_" + i);
			if (mf.getOriginalFilename()!= null && !mf.getOriginalFilename().equals("")) {
				String originalFileExtnesion = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtnesion;
				// 파일저장
				mf.transferTo(new File(uploadPath + storedFileName));
				if (i == 1) {
					System.out.println(storedFileName);
					picsVO.setPICS_FILE_1(storedFileName);
				}
				if (i == 2) {
					System.out.println(storedFileName);
					picsVO.setPICS_FILE_2(storedFileName);
				}
				if (i == 3) {
					System.out.println(storedFileName);
					picsVO.setPICS_FILE_3(storedFileName);
				}
			}
			else{
				if(i==1) {					
					picsVO.setPICS_FILE_1(request.getParameter("PICS_FILE_1"));
				}if(i==2) {
					System.out.println("else 2");
					picsVO.setPICS_FILE_2(request.getParameter("PICS_FILE_2"));
				}if(i==3) {
					System.out.println("else 3");
					picsVO.setPICS_FILE_3(request.getParameter("PICS_FILE_3"));
				}
			}
		}
		communityService.updatePics(picsVO);
		return "redirect:./community.cm";	
	}
	
	@RequestMapping(value = "/deletePicsFile.cm")
	public @ResponseBody Map<String, Object> deletePicsFile(PicsVO picsVO,HttpServletRequest request) {
		String src = request.getParameter("src");
		String uploadPath="C://Project138//upload";
		String path = uploadPath + src;
		System.out.println(path);
		File file =	new File(path);  
		if(file.exists() == true){ 
			file.delete(); 
		}
		String index = request.getParameter("index");
		if(index =="1") {
			picsVO.setPICS_FILE_1("");
		}if(index =="2") {
			picsVO.setPICS_FILE_2("");
		}if(index =="3") {
			picsVO.setPICS_FILE_3("");
		}
		
		picsVO.setPICS_NUM(Integer.parseInt(request.getParameter("picNum")));
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			int result = communityService.deletePicsFile(picsVO);
			retVal.put("res", "OK");
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	} 
	@RequestMapping(value = "/insertPicsLike.cm")
	public @ResponseBody Map<String, Object> getLikeUpdate(PicsVO picsVO,HttpServletRequest request) {
		System.out.println("insert컨트롤러 시작");
		String memberNum = request.getParameter("memberNum");
		String picsNum = request.getParameter("picsNum");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNum", memberNum);
		map.put("picsNum", picsNum);
		
		//picsVO.setPICS_NUM(Integer.parseInt(request.getParameter("picNum")));
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			HashMap<String, Object> returnInfo = communityService.insertMemberLike(map);
			retVal.put("picsLikeCount", returnInfo.get("picsLikeCount"));
			retVal.put("cnt", returnInfo.get("cnt"));//0이면 좋아요+, 1이면 좋아요-
			retVal.put("res", "OK");
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	} 
	 
	
}
