 package com.spring.estimate;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.member.KakaoController;
import com.spring.member.NaverLoginBO;

@Controller
public class EstimateController {
	
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired(required = false)
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

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
		int startRow = (page-1)*limit + 1;
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
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	    System.out.println("네이버:" + naverAuthUrl);
	    model.addAttribute("naver_url", naverAuthUrl);
      
	    //카카오 인증 url을 view로 전달
	    String kakaoUrI = KakaoController.getAuthorizationUri(session);
	    System.out.println("카카오: "+ kakaoUrI);
	    model.addAttribute("kakao_url", kakaoUrI);
		
		return "Store/estimateList";
	}
	
	@RequestMapping(value="/estimate_form.es")
	public String estimateForm(HttpServletRequest request) {
		
		return "Store/estimateForm";
	}
	
	@RequestMapping(value="/estimate_modify.es")
	public String estimateModifyForm(HttpServletRequest request, Model model) {
		int ESTIMATE_NUM = Integer.parseInt(request.getParameter("ESTIMATE_NUM"));
		
		String page = request.getParameter("page");
		
		EstimateVO esvo = estimateService.estimateDetail(ESTIMATE_NUM);
		
		model.addAttribute("esvo", esvo);
		model.addAttribute("page", page);
		
		return "Store/estimateModifyForm";
	}
	
	@RequestMapping(value="/estimate_input.es")
	public String estimateInput(HttpServletRequest request) {
		EstimateVO vo = new EstimateVO();
		
		String ESTIMATE_FILE = request.getParameter("ESTIMATE_FILE");
		
		if (ESTIMATE_FILE.equals("")) {
			ESTIMATE_FILE = "https://via.placeholder.com/400.png?text=No+Image";
		}
		
		vo.setESTIMATE_MEMBER(request.getParameter("ESTIMATE_MEMBER"));
		vo.setESTIMATE_NICK(request.getParameter("ESTIMATE_NICK"));
		vo.setESTIMATE_TITLE(request.getParameter("ESTIMATE_TITLE"));
		vo.setESTIMATE_AREA(request.getParameter("ESTIMATE_AREA"));
		vo.setESTIMATE_CATEGORY(request.getParameter("ESTIMATE_CATEGORY"));
		vo.setESTIMATE_SOURCE(request.getParameter("ESTIMATE_SOURCE"));
		vo.setESTIMATE_COLOR(request.getParameter("ESTIMATE_COLOR"));
		vo.setESTIMATE_COAT(request.getParameter("ESTIMATE_COAT"));
		vo.setESTIMATE_SIZE(request.getParameter("ESTIMATE_SIZE"));
		vo.setESTIMATE_FILE(ESTIMATE_FILE);
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
	
	@RequestMapping(value="/estimate_update.es")
	public String estimateModify(HttpServletRequest request, Model model) {

		String ESTIMATE_FILE = request.getParameter("ESTIMATE_FILE");

		if (ESTIMATE_FILE.equals("")) {
			ESTIMATE_FILE = "https://via.placeholder.com/400.png?text=No+Image";
		}

		EstimateVO vo = new EstimateVO();
		String page = request.getParameter("page");

		vo.setESTIMATE_NUM(Integer.parseInt(request.getParameter("ESTIMATE_NUM")));
		vo.setESTIMATE_MEMBER(request.getParameter("ESTIMATE_MEMBER"));
		vo.setESTIMATE_NICK(request.getParameter("ESTIMATE_NICK"));
		vo.setESTIMATE_TITLE(request.getParameter("ESTIMATE_TITLE"));
		vo.setESTIMATE_AREA(request.getParameter("ESTIMATE_AREA"));
		vo.setESTIMATE_CATEGORY(request.getParameter("ESTIMATE_CATEGORY"));
		vo.setESTIMATE_SOURCE(request.getParameter("ESTIMATE_SOURCE"));
		vo.setESTIMATE_COLOR(request.getParameter("ESTIMATE_COLOR"));
		vo.setESTIMATE_COAT(request.getParameter("ESTIMATE_COAT"));
		vo.setESTIMATE_SIZE(request.getParameter("ESTIMATE_SIZE"));
		vo.setESTIMATE_FILE(request.getParameter("ESTIMATE_FILE"));
		vo.setESTIMATE_CONTENT(request.getParameter("ESTIMATE_CONTENT"));
		vo.setESTIMATE_PAY(request.getParameter("ESTIMATE_PAY"));
		
		int res = estimateService.estimateModify(vo);

		if (res == 1) {
			System.out.println("estimate modified");

			return "redirect:/estimate.es?page=" + page;
		}
		else {
			System.out.println("estimate modify failed");
			
			return "redirect:/estimate_detail.es?ESTIMATE_NUM=" + vo.getESTIMATE_NUM();
		}
	}
	
	@RequestMapping(value = "/estimate_delete.es")
	public String estimateDelete(HttpServletRequest request) {
		int ESTIMATE_NUM = Integer.parseInt(request.getParameter("ESTIMATE_NUM"));
		int res = estimateService.estimateDelete(ESTIMATE_NUM);
		
		if (res == 1) {
			System.out.println("estimate deleted");
			return "redirect:/estimate.es";
		}
		else {
			System.out.println("estimate delete failed..");
			
			return "redirect:/estimate_detail.es?ESTIMATE_NUM=" + ESTIMATE_NUM;
		}
	}
	
	
	@RequestMapping(value = "/estimate_detail.es")
	public String estimateDetail(HttpServletRequest request, HttpSession session, Model model) {
		int ESTIMATE_NUM = Integer.parseInt(request.getParameter("ESTIMATE_NUM"));
		EstimateVO vo = estimateService.estimateDetail(ESTIMATE_NUM);
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
	    String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	    System.out.println("네이버:" + naverAuthUrl);
	    model.addAttribute("naver_url", naverAuthUrl);
      
	    //카카오 인증 url을 view로 전달
	    String kakaoUrI = KakaoController.getAuthorizationUri(session);
	    System.out.println("카카오: "+ kakaoUrI);
	    model.addAttribute("kakao_url", kakaoUrI);
		
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

	@RequestMapping(value = "/estimate_modify_file.es")
	@ResponseBody 
	public String handlerFileModify(MultipartHttpServletRequest request) throws Exception {
		
		String img_name = null;
		String uploadedFile = null;
		MultipartFile file = request.getFile("file");
		
		String url = "C:/Project138/upload/";
		
		try {
			EstimateVO prevo = estimateService.estimateDetail(Integer.parseInt(request.getParameter("ESTIMATE_NUM")));
			String[] filesrc = prevo.getESTIMATE_FILE().split(",");
		
			int imgDelRes = estimateService.imageDelete(filesrc);
			
			if (imgDelRes == filesrc.length) {
				uploadedFile = estimateService.imageUpload(url, file);
			}
			
			img_name = "/estimateupload/image/"+uploadedFile;
			
			return img_name;
		}
		catch (Exception e) {
			
			e.printStackTrace();
			return img_name;
		}
	}
	
	/* 견적글 제안 댓글 */
	@RequestMapping(value = "/offer_list.es")
    @ResponseBody
	public HashMap<String, Object> offerList (HttpServletRequest request) {
		
        HashMap<String, Object> map = new HashMap<String, Object>();
		int ESTIMATE_NUM = Integer.parseInt(request.getParameter("ESTIMATE_NUM"));
		String OFFER_WORKSHOP = request.getParameter("OFFER_WORKSHOP");

		HashMap <String, Object> countMap = new HashMap <String, Object>();
		countMap.put("ESTIMATE_NUM", ESTIMATE_NUM);
		countMap.put("OFFER_WORKSHOP", OFFER_WORKSHOP);
		
		
		int offer_page = 1;
		int offer_limit = 10;
        int offerCount = estimateService.offerCount(countMap);
		
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
            ArrayList<EstimateOfferVO> offerList = estimateService.offerList(ESTIMATE_NUM,offer_startRow, offer_endRow, OFFER_WORKSHOP);
            
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
	@ResponseBody
	public HashMap<String, Object> offerInsert (HttpServletRequest request) {
		EstimateOfferVO vo = new EstimateOfferVO();
		vo.setOFFER_ESTIMATE(Integer.parseInt(request.getParameter("OFFER_ESTIMATE")));
		vo.setOFFER_WORKSHOP(request.getParameter("OFFER_WORKSHOP"));
		vo.setOFFER_PRICE(Integer.parseInt(request.getParameter("OFFER_PRICE")));
		vo.setOFFER_CONTENT(request.getParameter("OFFER_CONTENT"));
		
		int res = estimateService.offerInsert(vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if (res == 1) {
			map.put("res", "Offer successfully added");
		}
		else {
			map.put("res", "Offer add failed...");
		}
		
		return map;
	}

	@RequestMapping(value = "/offer_modify.es", produces="application/json; charset=UTF-8")
	@ResponseBody
	public HashMap<String, Object> offerModify (HttpServletRequest request) {
		EstimateOfferVO vo = new EstimateOfferVO();
		vo.setOFFER_NUM(Integer.parseInt(request.getParameter("OFFER_NUM")));
		vo.setOFFER_ESTIMATE(Integer.parseInt(request.getParameter("OFFER_ESTIMATE")));
		vo.setOFFER_PRICE(Integer.parseInt(request.getParameter("OFFER_PRICE")));
		vo.setOFFER_CONTENT(request.getParameter("OFFER_CONTENT"));
		
		int res = estimateService.offerModify(vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if (res == 1) {
			map.put("res", "Offer successfully added");
		}
		else {
			map.put("res", "Offer add failed...");
		}
		
		return map;
	}
	
	/* 견적 제안 삭제 */
	@RequestMapping(value = "/offer_delete.es", produces="application/json; charset=UTF-8")
	@ResponseBody
	public HashMap<String, Object> offerDelete (HttpServletRequest request) {
		int ESTIMATE_NUM = Integer.parseInt(request.getParameter("ESTIMATE_NUM"));
		int OFFER_NUM = Integer.parseInt(request.getParameter("OFFER_NUM"));
		
		int res = estimateService.offerDelete(ESTIMATE_NUM, OFFER_NUM);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if (res == 1) {
			map.put("res", "Offer successfully added");
		}
		else {
			map.put("res", "Offer add failed...");
		}
		
		return map;
	}
	
	/* 견적 낙찰 */
	@RequestMapping(value = "/offer_bid.es")
	public String offerBid (HttpServletRequest request) {
		int ESTIMATE_NUM = Integer.parseInt(request.getParameter("ESTIMATE_NUM"));
		int OFFER_NUM = Integer.parseInt(request.getParameter("OFFER_NUM"));
		int OFFER_STATE = Integer.parseInt(request.getParameter("OFFER_STATE"));
		String redirect = "redirect:/";
		redirect += request.getParameter("redirect");
		
		int res1 = estimateService.offerBidSet(OFFER_STATE, OFFER_NUM);
		if (res1 == 1) {
			int res2 = estimateService.estimateBidSet(OFFER_STATE, ESTIMATE_NUM);
			
			if (res2 == 1) {
				if (OFFER_STATE == 1) {
					EstimateVO esvo = estimateService.estimateDetail(ESTIMATE_NUM);
					EstimateOfferVO offervo = estimateService.offerDetail(OFFER_NUM);
					EstimateOrderVO vo = new EstimateOrderVO();
					
					String thumbPic = (esvo.getESTIMATE_FILE().split(","))[0];
					
					vo.setES_ORDER_ESTIMATE(ESTIMATE_NUM);
					vo.setES_ORDER_OFFER(OFFER_NUM);
					vo.setES_ORDER_TITLE(esvo.getESTIMATE_TITLE());
					vo.setES_ORDER_BUYER(esvo.getESTIMATE_MEMBER());
					vo.setES_ORDER_WORKSHOP(offervo.getOFFER_WORKSHOP());
					vo.setES_ORDER_PIC(thumbPic);
					vo.setES_ORDER_PRICE(offervo.getOFFER_PRICE());
					
					int res3 = estimateService.esOrderInsert(vo);
				}
				else {
					int res3 = estimateService.esOrderDelete(ESTIMATE_NUM);
				}
			}
		}
		
		return redirect;
	}
	

	/* 일반회원 : 의뢰한 견적 리스트 */
	@RequestMapping(value = "/mypage_estimate.my")
	public String MypageEsOrderDetail(HttpSession session, HttpServletRequest request, Model model) {
		String ES_ORDER_BUYER = (String)session.getAttribute("MEMBER_EMAIL");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ES_ORDER_BUYER", ES_ORDER_BUYER);
		if (request.getParameter("ES_ORDER_STATE") != null) {
			int ES_ORDER_STATE = Integer.parseInt(request.getParameter("ES_ORDER_STATE"));
			map.put("ES_ORDER_STATE", ES_ORDER_STATE);
		}
		
		ArrayList<EstimateOrderVO> esOrderList = estimateService.esOrderList(map);
		
		for (int i=0; i<7; i++) {
			HashMap<String, Object> cntmap = new HashMap<String, Object>();
			cntmap.put("ES_ORDER_STATE", i);
			cntmap.put("ES_ORDER_BUYER", ES_ORDER_BUYER);
			int cnt = estimateService.esOrderCount(cntmap);
			model.addAttribute("esCount" + i, cnt);
		}
		
		model.addAttribute("esOrderList", esOrderList);
		
		return "Mypage/es_order_list";
	}
}
