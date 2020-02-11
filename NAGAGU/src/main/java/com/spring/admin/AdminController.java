package com.spring.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.academy.ClassVO;
import com.spring.community.PicsVO;
import com.spring.estimate.EstimateVO;
import com.spring.member.MemberVO;
import com.spring.store.ProductVO;
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
	
	@RequestMapping(value = "/Alogin.ad", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView Alogin(AdminMemberVO adminVO, HttpSession session, ModelAndView mav) {
		System.out.println("아이디 : " + adminVO.getADMIN_ID());
		System.out.println("비밀번호 : " + adminVO.getADMIN_PASS());
		int res = adminService.user_chk(adminVO);
		System.out.println("admin res는" + res);
		
		if (res == 1) {	//로그인(아이디,비번 맞음)-이메일 인증 완료
			session.setAttribute("ADMIN_NUM", adminVO.getADMIN_NUM());
			
		} else {	//아이디or비번 틀렸을 때
			System.out.println("아이디 또는 비밀번호 틀림");
			return null;
		}
		
		mav.addObject("adminVO", adminVO);
		mav.setViewName("Admin/Aindex");
		
		return mav;
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
	
	@RequestMapping(value = "/deleteMember.ad", produces="application/json; charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> deleteMember(MemberVO vo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			System.out.println("MEMBER_NUM = " + vo.getMEMBER_NUM());
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
			System.out.println("WORKSHOP_NUM = " + vo.getWORKSHOP_NUM());
			int res = adminService.deleteWMember(vo);
			
			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "삭제가 되지 않았습니다.");
		}
		
		return retVal;
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
}
