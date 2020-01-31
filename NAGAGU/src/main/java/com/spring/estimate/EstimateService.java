package com.spring.estimate;

import org.springframework.web.multipart.MultipartFile;

public interface EstimateService {
	public int estimateInsert (EstimateVO vo) throws Exception;
	public String imageUpload(String url, MultipartFile file) throws Exception;
}
