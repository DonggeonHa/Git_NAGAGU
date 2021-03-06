package com.spring.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.academy.AcademyService;
import com.spring.academy.ClassQnaService;
import com.spring.academy.ClassReviewService;
import com.spring.academy.ClassVO;
import com.spring.academy.Class_qnaVO;
import com.spring.academy.Class_reviewVO;
import com.spring.chat.ChatRoomVO;
import com.spring.chat.ChatService;
import com.spring.estimate.EstimateOrderVO;
import com.spring.estimate.EstimateService;
import com.spring.member.MemberService;
import com.spring.member.MemberVO;
import com.spring.order.ProductOrderVO;
import com.spring.store.ProductQnaService;
import com.spring.store.ProductReviewService;
import com.spring.store.ProductService;
import com.spring.store.ProductVO;
import com.spring.store.Product_qnaVO;
import com.spring.store.Product_reviewVO;
import com.spring.workshop.WorkShopMemberService;
import com.spring.workshop.WorkShopMemberVO;
import com.spring.workshopMypage.AcademyManagementService;
import com.spring.workshopMypage.ProductManagementService;

@Controller
public class MypageController {
	@Autowired
	private MemberService memberService;

	@Autowired
	private WorkShopMemberService workShopMemberService;
	
	@Autowired(required = false)
	private AcademyService academyService;
	
	@Autowired(required = false)
	private EstimateService estimateService;

	@Autowired(required = false)
	private ChatService chatService;

	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductReviewService productreviewService;
	
	@Autowired
	private ProductQnaService productqnaService;
	
	@Autowired(required = false)
	private AcademyManagementService academyManagementService;

	@Autowired(required = false)
	private ProductManagementService productManagementService;
	
	@Autowired(required = false)
	private ClassReviewService classreviewService;
	
	@Autowired(required = false)
	private ClassQnaService classqnaService;

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
		int WORKSHOP_NUM = 0;
		if (request.getParameter("WORKSHOP_NUM") != null) {
			WORKSHOP_NUM = Integer.parseInt(request.getParameter("WORKSHOP_NUM"));
			wsMemberVO.setWORKSHOP_NUM(WORKSHOP_NUM);
		}
		else if (request.getParameter("ES_ORDER_WORKSHOP") != null) {
			wsMemberVO = workShopMemberService.selectByName(request.getParameter("ES_ORDER_WORKSHOP").toString());
			wsMemberVO.getWORKSHOP_NUM();
		}

		WorkShopMemberVO wsMemberDetail = workShopMemberService.selectwmember(wsMemberVO);

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
	public ModelAndView Workshopadmin(HttpSession session, ModelAndView mav) throws Exception{
		int WORKSHOP_NUM = (int)session.getAttribute("WORKSHOP_NUM");
		int i = 0;
		ArrayList<ClassVO> myClassList = null;
		ClassVO[] ClassList = new ClassVO[5];
		String class_name = null;
		int class_count_member = 0;
		ArrayList<ProductVO> productSellList = null;
		ProductVO[] sellList = new ProductVO[5];
		String product_category = null;
		String product_title = null;
		int product_sales = 0;
		int order_state = 0;
		try {
			productSellList = academyService.productSellList(WORKSHOP_NUM);
			for(i=0 ; i < 5; i++) {
				sellList[i] = productSellList.get(i);
			}
			
			for(i=0 ; i < 5; i++) {
				if(sellList[i] == null) {
					product_category = "nothing";
					product_title = "nothing";
					product_sales = 0;
					mav.addObject("product_category"+i, product_category);
					mav.addObject("product_title"+i, product_title);
					mav.addObject("product_sales"+i, product_sales);
					continue;
				} else {
					product_category = sellList[i].getPRODUCT_CATEGORY();
					product_title = sellList[i].getPRODUCT_TITLE();
					product_sales = sellList[i].getPRODUCT_SALES();
					if(product_sales == 0)
						product_sales = 1;
					mav.addObject("product_sales"+i, product_sales);
					mav.addObject("product_category"+i, product_category);
					mav.addObject("product_title"+i, product_title);
					continue;
				}
			}
			
			
			
			myClassList = academyService.myClassList(WORKSHOP_NUM);
			for(i=0 ; i < 5; i++) {
				ClassList[i] = myClassList.get(i);
			}
			for(i=0 ; i < 5; i++) {
				if(ClassList[i] == null) {
					class_name = "nothing";
					System.out.println("ClassList i는?" + i);
					mav.addObject("class_name"+i, class_name);
					mav.addObject("class_count_member"+i, 0);
					continue;
				}else {
					System.out.println("else문 ClassList i는?" + i);
					class_name = ClassList[i].getCLASS_NAME();
					class_count_member = ClassList[i].getCLASS_COUNT_MEMBER();
					mav.addObject("class_name"+i, class_name);
					mav.addObject("class_count_member"+i, class_count_member);
					continue;
				}
			}
			for(int number=0 ; number < 8; number++) {
				System.out.println("worknum: " + WORKSHOP_NUM + "number: " + number);
				order_state = academyManagementService.countOrderState(number, WORKSHOP_NUM);				
				mav.addObject("order_state"+number, order_state);
			}
		} catch(Exception e) {
			System.out.println("대시보드 컨트롤러 차트 에러" + e.toString());
		}
		mav.setViewName("Workshop/main");
		return mav;
	}
	
