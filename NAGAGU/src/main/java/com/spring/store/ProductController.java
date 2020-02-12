package com.spring.store;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.member.MemberVO;
import com.spring.workshop.WorkShopMemberVO;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private ProductReviewService reviewService;
	@Autowired
	private ProductQnaService qnaService;

	@Autowired
	MappingJackson2JsonView jsonView;	
	
	@RequestMapping(value = "/productcategory.pro")
	public String productcategory(Model model) {
		
		return "Store/productCategory";
	}
	
	@RequestMapping(value = "/productlist.pro", method = RequestMethod.GET)
	public String productlist(ProductVO productVO, MemberVO memberVO, Model model, HttpServletRequest request, HttpSession session) {
		System.out.println("/productlist.pro------------------------------");
		
		/*로그인 멤버*/
		if(session.getAttribute("MEMBER_NUM") != null) {
			memberVO.setMEMBER_NUM((int)session.getAttribute("MEMBER_NUM"));
			MemberVO LoginMemberVO = reviewService.getLoginMemberbyNUM(memberVO);			
			/*로그인 멤버 관련*/
			model.addAttribute("LoginMemberVO",LoginMemberVO);		
		}
		
		
		int page = 1; //초기값 1
		int limit = 9; //한 페이지당 출력할 글의 수
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startrow = (page - 1) * 9 + 1; // 읽기 시작할 row 번호.
		int endrow = startrow + limit - 1; //읽을 마지막 row 번호.

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startrow", startrow);
		map.put("endrow", endrow);	
		
		
		String PRODUCT_CATEGORY = "all";	//초기값
		PRODUCT_CATEGORY = request.getParameter("PRODUCT_CATEGORY");
//		PRODUCT_CATEGORY = productVO.getPRODUCT_CATEGORY();
		String sort = "new";
		if(request.getParameter("sort") != null) {
			sort = request.getParameter("sort");
		}

		map.put("PRODUCT_CATEGORY", PRODUCT_CATEGORY);
		map.put("sort", sort);		
		
		System.out.println(PRODUCT_CATEGORY);
		System.out.println(sort);
		System.out.println(startrow);
		System.out.println(endrow);
	
		int productcount;		
		ArrayList<ProductVO> productList = null;
		
		productList = productService.getproductlist(map);			
		productcount = productService.getproductcount(map);
		System.out.println("PRODUCT_CATEGORY:"+PRODUCT_CATEGORY);
		System.out.println("productcount:"+productcount);
		
		
		//총 페이지 수
		int maxpage = (int)((double)productcount / limit + 0.95); // 0.95를 더해서 올림 처리
		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1; // 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
		int endpage =startpage + 10 - 1; // 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등..)
		
		if (endpage > maxpage)
			endpage = maxpage;

		model.addAttribute("PRODUCT_CATEGORY", PRODUCT_CATEGORY);
		model.addAttribute("sort", sort);
		model.addAttribute("page", page);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("productcount", productcount);
		model.addAttribute("productList", productList);
		
		return "Store/productList";
	}

	@RequestMapping(value = "/getReviewList.pro", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public HashMap<String, Object> productdetailreview(ProductVO productVO, MemberVO memberVO, Model model, HttpServletRequest request, HttpSession session) {
		System.out.println("댓글확인");


		
		/*리뷰 리스트*/
		int limit = 5; //한 페이지당 출력할 글의 수

		int reviewpage = Integer.parseInt(request.getParameter("pg"));
		int PRODUCT_NUM= Integer.parseInt(request.getParameter("PRODUCT_NUM"));
		
		int startrow = (reviewpage - 1) * 5 + 1; // 읽기 시작할 row 번호.
		int endrow = startrow + limit - 1; //읽을 마지막 row 번호.
		
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("startrow", startrow);
		map1.put("endrow", endrow);
		map1.put("PRODUCT_NUM", PRODUCT_NUM);
		
		int reviewCount;
		int review_RE_Count;	//RE는 답글
		ArrayList<Product_reviewVO> reviewList = null;
		ArrayList<Product_reviewVO> review_RE_List = null;
		reviewCount = reviewService.getReviewCount(map1);
		//리뷰까지는 멤버 조인 쿼리 만들었음 //리뷰의 답글은 만들어야함
//		review_RE_Count = reviewService.getReview_RE_Count(map1);
	//	reviewList = reviewService.getReviewList123(map1);
//		review_RE_List = reviewService.getReview_RE_List(map1);
	
		
//		//리뷰 멤버
//		ArrayList<MemberVO> reviewMemberList = null;
//		reviewMemberList = reviewService.getreviewMemberList(map1);
//		
		
//		
//		//리뷰 답글 멤버
//		ArrayList<MemberVO> review_RE_MemberList = null;
//		review_RE_MemberList = reviewService.getreview_RE_MemberList(map1);
		
		HashMap<String, Object> retVal = new HashMap<String, Object>();
		try {
			reviewList = reviewService.getReviewList123(map1);
			retVal.put("res", "OK");
			retVal.put("reviewList", reviewList);
			retVal.put("reviewCount", reviewCount);	//allRowCnt

		} catch(Exception e) {
			retVal.put("res", "FAIL");
		}
		
		return retVal;
	}
	

	@RequestMapping(value = "/productdetail.pro", method = RequestMethod.GET)
	public String productdetail(ProductVO productVO, MemberVO memberVO, Model model, HttpServletRequest request, HttpSession session) {

		/*로그인 멤버*/
		if(session.getAttribute("MEMBER_NUM") != null) {
			System.out.println("멤버넘");
			System.out.println("멤버넘"+session.getAttribute("MEMBER_NUM"));
			memberVO.setMEMBER_NUM((int)session.getAttribute("MEMBER_NUM"));
			//int index = ((Integer)(session.getAttribute("index"))).intValue();
			MemberVO LoginMemberVO = reviewService.getLoginMemberbyNUM(memberVO);			
			System.out.println("1"+memberVO.getMEMBER_NUM());
			System.out.println("로그인 멤버 확인- membernum="+(int)session.getAttribute("MEMBER_NUM"));
			System.out.println("로그인 멤버 확인- membernick="+LoginMemberVO.getMEMBER_NICK());
			System.out.println("로그인 멤버 확인- memberpicture="+LoginMemberVO.getMEMBER_PICTURE());
			/*로그인 멤버 관련*/
			model.addAttribute("LoginMemberVO",LoginMemberVO);
		
		}
	
		
		/*상품 vo 가져오기*/
		String PRODUCT_CATEGORY = request.getParameter("PRODUCT_CATEGORY");
		int PRODUCT_NUM = Integer.parseInt(request.getParameter("PRODUCT_NUM"));
		ProductVO vo = null;
//		vo.setPRODUCT_NUM(PRODUCT_NUM);
		vo = productService.getproductVO(PRODUCT_NUM);
		/*이 product의 워크샵 넘버 필요함*/	
		WorkShopMemberVO workshopVO = productService.selectWorkshop(vo);
		int WorkshopMatchingNumber = workshopVO.getWORKSHOP_NUM();
		int WorkshopNum = workshopVO.getWORKSHOP_NUM();
		model.addAttribute("WorkshopNum",WorkshopNum);
		model.addAttribute("WorkshopMatchingNumber",WorkshopMatchingNumber);
		/*qna 답글 출력시 워크샵 name, pic 필요함*/
		String WorkshopName = workshopVO.getWORKSHOP_NAME();
		String WorkshopPicture = workshopVO.getWORKSHOP_PICTURE();
		model.addAttribute("WorkshopName",WorkshopName);
		model.addAttribute("WorkshopPicture",WorkshopPicture);

		
		/*리뷰 리스트*/
		int reviewpage = 1; //초기값 1
		int limit = 5; //한 페이지당 출력할 글의 수
		
		if(request.getParameter("reviewpage") != null) {
			reviewpage = Integer.parseInt(request.getParameter("reviewpage"));
		}
		
		int startrow = (reviewpage - 1) * 5 + 1; // 읽기 시작할 row 번호.
		int endrow = startrow + limit - 1; //읽을 마지막 row 번호.
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startrow", startrow);
		map.put("endrow", endrow);
		map.put("PRODUCT_NUM", PRODUCT_NUM);
		
		int reviewCount;
		int review_RE_Count;	//RE는 답글
		ArrayList<Product_reviewVO> reviewList = null;
		ArrayList<Product_reviewVO> review_RE_List = null;
		reviewCount = reviewService.getReviewCount(map);
		review_RE_Count = reviewService.getReview_RE_Count(map);
		reviewList = reviewService.getReviewList(map);
		review_RE_List = reviewService.getReview_RE_List(map);

		//리스트 총 페이지 수
		int maxpage = (int)((double)reviewCount / limit + 0.95); // 0.95를 더해서 올림 처리
		int startpage = (((int) ((double)reviewpage / 10 + 0.9)) - 1) * 10 + 1; // 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
		int endpage =startpage + 10 - 1; // 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등..)
		
		if (endpage > maxpage)
			endpage = maxpage;		
		
		//리뷰 멤버
		ArrayList<MemberVO> reviewMemberList = null;
		reviewMemberList = reviewService.getreviewMemberList(map);
		
		
		
		//리뷰 답글 멤버
		ArrayList<MemberVO> review_RE_MemberList = null;
		review_RE_MemberList = reviewService.getreview_RE_MemberList(map);

		
		
		/*qna 리스트*/
		//qna 원글 리스트
		int qnapage = 1; //초기값 1
		int qnalimit = 5; //한 페이지당 출력할 글의 수
		
		if(request.getParameter("qnapage") != null) {
			qnapage = Integer.parseInt(request.getParameter("qnapage"));
		}
		
		int qnastartrow = (qnapage - 1) * 5 + 1; // 읽기 시작할 row 번호.
		int qnaendrow = qnastartrow + qnalimit - 1; //읽을 마지막 row 번호.
		
		HashMap<String, Object> qnamap = new HashMap<String, Object>();
		qnamap.put("qnastartrow", qnastartrow);
		qnamap.put("qnaendrow", qnaendrow);
		qnamap.put("PRODUCT_NUM", PRODUCT_NUM);
		System.out.println("qnastartrow="+qnastartrow);
		System.out.println("qnaendrow="+qnaendrow);
		int qnaCount;
		int qna_RE_Count;
		ArrayList<Product_qnaVO> qnaList = null;
		ArrayList<Product_qnaVO> qna_RE_List = null;
		qnaCount = qnaService.getQnaCount(qnamap);	//원글이 존재하면, qna리스트 출력
		qna_RE_Count = qnaService.getQna_RE_Count(qnamap);	//원글이 존재하면, qna리스트 출력
		qnaList = qnaService.getQnaList(qnamap);	//원글 리스트
		qna_RE_List = qnaService.getQna_RE_List(qnamap);	//원글 리스트

	
		
		//qna 총 페이지 수
		int qnamaxpage = (int)((double)qnaCount / qnalimit + 0.95); // 0.95를 더해서 올림 처리
		int qnastartpage = (((int) ((double)qnapage / 10 + 0.9)) - 1) * 10 + 1; // 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
		int qnaendpage =startpage + 10 - 1; // 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등..)
		
		if (qnaendpage > qnamaxpage)
			qnaendpage = qnamaxpage;		
		
		
		//qna 멤버
		ArrayList<MemberVO> qnaMemberList = null;
		qnaMemberList = qnaService.getqnaMemberList(map);
		
		if(qnaMemberList == null) {
			System.out.println("qnaMemberList는 null");
		} else {
			System.out.println("qnaMemberList는 null이 아님");
		}		
		
		
		//상세페이지 들어가기 전에 조회수 1 증가
		productService.updateReadCount(PRODUCT_NUM);
		
		/*상품 상세 관련 */
		model.addAttribute("productVO", vo);
		model.addAttribute("PRODUCT_CATEGORY", PRODUCT_CATEGORY);
		model.addAttribute("PRODUCT_NUM", PRODUCT_NUM);

		/*리뷰 댓글 관련 */
		model.addAttribute("reviewpage", reviewpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("review_RE_Count", review_RE_Count);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("review_RE_List", review_RE_List);
		
		/*리뷰 멤버 관련*/
		model.addAttribute("reviewMemberList", reviewMemberList);
		model.addAttribute("review_RE_MemberList", review_RE_MemberList);
		
		/*qna 댓글 관련 */
		model.addAttribute("qnapage", qnapage);
		model.addAttribute("qnamaxpage", qnamaxpage);
		model.addAttribute("qnastartpage", qnastartpage);
		model.addAttribute("qnaendpage", qnaendpage);
		model.addAttribute("qnaCount", qnaCount);
		model.addAttribute("qna_RE_Count", qna_RE_Count);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("qna_RE_List", qna_RE_List);
		
		/*qna 멤버 관련*/
		model.addAttribute("qnaMemberList", qnaMemberList);		
		
		return "Store/productDetail";
	}
	


@RequestMapping(value = "/productdetail123.pro", method = RequestMethod.GET)
public String productdetail123(ProductVO productVO, MemberVO memberVO, Model model, HttpServletRequest request, HttpSession session) {

	/*로그인 멤버*/
	if(session.getAttribute("MEMBER_NUM") != null) {
		System.out.println("멤버넘");
		System.out.println("멤버넘"+session.getAttribute("MEMBER_NUM"));
		memberVO.setMEMBER_NUM((int)session.getAttribute("MEMBER_NUM"));
		//int index = ((Integer)(session.getAttribute("index"))).intValue();
		MemberVO LoginMemberVO = reviewService.getLoginMemberbyNUM(memberVO);			
		System.out.println("1"+memberVO.getMEMBER_NUM());
		System.out.println("로그인 멤버 확인- membernum="+(int)session.getAttribute("MEMBER_NUM"));
		System.out.println("로그인 멤버 확인- membernick="+LoginMemberVO.getMEMBER_NICK());
		System.out.println("로그인 멤버 확인- memberpicture="+LoginMemberVO.getMEMBER_PICTURE());
		/*로그인 멤버 관련*/
		model.addAttribute("LoginMemberVO",LoginMemberVO);
	
	}

	
	/*상품 vo 가져오기*/
	String PRODUCT_CATEGORY = request.getParameter("PRODUCT_CATEGORY");
	int PRODUCT_NUM = Integer.parseInt(request.getParameter("PRODUCT_NUM"));
	ProductVO vo = null;
//	vo.setPRODUCT_NUM(PRODUCT_NUM);
	vo = productService.getproductVO(PRODUCT_NUM);
	/*이 product의 워크샵 넘버 필요함*/	
	WorkShopMemberVO workshopVO = productService.selectWorkshop(vo);
	int WorkshopMatchingNumber = workshopVO.getWORKSHOP_NUM();
	int WorkshopNum = workshopVO.getWORKSHOP_NUM();
	model.addAttribute("WorkshopNum",WorkshopNum);
	model.addAttribute("WorkshopMatchingNumber",WorkshopMatchingNumber);
	/*qna 답글 출력시 워크샵 name, pic 필요함*/
	String WorkshopName = workshopVO.getWORKSHOP_NAME();
	String WorkshopPicture = workshopVO.getWORKSHOP_PICTURE();
	model.addAttribute("WorkshopName",WorkshopName);
	model.addAttribute("WorkshopPicture",WorkshopPicture);

	
	/*리뷰 리스트*/
	int reviewpage = 1; //초기값 1
	int limit = 5; //한 페이지당 출력할 글의 수
	
	if(request.getParameter("reviewpage") != null) {
		reviewpage = Integer.parseInt(request.getParameter("reviewpage"));
	}
	
	int startrow = (reviewpage - 1) * 5 + 1; // 읽기 시작할 row 번호.
	int endrow = startrow + limit - 1; //읽을 마지막 row 번호.
	
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("startrow", startrow);
	map.put("endrow", endrow);
	map.put("PRODUCT_NUM", PRODUCT_NUM);
	
	int reviewCount;
	int review_RE_Count;	//RE는 답글
	ArrayList<Product_reviewVO> reviewList = null;
	ArrayList<Product_reviewVO> review_RE_List = null;
	reviewCount = reviewService.getReviewCount(map);
	review_RE_Count = reviewService.getReview_RE_Count(map);
	reviewList = reviewService.getReviewList(map);
	review_RE_List = reviewService.getReview_RE_List(map);

	//리스트 총 페이지 수
	int maxpage = (int)((double)reviewCount / limit + 0.95); // 0.95를 더해서 올림 처리
	int startpage = (((int) ((double)reviewpage / 10 + 0.9)) - 1) * 10 + 1; // 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
	int endpage =startpage + 10 - 1; // 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등..)
	
	if (endpage > maxpage)
		endpage = maxpage;		
	
	//리뷰 멤버
	ArrayList<MemberVO> reviewMemberList = null;
	reviewMemberList = reviewService.getreviewMemberList(map);
	
	//리뷰 답글 멤버
	ArrayList<MemberVO> review_RE_MemberList = null;
	review_RE_MemberList = reviewService.getreview_RE_MemberList(map);

	
	/*qna 리스트*/
	//qna 원글 리스트
	int qnapage = 1; //초기값 1
	int qnalimit = 5; //한 페이지당 출력할 글의 수
	
	if(request.getParameter("qnapage") != null) {
		qnapage = Integer.parseInt(request.getParameter("qnapage"));
	}
	
	int qnastartrow = (qnapage - 1) * 5 + 1; // 읽기 시작할 row 번호.
	int qnaendrow = qnastartrow + qnalimit - 1; //읽을 마지막 row 번호.
	
	HashMap<String, Object> qnamap = new HashMap<String, Object>();
	qnamap.put("qnastartrow", qnastartrow);
	qnamap.put("qnaendrow", qnaendrow);
	qnamap.put("PRODUCT_NUM", PRODUCT_NUM);
	System.out.println("qnastartrow="+qnastartrow);
	System.out.println("qnaendrow="+qnaendrow);
	int qnaCount;
	int qna_RE_Count;
	ArrayList<Product_qnaVO> qnaList = null;
	ArrayList<Product_qnaVO> qna_RE_List = null;
	qnaCount = qnaService.getQnaCount(qnamap);	//원글이 존재하면, qna리스트 출력
	qna_RE_Count = qnaService.getQna_RE_Count(qnamap);	//원글이 존재하면, qna리스트 출력
	qnaList = qnaService.getQnaList(qnamap);	//원글 리스트
	qna_RE_List = qnaService.getQna_RE_List(qnamap);	//원글 리스트


	
	//qna 총 페이지 수
	int qnamaxpage = (int)((double)qnaCount / qnalimit + 0.95); // 0.95를 더해서 올림 처리
	int qnastartpage = (((int) ((double)qnapage / 10 + 0.9)) - 1) * 10 + 1; // 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
	int qnaendpage =startpage + 10 - 1; // 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등..)
	
	if (qnaendpage > qnamaxpage)
		qnaendpage = qnamaxpage;		
	
	
	//qna 멤버
	ArrayList<MemberVO> qnaMemberList = null;
	qnaMemberList = qnaService.getqnaMemberList(map);
	
	if(qnaMemberList == null) {
		System.out.println("qnaMemberList는 null");
	} else {
		System.out.println("qnaMemberList는 null이 아님");
	}		
	
	
	//상세페이지 들어가기 전에 조회수 1 증가
	productService.updateReadCount(PRODUCT_NUM);
	
	/*상품 상세 관련 */
	model.addAttribute("productVO", vo);
	model.addAttribute("PRODUCT_CATEGORY", PRODUCT_CATEGORY);
	model.addAttribute("PRODUCT_NUM", PRODUCT_NUM);

	/*리뷰 댓글 관련 */
	model.addAttribute("reviewpage", reviewpage);
	model.addAttribute("maxpage", maxpage);
	model.addAttribute("startpage", startpage);
	model.addAttribute("endpage", endpage);
	model.addAttribute("reviewCount", reviewCount);
	model.addAttribute("review_RE_Count", review_RE_Count);
	model.addAttribute("reviewList", reviewList);
	model.addAttribute("review_RE_List", review_RE_List);
	
	/*리뷰 멤버 관련*/
	model.addAttribute("reviewMemberList", reviewMemberList);
	model.addAttribute("review_RE_MemberList", review_RE_MemberList);
	
	/*qna 댓글 관련 */
	model.addAttribute("qnapage", qnapage);
	model.addAttribute("qnamaxpage", qnamaxpage);
	model.addAttribute("qnastartpage", qnastartpage);
	model.addAttribute("qnaendpage", qnaendpage);
	model.addAttribute("qnaCount", qnaCount);
	model.addAttribute("qna_RE_Count", qna_RE_Count);
	model.addAttribute("qnaList", qnaList);
	model.addAttribute("qna_RE_List", qna_RE_List);
	
	/*qna 멤버 관련*/
	model.addAttribute("qnaMemberList", qnaMemberList);		
	
	return "Store/productDetail123";
}


	
	
	
	//-------------------------------------------리뷰1-댓글등록
	//-------------------------------------------리뷰re1-2.-답글등록process(review_re)
	//다중파일 업로드 됨!!!
	@RequestMapping(value="/review_insert.do",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public String insert_review(MultipartHttpServletRequest request, HttpSession session) throws Exception {
		System.out.println("컨트롤러 왔다");
		Product_reviewVO reviewVO = new Product_reviewVO();
		
		System.out.println("REVIEW_CONTENT=" + request.getParameter("REVIEW_CONTENT"));
	
		String str = "";
		if(!request.getFiles("REVIEW_FILE").isEmpty()) {
			List<MultipartFile> fileList = new ArrayList<MultipartFile>(); 
			
			// input file 에 아무것도 없을 경우 (파일을 업로드 하지 않았을 때 처리) 
			if(request.getFiles("REVIEW_FILE").get(0).getSize() != 0) { 
				fileList = request.getFiles("REVIEW_FILE"); 
			} 
	
			System.out.println("파일 없을 때 2");
			
			String path = "C:\\Project138\\upload\\"; 
			File fileDir = new File(path); 
			if (!fileDir.exists()) { 
				fileDir.mkdirs(); 
			} 
			
			long time = System.currentTimeMillis(); 
			
			for (MultipartFile mf : fileList) { 
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명 
				String saveFileName = String.format("%d_%s", time, originFileName);
	
				try { // 파일생성
					mf.transferTo(new File(path, saveFileName)); 
					str += saveFileName + ",";
				} catch (Exception e) { 
					e.printStackTrace(); 
					} 
				}
			System.out.println("파일 없을 때 6");
	
			System.out.println("str = " + str);
			
			if(str.length() != 0) {
				str = str.substring(0, str.length()-1);
			} else {
				str = "#";
			}
			
			/*
		    if (str.length() > 0 && str.charAt(str.length()-1)==',') {
		        str = str.substring(0, str.length()-1);
		      }
			*/
			
			
		    System.out.println("str 2 = " + str);
		} else {
			str = "#";
		}

	    
		//reviewVO.setREVIEW_NUM(0); //시퀀스 이용
		reviewVO.setREVIEW_MEMBER((int)session.getAttribute("MEMBER_NUM"));
		reviewVO.setREVIEW_PRODUCT(Integer.parseInt(request.getParameter("REVIEW_PRODUCT")));
		reviewVO.setREVIEW_DATE(new Timestamp(System.currentTimeMillis()));
		reviewVO.setREVIEW_FILE(str);
		reviewVO.setREVIEW_CONTENT(request.getParameter("REVIEW_CONTENT"));
		

		//넘겨받은 REVIEW_RE가 존재하면 답글이고(원글의 REVIEW_NUM을 전달해줌), null이면 원글이다.
		if(request.getParameter("REVIEW_RE") != null) {	
			//답글 - GRADE=10, RE=NUM
			reviewVO.setREVIEW_GRADE(7);
			reviewVO.setREVIEW_RE(Integer.parseInt(request.getParameter("REVIEW_RE")));
		} else {	
			//원글 - GRADE=GRADE, RE=0
			reviewVO.setREVIEW_GRADE(Double.parseDouble(request.getParameter("REVIEW_GRADE")));
			reviewVO.setREVIEW_RE(0);
		}
		
		int res = reviewService.insertReview(reviewVO);
		
		
		//답글
		//댓글(review) 입력시 grade update(답글 입력시는  grade 상관 없다)
		//update해야하는 상품의 vo 가져옴
		if(request.getParameter("REVIEW_RE") == null) {
			System.out.println("왔나?");
			ProductVO productVO = null;
			productVO = productService.getproductVO(Integer.parseInt(request.getParameter("REVIEW_PRODUCT")));
		
			double grade = productVO.getPRODUCT_GRADE();	//이  grade에 인원수를 곱해줘야 순수 grade누적값이 나온다.
			int gradepeoplecount = reviewService.getGradePeopleCount(Integer.parseInt(request.getParameter("REVIEW_PRODUCT")));	//인원수 구해오기(PRODUCT_NUM = REVIEW_PRODUCT)
			double totalGrade = grade * (gradepeoplecount-1);	//이전까지 total 누적 grade	//gradepeoplecount는 update된 후이므로 이전걸 계산하려면 -1해줘야함

			//(grade 총합+현재 리뷰 grade) / (gradepeoplecount)
			double newGrade = (totalGrade+Double.parseDouble(request.getParameter("REVIEW_GRADE"))) / (gradepeoplecount);
			
			//product테이블에 grade update
			productVO.setPRODUCT_NUM(Integer.parseInt(request.getParameter("REVIEW_PRODUCT")));
			productVO.setPRODUCT_GRADE(newGrade);
			productService.updateGrade(productVO);
			
			
		} 	
		
		
		System.out.println("res="+res);		
	
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(reviewVO);
			System.out.println(str);
		}catch(Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
		
	}		
	
	
	
		
	//-------------------------------------------리뷰2-1.-댓글수정폼	
	//리뷰 댓글 수정 폼
	@RequestMapping(value="/review_modify_form.do",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public Product_reviewVO modify_review_form(HttpServletRequest request) throws Exception {
		System.out.println("modify_review_form 컨트롤러 왔다");
		
		int REVIEW_NUM = Integer.parseInt(request.getParameter("REVIEW_NUM"));
		System.out.println("REVIEW_NUM = " + REVIEW_NUM);
		
		Product_reviewVO reviewVO = null;
		
		reviewVO = reviewService.getReviewVO(REVIEW_NUM);
		System.out.println("modify에서 vo 잘 가져왔나?? content 확인 = " + reviewVO.getREVIEW_CONTENT());
		return reviewVO;
	}		
	
	
	
	//리뷰 댓글 수정에서 이미지 삭제
	@RequestMapping(value="/review_img_delete.do",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public String review_img_delete(HttpServletRequest request) throws Exception {
		String newReviewImg = null;
		int REVIEW_NUM = Integer.parseInt(request.getParameter("REVIEW_NUM"));
//		String img_src = request.getParameter("img_src");	//삭제할 이미지 소스	
		int i = Integer.parseInt(request.getParameter("index"));
//		String img_src = request.getParameter("img_src");	//삭제할 이미지 소스
//		System.out.println("img_src = " + img_src);
		
		String REVIEW_FILE = reviewService.getREVIEW_FILE(REVIEW_NUM); //기존 db에 있던 이미지 파일
		
		System.out.println("REVIEW_FILE = " + REVIEW_FILE);
		
		String path = "C:\\Project138\\upload\\"; 
		String fullPath = "";
		String[] f = REVIEW_FILE.split(",");
		int length = f.length;
		System.out.println("length="+length);
//		for(int x=0; x<f.length; x++) {
//			System.out.println("f["+x+"]번째 src는 "+f[x]);
//		}
		fullPath = path+f[i];
		System.out.println("fullPath="+fullPath);
		File file = new File(fullPath);					
		file.delete();
	   
	    String mod_REVIEW_FILE = "";

	    System.out.println("원본: " + REVIEW_FILE);
	    System.out.println(); // 줄바꿈

	    //delete이지만 REVIEW_FILE을 수정해서(원하는 이미지 삭제) update해주는 형식으로 해야할 것 같음
	    // 문자열에서 특정 이미지 제거
	    if (i == (length-1)) { //,가 맨 뒤에 없음
	    	mod_REVIEW_FILE = REVIEW_FILE.replace(","+f[i], "");
		    System.out.println("삭제(1): " + mod_REVIEW_FILE);
	    } else {
	    	mod_REVIEW_FILE = REVIEW_FILE.replace(f[i]+",", "");
		    System.out.println("삭제(i != length-1 ): " + mod_REVIEW_FILE); // 출력 결과: 가나다라ABCDE 가나다라ABCDE		    
	    }  
	    System.out.println("mod_REVIEW_FILE="+mod_REVIEW_FILE);
	    Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("REVIEW_NUM", REVIEW_NUM);
		map.put("mod_REVIEW_FILE", mod_REVIEW_FILE);
		
		String str = "";
		reviewService.deleteReviewImg(map);
		newReviewImg = reviewService.newReviewImg(REVIEW_NUM); //기존 db 이미지 삭제했을 때, review_file(경로)에서 삭제하고 db에 새로 update  
		ObjectMapper mapper = new ObjectMapper();
		try {

			str = mapper.writeValueAsString(newReviewImg);
			System.out.println("컨트롤러 getComments"+str);
		} catch(Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}			
		return str;
	}		
	
	//-------------------------------------------리뷰2-2.-댓글수정process
	//리뷰 댓글 수정 process
	@RequestMapping(value="/review_modify.do",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public String modify_review(MultipartHttpServletRequest request) throws Exception {
		System.out.println("modify_review 컨트롤러 왔다");
		System.out.println("REVIEW_NUM = " + request.getParameter("REVIEW_NUM"));
		
		//원래 db에 있던 이미지들 불러와야함(이후에 붙여야함)
		String REVIEW_FILE = reviewService.getREVIEW_FILE(Integer.parseInt(request.getParameter("REVIEW_NUM")));
		System.out.println("기존 REVIEW_FILE = " + REVIEW_FILE);
		
		Product_reviewVO reviewVO = new Product_reviewVO();
	
		
		List<MultipartFile> fileList = new ArrayList<MultipartFile>(); 
		
		// input file 에 아무것도 없을 경우 (파일을 업로드 하지 않았을 때 처리) 
		if(request.getFiles("REVIEW_FILE").get(0).getSize() != 0) { 
			fileList = request.getFiles("REVIEW_FILE"); 
		} 	
		
		String path = "C:\\Project138\\upload\\"; 
		File fileDir = new File(path); 
		if (!fileDir.exists()) { 
			fileDir.mkdirs(); 
		} 
		
		long time = System.currentTimeMillis(); 
		String str = "";
		for (MultipartFile mf : fileList) { 
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명 
			String saveFileName = String.format("%d_%s", time, originFileName);

			try { // 파일생성
				mf.transferTo(new File(path, saveFileName)); 
				str += saveFileName + ",";
			} catch (Exception e) { 
				e.printStackTrace(); 
				} 
			}
		System.out.println("파일 없을 때 6");

		System.out.println("str = " + str);
		
		if(str.length() != 0) {
			str = str.substring(0, str.length()-1);
			REVIEW_FILE += "," + str;	//기존 db파일,새로운파일 이어붙임
		} else {
			str = "#";	//새로운 파일 없을시 붙이지 않음
		}
		
		
		reviewVO.setREVIEW_NUM(Integer.parseInt(request.getParameter("REVIEW_NUM"))); //시퀀스 이용
		reviewVO.setREVIEW_DATE(new Timestamp(System.currentTimeMillis()));
		reviewVO.setREVIEW_FILE(REVIEW_FILE);
		reviewVO.setREVIEW_CONTENT(request.getParameter("REVIEW_CONTENT"));
		reviewVO.setREVIEW_GRADE(Double.parseDouble(request.getParameter("REVIEW_GRADE")));
		System.out.println("확인aaaaaaaaaaaa = "+reviewVO.getREVIEW_FILE());
		
		int res = reviewService.modifyReview(reviewVO);
		System.out.println("res="+res);		
	
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(reviewVO);
			System.out.println(str);
			System.out.println("아아아");
			
		}catch(Exception e) {
			System.out.println("응?");
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
		
	}		

	
	//-------------------------------------------리뷰3-댓글삭제
	//-------------------------------------------리뷰re3-답글삭제(review_re)
	@RequestMapping(value="/delete_review.do",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> delete_review(HttpServletRequest request) throws Exception {
		System.out.println("delete_review 컨트롤러 왔다");
		Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
		try {
					
			int REVIEW_NUM = Integer.parseInt(request.getParameter("REVIEW_NUM"));
			System.out.println("REVIEW_NUM = " + REVIEW_NUM);
			
			
			int res = 0;
			
			//답글을 가지고 있는 댓글을 삭제하면, 해당 답글까지 다 삭제돼야 한다.
			//답글을 가지고 있는 댓글은 삭제할 수 없다.
			//본인의 review_num을 review_re로 하는 데이터가 있을 경우, 삭제 불가
			int count = reviewService.findChildrenRE(REVIEW_NUM);
			//있으면 답글이 있는 것
			if(count == 0) {
				//없으면 삭제 가능
				res = reviewService.deleteReview(REVIEW_NUM);
			} else {
				
				
			}
			
			if(res != 0) {
				retVal.put("res", "OK");
			} else {
				retVal.put("res", "FAIL");
			}
			
			
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}		
		
		return retVal;
		
	}		
	
	
	//-------------------------------------------리뷰re2-2.-답글수정process(review_re)	
	@RequestMapping(value="/review_re_modify.do",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public Product_reviewVO review_re_modify(Product_reviewVO vo, HttpServletRequest request) throws Exception {
		System.out.println("review_re_modify 컨트롤러 왔다");

		vo.setREVIEW_DATE(new Timestamp(System.currentTimeMillis()));

		int res = reviewService.modifyReview_RE(vo);
		System.out.println("ccc");
		return vo;
	}		

	
	//-------------------------------------------좋아요 누르는 기능
	@RequestMapping(value = "/insertProLike.pro", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertProLike(ProductVO productVO, HttpServletRequest request) {
		System.out.println("좋아요 insert컨트롤러 시작");
		String MEMBER_NUM = request.getParameter("MEMBER_NUM");
		String PRODUCT_NUM = request.getParameter("PRODUCT_NUM");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("MEMBER_NUM", MEMBER_NUM);
		map.put("PRODUCT_NUM", PRODUCT_NUM);
		
		//picsVO.setPICS_NUM(Integer.parseInt(request.getParameter("picNum")));
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			HashMap<String, Object> returnInfo = productService.insertProductLike(map);
//			System.out.println("picscount="+returnInfo.get("picsLikeCount"));
//			retVal.put("picsLikeCount", returnInfo.get("picsLikeCount"));
			retVal.put("cnt", returnInfo.get("cnt"));
			retVal.put("res", "OK");
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	
	//-------------------------------------------좋아요 리스트 가져오기
	@RequestMapping(value = "/getProductLike.pro", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getProductLike(ProductVO productVO, HttpServletRequest request, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int LIKE_MEMBER = (int)session.getAttribute("MEMBER_NUM");
		map.put("LIKE_MEMBER", LIKE_MEMBER);
		map.put("PRODUCT_NUM", Integer.parseInt(request.getParameter("PRODUCT_NUM")));
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			int status = productService.getProductLike(map);
			
			retVal.put("status", status);
			retVal.put("res", "OK");
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	
	
	//-------------------------------------------상품 글쓰기 폼   
	@RequestMapping(value = "/product_write.pro", method = RequestMethod.GET)
	public ModelAndView product_write(Model model, HttpServletRequest request, HttpSession session) {
		int WORKSHOP_NUM = (int)session.getAttribute("WORKSHOP_NUM");
		
		ArrayList<ProductVO> WorkshopProoductList = null;
		WorkshopProoductList = productService.getAllWorkshopProduct(WORKSHOP_NUM);   //WorkshopVO vo2로 공방의 productList 받아온다
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Store/productForm");
		mav.addObject("WorkshopProoductList", WorkshopProoductList);
		
		if(WorkshopProoductList== null) {
			System.out.println("WorkshopProoductList-null");
		} else {
			System.out.println("WorkshopProoductList-not null");
		}
		
		return mav;
	      
	}
	
	//-------------------------------------------상품 글쓰기 업로드(공방 업자)
	@RequestMapping(value = "/addproduct.pro", method = RequestMethod.POST)
	public ModelAndView addproduct(WorkShopMemberVO workshopVO, MultipartHttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		boolean result = false;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		
		
		//세션에 로그인 된 workshop_num를 vo에 넣어줌
		int WORKSHOP_NUM = (int)session.getAttribute("WORKSHOP_NUM");
		
		ProductVO vo = new ProductVO();
		vo.setPRODUCT_WORKSHOP(WORKSHOP_NUM);   //공방번호를 ProductVO vo에 set해줌
		
		//--------1. setPRODUCT_SHOPNAME
		WorkShopMemberVO vo2 = productService.selectWorkshop(vo);    //vo로 Workshop정보 (product_shopname) 받아온다
		vo.setPRODUCT_SHOPNAME(vo2.getWORKSHOP_NAME());
		
		//값이 여러개일 수 있는 size, color, option String으로 값 받기
		String PRODUCT_SIZE = "";
		String PRODUCT_COLOR = "";
		String PRODUCT_OPTION = "";
		String[] SizeStr = request.getParameterValues("PRODUCT_SIZE");
		String[] ColorStr = request.getParameterValues("PRODUCT_COLOR");
		
		//---------size
		for(int i = 0; i < SizeStr.length; i++) {
			PRODUCT_SIZE += SizeStr[i] + ",";
			System.out.println("PRODUCT_SIZE="+PRODUCT_SIZE);
		}
		PRODUCT_SIZE = PRODUCT_SIZE.substring(0, PRODUCT_SIZE.length()-1);
		
		//---------color
		for(int i = 0; i < ColorStr.length; i++) {
			PRODUCT_COLOR += ColorStr[i] + ",";
			System.out.println("PRODUCT_COLOR="+PRODUCT_COLOR);
		}
		PRODUCT_COLOR = PRODUCT_COLOR.substring(0, PRODUCT_COLOR.length()-1);
		System.out.println("PRODUCT_COLOR2="+PRODUCT_COLOR);
		

	 
	
	  //---------배너 이미지 네 장
	  List<MultipartFile> fileList = new ArrayList<MultipartFile>();    
	  
	  // input file 에 아무것도 없을 경우 (파일을 업로드 하지 않았을 때 처리) 
	  if(request.getFiles("PRODUCT_BANNER").get(0).getSize() != 0) { 
	 fileList = request.getFiles("PRODUCT_BANNER"); 
	  } 
	  
	  String path = "C:\\Project138\\upload\\"; 
	  File fileDir = new File(path); 
	  if (!fileDir.exists()) { 
	     fileDir.mkdirs(); 
	  } 
	  
	  long time = System.currentTimeMillis(); 
	  String str = "";
	  for (MultipartFile mf : fileList) { 
	     String originFileName = mf.getOriginalFilename(); // 원본 파일 명 
	 String saveFileName = String.format("%d_%s", time, originFileName);
	
	 try { // 파일생성
	    mf.transferTo(new File(path, saveFileName)); 
	    str += saveFileName + ",";
	    System.out.println("str="+str);
	     } catch (Exception e) { 
	        e.printStackTrace(); 
	        } 
	  }
	
	  System.out.println("str = " + str);
	  
	  if(str.length() != 0) {
	     str = str.substring(0, str.length()-1);
	  } else {
	     str = "#";
	  }
	  
	  //---------썸네일 이미지는 하나
	  MultipartFile mf2 = request.getFile("PRODUCT_IMAGE");   
	  if(!mf2.isEmpty()) {
	     String uploadPath = "C:\\Project138\\upload\\";
	 File fileDir2 = new File(uploadPath); 
	 if (!fileDir2.exists()) { 
	    fileDir2.mkdirs(); 
	 } 
	 String originalFileExtension = mf2.getOriginalFilename().substring(mf2.getOriginalFilename().lastIndexOf("."));
	 String storedFileName2 = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
	 
	 if(mf2.getSize() != 0) {
	    mf2.transferTo(new File(uploadPath+storedFileName2));
	 }
	 System.out.println("storedFileName2= "+storedFileName2);
	     vo.setPRODUCT_IMAGE(storedFileName2);
	     
	  } else {
	     System.out.println("썸네일 사진 넣지 않음.");
	     return null;
	  }
	      
	  vo.setPRODUCT_DATE(new Timestamp(System.currentTimeMillis()));
	  vo.setPRODUCT_TITLE(request.getParameter("PRODUCT_TITLE"));
	  vo.setPRODUCT_BRIEF(request.getParameter("PRODUCT_BRIEF"));
	  vo.setPRODUCT_CATEGORY(request.getParameter("PRODUCT_CATEGORY"));
	  vo.setPRODUCT_PRICE(Integer.parseInt(request.getParameter("PRODUCT_PRICE")));
	  vo.setPRODUCT_GRADE(0);   //review 평점 업로드시 update 해주기. (오케이)
	  vo.setPRODUCT_READ(0);   //detail 들어갈 시 update 해주기. (오케이)
	  vo.setPRODUCT_SALES(0);   //결제시 update 해주기
	  vo.setPRODUCT_LIKE(0);   //실시간 update 해주기      (오케이)
	  vo.setPRODUCT_SIZE(PRODUCT_SIZE);
	  vo.setPRODUCT_COLOR(PRODUCT_COLOR);
	  vo.setPRODUCT_INFO(request.getParameter("PRODUCT_INFO"));
	  vo.setPRODUCT_SHIP_PRICE(Integer.parseInt(request.getParameter("PRODUCT_SHIP_PRICE")));
	  vo.setPRODUCT_SHIP_COMPANY(request.getParameter("PRODUCT_SHIP_COMPANY"));
	  vo.setPRODUCT_SHIP_RETURN_PRICE(Integer.parseInt(request.getParameter("PRODUCT_SHIP_RETURN_PRICE")));
	  vo.setPRODUCT_SHIP_CHANGE_PRICE(Integer.parseInt(request.getParameter("PRODUCT_SHIP_CHANGE_PRICE")));
	  vo.setPRODUCT_SHIP_RETURN_PLACE(request.getParameter("PRODUCT_SHIP_RETURN_PLACE"));
	  vo.setPRODUCT_SHIP_DAYS(request.getParameter("PRODUCT_SHIP_DAYS"));
	  vo.setPRODUCT_SHIP_INFO(request.getParameter("PRODUCT_SHIP_INFO"));
	  vo.setPRODUCT_AS_INFO(request.getParameter("PRODUCT_AS_INFO"));
	  vo.setPRODUCT_RETURN_INFO(request.getParameter("PRODUCT_RETURN_INFO"));
	  vo.setPRODUCT_STORE_INFO(request.getParameter("PRODUCT_STORE_INFO"));
	  vo.setPRODUCT_BANNER(str);
	  vo.setPRODUCT_STATUS(1);		//1:판매중 2:판매완료 0:품절
	  vo.setPRODUCT_STOCK(Integer.parseInt(request.getParameter("PRODUCT_STOCK")));
	  System.out.println("aaa"+request.getParameter("PRODUCT_CATEGORY"));
	  
	  ModelAndView mav = new ModelAndView();
//	  mav.setViewName("redirect:productlist.pro?PRODUCT_CATEGORY="+request.getParameter("PRODUCT_CATEGORY"));
	  mav.setViewName("redirect:productlist.pro?PRODUCT_CATEGORY=all");
	  mav.addObject("ProductVO", vo);
	   
	      
	      result = productService.insertProduct(vo);
	      
	      if(result == false) {
	         System.out.println("상품 등록 실패!");
	     return null;
	  }
	  System.out.println("상품 등록 완료!");
	      
	      
	      return mav;
	   }
	   
	
	//=====================================================
	//===============================================QNA insert
	//-------------------------------------------QNA_RE_insert
	@RequestMapping(value="/qna_insert.do",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> insert_qna(HttpServletRequest request, HttpSession session) throws Exception {
		System.out.println("qna_insert 컨트롤러 start!");

		int MEMBER_NUM = 0;
		int WORKSHOP_NUM = 0;
		Product_qnaVO qnaVO = new Product_qnaVO();
		
		
		if(session.getAttribute("MEMBER_NUM") != null) {	//멤버로그인(원글)
			System.out.println("원글qna insert");
			MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
			qnaVO.setQNA_STATUS(0);
	    	qnaVO.setQNA_RE(0);
	    	qnaVO.setQNA_MEMBER(MEMBER_NUM);
		}else {	//공방로그인(답글)
			System.out.println("답글qna insert");
			WORKSHOP_NUM = (int)session.getAttribute("WORKSHOP_NUM");
			qnaVO.setQNA_STATUS(-1);
			qnaVO.setQNA_RE(Integer.parseInt(request.getParameter("QNA_RE")));
	    	qnaVO.setQNA_MEMBER(WORKSHOP_NUM);
		}
		
		System.out.println("QNA_CONTENT=" + request.getParameter("QNA_CONTENT"));
		System.out.println("QNA_PRODUCT=" + request.getParameter("QNA_PRODUCT"));
		System.out.println("WORKSHOP_NUM=" + request.getParameter("WORKSHOP_NUM"));
		System.out.println("MEMBER_NUM=" + request.getParameter("MEMBER_NUM"));

//		qnaVO.setQNA_NUM(qNA_NUM);	//시퀀스 이용
	    qnaVO.setQNA_CONTENT(request.getParameter("QNA_CONTENT"));
	    qnaVO.setQNA_DATE(new Timestamp(System.currentTimeMillis()));
	    qnaVO.setQNA_PRODUCT(Integer.parseInt(request.getParameter("QNA_PRODUCT")));
	

		
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			int res = qnaService.insertQna(qnaVO);
			Product_qnaVO vo = qnaService.getQnaVO(qnaVO);
			retVal.put("res", "OK");
			retVal.put("vo", vo);
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}		
	
	//===============================================QNA modify
	@RequestMapping(value="/qna_modify.do",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public Product_qnaVO qna_modify(Product_qnaVO vo, HttpServletRequest request) throws Exception {
		System.out.println("qna_modify 컨트롤러 왔다");

		vo.setQNA_DATE(new Timestamp(System.currentTimeMillis()));

		int res = qnaService.modifyQna(vo);
		System.out.println("ccc");
		return vo;
	}		
	
	
	//-------------------------------------------QNA delete
	@RequestMapping(value="/delete_qna.do",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> delete_qna(HttpServletRequest request) throws Exception {
		System.out.println("delete_qna 컨트롤러 왔다");
		int QNA_NUM = Integer.parseInt(request.getParameter("QNA_NUM"));
		Product_qnaVO qnaVO = new Product_qnaVO();
		qnaVO.setQNA_NUM(QNA_NUM);	
		System.out.println(qnaVO.getQNA_NUM());
		Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
		try {
			int res = 0;
			System.out.println(res);
			
			//답글을 가지고 있는 댓글은 삭제할 수 없다.
			//삭제하고자 하는 댓글의 qna_num을 qna_re로 하는 데이터가 있을 경우, 삭제 불가
			int count = qnaService.findChildrenRE(qnaVO);
			//답변 존재(삭제 불가능)
			if(count == 0) {
				//답변 달려있지 않음(삭제 가능)
				res = qnaService.deleteQna(qnaVO);
			} else {
				
			}
			
			if(res != 0) {
				retVal.put("res", "OK");
			} else {
				retVal.put("res", "FAIL");
			}
			
			
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}		
		System.out.println(retVal);
		return retVal;
		
	}			
	
	

	
	
	
	
	
	
	
}
