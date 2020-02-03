package com.spring.main;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired(required=false)
	private SqlSession sqlSession;

	@Override
	public String summernote(String url, MultipartFile file) throws Exception { /* 썸머노트 부분 */
		try {
			if (file.isEmpty()) {
				throw new Exception ("Failed to summernote file " + file.getOriginalFilename());
			}
			
			String storedFileName = null;
			System.out.println(url);
			
			
			if(file.getSize()!=0) {
			
			String originalFileExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
			
			file.transferTo(new File(url + storedFileName));
			
			}
			
			return storedFileName;
		}
		catch (IOException e) {
			throw new Exception("Failed to summernote file " + file.getOriginalFilename(), e);
		}
	}

}
