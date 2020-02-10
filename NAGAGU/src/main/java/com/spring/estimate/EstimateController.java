 package com.spring.estimate;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class EstimateController {

	@Autowired
	EstimateService estimateService;
	
	@RequestMapping(value = "/estimate.es")
	public String estimate(HttpServletRequest request, Model model, HttpSession session) {
		HashMap <String, Object> map = new HashMap <String, Object>();
		map.put("ES_CATEGORY", request.getParameter("category"));
		map.put("ES_SEARCH", request.getParameter("search_text"));
		int page = 1;
		int limit = 20;
		int estimateCount = estimateService.estimateCount(map);
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int maxpage = (int)((double)estimateCount/limit+0.95);
		int startRow = (page-1)*10 + 1;
		int endRow = startRow+limit-1;
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		if (page == maxpage)
			endRow = estimateCount;
		
		int rnum = estimateCount - (page-1)*limit;

		ArrayList<EstimateVO> eList = estimateService.estimateList(map);
		
		model.addAttribute("page", page);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startRow);
		model.addAttribute("endpage", endRow);
		model.addAttribute("estimateCount", estimateCount);
		model.addAttribute("rnum", rnum);
		model.addAttribute("eList", eList);
		
		return "Store/estimateList";
	}
	
	@RequestMapping(value="/estimate_form.es")
	public String estimateForm(HttpServletRequest request) {
		
		return "Store/estimateForm";
	}
	
	@RequestMapping(value="/estimate_input.es")
	public String estimateInput(HttpServletRequest request) {
		EstimateVO vo = new EstimateVO();
		
		vo.setESTIMATE_MEMBER(request.getParameter("ESTIMATE_MEMBER"));
		vo.setESTIMATE_NICK(request.getParameter("ESTIMATE_NICK"));
		vo.setESTIMATE_TITLE(request.getParameter("ESTIMATE_TITLE"));
		vo.setESTIMATE_CATEGORY(request.getParameter("ESTIMATE_CATEGORY"));
		vo.setESTIMATE_SOURCE(request.getParameter("ESTIMATE_SOURCE"));
		vo.setESTIMATE_COLOR(request.getParameter("ESTIMATE_COLOR"));
		vo.setESTIMATE_COAT(request.getParameter("ESTIMATE_COAT"));
		vo.setESTIMATE_SIZE(request.getParameter("ESTIMATE_SIZE"));
		vo.setESTIMATE_FILE(request.getParameter("ESTIMATE_FILE"));
		vo.setESTIMATE_CONTENT(request.getParameter("ESTIMATE_CONTENT"));
		vo.setESTIMATE_PAY(request.getParameter("ESTIMATE_PAY"));
		
		int res = estimateService.estimateInsert(vo);
		
		if (res == 1) {
			System.out.println("estimate inserted");
			return "redirect:/estimate.es";
		}
		else {
			System.out.println("estimate insert failed");
			return "Store/estimateForm";
		}
	}
	
	@RequestMapping(value = "/estimate_detail.es")
	public String estimateDetail(HttpServletRequest request, Model model) {
		int ESTIMATE_NUM = Integer.parseInt(request.getParameter("ESTIMATE_NUM"));
		EstimateVO vo = estimateService.estimateDetail(ESTIMATE_NUM);
		
		model.addAttribute("estimatevo", vo);
		model.addAttribute("page", request.getParameter("page"));
        model.addAttribute("ESTIMATE_NUM", ESTIMATE_NUM);

		return "Store/estimateDetail";
	}
	
	@RequestMapping(value = "/estimate_file.es")
	@ResponseBody 
	public String handlerFileUpload(MultipartHttpServletRequest request) throws Exception {
		
		String img_name = null;
		MultipartFile file = request.getFile("file");
		
		String url = "C:/Project138/upload/";
		
		try {
			String uploadedFile = estimateService.imageUpload(url, file);
			
			img_name = "/estimateupload/image/"+uploadedFile;
			
			return img_name;
		}
		catch (Exception e) {
			
			e.printStackTrace();
			return img_name;
		}
	}
	
	@RequestMapping(value = "/offer_list.es")
    @ResponseBody
	public HashMap<String, Object> offerList (HttpServletRequest request) {
		
        HashMap<String, Object> map = new HashMap<String, Object>();
		int ESTIMATE_NUM = Integer.parseInt(request.getParameter("ESTIMATE_NUM"));
		
		int offer_page = 1;
		int offer_limit = 10;
        int offerCount = estimateService.offerCount(ESTIMATE_NUM);
		
		if (request.getParameter("OFFER_PAGE") != null) {
			offer_page = Integer.parseInt(request.getParameter("OFFER_PAGE"));
		}
		
		int offer_maxpage = (int)((double)offerCount/offer_limit+0.95);
		int offer_startRow = (offer_page-1)*10 + 1;
		int offer_endRow = offer_startRow+offer_limit-1;
		if (offer_page == offer_maxpage)
			offer_endRow = offerCount;
		
		int offer_rnum = offerCount - (offer_page-1)*offer_limit;
		
        try {
            ArrayList<EstimateOfferVO> offerList = estimateService.offerList(ESTIMATE_NUM, offer_startRow, offer_endRow);
            
            map.put("offer_page", offer_page);
            map.put("offer_limit", offer_limit);
            map.put("offer_maxpage", offer_maxpage);
            map.put("offer_endpage", offer_endRow);
            map.put("offer_rnum", offer_rnum);
            map.put("offerCount", offerCount);
            map.put("offerList", offerList);
            map.put("res", "success");
        }
        catch (Exception e) {
            map.put("res", "failed");
        }
		
		return map;
	}
	
	@RequestMapping(value = "/offer_insert.es", produces="application/json; charset=UTF-8")
	public String offerInsert (HttpServletRequest request) {
		EstimateOfferVO vo = new EstimateOfferVO();
		vo.setOFFER_ESTIMATE(Integer.parseInt(request.getParameter("OFFER_ESTIMATE")));
		vo.setOFFER_WORKSHOP(request.getParameter("OFFER_WORKSHOP"));
		vo.setOFFER_PRICE(Integer.parseInt(request.getParameter("OFFER_PRICE")));
		vo.setOFFER_CONTENT(request.getParameter("OFFER_CONTENT"));
		
		int res = estimateService.offerInsert(vo);
		
		if (res == 1) {
			return "Offer successfully added";
		}
		else if (res == 2) {
			return "Set min price failed..";
		}
		else {
			return "Offer add failed..";
		}
	}
	

	/* 의뢰된 견적 리스트 */
	@RequestMapping(value = "/order_estimate_list.my")
	public String MypageEsOrderDetail(HttpServletRequest request, Model model) {
		int ES_ORDER_BUYER = Integer.parseInt(request.getParameter("ES_ORDER_BUYER"));
		ArrayList<EstimateOrderVO> esOrderList = estimateService.esOrderList(ES_ORDER_BUYER);
		model.addAttribute("esOrderList", esOrderList);
		
		return "Mypage/es_order_list";
	}
}
