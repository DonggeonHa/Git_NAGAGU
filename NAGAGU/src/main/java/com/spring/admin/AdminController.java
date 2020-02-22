package com.spring.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.academy.ClassVO;
import com.spring.academy.Class_qnaVO;
import com.spring.academy.Class_reviewVO;
import com.spring.community.PicsCommentDB;
import com.spring.community.PicsVO;
import com.spring.estimate.EstimateVO;
import com.spring.member.MemberVO;
import com.spring.store.ProductVO;
import com.spring.store.Product_qnaVO;
import com.spring.store.Product_reviewVO;
import com.spring.workshop.WorkShopMemberVO;

@Controller
public class AdminController {
	
	@Autowired(required = false)
	private AdminService adminService;
	
	/*========================================= 어드민 =====================================*/
	@RequestMapping(value = "/login.ad")
	public String AdminLogin() {
		
		return "Admin/login";
	}
	
	
	@RequestMapping(value = "/index.ad")
	public String Menu() {
		
		return "Admin/Aindex";
	}
	
	/*=========================== 일반회원관리 ==============================*/
	@RequestMapping(value = "/MemberList.ad")
	public String MemberList() {
		return "Admin/MemberList";
	}
	
	//produces 속성을 이용해 Response의 Content-Type을 제어할 수 있다
	@RequestMapping(value = "/Member.ad", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String MemberList2() {
		List<MemberVO> memberList = adminService.getMembers();
		
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(memberList);
			System.out.println("memberList 변환 : " + str);
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value = "/detailMember.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> detailMember(MemberVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			MemberVO res = adminService.detailMember(vo);
			
			retVal.put("res", "OK");
			retVal.put("MemberVO", res);
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "상세보기가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	@RequestMapping(value = "/memberInfo.ad", method = {RequestMethod.GET, RequestMethod.POST})
	public String MemberInfo(MemberVO vo, Model model) {
		try {
			MemberVO res = adminService.detailMember(vo);
			
			model.addAttribute("MemberVO", res);
			
		} catch(Exception e) {
			System.out.println("MemberInfo : " + e.getMessage());
		}		
		return "Admin/Info/MemberInfo";
	}
	
	@RequestMapping(value = "/deleteMember.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> deleteMember(MemberVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			int res = adminService.deleteMember(vo);
			
			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "삭제가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	/*=========================== 공방회원관리 ==============================*/
	@RequestMapping(value = "/WMemberList.ad")
	public String WMemberList() {
		return "Admin/WMemberList";
	}
	
	//produces 속성을 이용해 Response의 Content-Type을 제어할 수 있다
	@RequestMapping(value = "/WMember.ad", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String WMemberList2() {
		List<WorkShopMemberVO> wmemberList = adminService.getWMembers();
		
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(wmemberList);
			System.out.println("wmemberList 변환 : " + str);
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value = "/updateWMember.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> updateWMember(WorkShopMemberVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			System.out.println("WORKSHOP_NUM = " + vo.getWORKSHOP_NUM());
			int res = adminService.updateWMember(vo);
			
			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "삭제가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	@RequestMapping(value = "/deleteWMember.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> deleteWMember(WorkShopMemberVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			int res = adminService.deleteWMember(vo);
			
			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "삭제가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	@RequestMapping(value = "/detailWMember.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> detailWMember(WorkShopMemberVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			WorkShopMemberVO res = adminService.detailWMember(vo);
			
			retVal.put("res", "OK");
			retVal.put("WMemberVO", res);
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "상세보기가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	@RequestMapping(value = "/WmemberInfo.ad", method = {RequestMethod.GET, RequestMethod.POST})
	public String WMemberInfo(WorkShopMemberVO vo, Model model) {
		try {
			WorkShopMemberVO res = adminService.detailWMember(vo);
			
			model.addAttribute("WMemberVO", res);
			
		} catch(Exception e) {
			System.out.println("MemberInfo : " + e.getMessage());
		}		
		return "Admin/Info/WMemberInfo";
	}
	
	
	/*=========================== 커뮤니티관리 ==============================*/
	
	@RequestMapping(value = "/picsList.ad")
	public String picsList() {
		return "Admin/CommunityList";
	}
	
	//produces 속성을 이용해 Response의 Content-Type을 제어할 수 있다
	@RequestMapping(value = "/Pics.ad", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String picsList2() {
		List<PicsVO> picsList = adminService.getPICS();
		
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(picsList);
			System.out.println("picsList 변환 : " + str);
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value = "/deletePICS.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> deletePICS(PicsVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			System.out.println("PICS_NUM = " + vo.getPICS_NUM());
			int res = adminService.deletePICS(vo);
			
			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "삭제가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	@RequestMapping(value = "/detailPICS.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> detailPICS(PicsVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			PicsVO res = adminService.detailPICS(vo);
			MemberVO member = adminService.memberPICS(res);
			System.out.println("member" + member.getMEMBER_NUM());
			
			retVal.put("res", "OK");
			retVal.put("PicsVO", res);
			retVal.put("MemberVO", member);
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "상세보기가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	@RequestMapping(value = "/picsCommentList.ad")
	public String picsCommnetList() {
		return "Admin/CommunityCommentList";
	}
	
	//produces 속성을 이용해 Response의 Content-Type을 제어할 수 있다
	@RequestMapping(value = "/picsComment.ad", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String picsComment() {
		List<PicsCommentDB> picsList = adminService.getPICSComment();
		
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(picsList);
			System.out.println("picsList 변환 : " + str);
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value = "/deleteCommentPICS.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> deleteCommentPICS(PicsCommentDB vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			System.out.println("PICS_RE_NUM = " + vo.getPICS_RE_NUM());
			int res = adminService.deletePICSComment(vo);
			
			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "삭제가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	/*=========================== 아카데미 관리 ==============================*/
	@RequestMapping(value = "/academyList.ad")
	public String academyList() {
		return "Admin/AcademyList";
	}
	
	//produces 속성을 이용해 Response의 Content-Type을 제어할 수 있다
	@RequestMapping(value = "/Academy.ad", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String academyList2() {
		List<ClassVO> academyList = adminService.getAcademy();
		
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(academyList);
			System.out.println("productList 변환 : " + str);
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value = "/deleteAcademy.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> deleteAcademy(ClassVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			System.out.println("ESTIMATE_NUM = " + vo.getCLASS_NUMBER());
			int res = adminService.deleteAcademy(vo);
			
			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "삭제가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	@RequestMapping(value = "/detailAcademy.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> detailAcademy(ClassVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			ClassVO res = adminService.detailAcademy(vo);
			
			retVal.put("res", "OK");
			retVal.put("ClassVO", res);
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "상세보기가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	@RequestMapping(value = "/academyReviewList.ad")
	public String academyReview() {
		return "Admin/AcademyReview";
	}
	
	//produces 속성을 이용해 Response의 Content-Type을 제어할 수 있다
	@RequestMapping(value = "/AcademyReview.ad", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String academyReview2() {
		List<Class_reviewVO> academyList = adminService.getAcademyReview();
		
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(academyList);
			System.out.println("productReviewList 변환 : " + str);
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value = "/deleteAcademyReview.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> deleteAcademyReview(Class_reviewVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			System.out.println("REVIEW_NUM = " + vo.getREVIEW_NUM());
			int res = adminService.deleteAcademyReview(vo);
			
			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "삭제가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	@RequestMapping(value = "/academyQnAList.ad")
	public String academyQnA() {
		return "Admin/AcademyQnA";
	}
	
	//produces 속성을 이용해 Response의 Content-Type을 제어할 수 있다
	@RequestMapping(value = "/AcademyQnA.ad", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String academyQnA2() {
		List<Class_qnaVO> QnAList = adminService.getAcademyQnA();
		
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(QnAList);
			System.out.println("picsList 변환 : " + str);
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value = "/deleteAcademyQnA.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> deleteAcademyQnA(Class_qnaVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			System.out.println("QNA_NUM = " + vo.getQNA_NUM());
			int res = adminService.deleteAcademyQnA(vo);
			
			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "삭제가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	/*=========================== 상품 관리 ==============================*/
	@RequestMapping(value = "/productList.ad")
	public String productList() {
		return "Admin/ProductList";
	}
	
	//produces 속성을 이용해 Response의 Content-Type을 제어할 수 있다
	@RequestMapping(value = "/Product.ad", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String productList2() {
		List<ProductVO> productList = adminService.getProduct();
		
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(productList);
			System.out.println("productList 변환 : " + str);
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value = "/deleteProduct.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> deleteProduct(ProductVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			System.out.println("PICS_NUM = " + vo.getPRODUCT_NUM());
			int res = adminService.deleteProduct(vo);
			
			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "삭제가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	@RequestMapping(value = "/detailProduct.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> detailProduct(ProductVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			ProductVO res = adminService.detailProduct(vo);
			
			retVal.put("res", "OK");
			retVal.put("ProductVO", res);
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "상세보기가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	@RequestMapping(value = "/productReviewList.ad")
	public String productReview() {
		return "Admin/ProductReview";
	}
	
	//produces 속성을 이용해 Response의 Content-Type을 제어할 수 있다
	@RequestMapping(value = "/ProductReview.ad", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String productReview2() {
		List<Product_reviewVO> productList = adminService.getProductReview();
		
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(productList);
			System.out.println("productReviewList 변환 : " + str);
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value = "/deleteProductReview.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> deleteProductReview(Product_reviewVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			System.out.println("PICS_NUM = " + vo.getREVIEW_NUM());
			int res = adminService.deleteProductReview(vo);
			
			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "삭제가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	@RequestMapping(value = "/productQnAList.ad")
	public String productQnA() {
		return "Admin/ProductQnA";
	}
	
	//produces 속성을 이용해 Response의 Content-Type을 제어할 수 있다
	@RequestMapping(value = "/ProductQnA.ad", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String productQnA2() {
		List<Product_qnaVO> productList = adminService.getProductQnA();
		
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(productList);
			System.out.println("productReviewList 변환 : " + str);
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value = "/deleteProductQnA.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> deleteProductQnA(Product_qnaVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			System.out.println("QNA_NUM = " + vo.getQNA_NUM());
			int res = adminService.deleteProductQnA(vo);
			
			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "삭제가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	/*=========================== 견적 관리 ==============================*/
	@RequestMapping(value = "/estimateList.ad")
	public String estimateList() {
		return "Admin/EstimateList";
	}
	
	//produces 속성을 이용해 Response의 Content-Type을 제어할 수 있다
	@RequestMapping(value = "/Estimate.ad", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String estimateList2() {
		List<EstimateVO> estimateList = adminService.getEstimate();
		
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(estimateList);
			System.out.println("productList 변환 : " + str);
		} catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value = "/deleteEstimate.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> deleteEstimate(EstimateVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			System.out.println("ESTIMATE_NUM = " + vo.getESTIMATE_NUM());
			int res = adminService.deleteEstimate(vo);
			
			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "삭제가 되지 않았습니다.");
		}
		
		return retVal;
	}
	
	@RequestMapping(value = "/detailEstimate.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> detailEstimate(EstimateVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			EstimateVO res = adminService.detailEstimate(vo);
			
			retVal.put("res", "OK");
			retVal.put("EstimateVO", res);
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "상세보기가 되지 않았습니다.");
		}
		
		return retVal;
	}
}
