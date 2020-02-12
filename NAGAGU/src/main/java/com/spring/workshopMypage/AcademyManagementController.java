package com.spring.workshopMypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.academy.ClassVO;

@Controller
public class AcademyManagementController {
	@Autowired(required = false)
	private AcademyManagementService academyManagementService;
	
	
	@RequestMapping(value="/updateClass.mywork", method = {RequestMethod.POST, RequestMethod.GET} )
	public ModelAndView updateClass(HttpSession session, HttpServletRequest request) {
		
		ClassVO classVO = new ClassVO();
		ModelAndView mav = new ModelAndView();
		
		int CLASS_NUMBER =  Integer.parseInt(request.getParameter("CLASS_NUMBER"));
		classVO = academyManagementService.getclassDetail(CLASS_NUMBER);
		
		mav.addObject("ClassVO", classVO);
		mav.setViewName("Mypage/Workshop/Academy/classUpdateForm");
		
		return mav;
	}
}
