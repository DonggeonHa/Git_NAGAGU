package com.spring.mypage;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.academy.AcademyService;
import com.spring.academy.ClassVO;
import com.spring.estimate.EstimateService;
import com.spring.estimate.EstimateVO;
import com.spring.member.MemberService;
import com.spring.member.MemberVO;
import com.spring.workshop.WorkShopMemberService;
import com.spring.workshop.WorkShopMemberVO;

@Controller
public class MypageController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private EstimateService estimateService;

	@Autowired
	private WorkShopMemberService workShopMemberService;
	
	@Autowired(required = false)
	private AcademyService academyService;
	
	@RequestMapping(value = "/mypage.my")
	public String Mypage(MemberVO memberVO, HttpServletRequest request, HttpSession session) {
		return "Mypage/mypage";
	}
	
	@RequestMapping(value = "/mypage_pic.my")
	public String MypagePic() {
		
		return "Mypage/picture";
	}
	
	@RequestMapping(value = "/mypage_like.my")
	public String MypageLike() {
		return "Mypage/like";
	}

	@RequestMapping(value = "/mypage_support.my")
	public String MypageSupport() {
		
		return "Mypage/support";
	}
	
	@RequestMapping(value = "/mypage_class.my")
	public String MypageClass() {
		return "Mypage/class";
	}
	
	//공방 마이페이지
	@RequestMapping(value = "/workshop_page.my")
	public String MypageClass(WorkShopMemberVO wsMemberVO, Model model, HttpServletRequest request) throws Exception {
		System.out.println("컨트롤러");
		//마이페이지 멤버
		WorkShopMemberVO wsMemberDetail = workShopMemberService.selectwmember(wsMemberVO);
		int WORKSHOP_NUM = Integer.parseInt(request.getParameter("WORKSHOP_NUM"));
		wsMemberVO.setWORKSHOP_NUM(WORKSHOP_NUM);
		
		
		//멤버가 올린 강의 리스트
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("WORKSHOP_NUM", WORKSHOP_NUM);
		ArrayList<ClassVO> classList = academyService.getClassListOfMember(map);
		model.addAttribute("classList",classList);
		model.addAttribute("wsMemberDetail",wsMemberDetail);
		System.out.println("classList="+classList);
		//업로드나 라이크 값이 없으면 일반 마이페이지, 있으면 more페이지
		if(request.getParameter("uploadOrLike")!=null) {
			return"Mypage/workshop_mypage_more";
		}
		return "Mypage/workshop_page";
	}
	
	@RequestMapping(value = "/mypage_edit.my")
	public ModelAndView MypageEdit(MemberVO memberVO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String member_email = (String)session.getAttribute("MEMBER_EMAIL");
		memberVO.setMEMBER_EMAIL(member_email);
		MemberVO member = new MemberVO();
		member = memberService.selectMember(memberVO);
		
		System.out.println(member.getADDRESS_ZIP());
		System.out.println(member.getADDRESS_ADDRESS1());
		System.out.println(member.getADDRESS_ADDRESS2());
		mav.setViewName("Mypage/edit");
		mav.addObject("member", member);
		
		return mav;
	}
	
	@RequestMapping(value = "/mypage_reply.my")
	public String MypageReply() {
		
		return "Mypage/reply";
	}
	@RequestMapping(value = "/mypage_review.my")
	public String MypageReviewProduct() {		
		return "Mypage/review";
	}
	@RequestMapping(value = "/other_mypage_more.my")
	public String OtherMypageMore() {
		
		return "Mypage/other_mypage_more";
	}
	
	@RequestMapping(value = "/order_vbank.my")
	public String MypageOrderVbank() {
		
		return "Mypage/order_vbank";
	}
	
	@RequestMapping(value = "/search.my")
	public String MypageSearch() {
		
		return "Mypage/search";
	}
	
	@RequestMapping(value = "/workshop.ws")
	public String Workshopadmin() {
		
		return "Mypage/Workshop/main";
	}
	
	@RequestMapping(value = "/workshop_modify.ws")
	public ModelAndView WorkshopModify(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		WorkShopMemberVO workshopVO = new WorkShopMemberVO();
		workshopVO.setWORKSHOP_NUM((int)(session.getAttribute("WORKSHOP_NUM")));
		workshopVO = workShopMemberService.selectwmember(workshopVO);
		
		mav.addObject("WorkShopMemberVO", workshopVO);
		mav.setViewName("Mypage/Workshop/modify");
		
		return mav;
	}
	
	@RequestMapping(value = "/workshop_academy_Registration.ws")
	public String WorkshopAcademyRegistration() {
		
		return "Mypage/Workshop/Academy/courseRegistration";
	}
	
	@RequestMapping(value = "/workshop_academy_Management.ws")
	public String WorkshopAcademyManagement() {
		
		return "Mypage/Workshop/Academy/lectureManagement";
	}
	
	@RequestMapping(value = "/workshop_academy_Membership.ws")
	public String WorkshopAcademyMembership() {
		
		return "Mypage/Workshop/Academy/memberShip";
	}
	
	@RequestMapping(value = "/workshop_review_qnaAcademy")
	public String WorkshopReviewreqAcademy() {
		
		return "Mypage/Workshop/Review/qnaAcademy";
	}
	
	@RequestMapping(value = "/workshop_review_qnaStore.ws")
	public String WorkshopReviewreqStore() {
		
		return "Mypage/Workshop/Review/qnaStore";
	}
	
	@RequestMapping(value = "/workshop_review_Academy.ws")
	public String WorkshopReviewAcademy() {
		
		return "Mypage/Workshop/Review/reviewAcademy";
	}
	
	@RequestMapping(value = "/workshop_review_Store.ws")
	public String WorkshopReviewStore() {
		
		return "Mypage/Workshop/Review/reviewStore";
	}
	
	//견적 제안 관리
	@RequestMapping(value = "/workshop_estimate_offers.ws")
	public String WorkshopStoreestOffers(HttpServletRequest request, HttpSession session, Model model) {
		String OFFER_WORKSHOP = (String)session.getAttribute("WORKSHOP_NAME");
		
		HashMap <String, Object> listmap = new HashMap <String, Object>();
		listmap.put("WO_CATEGORY", request.getParameter("category"));
		listmap.put("WO_SEARCH", request.getParameter("search_text"));
		
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
		
		model.addAttribute("page", page);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("offerCount", offerCount);
		model.addAttribute("rnum", rnum);
		model.addAttribute("woList", woList);
		
		
		
		return "Mypage/Workshop/Store/estOffers";
	}
	//견적 주문 관리
	@RequestMapping(value = "/workshop_estimate_product.ws")
	public String WorkshopStoreestProduct() {
		
		return "Mypage/Workshop/Store/estProduct";
	}
	//판매된 상품 관리
	@RequestMapping(value = "/workshop_product_selled.ws")
	public String WorkshopStoreselled() {
		
		return "Mypage/Workshop/Store/selled";
	}
	//등록된 상품 관리
	@RequestMapping(value = "/workshop_product_items.ws")
	public String WorkshopStoreproduct() {
		
		return "Mypage/Workshop/Store/product";
	}
}
