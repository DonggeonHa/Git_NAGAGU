package com.spring.workshopMypage;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class ProductManagementAjaxController {

	@Autowired(required = false)
	private ProductManagementService productManagementService;

	
	@ResponseBody
	@PostMapping(value="/productManagementList.my" ,produces="application/json;charset=UTF-8")
	public ArrayList<Map<String, Object>> productManagementList() {
		
		System.out.println("aaa");
		ArrayList<Map<String, Object>> reviewList = productManagementService.getManagementProductList();
		System.out.println("productManagementList의 size : " +reviewList.size());
		
		return reviewList;
	}
	
	/*
	@PostMapping(value="/searchTypeList.my", produces = "application/json;charset=UTF-8")
	public List<ClassVO> searchTypeList(String searchType, String keyword){
		
		List<ClassVO> list = null;
		System.out.println(searchType + " 그리고 " + keyword);
		
		list = academyManagementService.getSearchList(keyword, searchType);
		
		
		return list;
	}
	*/
}
