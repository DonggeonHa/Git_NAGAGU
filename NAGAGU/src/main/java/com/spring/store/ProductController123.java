package com.spring.store;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;


import com.spring.member.MemberVO;
import com.spring.workshop.WorkShopMemberVO;

@Controller
public class ProductController123 {

	@Autowired
	private ProductService productService;
	@Autowired
	private ProductReviewService reviewService;
	@Autowired
	private ProductQnaService qnaService;

	@Autowired
	MappingJackson2JsonView jsonView;	
	
	
	//디테일-페이지네이션 에이젝스
	@RequestMapping(value = "/getReviewList123.pro", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public HashMap<String, Object> getReviewList123(ProductVO productVO, MemberVO memberVO, Model model, HttpServletRequest request, HttpSession session) {
		System.out.println("getReviewList123 컨트롤러 start!");


		
		/*리뷰 리스트*/
		int limit = 5; //한 페이지당 출력할 글의 수
		int reviewpage = 1;
		if(request.getParameter("reviewpage") != null) {
			reviewpage = Integer.parseInt(request.getParameter("reviewpage"));
		}
		int startrow = (reviewpage - 1) * 5 + 1; // 읽기 시작할 row 번호.
		int endrow = startrow + limit - 1; //읽을 마지막 row 번호.
		int PRODUCT_NUM= Integer.parseInt(request.getParameter("PRODUCT_NUM"));
		
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("startrow", startrow);
		map1.put("endrow", endrow);
		map1.put("PRODUCT_NUM", PRODUCT_NUM);
		
		int reviewCount;	
		int review_RE_Count;	//RE는 답글
		ArrayList<HashMap<String, Object>> reviewList = null;
		ArrayList<HashMap<String, Object>> review_RE_List = null;

		reviewCount = reviewService.getReviewCount(map1);
		review_RE_Count = reviewService.getReview_RE_Count(map1);
		reviewList = reviewService.getReviewList123(map1);
		review_RE_List = reviewService.getReview_RE_List123(map1);
		
		HashMap<String, Object> retVal = new HashMap<String, Object>();

		retVal.put("reviewCount", reviewCount);	//allRowCnt
		retVal.put("reviewList", reviewList);
		retVal.put("review_RE_Count", review_RE_Count);	
		retVal.put("review_RE_List", review_RE_List);	

		
		
		return retVal;
	}

	
	
	
	
	@RequestMapping(value = "/productdetail123.pro", method = RequestMethod.GET)
	public String productdetail123(ProductVO productVO, MemberVO memberVO, Model model, HttpServletRequest request, HttpSession session) {
		System.out.println("detail123");

		
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
		int qnaendpage =qnastartpage + 10 - 1; // 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등..)
		
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


		
	//@RequestMapping(value="/getReviewList123.do",  produces="application/json;charset=UTF-8")
	//@ResponseBody
	//public String getReviewList123(MultipartHttpServletRequest request, HttpSession session) throws Exception {
	//
	//	
	//}
		


		@RequestMapping(value="/review_insert123.do",  produces="application/json;charset=UTF-8")
		@ResponseBody
		public Map<String, Object> insert_review123(MultipartHttpServletRequest request, HttpSession session) throws Exception {
			System.out.println("review_insert123 컨트롤러 start!");
			
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
			reviewVO.setREVIEW_PRODUCT(Integer.parseInt(request.getParameter("PRODUCT_NUM")));
			reviewVO.setREVIEW_DATE(new Timestamp(System.currentTimeMillis()));
			reviewVO.setREVIEW_FILE(str);
			reviewVO.setREVIEW_CONTENT(request.getParameter("REVIEW_CONTENT"));
			
		
			//넘겨받은 REVIEW_RE가 존재하면 답글이고(원글의 REVIEW_NUM을 전달해줌), null이면 원글이다.
			if(request.getParameter("REVIEW_RE") != null) {	
				System.out.println("답글");
				//답글 - GRADE=10, RE=NUM
				reviewVO.setREVIEW_GRADE(7);
				reviewVO.setREVIEW_RE(Integer.parseInt(request.getParameter("REVIEW_RE")));
			} else {	
				System.out.println("원글");
				//원글 - GRADE=GRADE, RE=0
				reviewVO.setREVIEW_GRADE(Double.parseDouble(request.getParameter("REVIEW_GRADE")));
				reviewVO.setREVIEW_RE(0);
			}
			
			Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
			try {
				int res = reviewService.insertReview(reviewVO);
				retVal.put("insertres", "OK");
				retVal.put("reviewVO", reviewVO);
			} catch(Exception e) {
				retVal.put("insertres", "Fail");
			}
			
			
			
			//댓글(review) 입력시 product grade update(답글 입력시는  grade 상관 없다)
			//update해야하는 상품의 vo 가져옴
			if(request.getParameter("REVIEW_RE") == null) {
				ProductVO productVO = null;
				productVO = productService.getproductVO(Integer.parseInt(request.getParameter("PRODUCT_NUM")));
			
				double grade = productVO.getPRODUCT_GRADE();	//이  grade에 인원수를 곱해줘야 순수 grade누적값이 나온다.
				int gradepeoplecount = reviewService.getGradePeopleCount(Integer.parseInt(request.getParameter("PRODUCT_NUM")));	//인원수 구해오기(PRODUCT_NUM = REVIEW_PRODUCT)
				double totalGrade = grade * (gradepeoplecount-1);	//이전까지 total 누적 grade	//gradepeoplecount는 update된 후이므로 이전걸 계산하려면 -1해줘야함
		
				//(grade 총합+현재 리뷰 grade) / (gradepeoplecount)
				double newGrade = (totalGrade+Double.parseDouble(request.getParameter("REVIEW_GRADE"))) / (gradepeoplecount);
				
				//product테이블에 grade update
				productVO.setPRODUCT_NUM(Integer.parseInt(request.getParameter("PRODUCT_NUM")));
				productVO.setPRODUCT_GRADE(newGrade);
				productService.updateGrade(productVO);
				
			} 	
			
			return retVal;
			
		}		

	
	
		//리뷰 댓글 수정 폼
		@RequestMapping(value="/gomodifyReviewform.do",  produces="application/json;charset=UTF-8")
		@ResponseBody
		public Map<String, Object> gomodifyReviewform(HttpServletRequest request) throws Exception {
			System.out.println("gomodifyReviewform 컨트롤러 왔다");
			int REVIEW_NUM = Integer.parseInt(request.getParameter("REVIEW_NUM"));
			System.out.println("REVIEW_NUM = " + REVIEW_NUM);
			
			Product_reviewVO reviewVO = null;
			

			Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
			try {
				reviewVO = reviewService.getReviewVO(REVIEW_NUM);
				retVal.put("res", "OK");
				retVal.put("reviewVO", reviewVO);
			} catch(Exception e) {
				retVal.put("res", "Fail");
			}
			return retVal;
			
		}		
		
		//리뷰 댓글 수정 process (원글)
		@RequestMapping(value="/modifyReview.do",  produces="application/json;charset=UTF-8")
		@ResponseBody
		public Map<String, Object> modifyReview(MultipartHttpServletRequest request) throws Exception {
			System.out.println("modifyReview 컨트롤러 왔다");
			int REVIEW_NUM = Integer.parseInt(request.getParameter("REVIEW_NUM"));
			String beforeImg = request.getParameter("beforeImg");	//이전 이미지 중 남긴 이미지
			String deleteImg = request.getParameter("deleteImg");	//이전 이미지 중 삭제할 이미지
			String REVIEW_FILE = "";	//이전 이미지+추가 이미지
			
			if(deleteImg.equals("")) {
				System.out.println("삭제할 이미지 없음");
			}else {
				deleteImg = deleteImg.substring(0, deleteImg.length()-1);	//맨 마지막 , 떼기
				System.out.println(deleteImg);
				//기존의 이미지는 삭제
				String path = "C:\\Project138\\upload\\"; 
				String fullPath = "";
				String[] f = deleteImg.split(",");
				for(int i=0; i<f.length; i++) {
					fullPath = path+f[i];
					System.out.println("fullPath="+fullPath);
					File file = new File(fullPath);					
					file.delete();				
				}
				
			}
			
			//beforeImg - 이전 이미지 중 살릴 이미지
			if(beforeImg == ",") {	//기존 이미지 다 삭제했을 때, 바로 추가업로드 경로 붙일 수 있게 초기화시켜줌
				beforeImg = "";
			} 
			
			
			//사진 추가 업로드 처리
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
			
			for (MultipartFile mf : fileList) { 
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명 
				String saveFileName = String.format("%d_%s", time, originFileName);

				try { // 파일생성
					mf.transferTo(new File(path, saveFileName)); 
					beforeImg += saveFileName + ",";	//beforeImg에 추가 업로드 이미지 경로 추가
				} catch (Exception e) { 
					e.printStackTrace(); 
					} 
				}
			System.out.println("파일 없을 때 6");

			System.out.println("beforeImg : " + beforeImg);
			
			if(beforeImg.length() != 0) {
				REVIEW_FILE = beforeImg.substring(0, beforeImg.length()-1);	//beforeImg + 추가 업로드 이미지
				
			} else {
				REVIEW_FILE = "#";	//새로운 파일 없을시 붙이지 않음
			}
						
			System.out.println("modify 전 REVIEW_FILE은 : " + REVIEW_FILE );
			
			Product_reviewVO reviewVO = new Product_reviewVO();
			reviewVO.setREVIEW_NUM(REVIEW_NUM);
			reviewVO.setREVIEW_CONTENT(request.getParameter("REVIEW_CONTENT"));
			reviewVO.setREVIEW_DATE(new Timestamp(System.currentTimeMillis()));
			reviewVO.setREVIEW_FILE(REVIEW_FILE);
			reviewVO.setREVIEW_GRADE(Double.parseDouble(request.getParameter("REVIEW_GRADE")));
			
			
			Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
			try {
				int res = reviewService.modifyReview(reviewVO);
				retVal.put("res", "OK");
			} catch(Exception e) {
				retVal.put("res", "Fail");
			}
			return retVal;
			
		}		
		
		
		

		//리뷰 댓글 수정 process (답글)
		@RequestMapping(value="/modifyReviewReply.do",  produces="application/json;charset=UTF-8")
		@ResponseBody
		public Map<String, Object>  modifyReviewReply(HttpServletRequest request) throws Exception {
			System.out.println("modifyReviewReply 컨트롤러 왔다");
			int REVIEW_NUM = Integer.parseInt(request.getParameter("REVIEW_NUM"));
			String REVIEW_CONTENT = request.getParameter("REVIEW_CONTENT");
			Product_reviewVO vo = new Product_reviewVO();

			vo.setREVIEW_NUM(REVIEW_NUM);
			vo.setREVIEW_DATE(new Timestamp(System.currentTimeMillis()));
			vo.setREVIEW_CONTENT(REVIEW_CONTENT);
			
			Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
			try {
						
				int res = reviewService.modifyReviewReply(vo);
					retVal.put("res", "OK");
				
			}catch(Exception e) {
				retVal.put("res", "FAIL");
				retVal.put("message", "Failure");
			}		
			
			
			return retVal;
		}		
	
		//리뷰 댓글 삭제
		@RequestMapping(value="/deleteReview.do",  produces="application/json;charset=UTF-8")
		@ResponseBody
		public Map<String, Object> deleteReview(HttpServletRequest request) throws Exception {	
			System.out.println("deleteReview 컨트롤러 왔다");
			
			int REVIEW_NUM = Integer.parseInt(request.getParameter("REVIEW_NUM"));
			
			
			Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
			try {
						
				int res = 0;
				
				//답글을 가지고 있는 댓글은 삭제할 수 없다.
				//본인의 review_num을 review_re로 하는 데이터가 있을 경우, 삭제 불가
				int count = reviewService.findChildrenRE(REVIEW_NUM);
				
				if(count == 0) {	//답글이 없으므로 삭제 가능
					//upload폴더에서 파일 삭제
					String getReviewFile = reviewService.getREVIEW_FILE(REVIEW_NUM);
					if(!getReviewFile.equals("#")) {
						String path = "C:\\Project138\\upload\\"; 
						String fullPath = "";
						String[] f = getReviewFile.split(",");

						for(int i=0; i<f.length; i++) {
							fullPath = path+f[i];
							System.out.println("fullPath="+fullPath);
							File file = new File(fullPath);					
							file.delete();				
						}						
					}
					//db 삭제
					res = reviewService.deleteReview(REVIEW_NUM);
					retVal.put("res", "OK");
				} else {	//답글 존재
					retVal.put("res", "Children");
					
				}
				

				
				
			}catch(Exception e) {
				retVal.put("res", "FAIL");
				retVal.put("message", "Failure");
			}		
			
			return retVal;
			
		}
	
}
