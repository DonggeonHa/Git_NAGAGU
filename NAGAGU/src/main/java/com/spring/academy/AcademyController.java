package com.spring.academy;

import java.io.File;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class AcademyController {
	
	@Autowired
	private AcademyServiceImpl AcademyService;
	
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
	public ModelAndView ClassDetail(ClassVO academy) throws Exception {
		ClassVO vo = null;
		vo = AcademyService.getDetail(academy);
		
		if (vo == null) {
			System.out.println("상세보기 실패");
			return null;
		}
		System.out.println("상세보기 성공");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ClassVO", vo);
		mav.setViewName("Academy/detail2");
		
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
	public ModelAndView AddClass(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean result = false;
		String downlink = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		
		MultipartFile mf = request.getFile("CLASS_BANNER");
		MultipartFile mf2 = request.getFile("CLASS_IMAGE");

		if(!mf.isEmpty()) {
			String uploadPath = "C:\\Project138\\upload\\";
			String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
			
			if(mf.getSize() != 0) {
				mf.transferTo(new File(uploadPath+storedFileName));
			}
			
			downlink = "fileDownload.do?of="+ URLEncoder.encode(storedFileName, "utf-8")
						+ "&of2=" + URLEncoder.encode(mf.getOriginalFilename(), "utf-8");
		} else {
			downlink = "첨부파일 없음";
		}
		
		if(!mf2.isEmpty()) {
			String uploadPath = "C:\\Project138\\upload\\";
			String originalFileExtension = mf2.getOriginalFilename().substring(mf2.getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
			
			if(mf2.getSize() != 0) {
				mf2.transferTo(new File(uploadPath+storedFileName));
			}
			
			downlink = "fileDownload.do?of="+ URLEncoder.encode(storedFileName, "utf-8")
						+ "&of2=" + URLEncoder.encode(mf2.getOriginalFilename(), "utf-8");
		} else {
			downlink = "첨부파일 없음";
		}
		
		ClassVO vo = new ClassVO();
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
		vo.setCLASS_BANNER(mf.getOriginalFilename());
		vo.setCLASS_IMAGE(mf2.getOriginalFilename());
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
