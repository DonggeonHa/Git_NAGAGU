package com.spring.estimate;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class EstimateController {

	@Autowired
	EstimateService estimateService;
	
	@RequestMapping(value="/estimate_form.es")
	public String estimateForm(HttpServletRequest request) {
		return "Store/estimateForm";
	}
	
	@RequestMapping(value="/estimate_input.es")
	public String estimateInput(HttpServletRequest request) throws Exception {
		
		return "Store/estimateList";
	}
	
	@RequestMapping(value = "/estimate_file.es")
	public @ResponseBody String handlerFileUpload(MultipartHttpServletRequest request) throws Exception {
		
		String img_name = null;
		MultipartFile file = request.getFile("file");
		System.out.println(file.getOriginalFilename());
		
		String url = "C:/Project138/upload/";
		
		try {
			String uploadedFile = estimateService.imageUpload(url, file);
			
			img_name = "/NAGAGU/images/"+uploadedFile;
			System.out.println(img_name);
			
			return img_name;
		}
		catch (Exception e) {
			
			e.printStackTrace();
			return img_name;
		}
	}
}
