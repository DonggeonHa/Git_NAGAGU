package com.spring.academy;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.member.MemberVO;
@Controller
public class AcademyController {
	
	@Autowired
	private AcademyService AcademyService;
	
	@RequestMapping(value = "/classlist.ac")
	public ModelAndView ClassList(ClassVO classVO, ModelAndView mav, HttpServletRequest request) throws Exception  {
		ArrayList<ClassVO> classList = new ArrayList<ClassVO>();
		
		
		int page = 1; // 초기값 1
		int limit = 12; // 한 페이지당 출력할 글의 수
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int startrow = (page - 1) * 12 + 1; // 읽기 시작할 row 번호.
		int endrow = startrow + limit - 1; //읽을 마지막 row 번호.
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startrow", startrow);
		map.put("endrow", endrow);
		

		String CLASS_CATEGORY = classVO.getCLASS_CATEGORY();
		String sort = "new";
		if(request.getParameter("sort") != null) {
			sort = request.getParameter("sort");
		}
		
		if (CLASS_CATEGORY == null)
			CLASS_CATEGORY = "all";
		
		map.put("CLASS_CATEGORY", CLASS_CATEGORY);
		map.put("sort", sort);
		
		// addObject view에 넘어가는 데이터
		classList = AcademyService.getClassList(map);
		int listcount = AcademyService.getCount(map);
				
		
		// 총 페이지 수
		int maxpage = (int)((double)listcount / limit + 0.95);
		int startpage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = startpage + 10 - 1;
		
		if(endpage > maxpage)
			endpage = maxpage;
		
		mav.addObject("page", page);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);		
		mav.addObject("classList", classList);
		mav.addObject("listcount", listcount);
		mav.addObject("CLASS_CATEGORY", CLASS_CATEGORY);
		mav.setViewName("Academy/classList");
		System.out.println(map + "갯수 : " + listcount);
		
		return mav;
	}
	
	@RequestMapping(value = "/classdetail.ac")
	public ModelAndView ClassDetail(ClassVO academy, HttpSession session) throws Exception {
		ClassVO vo = AcademyService.getDetail(academy);
		MemberVO vo2 = AcademyService.selectMember(academy);
		
		if (vo == null) {
			System.out.println("상세보기 실패");
			return null;
		}
		System.out.println("상세보기 성공");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ClassVO", vo);
		mav.addObject("MemberVO", vo2);
		mav.setViewName("Academy/detail");
		
		return mav;
	}
	
	@RequestMapping(value = "/classreservation.ac")
	public String ClassReservation() {
		
		return "Academy/reservation";
	}
	
	@RequestMapping(value = "/classform.ac")
	public String ClassForm() {
		
		return "Academy/classForm";
	}
	
	@RequestMapping(value = "/addclass.ac", method = RequestMethod.POST)
	public ModelAndView AddClass(MultipartHttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		boolean result = false;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		ClassVO vo = new ClassVO();
		vo.setMEMBER_NUM(Integer.parseInt(session.getAttribute("MEMBER_NUM").toString()));
		
		MemberVO vo2 = AcademyService.selectMember(vo);
		
		MultipartFile mf2 = request.getFile("CLASS_IMAGE");

		List<MultipartFile> fileList = new ArrayList<MultipartFile>(); 
		
		// input file 에 아무것도 없을 경우 (파일을 업로드 하지 않았을 때 처리) 
		if(request.getFiles("CLASS_BANNER").get(0).getSize() != 0) { 
			fileList = request.getFiles("CLASS_BANNER"); 
		} 

		System.out.println("파일 없을 때 2");
		
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
		} else {
			str = "#";
		}
		
		
		vo.setCLASS_BANNER(str);
		
		
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
			
			vo.setCLASS_IMAGE(storedFileName2);
		} else {
			System.out.println("썸네일 사진 넣지 않음.");
			return null;
		}
		
		
		

		vo.setMEMBER_NICK(vo2.getMEMBER_NICK());
		vo.setMEMBER_PICTURE(vo2.getMEMBER_PICTURE());
		vo.setCLASS_DIVISION(request.getParameter("CLASS_DIVISION"));
		vo.setCLASS_NAME(request.getParameter("CLASS_NAME"));
		vo.setCLASS_ABRIEF(request.getParameter("CLASS_ABRIEF"));
		vo.setCLASS_AMOUNT(Integer.parseInt(request.getParameter("CLASS_AMOUNT")));
		vo.setCLASS_DATE(new Timestamp(System.currentTimeMillis()));
		vo.setCLASS_DATE_CONFIGURATION_1(request.getParameter("CLASS_DATE_CONFIGURATION_1"));
		vo.setCLASS_DATE_CONFIGURATION_2(request.getParameter("CLASS_DATE_CONFIGURATION_2"));
		vo.setCLASS_AREA(request.getParameter("CLASS_AREA"));
		vo.setCLASS_CATEGORY(request.getParameter("CLASS_CATEGORY"));
		vo.setCLASS_INTRODUCTION_1(request.getParameter("CLASS_INTRODUCTION_1"));
		vo.setCLASS_INTRODUCTION_2(request.getParameter("CLASS_INTRODUCTION_2"));
		vo.setCLASS_INTRODUCTION_3(request.getParameter("CLASS_INTRODUCTION_3"));
		vo.setCLASS_ETC(request.getParameter("CLASS_ETC"));
		vo.setCLASS_ADDRESS(request.getParameter("CLASS_ADDRESS"));
		vo.setCLASS_DETAIL_ADDRESS(request.getParameter("CLASS_DETAIL_ADDRESS"));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:classlist.ac");
		mav.addObject("ClassVO", vo);
		
		result = AcademyService.insertClass(vo);
		
		if(result == false) {
			System.out.println("클래스 등록 실패!");
			return null;
		}
		System.out.println("클래스 등록 완료!");
		
		return mav;
	}
}
