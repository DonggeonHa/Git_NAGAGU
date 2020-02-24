package com.spring.workshopMypage;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.estimate.EstimateOrderVO;
import com.spring.estimate.EstimateService;

@Controller
public class EstimateManagementController {

	@Autowired
	private EstimateService estimateService;
	
	//견적 제안 관리
	@RequestMapping(value = "/workshop_estimate_offers.ws")
	public String WorkshopStoreestOffers(HttpSession session) {
		
		return "Workshop/Store/estOffers";
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
		
		HashMap <String, Object> countMap = new HashMap <String, Object>();
		countMap.put("OFFER_WORKSHOP", OFFER_WORKSHOP);
		
		int page = 1;
		int limit = 20;
		int offerCount = estimateService.offerCount(countMap);
		
		if (request.getParameter("page") != "") {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int maxpage = (int)((double)offerCount/limit+0.95);
		int startRow = (page-1)*limit + 1;
		int endRow = startRow+limit-1;
		int startpage = (((int) ((double)page/10 + 0.9)) - 1) * 10 + 1;
		int endpage = startpage+9;
		
		if (maxpage > 1) {     // 한페이지 이상이면
			if (page < 6 && (maxpage-page) >= 6) {   // 현재 5p 이하이면
				startpage = 1;     // 1부터 
				endpage = 10;    // 10까지
			} else {
				startpage = page -5;  // 6넘어가면 2부터 찍고
				endpage = startpage+10;   // 10까지
			}
		 
			if (maxpage < endpage) {   // 10페이지가 안되면
				endpage = maxpage;   // 마지막페이지를 갯수 만큼
				startpage = maxpage-10;  // 시작페이지를   갯수 -10
			}
			if (startpage < 2) {     // 시작이 음수 or 0 이면
				startpage = 0;     // 1페이지부터 시작
			}
		} else {       // 한페이지 이하이면
			startpage = 1;      // 한번만 페이징 생성
			endpage = maxpage;
		}
		
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
		
		return "Workshop/Store/estProduct";
	}
	
	@RequestMapping(value = "/workshop_estimate_list.ws")
	@ResponseBody
	public HashMap <String, Object> WorkshopEstimateList(HttpServletRequest request, HttpSession session) {

		String ES_ORDER_WORKSHOP = (String)session.getAttribute("WORKSHOP_NAME");
		
		HashMap <String, Object> listmap = new HashMap <String, Object>();
		listmap.put("EO_SEARCH_CATEGORY", request.getParameter("search_category"));
		listmap.put("EO_SEARCH", request.getParameter("search_text"));
		listmap.put("EO_CATEGORY", request.getParameter("eo_category"));
		listmap.put("EO_STATE", request.getParameter("eo_state"));
		
		HashMap <String, Object> countMap = new HashMap <String, Object>();
		countMap.put("ES_ORDER_WORKSHOP", ES_ORDER_WORKSHOP);
		
		int page = 1;
		int limit = 20;
		int offerCount = estimateService.esOrderCount(countMap);
		
		if (request.getParameter("page") != "") {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int maxpage = (int)((double)offerCount/limit+0.95);
		int startRow = (page-1)*limit + 1;
		int endRow = startRow+limit-1;
		int startpage = (((int) ((double)page/10 + 0.9)) - 1) * 10 + 1;
		int endpage = startpage+9;
		
		if (maxpage > 1) {     // 한페이지 이상이면
			if (page < 6 && (maxpage-page) >= 6) {   // 현재 5p 이하이면
				startpage = 1;     // 1부터 
				endpage = 10;    // 10까지
			} else {
				startpage = page -5;  // 6넘어가면 2부터 찍고
				endpage = startpage+10;   // 10까지
			}
		 
			if (maxpage < endpage) {   // 10페이지가 안되면
				endpage = maxpage;   // 마지막페이지를 갯수 만큼
				startpage = maxpage-10;  // 시작페이지를   갯수 -10
			}
			if (startpage < 2) {     // 시작이 음수 or 0 이면
				startpage = 0;     // 1페이지부터 시작
			}
		} else {       // 한페이지 이하이면
			startpage = 1;      // 한번만 페이징 생성
			endpage = maxpage;
		}
		
		listmap.put("ES_ORDER_WORKSHOP", ES_ORDER_WORKSHOP);
		listmap.put("startRow", startRow);
		listmap.put("endRow", endRow);
		
		if (page == maxpage)
			endRow = offerCount;
		
		int rnum = offerCount - (page-1)*limit;

		ArrayList<EstimateOrderVO> eoList = estimateService.esOrderTable(listmap);
		
		HashMap <String, Object> resMap = new HashMap <String, Object>();
		resMap.put("page", page);
		resMap.put("maxpage", maxpage);
		resMap.put("startpage", startpage);
		resMap.put("endpage", endpage);
		resMap.put("offerCount", offerCount);
		resMap.put("rnum", rnum);
		resMap.put("eoList", eoList);
		
		return resMap;
	}

}
