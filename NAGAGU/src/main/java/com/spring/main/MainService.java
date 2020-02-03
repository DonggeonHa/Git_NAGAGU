package com.spring.main;

import org.springframework.web.multipart.MultipartFile;

public interface MainService {
	public String summernote(String url, MultipartFile file) throws Exception;
}
