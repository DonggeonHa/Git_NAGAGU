package com.spring.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.workshop.WorkShopMemberVO;

@Controller
public class AdminController {
	
	@Autowired(required = false)
	private AdminService adminService;
	
	@RequestMapping(value = "/login.ad")
	public String AdminLogin() {
		
		return "Admin/login";
	}
	
	@PostMapping(value = "/Alogin.ad")
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
		mav.setViewName("redirect:index.ad");
		
		return mav;
	}
	
	@RequestMapping(value = "/index.ad")
	public String Menu() {
		
		return "Admin/Aindex";
	}
	
	/*=========================== 공방회원 승인 ==============================*/
	@RequestMapping(value = "/WMemberList.ad")
	public ModelAndView WMemberStatus(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int page = 1; // 초기값 1
		int limit = 10; // 한 페이지당 출력할 글의 수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int startrow = (page -1) * 10 + 1; // 읽기 시작할 row 번호
		int endrow = startrow + limit - 1; // 읽을 마지막 row 번호.
		
		int listcount = adminService.getListCount();
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
		mav.setViewName("Admin/memberStatus");
		
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
		
		int listcount = adminService.getListCount();
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
		mav.setViewName("Admin/memberStatus");
		
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
		
		int listcount = adminService.getListCount();
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
		mav.setViewName("Admin/memberStatus");
		
		return mav;
	}
}
