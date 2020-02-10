package com.spring.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.member.MemberService;
import com.spring.member.MemberVO;

@Controller
public class MypageController {
	@Autowired
	private MemberService memberService;
	
	
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
	@RequestMapping(value = "/mypage_estimate.my")
	public String MypageReviewClass() {
		
		return "Mypage/review_class";
	}
	@RequestMapping(value = "/other_mypage_more.my")
	public String OtherMypageMore() {
		
		return "Mypage/other_mypage_more";
	}
	
	@RequestMapping(value = "/order_vbank.my")
	public String MypageOrderVbank() {
		
		return "Mypage/order_vbank";
	}
	
	@RequestMapping(value = "/order_list.my")
	public String MypageOrderList() {
		
		return "Mypage/order_list";
	}
	
	@RequestMapping(value = "/order_detail.my")
	public String MypageOrderDetail() {
		
		return "Mypage/order_detail";
	}
	
	@RequestMapping(value = "/search.my")
	public String MypageSearch() {
		
		return "Mypage/search";
	}
	
	@RequestMapping(value = "/workshop.no")
	public String Workshopadmin() {
		
		return "Mypage/Workshop/main";
	}
	
	@RequestMapping(value = "/workshop_modify.no")
	public String WorkshopModify() {
		
		return "Mypage/Workshop/modify";
	}
	
	@RequestMapping(value = "/workshop_academy_Registration.no")
	public String WorkshopAcademyRegistration() {
		
		return "Mypage/Workshop/Academy/courseRegistration";
	}
	
	@RequestMapping(value = "/workshop_academy_Management.no")
	public String WorkshopAcademyManagement() {
		
		return "Mypage/Workshop/Academy/lectureManagement";
	}
	
	@RequestMapping(value = "/workshop_academy_Membership.no")
	public String WorkshopAcademyMembership() {
		
		return "Mypage/Workshop/Academy/memberShip";
	}
	
	@RequestMapping(value = "/workshop_review_qnaAcademy")
	public String WorkshopReviewreqAcademy() {
		
		return "Mypage/Workshop/Review/qnaAcademy";
	}
	
	@RequestMapping(value = "/workshop_review_qnaStore.no")
	public String WorkshopReviewreqStore() {
		
		return "Mypage/Workshop/Review/qnaStore";
	}
	
	@RequestMapping(value = "/workshop_review_Academy.no")
	public String WorkshopReviewAcademy() {
		
		return "Mypage/Workshop/Review/reviewAcademy";
	}
	
	@RequestMapping(value = "/workshop_review_Store.no")
	public String WorkshopReviewStore() {
		
		return "Mypage/Workshop/Review/reviewStore";
	}
	//견적 제안 관리
	@RequestMapping(value = "/workshop_estimate_offers.no")
	public String WorkshopStoreestOffers() {
		
		return "Mypage/Workshop/Store/estOffers";
	}
	//견적 주문 관리
	@RequestMapping(value = "/workshop_estimate_product.no")
	public String WorkshopStoreestProduct() {
		
		return "Mypage/Workshop/Store/estProduct";
	}
	//판매된 상품 관리
	@RequestMapping(value = "/workshop_product_selled.no")
	public String WorkshopStoreselled() {
		
		return "Mypage/Workshop/Store/selled";
	}
	//등록된 상품 관리
	@RequestMapping(value = "/workshop_product_items.no")
	public String WorkshopStoreproduct() {
		
		return "Mypage/Workshop/Store/product";
	}
}
