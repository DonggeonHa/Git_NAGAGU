package com.spring.estimate;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class EstimateServiceImpl implements EstimateService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int estimateInsert(EstimateVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public String imageUpload(String url, MultipartFile file) throws Exception {
		try {
			if (file.isEmpty()) {
				throw new Exception ("Failed to store file " + file.getOriginalFilename());
			}
			
			String storedFileName = null;
			
			
			if(file.getSize()!=0) {
			
			String originalFileExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
			
			file.transferTo(new File(url+storedFileName));
			
			}
			
			return storedFileName;
		}
		catch (IOException e) {
			throw new Exception("Failed to store file " + file.getOriginalFilename(), e);
		}
	}

}