	@RequestMapping(value = "/workshop_modify.ws")
	public ModelAndView WorkshopModify(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		WorkShopMemberVO workshopVO = new WorkShopMemberVO();
		workshopVO.setWORKSHOP_NUM((int)(session.getAttribute("WORKSHOP_NUM")));
		workshopVO = workShopMemberService.selectwmember(workshopVO);
		System.out.println("이건폼이다" + workshopVO.getWORKSHOP_ADDRESS1());
		System.out.println(workshopVO.getWORKSHOP_ADDRESS2());
		
		mav.addObject("WorkShopMemberVO", workshopVO);
		mav.setViewName("Workshop/modify");
		
		return mav;
	}
	
	@RequestMapping(value = "/workshop_academy_Registration.ws")
	public String WorkshopAcademyRegistration() {
		
		return "Workshop/Academy/courseRegistration";
	}
	
	@RequestMapping(value = "/workshop_academy_Management.ws")
	public String WorkshopAcademyManagement() {
		
		return "Workshop/Academy/lectureManagement";
	}
	
	@RequestMapping(value = "/workshop_academy_Membership.ws")
	public String WorkshopAcademyMembership() {
		
		return "Workshop/Academy/memberShip";
	}
	
	@RequestMapping(value = "/workshop_review_qnaAcademy")
	public String WorkshopReviewreqAcademy() {
		
		return "Workshop/Review/qnaAcademy";
	}
	
	//강의 문의 상세
	@RequestMapping(value = "/AqnaInfo.my", method = {RequestMethod.GET, RequestMethod.POST})
	public String AqnaInfo(Class_qnaVO vo, Model model) {
		try {
			HashMap<String, Object> qnaVOmap = classqnaService.getQnaInfo(vo);
			Class_qnaVO replyVO = classqnaService.getQnaReplyInfo(vo);
			model.addAttribute("qnaVOmap", qnaVOmap);
			model.addAttribute("replyVO", replyVO);
			
		} catch(Exception e) {
			System.out.println("QnaInfo : " + e.getMessage());
		}		
		return "Workshop/Review/Info/AqnaInfo";
	}
	
	@RequestMapping(value = "/workshop_review_qnaStore.ws")
	public String WorkshopReviewreqStore() {
		
		return "Workshop/Review/qnaStore";
	}
	
	//스토어 문의 상세
	@RequestMapping(value = "/SqnaInfo.my", method = {RequestMethod.GET, RequestMethod.POST})
	public String SqnaInfo(Product_qnaVO vo, Model model) {
		try {
			HashMap<String, Object> qnaVOmap = productqnaService.getQnaInfo(vo);
			Product_qnaVO replyVO = productqnaService.getQnaReplyInfo(vo);
			model.addAttribute("qnaVOmap", qnaVOmap);
			model.addAttribute("replyVO", replyVO);
			
		} catch(Exception e) {
			System.out.println("QnaInfo : " + e.getMessage());
		}		
		return "Workshop/Review/Info/SqnaInfo";
	}

	

	@RequestMapping(value = "/workshop_review_Academy.ws")
	public String WorkshopReviewAcademy() {
		
		return "Workshop/Review/reviewAcademy";
	}
	
	//강의 후기 상세
	@RequestMapping(value = "/AreviewInfo.my", method = {RequestMethod.GET, RequestMethod.POST})
	public String AreviewInfo(Class_reviewVO vo, Model model) {
		try {
			HashMap<String, Object> reviewVOmap = classreviewService.getReviewInfo(vo);
			model.addAttribute("reviewVOmap", reviewVOmap);
		} catch(Exception e) {
			System.out.println("ReviewInfo : " + e.getMessage());
		}		
		return "Workshop/Review/Info/AreviewInfo";
	}

	@RequestMapping(value = "/workshop_review_Store.ws")
	public String WorkshopReviewStore() {
		
		return "Workshop/Review/reviewStore";
	}
	
