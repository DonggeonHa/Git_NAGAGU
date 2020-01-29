package com.spring.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	@RequestMapping(value = "/mypage.my")
	public String Mypage() {
		
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
	public String MypageBasket() {
		
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
	public String MypageEdit() {
		
		return "Mypage/edit";
	}
	@RequestMapping(value = "/mypage_reply.my")
	public String MypageReply() {
		
		return "Mypage/reply";
	}
	@RequestMapping(value = "/mypage_review_product.my")
	public String MypageReviewProduct() {		
		return "Mypage/review_product";
	}
	@RequestMapping(value = "/mypage_review_class.my")
	public String MypageReviewClass() {
		
		return "Mypage/review_class";
	}
	@RequestMapping(value = "/other_mypage.my")
	public String OtherMypage() {
		
		return "Mypage/other_mypage";
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
