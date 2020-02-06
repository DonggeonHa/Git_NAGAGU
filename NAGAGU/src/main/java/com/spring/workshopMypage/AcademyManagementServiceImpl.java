package com.spring.workshopMypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.academy.ClassVO;
import com.spring.mapper.AcademyManagementMapper;

@Service
public class AcademyManagementServiceImpl implements AcademyManagementService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ClassVO> getManagementClassList() {
		List<ClassVO> mypageClassList = null;
		
		AcademyManagementMapper managementMapper = sqlSession.getMapper(AcademyManagementMapper.class);
		mypageClassList = managementMapper.getManagementClassList();
		
		return mypageClassList;
	}

	@Override
	public List<ClassVO> getSearchList(String keyword, String searchType) {
		List<ClassVO> searchList = null;
		System.out.println("impl 확인");
		AcademyManagementMapper managementMapper = sqlSession.getMapper(AcademyManagementMapper.class);
		searchList = managementMapper.getSearchList(keyword, searchType);
		
		
		return searchList;
	}
	
}
