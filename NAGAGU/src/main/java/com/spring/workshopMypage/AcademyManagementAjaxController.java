package com.spring.workshopMypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		System.out.println("WORKSHOP_NUM은 " + WORKSHOP_NUM);
		List<WsMemberVO> member_list = null;

		member_list = academyManagementService.getMemberList(WORKSHOP_NUM);
		
		return member_list;
	}
	
	@PostMapping(value = "/searchMemberManagementList.my", produces = "application/json;charset=UTF-8")
	public List<WsMemberVO> memberList(String searchType, String keyword, HttpSession session) {
		
		int WORKSHOP_NUM = (int)session.getAttribute("WORKSHOP_NUM");
		List<WsMemberVO> searchMemberList = null;
		
		searchMemberList = academyManagementService.getMemberSearch(keyword, searchType, WORKSHOP_NUM);
		
		return searchMemberList;
	}
	
	@PostMapping(value= "/deleteManagementMember.my", produces = "application/json;charset=UTF-8")
	public Map<String, Object> deleteManagementMember(int MY_CLASS_MEMBERNUM) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			int result = academyManagementService.deleteManagementMember(MY_CLASS_MEMBERNUM);
			System.out.println("result : " + result);
			
			if(result == 1) {
				retVal.put("res", "OK");
			} else {
				retVal.put("res", "FAIL");
			}
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			e.getMessage();
		}
		
		return retVal;
	}
	
	@PostMapping(value="/updateStauts.my", produces = "application/json;charset=UTF-8")
	public Map<String, Object> updateStauts(@RequestParam(value="checkArray[]") List<Integer> updateList) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			ArrayList<Integer> updateArray = new ArrayList<Integer>();
			
			for(int i=0; i<updateList.size(); i++) {
				updateArray.add(updateList.get(i));
				System.out.println(updateList.get(i));
			}
			
			int result = academyManagementService.updateClassStatus(updateArray);
			
			if(result != 0) {
				retVal.put("res", "OK");
			} else {
				retVal.put("res", "FAIL");
			}
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			e.getMessage();
		}
		
		return retVal;
	}
	
	
	
	
//-------------------------------------강의 리뷰 ,문의
	
	//---------------------------------------강의 review 관리 페이지 리스트
	@PostMapping(value="/classReviewList.my" ,produces="application/json;charset=UTF-8")
	public ArrayList<Map<String, Object>> classReviewList(String selectClassType1, String selectClassType2, String selectCategory1, String selectCategory2, String selectListAlign, String searchType, String keyword, HttpSession session) {
		System.out.println("classReviewList 컨트롤러 start!");
		
		Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("WORKSHOP_NUM", WORKSHOP_NUM);
		map.put("selectClassType1", selectClassType1);
		map.put("selectClassType2", selectClassType2);
		map.put("selectCategory1", selectCategory1);
		map.put("selectCategory2", selectCategory2);
		map.put("selectListAlign", selectListAlign);
		map.put("searchType", searchType);
		map.put("keyword", keyword);

		System.out.println("WORKSHOP_NUM="+WORKSHOP_NUM);
		System.out.println("selectClassType1="+selectClassType1);
		System.out.println("selectClassType2="+selectClassType2);
		System.out.println("selectCategory1="+selectCategory1);
		System.out.println("selectCategory2="+selectCategory2);
		System.out.println("selectListAlign="+selectListAlign);
		System.out.println("searchType="+searchType);
		System.out.println("keyword="+keyword);
		
		ArrayList<Map<String, Object>> reviewList = null;
		reviewList = academyManagementService.getclassReviewList(map);
		
		
		return reviewList;
	}

	
	//---------------------------------------상품 qna 관리 페이지 리스트	
	@PostMapping(value="/classQnaList.my", produces = "application/json;charset=UTF-8")
	public ArrayList<Map<String, Object>> productQnaList(String selectClassType1, String selectClassType2, String selectClassType3, String selectCategory1, String selectCategory2, String searchType, String keyword, HttpSession session){
		System.out.println("classQnaList 컨트롤러 start!");
		
		Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("WORKSHOP_NUM", WORKSHOP_NUM);
		map.put("selectClassType1", selectClassType1);
		map.put("selectClassType2", selectClassType2);
		map.put("selectClassType3", selectClassType3);
		map.put("selectCategory1", selectCategory1);
		map.put("selectCategory2", selectCategory2);
		map.put("searchType", searchType);
		map.put("keyword", keyword);

		System.out.println("WORKSHOP_NUM="+WORKSHOP_NUM);
		System.out.println("selectClassType1="+selectClassType1);
		System.out.println("selectClassType2="+selectClassType2);
		System.out.println("selectClassType3="+selectClassType3);
		System.out.println("selectCategory1="+selectCategory1);
		System.out.println("selectCategory2="+selectCategory2);
		System.out.println("searchType="+searchType);
		System.out.println("keyword="+keyword);
		
		ArrayList<Map<String, Object>> searchList = null;
		searchList = academyManagementService.getclassQnaList(map);
		
		
		return searchList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}


