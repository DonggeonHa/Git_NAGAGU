package com.spring.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageEditController {
	
//	@Autowired(required = false)
//	private EditMemberService
	
	@RequestMapping(value = "/edit_member_form.my", method = RequestMethod.POST) 
	public String edit_member_form() { 
		
		return "Mypage/Workshop/Store/selled";
	}
}
