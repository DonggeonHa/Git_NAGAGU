package com.spring.workshopMypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class ProductManagementAjaxController {

	@Autowired(required = false)
	private ProductManagementService productManagementService;

	
	@ResponseBody
	@PostMapping(value="/productReviewList.my" ,produces="application/json;charset=UTF-8")
	public ArrayList<Map<String, Object>> productReviewList(String selectClassType, HttpSession session) {

		Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");
		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("selectClassType", selectClassType);
		map.put("WORKSHOP_NUM", WORKSHOP_NUM);
		
		ArrayList<Map<String, Object>> reviewList = productManagementService.getproductReviewList(map);
		System.out.println("productReviewList의 size : " +reviewList.size());
		
		return reviewList;
	}

	
	@PostMapping(value="/searchTypeReviewList.my", produces = "application/json;charset=UTF-8")
	public ArrayList<Map<String, Object>> getReviewSearchList(String searchType, String keyword, String categorySelect, HttpSession session){
		Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");
		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("selectClassType", selectClassType);
		map.put("WORKSHOP_NUM", WORKSHOP_NUM);
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("categorySelect", categorySelect);
		
		System.out.println("searchType = " + searchType + ", keyword = " + keyword);
		
		ArrayList<Map<String, Object>> searchList = null;
		searchList = productManagementService.getReviewSearchList(map);
		
		
		return searchList;
	}

	@ResponseBody
	@PostMapping(value="/productQnaList.my" ,produces="application/json;charset=UTF-8")
	public ArrayList<Map<String, Object>> productQnaList(String selectClassType, HttpSession session) {
		
		Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("selectClassType", selectClassType);
		map.put("WORKSHOP_NUM", WORKSHOP_NUM);
		
		System.out.println("selectClassType="+selectClassType);
		ArrayList<Map<String, Object>> qnaList = productManagementService.getproductQnaList(map);
	
		System.out.println("productQnaList의 size : " +qnaList.size());
		
		return qnaList;
	}
	
		
	@PostMapping(value="/searchTypeQnaList.my", produces = "application/json;charset=UTF-8")
	public ArrayList<Map<String, Object>> getQnaSearchList(String selectClassType, String searchType, String keyword, String categorySelect, HttpSession session){
		Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("selectClassType", selectClassType);
		map.put("WORKSHOP_NUM", WORKSHOP_NUM);
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("categorySelect", categorySelect);
		
		System.out.println("selectClassType="+selectClassType);
		System.out.println("searchType="+searchType);
		System.out.println("keyword="+keyword);
		System.out.println("categorySelect="+categorySelect);
		
		ArrayList<Map<String, Object>> searchList = null;
		searchList = productManagementService.getQnaSearchList(map);
		
		
		return searchList;
	}
	
	
	//---------------------------------------상품 관리 페이지
	@ResponseBody
	@PostMapping(value="/AllproductsList.my" ,produces="application/json;charset=UTF-8")
	public ArrayList<Map<String, Object>> productList(String selectClassType, HttpSession session) {
		
		Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("selectClassType", selectClassType);
		map.put("WORKSHOP_NUM", WORKSHOP_NUM);
		
		System.out.println("selectClassType="+selectClassType);
		ArrayList<Map<String, Object>> qnaList = productManagementService.getproductQnaList(map);
	
		System.out.println("productQnaList의 size : " +qnaList.size());
		
		return qnaList;
	}
	
}
