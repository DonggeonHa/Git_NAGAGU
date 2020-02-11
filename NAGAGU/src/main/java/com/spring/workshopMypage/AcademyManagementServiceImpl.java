package com.spring.workshopMypage;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
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

	@Override
	public List<WsMemberVO> getMemberList(int WORKSHOP_NUM) {
		List<WsMemberVO> member_list = null;
		
		AcademyManagementMapper managementMapper = sqlSession.getMapper(AcademyManagementMapper.class);
		member_list = managementMapper.getMemberList(WORKSHOP_NUM);
		
		return member_list;
	}

	@Override
	public List<WsMemberVO> getMemberSearch(String keyword, String searchType, int WORKSHOP_NUM) {
		List<WsMemberVO> searchMember = null;
		
		AcademyManagementMapper managementMapper = sqlSession.getMapper(AcademyManagementMapper.class);
		searchMember = managementMapper.getMemberSearch(keyword, searchType, WORKSHOP_NUM);
		
		return searchMember;
	}

	@Override
	public int deleteManagementMember(int MY_CLASS_MEMBERNUM) {
		int result = 0;
		
		AcademyManagementMapper managementMapper = sqlSession.getMapper(AcademyManagementMapper.class);
		result = managementMapper.deleteManagementMember(MY_CLASS_MEMBERNUM);
		
		return result;
	}

	@Override
	public int updateClassStatus(ArrayList<Integer> updateArray) {
		AcademyManagementMapper managementMapper = sqlSession.getMapper(AcademyManagementMapper.class);
		int result = 0;
		
		for(int i=0; i<updateArray.size(); i++) {
			int CLASS_NUMBER = updateArray.get(i);
			
			result =managementMapper.updateClassStatus(CLASS_NUMBER);
		}
		
		return result;
	}


	
}
