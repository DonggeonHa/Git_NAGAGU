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
	public List<ClassVO> getManagementClassList(String selectClassType, String WORKSHOP_NAME) {
		List<ClassVO> mypageClassList = null;
		
		AcademyManagementMapper managementMapper = sqlSession.getMapper(AcademyManagementMapper.class);
		mypageClassList = managementMapper.getManagementClassList(selectClassType, WORKSHOP_NAME);
		
		return mypageClassList;
	}

	@Override
	public List<ClassVO> getSearchList(String keyword, String searchType, String WORKSHOP_NAME) {
		List<ClassVO> searchList = null;
		System.out.println("impl 확인");
		AcademyManagementMapper managementMapper = sqlSession.getMapper(AcademyManagementMapper.class);
		searchList = managementMapper.getSearchList(keyword, searchType, WORKSHOP_NAME);
		
		
		return searchList;
	}
	
}