	//스토어 후기 상세
	@RequestMapping(value = "/SreviewInfo.my", method = {RequestMethod.GET, RequestMethod.POST})
	public String SReviewInfo(Product_reviewVO vo, Model model) {
		try {
			HashMap<String, Object> reviewVOmap = productreviewService.getReviewInfo(vo);	
			model.addAttribute("reviewVOmap", reviewVOmap);
		} catch(Exception e) {
			System.out.println("ReviewInfo : " + e.getMessage());
		}		
		return "Workshop/Review/Info/SreviewInfo";
	}
	
	//판매된 상품 관리
	@RequestMapping(value = "/workshop_product_selled.ws")
	public ModelAndView WorkshopStoreselled(HttpSession session) {
		int WORKSHOP_NUM = (int)session.getAttribute("WORKSHOP_NUM");

		ArrayList<ProductVO> WorkshopProoductList = null;
		WorkshopProoductList = productService.getAllWorkshopProduct(WORKSHOP_NUM);   
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Workshop/Store/selled");
		mav.addObject("WorkshopProoductList", WorkshopProoductList);
		return mav;
	}
	//등록된 상품 관리
	@RequestMapping(value = "/workshop_product_items.ws")
	public String WorkshopStoreproduct() {
		
		return "Workshop/Store/product";
	}
	
	//selled 페이지에서 주문번호에 해당하는 상세보기 페이지	
	@RequestMapping(value = "/SproductSelledInfo.my", method = {RequestMethod.GET, RequestMethod.POST})
	public String SproductSelledInfo(ProductOrderVO vo, Model model, HttpSession session, HttpServletRequest request) {
		System.out.println("SproductSelledInfo.my 컨트롤러 시작");
		Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");
		String ORDER_AMOUNT = request.getParameter("ORDER_AMOUNT");
		System.out.println(ORDER_AMOUNT);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("WORKSHOP_NUM", WORKSHOP_NUM);
		map.put("ORDER_AMOUNT", ORDER_AMOUNT);

		ArrayList<Map<String, Object>> selledInfoList = null;
		try {
			selledInfoList = productManagementService.getSelledInfo(map); 
			System.out.println(selledInfoList);
			model.addAttribute("selledInfo", selledInfoList);
			if(selledInfoList.isEmpty()) {
				System.out.println("empty");
			} else {
				System.out.println("비어있지 않음");
			}
			System.out.println(selledInfoList.get(0).get("ORDER_AMOUNT"));			
		} catch(Exception e) {
			System.out.println("ReviewInfo : " + e.getMessage());
		}		
		return "Workshop/Review/Info/SproductSelledInfo";
	}	
	
	/* 일반회원 : 의뢰한 견적 리스트 */
	@RequestMapping(value = "/mypage_estimate.my")
	public String MypageEsOrderList(HttpSession session, HttpServletRequest request, Model model) {
		String ES_ORDER_BUYER_MAIL = (String)session.getAttribute("MEMBER_EMAIL");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ES_ORDER_BUYER_MAIL", ES_ORDER_BUYER_MAIL);
		if (request.getParameter("ES_ORDER_STATE") != null) {
			int ES_ORDER_STATE = Integer.parseInt(request.getParameter("ES_ORDER_STATE"));
			map.put("ES_ORDER_STATE", ES_ORDER_STATE);
		}
		
		ArrayList<EstimateOrderVO> esOrderList = estimateService.esOrderList(map);
		
		for (int i=0; i<7; i++) {
			HashMap<String, Object> cntmap = new HashMap<String, Object>();
			cntmap.put("ES_ORDER_STATE", i);
			cntmap.put("ES_ORDER_BUYER_MAIL", ES_ORDER_BUYER_MAIL);
			int cnt = estimateService.esOrderCount(cntmap);
			model.addAttribute("esCount" + i, cnt);
		}
		
		model.addAttribute("esOrderList", esOrderList);
		
		return "Mypage/es_order_list";
	}

	
	/* 견적 결제 페이지*/
	@RequestMapping(value = "/mypage_estimate_checkout.my")
	public String MypageEsOrderCheckout(HttpSession session, HttpServletRequest request, Model model) {
		String MEMBER_MAIL = (String)session.getAttribute("MEMBER_EMAIL");
		MemberVO vo = new MemberVO();
		vo.setMEMBER_EMAIL(MEMBER_MAIL);
		int ES_ORDER_NUM = 0;
		
		if (request.getParameter("ES_ORDER_NUM") != null) { 	/* 낙찰하기 */
			ES_ORDER_NUM = Integer.parseInt(request.getParameter("ES_ORDER_NUM"));
		}
		else if (request.getParameter("ESTIMATE_NUM") != null) {	/* 낙찰후 바로 결제하기 했을 경우 */
			ES_ORDER_NUM = estimateService.getEsOrderNum(Integer.parseInt(request.getParameter("ESTIMATE_NUM")));
		}
		
		EstimateOrderVO eovo = estimateService.esOrderDetail(ES_ORDER_NUM);
		MemberVO memvo = memberService.selectMember(vo);
		
		model.addAttribute("eovo", eovo);
		model.addAttribute("memvo", memvo);
		
		return "Mypage/es_order_checkout";
	}
	
