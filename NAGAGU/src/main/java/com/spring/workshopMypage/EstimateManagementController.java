package com.spring.workshopMypage;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.estimate.EstimateService;

@Controller
public class EstimateManagementController {

	@Autowired
	private EstimateService estimateService;
	
	//견적 제안 관리
	@RequestMapping(value = "/workshop_estimate_offers.ws")
	public String WorkshopStoreestOffers(HttpSession session) {
		
		return "Mypage/Workshop/Store/estOffers";
	}
	
	@RequestMapping(value = "/workshop_offer_list.ws")
	@ResponseBody
	public HashMap <String, Object> WorkshopOfferList(HttpServletRequest request, HttpSession session) {
		String OFFER_WORKSHOP = (String)session.getAttribute("WORKSHOP_NAME");
		
		HashMap <String, Object> listmap = new HashMap <String, Object>();
		listmap.put("WO_SEARCH_CATEGORY", request.getParameter("search_category"));
		listmap.put("WO_SEARCH", request.getParameter("search_text"));
		listmap.put("WO_CATEGORY", request.getParameter("wo_category"));
		listmap.put("WO_STATE", request.getParameter("wo_state"));
		System.out.println("test : " + listmap.get("WO_SEARCH_CATEGORY"));
		System.out.println("test : " + listmap.get("WO_SEARCH"));
		System.out.println("test : " + listmap.get("WO_CATEGORY"));
		System.out.println("test : " + listmap.get("WO_STATE"));
		
		HashMap <String, Object> countMap = new HashMap <String, Object>();
		countMap.put("OFFER_WORKSHOP", OFFER_WORKSHOP);
		
		if (request.getParameter("ESTIMATE_STATE") != null) {
			int ESTIMATE_STATE = Integer.parseInt(request.getParameter("ESTIMATE_STATE"));
			countMap.put("ESTIMATE_STATE", ESTIMATE_STATE);
		}
		
		int page = 1;
		int limit = 20;
		int offerCount = estimateService.offerCount(countMap);
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int maxpage = (int)((double)offerCount/limit+0.95);
		int startRow = (page-1)*limit + 1;
		int endRow = startRow+limit-1;
		int startpage = (((int) ((double)page/10 + 0.9)) - 1) * 10 + 1;
		int endpage = startpage+9;
		
		listmap.put("OFFER_WORKSHOP", OFFER_WORKSHOP);
		listmap.put("startRow", startRow);
		listmap.put("endRow", endRow);
		
		if (page == maxpage)
			endRow = offerCount;
		
		int rnum = offerCount - (page-1)*limit;

		ArrayList<HashMap <String, Object>> woList = estimateService.workOfferList(listmap);
		
		HashMap <String, Object> resMap = new HashMap <String, Object>();
		resMap.put("page", page);
		resMap.put("maxpage", maxpage);
		resMap.put("startpage", startpage);
		resMap.put("endpage", endpage);
		resMap.put("offerCount", offerCount);
		resMap.put("rnum", rnum);
		resMap.put("woList", woList);
		
		return resMap;
	}
	
	//견적 주문 관리
	@RequestMapping(value = "/workshop_estimate_product.ws")
	public String WorkshopStoreestProduct() {
		
		return "Mypage/Workshop/Store/estProduct";
	}

}
