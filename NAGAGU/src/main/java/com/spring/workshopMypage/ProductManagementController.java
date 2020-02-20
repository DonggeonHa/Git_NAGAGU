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
import com.spring.store.ProductVO;
import com.spring.workshop.WorkShopMemberVO;

@Controller
public class ProductManagementController {
	@Autowired(required = false)
	private ProductManagementService productManagementService;

	@RequestMapping(value = "/updateProductForm.mywork", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView updateProductForm(HttpSession session, HttpServletRequest request) {

		ProductVO productVO = new ProductVO();
		ModelAndView mav = new ModelAndView();

		int PRODUCT_NUM = Integer.parseInt(request.getParameter("PRODUCT_NUM"));
		productVO = productManagementService.getproductDetail(PRODUCT_NUM);
		productVO.setPRODUCT_NUM(PRODUCT_NUM);

		mav.addObject("productVO", productVO);
		mav.setViewName("Store/productUpdateForm");

		return mav;
	}

	@RequestMapping(value = "/updateProduct.mywork", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView updateClass(MultipartHttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		ProductVO vo = new ProductVO();

		// 값이 여러개일 수 있는 size, color, option String으로 값 받기
		String PRODUCT_SIZE = "";
		String PRODUCT_COLOR = "";
		String[] SizeStr = request.getParameterValues("PRODUCT_SIZE");
		String[] ColorStr = request.getParameterValues("PRODUCT_COLOR");

		// ---------size
		for (int i = 0; i < SizeStr.length; i++) {
			PRODUCT_SIZE += SizeStr[i] + ",";
			System.out.println("PRODUCT_SIZE=" + PRODUCT_SIZE);
		}
		PRODUCT_SIZE = PRODUCT_SIZE.substring(0, PRODUCT_SIZE.length() - 1);

		// ---------color
		for (int i = 0; i < ColorStr.length; i++) {
			PRODUCT_COLOR += ColorStr[i] + ",";
			System.out.println("PRODUCT_COLOR=" + PRODUCT_COLOR);
		}
		PRODUCT_COLOR = PRODUCT_COLOR.substring(0, PRODUCT_COLOR.length() - 1);
		System.out.println("PRODUCT_COLOR2=" + PRODUCT_COLOR);

		// ---------배너 이미지 네 장
		List<MultipartFile> fileList = new ArrayList<MultipartFile>();

		// input file 에 아무것도 없을 경우 (파일을 업로드 하지 않았을 때 처리)
		if (request.getFiles("PRODUCT_BANNER").get(0).getSize() != 0) {
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
				str += "/productupload/image/" + saveFileName + ",";
				System.out.println("str=" + str);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		System.out.println("str = " + str);

		if (str.length() != 0) {
			str = str.substring(0, str.length() - 1);
		} else {
			str = "#";
		}

		// ---------썸네일 이미지는 하나
		MultipartFile mf2 = request.getFile("PRODUCT_IMAGE");
		if (!mf2.isEmpty()) {
			String uploadPath = "C:\\Project138\\upload\\";
			File fileDir2 = new File(uploadPath);
			if (!fileDir2.exists()) {
				fileDir2.mkdirs();
			}
			String originalFileExtension = mf2.getOriginalFilename()
					.substring(mf2.getOriginalFilename().lastIndexOf("."));
			String storedFileName2 = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;

			if (mf2.getSize() != 0) {
				mf2.transferTo(new File(uploadPath + storedFileName2));
			}
			System.out.println("storedFileName2= " + storedFileName2);
			vo.setPRODUCT_IMAGE(storedFileName2);

		} else {
			System.out.println("썸네일 사진 넣지 않음.");
			return null;
		}

		vo.setPRODUCT_NUM(Integer.parseInt(request.getParameter("PRODUCT_NUM")));
		vo.setPRODUCT_TITLE(request.getParameter("PRODUCT_TITLE"));
		vo.setPRODUCT_BRIEF(request.getParameter("PRODUCT_BRIEF"));
		vo.setPRODUCT_CATEGORY(request.getParameter("PRODUCT_CATEGORY"));
		vo.setPRODUCT_PRICE(Integer.parseInt(request.getParameter("PRODUCT_PRICE")));
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
		vo.setPRODUCT_STOCK(Integer.parseInt(request.getParameter("PRODUCT_STOCK")));

		
		int result = productManagementService.updateProduct(vo);
		if(result == 0) {
			System.out.println("상품 수정 실패!");
			return null;
		}
		System.out.println("상품 수정 완료!");

		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:productlist.pro?PRODUCT_CATEGORY=all");
		mav.addObject("ProductVO", vo);
		return mav;
	}

}
