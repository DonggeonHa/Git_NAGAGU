package com.spring.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.member.MemberVO;
import com.spring.workshop.WorkShopMemberVO;

@Controller
public class AdminController {
	
	@Autowired(required = false)
	private AdminService adminService;
	
	/*========================================= 어드민 =====================================*/
	@RequestMapping(value = "/login.ad")
	public String AdminLogin() {
		
		return "Admin/login";
	}
	
	@RequestMapping(value = "/Alogin.ad", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView Alogin(AdminMemberVO adminVO, HttpSession session, ModelAndView mav) {
		System.out.println("아이디 : " + adminVO.getADMIN_ID());
		System.out.println("비밀번호 : " + adminVO.getADMIN_PASS());
		int res = adminService.user_chk(adminVO);
		System.out.println("admin res는" + res);
		
		if (res == 1) {	//로그인(아이디,비번 맞음)-이메일 인증 완료
			session.setAttribute("ADMIN_NUM", adminVO.getADMIN_NUM());
			
		} else {	//아이디or비번 틀렸을 때
			System.out.println("아이디 또는 비밀번호 틀림");
			return null;
		}
		
		mav.addObject("adminVO", adminVO);
		mav.setViewName("Admin/Aindex");
		
		return mav;
	}
	
	@RequestMapping(value = "/index.ad")
	public String Menu() {
		
		return "Admin/Aindex";
	}
	
	/*=========================== 일반회원관리 ==============================*/
	@RequestMapping(value = "/MemberList.ad")
	public String MemberList() {
		return "Admin/MemberList";
	}
	
	//produces 속성을 이용해 Response의 Content-Type을 제어할 수 있다
	@RequestMapping(value = "/Member.ad", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String MemberList2() {
		List<MemberVO> memberList = adminService.getMembers();
		
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(memberList);
			System.out.println("memberList 변환 : " + str);
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value = "/deleteMember.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> deleteWMember(MemberVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			System.out.println("MEMBER_NUM = " + vo.getMEMBER_NUM());
			int res = adminService.deleteMember(vo);
			
			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "삭제가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	/*=========================== 공방회원관리 ==============================*/
	@RequestMapping(value = "/WMemberList.ad")
	public ModelAndView WMemberList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int page = 1; // 초기값 1
		int limit = 10; // 한 페이지당 출력할 글의 수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int startrow = (page -1) * 10 + 1; // 읽기 시작할 row 번호
		int endrow = startrow + limit - 1; // 읽을 마지막 row 번호.
		
		int listcount = adminService.WmemberListCount();
		List<WorkShopMemberVO> wmemberList = adminService.getWMembers(startrow, endrow);
		
		// 총 페이지의 수
		int maxpage = (int)((double)listcount / limit + 0.95);
		int startpage = (((int)((double)page / 10 + 0.9)) -1) * 10 + 1;
		int endpage = startpage + 10 - 1;
		
		if(endpage > maxpage)
			endpage = maxpage;
		
		
		mav.addObject("page", page);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("startrow", startrow);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("wmemberList", wmemberList);
		mav.setViewName("Admin/WMemberList");
		
		return mav;
	}
	
	@RequestMapping(value = "/updateWMember.ad")
	public ModelAndView updateWMember(WorkShopMemberVO WMember, HttpServletRequest request) {
		adminService.updateStatus(WMember);
		System.out.println("update Complete");
		
		ModelAndView mav = new ModelAndView();
		int page = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int startrow = (page -1) * 10 + 1; // 읽기 시작할 row 번호
		int endrow = startrow + limit - 1; // 읽을 마지막 row 번호.
		
		int listcount = adminService.WmemberListCount();
		List<WorkShopMemberVO> wmemberList = adminService.getWMembers(startrow, endrow);
		
		int maxpage = (int)((double)listcount / limit + 0.95);
		int startpage = (((int)((double)page / 10 + 0.9)) -1) * 10 + 1;
		int endpage = startpage + 10 - 1;
		
		if(endpage > maxpage)
			endpage = maxpage;
		
		
		mav.addObject("page", page);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("startrow", startrow);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("wmemberList", wmemberList);
		mav.setViewName("Admin/WMemberList");
		
		return mav;
	}
	
	@RequestMapping(value = "/deleteWMember.ad")
	public ModelAndView deleteWMember(WorkShopMemberVO WMember, HttpServletRequest request) {
		WorkShopMemberVO vo = new WorkShopMemberVO();
		vo.setWORKSHOP_NUM(WMember.getWORKSHOP_NUM());
		
		adminService.deleteWMember(vo);
		System.out.println("delete Complete");
		
		ModelAndView mav = new ModelAndView();
		int page = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int startrow = (page -1) * 10 + 1; // 읽기 시작할 row 번호
		int endrow = startrow + limit - 1; // 읽을 마지막 row 번호.
		
		int listcount = adminService.WmemberListCount();
		List<WorkShopMemberVO> wmemberList = adminService.getWMembers(startrow, endrow);
		
		int maxpage = (int)((double)listcount / limit + 0.95);
		int startpage = (((int)((double)page / 10 + 0.9)) -1) * 10 + 1;
		int endpage = startpage + 10 - 1;
		
		if(endpage > maxpage)
			endpage = maxpage;
		
		
		mav.addObject("page", page);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("startrow", startrow);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("wmemberList", wmemberList);
		mav.setViewName("Admin/WMemberList");
		
		return mav;
	}
}
