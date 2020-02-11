package com.spring.workshopMypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.store.ProductVO;


@RestController
public class ProductManagementAjaxController {

	@Autowired(required = false)
	private ProductManagementService productManagementService;

	
	//---------------------------------------상품 review 관리 페이지 리스트
	@PostMapping(value="/productReviewList.my" ,produces="application/json;charset=UTF-8")
	public ArrayList<Map<String, Object>> productReviewList(String selectCategory, String selectListAlign, String searchType, String keyword, HttpSession session) {
		System.out.println("productReviewList 컨트롤러 start!");
		
		Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("WORKSHOP_NUM", WORKSHOP_NUM);
		map.put("selectCategory", selectCategory);
		map.put("selectListAlign", selectListAlign);
		map.put("searchType", searchType);
		map.put("keyword", keyword);

		System.out.println("WORKSHOP_NUM="+WORKSHOP_NUM);
		System.out.println("selectCategory="+selectCategory);
		System.out.println("selectListAlign="+selectListAlign);
		System.out.println("searchType="+searchType);
		System.out.println("keyword="+keyword);
		
		ArrayList<Map<String, Object>> reviewList = null;
		reviewList = productManagementService.getproductReviewList(map);
		
		
		return reviewList;
	}

	
	//---------------------------------------상품 qna 관리 페이지 리스트	
	@PostMapping(value="/productQnaList.my", produces = "application/json;charset=UTF-8")
	public ArrayList<Map<String, Object>> productQnaList(String selectClassType, String selectCategory, String selectListAlign, String searchType, String keyword, HttpSession session){
		System.out.println("getQnaSearchList 컨트롤러 start!");
		
		Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("WORKSHOP_NUM", WORKSHOP_NUM);
		map.put("selectClassType", selectClassType);
		map.put("selectCategory", selectCategory);
		map.put("selectListAlign", selectListAlign);
		map.put("searchType", searchType);
		map.put("keyword", keyword);

		System.out.println("WORKSHOP_NUM="+WORKSHOP_NUM);
		System.out.println("selectClassType="+selectClassType);
		System.out.println("selectCategory="+selectCategory);
		System.out.println("selectListAlign="+selectListAlign);
		System.out.println("searchType="+searchType);
		System.out.println("keyword="+keyword);
		
		ArrayList<Map<String, Object>> searchList = null;
		searchList = productManagementService.getproductQnaList(map);
		
		
		return searchList;
	}
	
	
	//---------------------------------------상품 관리 페이지 리스트
	@ResponseBody
	@PostMapping(value="/AllproductsList.my" ,produces="application/json;charset=UTF-8")
	public ArrayList<Map<String, Object>> productList(String selectClassType, String selectCategory, String selectListAlign, String searchType, String keyword, HttpSession session) {
		System.out.println("AllproductsList 컨트롤러 start!");
		
		Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("WORKSHOP_NUM", WORKSHOP_NUM);
		map.put("selectClassType", selectClassType);
		map.put("selectCategory", selectCategory);
		map.put("selectListAlign", selectListAlign);
		map.put("searchType", searchType);
		map.put("keyword", keyword);

		System.out.println("WORKSHOP_NUM="+WORKSHOP_NUM);
		System.out.println("selectClassType="+selectClassType);
		System.out.println("selectCategory="+selectCategory);
		System.out.println("searchType="+searchType);
		System.out.println("keyword="+keyword);
		ArrayList<Map<String, Object>> productList = productManagementService.getproductList(map);
	
		System.out.println("productList의 size : " +productList.size());
		
		return productList;
	}
	
	//---------------------------------------상품 관리 페이지 판매상태 update
	@ResponseBody
	@PostMapping(value="/modifyProductStatus.my" ,produces="application/json;charset=UTF-8")
	public int modifyProductStatus(int to_status, HttpServletRequest request, HttpSession session) {
		System.out.println("modifyProductStatus 컨트롤러 start!");
		Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");
		String[] checkBoxArr = request.getParameterValues("checkBoxArr[]");
		
		System.out.println("WORKSHOP_NUM = "+ WORKSHOP_NUM);
		System.out.println("to_status = "+ to_status);
		for(int i=0;i<checkBoxArr.length; i++) {
			System.out.println("checkBoxArr["+i+"] = " + checkBoxArr[i]);
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int res=-100;
		try {
	 		if(to_status == 1) { //선택 판매중
				map.put("to_status", 1);
				for(int i=0; i<checkBoxArr.length; i++) {
					map.put("PRODUCT_NUM", Integer.parseInt(checkBoxArr[i]));
					System.out.println(i+"번째 PROUDCT_NUM = " + Integer.parseInt(checkBoxArr[i]));
			
					res = productManagementService.modifyStatus(map);
					res = 1;
				}
			} else if(to_status == 0) {	//선택 품절
				map.put("to_status", 0);
				for(int i=0; i<checkBoxArr.length; i++) {
					map.put("PRODUCT_NUM", Integer.parseInt(checkBoxArr[i]));
					System.out.println(i+"번째 PROUDCT_NUM = " + Integer.parseInt(checkBoxArr[i]));
			
					res = productManagementService.modifyStatus(map);
					res = 0;
				}				
			} else if(to_status == 2) {	//선택 판매 종료
				map.put("to_status", 2);
				for(int i=0; i<checkBoxArr.length; i++) {
					map.put("PRODUCT_NUM", Integer.parseInt(checkBoxArr[i]));
					System.out.println(i+"번째 PROUDCT_NUM = " + Integer.parseInt(checkBoxArr[i]));
			
					res = productManagementService.modifyStatus(map);
					res = 2;
				}				
			} else if(to_status == -1) {	//선택 삭제
				for(int i=0; i<checkBoxArr.length; i++) {
					map.put("PRODUCT_NUM", Integer.parseInt(checkBoxArr[i]));
					System.out.println(i+"번째 PROUDCT_NUM = " + Integer.parseInt(checkBoxArr[i]));
					//삭제하는 sql 짜주기
					res = productManagementService.deleteProducts(map);
					res = -1;
				}				
			}
	 		
	 		
		}catch(Exception e) {
			
		}


		return res;
	}
	
	
	//---------------------------------------상품 관리 페이지에서 후기/문의로 이동
	@RequestMapping(value="/goReviewOrQna.my" ,produces="application/json;charset=UTF-8")
	public ModelAndView goReviewOrQna(int PRODUCT_NUM, HttpServletRequest request, HttpSession session) {
		System.out.println("goReviewOrQna 컨트롤러 start!");
		Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");
		String GO = request.getParameter("GO");
		
		System.out.println("WORKSHOP_NUM = "+ WORKSHOP_NUM);
		System.out.println("PRODUCT_NUM = "+ PRODUCT_NUM);
		System.out.println("GO = "+ GO);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("WORKSHOP_NUM", WORKSHOP_NUM);
		map.put("PRODUCT_NUM", PRODUCT_NUM);
		
		ProductVO productVO = null;
		productVO = productManagementService.getProductVoOfWorkshop(map);
	
		
		String url = "";
		if(GO.equals("QNA")) {
			//해당 상품글에 문의가 있는지 확인(없으면 따로 알람창 띄우기)
			url = "Mypage/Workshop/Review/qnaStore";
		} else if (GO.equals("REVIEW")) {
			url = "Mypage/Workshop/Review/reviewStore";
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName(url);
		mav.addObject("productVO", productVO);
		return mav;
	}
	
	
	
	
	
}