	/* 견적 결제 완료 */
	@RequestMapping(value = "/mypage_estimate_payment.my")
	public String MypageEsOrderPayment(HttpServletRequest request, Model model) {
		EstimateOrderVO eovo = new EstimateOrderVO();
		int ES_ORDER_NUM = Integer.parseInt(request.getParameter("ES_ORDER_NUM"));
		
		eovo.setES_ORDER_NUM(ES_ORDER_NUM);
		eovo.setES_ORDER_BUYER_NAME(request.getParameter("ES_ORDER_BUYER_NAME"));
		eovo.setES_ORDER_BUYER_ZIP(request.getParameter("ES_ORDER_BUYER_ZIP"));
		eovo.setES_ORDER_BUYER_ADDRESS(request.getParameter("ES_ORDER_BUYER_ADDRESS1") + " " + request.getParameter("ES_ORDER_BUYER_ADDRESS2"));
		eovo.setES_ORDER_BUYER_PHONE(request.getParameter("ES_ORDER_BUYER_PHONE"));
		eovo.setES_ORDER_RECEIVER(request.getParameter("ES_ORDER_RECEIVER"));
		eovo.setES_ORDER_ZIP(request.getParameter("ES_ORDER_ZIP"));
		eovo.setES_ORDER_ADDRESS(request.getParameter("ES_ORDER_ADDRESS1") + " " + request.getParameter("ES_ORDER_ADDRESS2"));
		eovo.setES_ORDER_PHONE(request.getParameter("ES_ORDER_PHONE"));
		eovo.setES_ORDER_MEMO(request.getParameter("ES_ORDER_MEMO"));
		
		int res = estimateService.esOrderPay(eovo);
		
		if (res == 1) {
			EstimateOrderVO vo = estimateService.esOrderDetail(ES_ORDER_NUM);
			ChatRoomVO chatvo = new ChatRoomVO();

			chatvo.setCHATROOM_NUM(ES_ORDER_NUM);
			chatvo.setCHATROOM_CUSTOMER(vo.getES_ORDER_BUYER_MAIL());
			chatvo.setCHATROOM_WORKSHOP(vo.getES_ORDER_WORKSHOP());
			
			int res2 = chatService.chatroomCreate(chatvo);
			int res3 = estimateService.estimateBidSet(4, vo.getES_ORDER_ESTIMATE());
			
			eovo = estimateService.esOrderDetail(ES_ORDER_NUM);
			
			model.addAttribute("eovo", eovo);
			
			return "Mypage/es_order_success";
		}
		else {
			return "Mypage/es_order_fail";
		}
	}
	
	@RequestMapping(value = "/mypage_estimate_updateForm.my")
	public String MypageEsOrderUpdateForm(HttpServletRequest request, Model model) {
		EstimateOrderVO eovo = estimateService.esOrderDetail(Integer.parseInt(request.getParameter("ES_ORDER_NUM")));
		model.addAttribute("eovo", eovo);
		
		return "Mypage/es_order_update";
	}
	
	@RequestMapping(value = "/mypage_estimate_update.my")
	public String MypageEsOrderUpdate(HttpServletRequest request, Model model) {
		EstimateOrderVO eovo = new EstimateOrderVO();
		
		eovo.setES_ORDER_NUM(Integer.parseInt(request.getParameter("ES_ORDER_NUM")));
		eovo.setES_ORDER_RECEIVER(request.getParameter("ES_ORDER_RECEIVER"));
		eovo.setES_ORDER_ZIP(request.getParameter("ES_ORDER_ZIP"));
		eovo.setES_ORDER_BUYER_ADDRESS(request.getParameter("ES_ORDER_ADDRESS1" + " " + request.getParameter("ES_ORDER_ADDRESS2")));
		eovo.setES_ORDER_BUYER_PHONE(request.getParameter("ES_ORDER_PHONE"));
		eovo.setES_ORDER_MEMO(request.getParameter("ES_ORDER_MEMO"));
		
		int res = estimateService.esOrderModify(eovo);
		
		if (res == 1) {
			return "redirect:/mypage_estimate.my";
		}
		
		else {
			System.out.println("배송정보 수정 실패...");
			model.addAttribute(Integer.parseInt(request.getParameter("ES_ORDER_NUM")));
			
			return "redirect:/mypage_estimate_updateForm.my";
		}
	}
}
