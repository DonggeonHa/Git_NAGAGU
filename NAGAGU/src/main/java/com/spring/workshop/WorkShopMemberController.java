package com.spring.workshop;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WorkShopMemberController {
	
	@Autowired(required = false)
	private WorkShopMemberService workShopMemberService;
	
	@RequestMapping(value="/WorkshopSignup.ws")
	public String WorkshopSignup() {
		
		return "WorkshopSignup";
	}
	
	@RequestMapping(value="/workshopMemberInsert.ws")
	public String workshopMemberInsert(WorkShopMemberVO workshopVO, HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		
		response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer;
        
        try {
        	writer = response.getWriter();
        	
        	int result = workShopMemberService.insert_workshop_member(workshopVO);
        	
        	if(result == 0) {
        		writer.write("<script>alert('정보를 다시 한번 확인 후  입력해주세요.'); location.href='WorkshopSignup.ws';</script>");
    		}
        	
        	
        } catch (Exception e) {
            e.printStackTrace(); 
         }
		
        return "redirect:/index.ma";
	}
}
