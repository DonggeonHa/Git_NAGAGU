package com.spring.mypage;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.member.MemberServiceImpl;
import com.spring.member.MemberVO;
import com.spring.store.ProductOrderServiceImpl;
import com.spring.store.ProductVO;

@Controller
public class MypageController {
	@Autowired
	private ProductOrderServiceImpl productOrderService;
	@Autowired
	private MemberServiceImpl memberService;
	
	
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
	
	@RequestMapping(value = "/mypage_basket.my")
	public String MypageBasket(BasketVO basketVO, HttpSession session, ProductVO productVO, HttpServletRequest request) {
		//바스켓에 업데이트 하고
		//product 값
		/*
		 * System.out.println("공방="+request.getParameter("PRODUCT_SHOPNAME"));
		 * System.out.println("제목="+request.getParameter("PRODUCT_TITLE"));
		 * System.out.println("가격="+request.getParameter("PRODUCT_PRICE"));
		 * System.out.println("배송가격="+request.getParameter("PRODUCT_SHIP_PRICE"));
		 * System.out.println("배송기간="+request.getParameter("PRODUCT_SHIP_DAYS"));
		 */
	
		//입력받는 값
		System.out.println("상품번호="+request.getParameter("PRODUCT_NUM"));
		System.out.println("컬러="+request.getParameter("PRODUCT_SHIP_PRICE"));
		System.out.println("사이즈는="+request.getParameter("BASKET_SIZE"));
		System.out.println("옵션은="+request.getParameter("BASKET_OPTION"));
		System.out.println("수량은="+request.getParameter("BASKET_AMOUNT"));
		
		
		int MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
		basketVO.setBASKET_MEMBER(MEMBER_NUM);
		basketVO.setBASKET_PRODUCT(request.getParameter("PRODUCT_NUM"));
		
		System.out.println(basketVO.getBASKET_MEMBER());
		System.out.println(basketVO.getBASKET_PRODUCT());
		System.out.println(basketVO.getBASKET_COLOR());
		System.out.println(basketVO.getBASKET_SIZE());
		System.out.println(basketVO.getBASKET_OPTION());
		System.out.println(basketVO.getBASKET_AMOUNT());
		
		productOrderService.insertCart(basketVO);
		
		return "Mypage/basket";
	}
	
	@RequestMapping(value = "/mypage_order.my")
	public String MypageOrder() {
		
		return "Mypage/order";
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
	
	@RequestMapping(value = "/workshop_review_reqAcademy.no")
	public String WorkshopReviewreqAcademy() {
		
		return "Mypage/Workshop/Review/reqAcademy";
	}
	
	@RequestMapping(value = "/workshop_review_reqStore.no")
	public String WorkshopReviewreqStore() {
		
		return "Mypage/Workshop/Review/reqStore";
	}
	
	@RequestMapping(value = "/workshop_review_Academy.no")
	public String WorkshopReviewAcademy() {
		
		return "Mypage/Workshop/Review/reviewAcademy";
	}
	
	@RequestMapping(value = "/workshop_review_Store.no")
	public String WorkshopReviewStore() {
		
		return "Mypage/Workshop/Review/reviewStore";
	}
	
	@RequestMapping(value = "/workshop_Store_estOffers.no")
	public String WorkshopStoreestOffers() {
		
		return "Mypage/Workshop/Store/estOffers";
	}
	
	@RequestMapping(value = "/workshop_Store_estProduct.no")
	public String WorkshopStoreestProduct() {
		
		return "Mypage/Workshop/Store/estProduct";
	}
	
	@RequestMapping(value = "/workshop_Store_selled.no")
	public String WorkshopStoreselled() {
		
		return "Mypage/Workshop/Store/selled";
	}
	
	@RequestMapping(value = "/workshop_Store_product.no")
	public String WorkshopStoreproduct() {
		
		return "Mypage/Workshop/Store/product";
	}
}
