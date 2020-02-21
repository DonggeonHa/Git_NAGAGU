package com.spring.workshopMypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.academy.ClassVO;
import com.spring.academy.Class_qnaVO;
import com.spring.mapper.AcademyManagementMapper;
import com.spring.mapper.AcademyMapper;
import com.spring.mapper.ProductManagementMapper;
import com.spring.workshop.WorkShopMemberVO;

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

	@Override
	public ClassVO getclassDetail(int CLASS_NUMBER) {
		AcademyManagementMapper managementMapper = sqlSession.getMapper(AcademyManagementMapper.class);
		
		ClassVO classVO = new ClassVO();
		classVO = managementMapper.getclassDetail(CLASS_NUMBER);
		
		return classVO;
		
	}

	@Override
	public int updateClass(ClassVO classVO) {
		AcademyManagementMapper managementMapper = sqlSession.getMapper(AcademyManagementMapper.class);
		int result = managementMapper.updateClass(classVO);
		
		return result;
	}

	@Override
	public int modifyWorkshop(WorkShopMemberVO workshopVO) {
		AcademyManagementMapper managementMapper = sqlSession.getMapper(AcademyManagementMapper.class);
		int result = managementMapper.modifyWorkshop(workshopVO);
		
		return result;
	}




	@Override
	public ArrayList<Map<String, Object>> getclassReviewList(HashMap<String, Object> map) {
		ArrayList<Map<String, Object>> ClassReviewList = null;
		
		AcademyManagementMapper managementMapper = sqlSession.getMapper(AcademyManagementMapper.class);
		ClassReviewList = managementMapper.getclassReviewList(map);
		
		return ClassReviewList;
	}

	@Override
	public ArrayList<Map<String, Object>> getclassQnaList(HashMap<String, Object> map) {
		ArrayList<Map<String, Object>> searchList = null;
		
		AcademyManagementMapper managementMapper = sqlSession.getMapper(AcademyManagementMapper.class);
		searchList = managementMapper.getclassQnaList(map);
		
		return searchList;
	}

	@Override
	public ArrayList<Map<String, Object>> getDashboardQna(int WORKSHOP_NUM) {
		ArrayList<Map<String, Object>> qnaList = null;
		
		AcademyManagementMapper managementMapper = sqlSession.getMapper(AcademyManagementMapper.class);
		qnaList = managementMapper.getDashboardQna(WORKSHOP_NUM);
		
		return qnaList;
	}

//	@Override
//	public int countOrderState(int number, int WORKSHOP_NUM) {
//		int count = 0;
//		
//		AcademyManagementMapper managementMapper = sqlSession.getMapper(AcademyManagementMapper.class);
//		count = managementMapper.countOrderState(number, WORKSHOP_NUM);
//		
//		return count;
//	}

	
	
}
