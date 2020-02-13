package com.spring.workshopMypage;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
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

import com.spring.academy.ClassVO;

@Controller
public class AcademyManagementController {
	@Autowired(required = false)
	private AcademyManagementService academyManagementService;
	
	
	@RequestMapping(value="/updateClassForm.mywork", method = {RequestMethod.POST, RequestMethod.GET} )
	public ModelAndView updateClass(HttpSession session, HttpServletRequest request) {
		
		ClassVO classVO = new ClassVO();
		ModelAndView mav = new ModelAndView();
		
		int CLASS_NUMBER =  Integer.parseInt(request.getParameter("CLASS_NUMBER"));
		classVO = academyManagementService.getclassDetail(CLASS_NUMBER);
		classVO.setCLASS_NUMBER(CLASS_NUMBER);
		
		mav.addObject("ClassVO", classVO);
		mav.setViewName("Academy/classUpdateForm");
		
		return mav;
	}
	
	@RequestMapping(value="/updateClass.mywork", method = RequestMethod.POST)
	public ModelAndView updateClass(MultipartHttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		ClassVO classVO = new ClassVO();
		
		MultipartFile mf2 = request.getFile("CLASS_IMAGE");
		
		List<MultipartFile> fileList = new ArrayList<MultipartFile>(); 
		
		// input file 에 아무것도 없을 경우 (파일을 업로드 하지 않았을 때 처리) 
		if(request.getFiles("CLASS_BANNER").get(0).getSize() != 0) { 
			fileList = request.getFiles("CLASS_BANNER"); 
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
		System.out.println("str = " + str);
		
		if(str.length() != 0) {
			str = str.substring(0, str.length()-1);
		} else {
			str = "#";
		}
		
		classVO.setCLASS_BANNER(str);
		
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
			
			classVO.setCLASS_IMAGE(storedFileName2);
		} else {
			System.out.println("썸네일 사진 넣지 않음.");
			return null;
		}
		
		classVO.setCLASS_NUMBER(Integer.parseInt(request.getParameter("CLASS_NUMBER")));
		classVO.setCLASS_DIVISION(request.getParameter("CLASS_DIVISION"));
		classVO.setCLASS_NAME(request.getParameter("CLASS_NAME"));
		classVO.setCLASS_ABRIEF(request.getParameter("CLASS_ABRIEF"));
		classVO.setCLASS_AMOUNT(Integer.parseInt(request.getParameter("CLASS_AMOUNT")));
		classVO.setCLASS_DATE(new Timestamp(System.currentTimeMillis()));
		classVO.setCLASS_DATE_CONFIGURATION_1(request.getParameter("CLASS_DATE_CONFIGURATION_1").substring(0,11));
		classVO.setCLASS_DATE_CONFIGURATION_2(request.getParameter("CLASS_DATE_CONFIGURATION_2").substring(0,11));
		classVO.setCLASS_AREA(request.getParameter("CLASS_AREA"));
		classVO.setCLASS_CATEGORY(request.getParameter("CLASS_CATEGORY"));
		classVO.setCLASS_INTRODUCTION_1(request.getParameter("CLASS_INTRODUCTION_1"));
		classVO.setCLASS_INTRODUCTION_2(request.getParameter("CLASS_INTRODUCTION_2"));
		classVO.setCLASS_INTRODUCTION_3(request.getParameter("CLASS_INTRODUCTION_3"));
		classVO.setCLASS_ETC(request.getParameter("CLASS_ETC"));
		classVO.setCLASS_ADDRESS(request.getParameter("CLASS_ADDRESS"));
		classVO.setCLASS_DETAIL_ADDRESS(request.getParameter("CLASS_DETAIL_ADDRESS"));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:classlist.ac");
		mav.addObject("ClassVO", classVO);
		
		int result = academyManagementService.updateClass(classVO);
		
		if(result == 0) {
			System.out.println("클래스 수정 실패!");
			return null;
		}
		System.out.println("클래스 수정 완료!");
		
		return mav;
	}
}
