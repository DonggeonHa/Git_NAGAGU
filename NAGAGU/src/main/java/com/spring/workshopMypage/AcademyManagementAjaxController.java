package com.spring.workshopMypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.academy.ClassVO;

@RestController
public class AcademyManagementAjaxController {
	
	@Autowired(required = false)
	private AcademyManagementService academyManagementService;
	
	@ResponseBody
	@PostMapping(value="/classManagementList.my" ,produces="application/json;charset=UTF-8")
	public List<ClassVO> classManagementList(String selectClassType, HttpSession session) {
		
		String WORKSHOP_NAME = (String)session.getAttribute("WORKSHOP_NAME");
		
		List<ClassVO> list = academyManagementService.getManagementClassList(selectClassType, WORKSHOP_NAME);
		System.out.println(list.size());
		System.out.println(list.get(0).getCLASS_STATUS());
		
		return list;
	}
	
	@PostMapping(value="/searchTypeList.my", produces = "application/json;charset=UTF-8")
	public List<ClassVO> searchTypeList(String searchType, String keyword, HttpSession session){
		
		String WORKSHOP_NAME = (String)session.getAttribute("WORKSHOP_NAME");
		
		List<ClassVO> list = null;
		System.out.println(searchType + ", " + keyword);
		
		list = academyManagementService.getSearchList(keyword, searchType, WORKSHOP_NAME);
		
		
		return list;
	}
	
	@PostMapping(value="/classMemberManagementList.my", produces = "application/json;charset=UTF-8")
	public List<WsMemberVO> memberList(HttpSession session) {
		
		int WORKSHOP_NUM = (int)session.getAttribute("WORKSHOP_NUM");
		System.out.println(WORKSHOP_NUM);
		List<WsMemberVO> member_list = null;

		member_list = academyManagementService.getMemberList(WORKSHOP_NUM);
		
		return member_list;
	}
}


