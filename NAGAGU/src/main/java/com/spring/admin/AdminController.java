package com.spring.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "/login.ad")
	public String AdminLogin() {
		
		return "Admin/login";
	}
	
	@PostMapping(value = "/Alogin.ad", produces = "application/json;charset=UTF-8")
	public ModelAndView Alogin(AdminMemberVO adminVO, HttpSession session, ModelAndView mav) {
		int res = adminService.user_chk(adminVO);
		System.out.println("admin res는" + res);
		
		if (res == 1) {	//로그인(아이디,비번 맞음)-이메일 인증 완료
			session.setAttribute("ADMIN_NUM", adminVO.getADMIN_NUM());
			mav.addObject("adminVO", adminVO);
			mav.setViewName("redirect:index.ma");
		} else {	//아이디or비번 틀렸을 때
			System.out.println("아이디 또는 비밀번호 틀림");
			return null;
		}
		return mav;
	}
}
