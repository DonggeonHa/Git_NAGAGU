package com.spring.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.member.MemberService;
import com.spring.member.MemberVO;
import com.spring.order.BasketService;
import com.spring.order.BasketVO;
import com.spring.store.ProductVO;

@Controller
public class BasketController {
	@Autowired
	private BasketService basketService;
	@Autowired
	private MemberService memberService;
	
	//폼에서 받아와서 장바구니페이지(이동)
	@RequestMapping(value = "/mypage_basket.my")
	public String MypageBasket() {
		return "Mypage/basket";
	}
	@RequestMapping(value = "/insertBasket.my")
	public @ResponseBody  Map<String, Object> insertBasket(BasketVO basketVO, HttpSession session, HttpServletRequest request) {
		int MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		System.out.println("insertbasket 컨트롤러");
		basketVO.setBASKET_MEMBER(MEMBER_NUM);
		basketVO.setBASKET_PRODUCT(request.getParameter("PRODUCT_NUM"));
		System.out.println("amount는"+basketVO.getBASKET_AMOUNT());
		
		try {
			
			basketService.insertCart(basketVO);
			retVal.put("res", "OK");
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	//수량 변경 업데이트
	@RequestMapping(value = "/updateBasket.my")
	public @ResponseBody  Map<String, Object> updateBasket(BasketVO basketVO, HttpSession session, HttpServletRequest request) {
		int MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		System.out.println("updateBasket 컨트롤러");
		basketVO.setBASKET_MEMBER(MEMBER_NUM);
		
		String category = request.getParameter("category");
		System.out.println(category);
		
		
		try {
			if(category.equals("updateAmount")) {
				basketService.updateAmount(basketVO);
			}
			retVal.put("res", "OK");
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	
	//장바구니 페이지
	@RequestMapping(value = "/getMyBasket.my")
	public @ResponseBody Map<String, Object> getMyBasket(HttpSession session) {
		//HashMap<String, Object> map = new HashMap<String, Object>();
		//String fromNum = request.getParameter("fromNum");
		//map.put("fromNum", fromNum);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
		map.put("MEMBER_NUM", MEMBER_NUM);
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			System.out.println("getmybasket컨트롤러");
			//장바구니 개수세기
			int countBasket = basketService.countBasket(MEMBER_NUM);
			System.out.println("장바구니 개수="+countBasket);
			
			ArrayList<Map<String, Object>> getbasketList = null;
			getbasketList = basketService.getbasketList(map);
			retVal.put("countBasket", countBasket);
			retVal.put("getbasketList", getbasketList);
			retVal.put("res", "OK");
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal; 
	} 
	//장바구니에서 삭제
	@RequestMapping(value = "/deleteBasket.my")
	public @ResponseBody Map<String, Object> deleteBasket(BasketVO basketVO, HttpSession session,HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
		basketVO.setBASKET_MEMBER(MEMBER_NUM);
		basketVO.setBASKET_PRODUCT(request.getParameter("BASKET_PRODUCT"));
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			System.out.println("deleteBasket컨트롤러");
			//장바구니 개수세기
			int countBasket = basketService.countBasket(MEMBER_NUM);
			System.out.println("장바구니 개수="+countBasket);
			int result = basketService.deleteBasket(basketVO);
			retVal.put("countBasket", countBasket);
			retVal.put("res", "OK");
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	} 
//	@RequestMapping(value = "/mypage_order.my")
//	public String MypageOrder(HttpSession session,HttpServletRequest request,BasketVO basketVO) {
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		System.out.println("mypage_order컨트롤로");
//		String[] arr = request.getParameterValues("arr[]");
//		for(int i=0; i<arr.length; i++) {
//			map.put("BASKET_NUM", Integer.parseInt(arr[i]));
//			System.out.println(basketVO.getBASKET_NUM());
//			int result = basketService.updateCheck(map);
//			System.out.println(result);
//		}
//		return "Mypage/order";
//	}
//	
//	@RequestMapping(value = "/mypage_support.my")
//	public String MypageSupport() {
//		
//		return "Mypage/support";
//	}
//	
//	@RequestMapping(value = "/mypage_class.my")
//	public String MypageClass() {
//		
//		return "Mypage/class";
//	}
//	
//	@RequestMapping(value = "/mypage_reply.my")
//	public String MypageReply() {
//		
//		return "Mypage/reply";
//	}
//	@RequestMapping(value = "/mypage_review.my")
//	public String MypageReviewProduct() {		
//		return "Mypage/review";
//	}
//	@RequestMapping(value = "/mypage_estimate.my")
//	public String MypageReviewClass() {
//		
//		return "Mypage/review_class";
//	}
//	@RequestMapping(value = "/other_mypage_more.my")
//	public String OtherMypageMore() {
//		
//		return "Mypage/other_mypage_more";
//	}
//	
//	@RequestMapping(value = "/order_vbank.my")
//	public String MypageOrderVbank() {
//		
//		return "Mypage/order_vbank";
//	}
//	
//	@RequestMapping(value = "/order_list.my")
//	public String MypageOrderList() {
//		
//		return "Mypage/order_list";
//	}
//	
//	@RequestMapping(value = "/order_detail.my")
//	public String MypageOrderDetail() {
//		
//		return "Mypage/order_detail";
//	}
//	
//	@RequestMapping(value = "/search.my")
//	public String MypageSearch() {
//		
//		return "Mypage/search";
//	}
//	
//	@RequestMapping(value = "/workshop.no")
//	public String Workshopadmin() {
//		
//		return "Mypage/Workshop/main";
//	}
//	
//	@RequestMapping(value = "/workshop_modify.no")
//	public String WorkshopModify() {
//		
//		return "Mypage/Workshop/modify";
//	}
//	
//	@RequestMapping(value = "/workshop_academy_Registration.no")
//	public String WorkshopAcademyRegistration() {
//		
//		return "Mypage/Workshop/Academy/courseRegistration";
//	}
//	
//	@RequestMapping(value = "/workshop_academy_Management.no")
//	public String WorkshopAcademyManagement() {
//		
//		return "Mypage/Workshop/Academy/lectureManagement";
//	}
//	
//	@RequestMapping(value = "/workshop_academy_Membership.no")
//	public String WorkshopAcademyMembership() {
//		
//		return "Mypage/Workshop/Academy/memberShip";
//	}
//	
//	@RequestMapping(value = "/workshop_review_reqAcademy.no")
//	public String WorkshopReviewreqAcademy() {
//		
//		return "Mypage/Workshop/Review/reqAcademy";
//	}
//	
//	@RequestMapping(value = "/workshop_review_reqStore.no")
//	public String WorkshopReviewreqStore() {
//		
//		return "Mypage/Workshop/Review/reqStore";
//	}
//	
//	@RequestMapping(value = "/workshop_review_Academy.no")
//	public String WorkshopReviewAcademy() {
//		
//		return "Mypage/Workshop/Review/reviewAcademy";
//	}
//	
//	@RequestMapping(value = "/workshop_review_Store.no")
//	public String WorkshopReviewStore() {
//		
//		return "Mypage/Workshop/Review/reviewStore";
//	}
//	
//	@RequestMapping(value = "/workshop_Store_estOffers.no")
//	public String WorkshopStoreestOffers() {
//		
//		return "Mypage/Workshop/Store/estOffers";
//	}
//	
//	@RequestMapping(value = "/workshop_Store_estProduct.no")
//	public String WorkshopStoreestProduct() {
//		
//		return "Mypage/Workshop/Store/estProduct";
//	}
//	
//	@RequestMapping(value = "/workshop_Store_selled.no")
//	public String WorkshopStoreselled() {
//		
//		return "Mypage/Workshop/Store/selled";
//	}
//	
//	@RequestMapping(value = "/workshop_Store_product.no")
//	public String WorkshopStoreproduct() {
//		
//		return "Mypage/Workshop/Store/product";
//	}
}
