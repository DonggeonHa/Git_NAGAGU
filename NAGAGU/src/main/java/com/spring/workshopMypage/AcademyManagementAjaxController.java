package com.spring.workshopMypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public List<ClassVO> classManagementList() {

		List<ClassVO> list = academyManagementService.getManagementClassList();
		System.out.println(list.size());
		
		return list;
	}
	
	@PostMapping(value="/searchTypeList.my", produces = "application/json;charset=UTF-8")
	public List<ClassVO> searchTypeList(String searchType, String keyword){
		
		List<ClassVO> list = null;
		System.out.println(searchType + " 그리고 " + keyword);
		
		list = academyManagementService.getSearchList(keyword, searchType);
		
		
		return list;
	}
}
