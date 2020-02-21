package com.spring.order;

import java.util.ArrayList;
import java.util.Date;
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
import com.spring.store.ProductService;
import com.spring.store.ProductVO;

@Controller
public class BasketController {
	@Autowired
	private BasketService basketService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService productService;
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
		int BASKET_PRODUCT = Integer.parseInt(request.getParameter("PRODUCT_NUM"));
		basketVO.setBASKET_PRODUCT(BASKET_PRODUCT);
		System.out.println("amount는"+basketVO.getBASKET_AMOUNT());
		
		try {
			basketService.insertCart(basketVO);
			//insert후 바스켓넘버 받아오기
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("MEMBER_NUM", MEMBER_NUM);
			ArrayList<Map<String, Object>> getbasketList = null;
			getbasketList = basketService.getbasketList(map);
			retVal.put("getbasketList", getbasketList);
			retVal.put("res", "OK");
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	//수량 변경 업데이트
	@RequestMapping(value = "/updateAmount.my")
	public @ResponseBody  Map<String, Object> updateBasket(BasketVO basketVO, HttpSession session, HttpServletRequest request) {
		int MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		System.out.println("updateBasket 컨트롤러");
		basketVO.setBASKET_MEMBER(MEMBER_NUM);
		System.out.println(basketVO.getBASKET_AMOUNT());
		basketVO.setBASKET_AMOUNT(Integer.parseInt(request.getParameter("BASKET_AMOUNT")));
		System.out.println(basketVO.getBASKET_AMOUNT());
		String category = request.getParameter("category");
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
		int num = Integer.parseInt(request.getParameter("BASKET_NUM"));
		basketVO.setBASKET_NUM(num);
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
	@RequestMapping(value = "/updateCheck.my")
	public @ResponseBody Map<String, Object> MypageOrder(HttpSession session,HttpServletRequest request,BasketVO basketVO) {
		System.out.println("mypage_order컨트롤로");
		String[] arr = request.getParameterValues("arr[]");
		HashMap<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> retVal = new HashMap<String, Object>();
		String category = request.getParameter("category");
		try {
			if(category.equals("order")) {
				System.out.println("check1로 업데이트");
				map.put("num", 1);
				for(int i=0; i<arr.length; i++) {
					map.put("BASKET_NUM", Integer.parseInt(arr[i]));
					//basketVO.setBASKET_NUM(Integer.parseInt(arr[i]));
					int result = basketService.updateCheck(map);
				}
			}
			if(category.equals("paid")) {
				System.out.println("check2로 업데이트");
				map.put("num", 2);
				for(int i=0; i<arr.length; i++) {
					map.put("BASKET_NUM", Integer.parseInt(arr[i]));
					//basketVO.setBASKET_NUM(Integer.parseInt(arr[i]));
					int result = basketService.updateCheck(map);
					
					//선주-결제되면 PRODUCT 테이블에서 PRODUCT_SALES+1해줌(판매량+1)
					/* productService.updateSales(map); */
				}
			}
			retVal.put("res", "OK");
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	@RequestMapping(value = "/mypage_order.my")
		public String mypage_order(BasketVO basketVO,MemberVO memberVO, HttpSession session,HttpServletRequest request, Model model) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			int MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
			map.put("MEMBER_NUM", MEMBER_NUM);
			memberVO.setMEMBER_NUM(Integer.valueOf(MEMBER_NUM));
			MemberVO memberDetail = memberService.getMemberDetail(memberVO);
			ArrayList<Map<String, Object>> orderList = null;
			orderList  = basketService.getOrderList(map);
			model.addAttribute("memberDetail",memberDetail);
			model.addAttribute("orderList",orderList);
			return "Mypage/order";
	}
	//결제완료 후 이동 페이지
	@RequestMapping(value = "/mypage_order_success.my")
	public String mypage_order_success() {
		return "Mypage/success";
	}
	//결제내역 페이지(오더리스트?)
	@RequestMapping(value = "/getMyPaidOrder.my")
	public @ResponseBody Map<String, Object> getMyPaidOrder(HttpSession session,HttpServletRequest request,ProductOrderVO productOrderVO) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
		map.put("MEMBER_NUM", MEMBER_NUM);
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			System.out.println("start");
			productOrderVO.setORDER_MEMBER(MEMBER_NUM);
			ArrayList<Map<String, Object>> myPaidOrder = null;
			ArrayList<Map<String, Object>> getCount= null;
            ArrayList<Map<String, Object>> orderList= null;
            orderList  = basketService.getOrderList(map);//아직 결제 안된 리스트
            getCount  = basketService.getCount(map);
            for(int i=0; i<getCount.size();i++) {
            	System.out.println(getCount.get(i));
            }
            
            myPaidOrder  = basketService.getPaidList(map);
			retVal.put("orderList", orderList);
			retVal.put("getCount", getCount);
			retVal.put("myPaidOrder", myPaidOrder);
			retVal.put("res", "OK");
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal; 
	} 
	@RequestMapping(value = "/insertOrderProduct.my")
	public @ResponseBody  Map<String, Object> insertOrderProduct(ProductOrderVO productOrderVO, BasketVO basketVO, HttpSession session, HttpServletRequest request) {
		int MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
		Map<String, Object> retVal = new HashMap<String, Object>();
		productOrderVO.setORDER_MEMBER(MEMBER_NUM);
		System.out.println("insertOrderProduct 컨트롤러");
		try {
			basketService.insertOrder(productOrderVO);

			retVal.put("res", "OK");
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	@RequestMapping(value = "/order_detail.my")
	public String MypageOrderDetail() {
		return "Mypage/order_detail";
	}
	//결제내역 페이지(오더리스트?)
	@RequestMapping(value = "/getPaidDetail.my")
	public @ResponseBody Map<String, Object> getPaidDetail(HttpSession session,HttpServletRequest request,ProductOrderVO productOrderVO) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
		map.put("MEMBER_NUM", MEMBER_NUM);
		String ORDER_AMOUNT = request.getParameter("ORDER_AMOUNT");
		System.out.println(ORDER_AMOUNT);
		map.put("ORDER_AMOUNT", ORDER_AMOUNT);
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			ArrayList<Map<String, Object>> myPaidOrder = null;
			ArrayList<Map<String, Object>> getCount= null;
			myPaidOrder  = basketService.getPaidDetail(map);
			getCount  = basketService.getCount(map);
			retVal.put("getCount", getCount);
			retVal.put("myPaidOrder", myPaidOrder);
			retVal.put("res", "OK");
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal; 
	}
	
	@RequestMapping(value = "/order_list.my")
	public String MypageOrderList() {
		
		return "Mypage/order_list";
	}
}

