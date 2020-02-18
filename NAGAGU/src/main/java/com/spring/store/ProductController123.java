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
//		qnaList = qnaService.getQnaList(qnamap);	//원글 리스트
//		qna_RE_List = qnaService.getQna_RE_List(qnamap);	//원글 리스트


		
		//qna 총 페이지 수
		int qnamaxpage = (int)((double)qnaCount / qnalimit + 0.95); // 0.95를 더해서 올림 처리
		int qnastartpage = (((int) ((double)qnapage / 10 + 0.9)) - 1) * 10 + 1; // 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
		int qnaendpage =qnastartpage + 10 - 1; // 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등..)
		
		if (qnaendpage > qnamaxpage)
			qnaendpage = qnamaxpage;		
		
		
		//qna 멤버
		ArrayList<MemberVO> qnaMemberList = null;
//		qnaMemberList = qnaService.getqnaMemberList(map);
		
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
		


	
	

}
