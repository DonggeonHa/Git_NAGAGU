package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.academy.ClassVO;
import com.spring.academy.Class_qnaVO;
import com.spring.workshop.WorkShopMemberVO;
import com.spring.workshopMypage.WsMemberVO;

public interface AcademyManagementMapper {
	List<ClassVO> getManagementClassList(@Param("selectClassType") String selectClassType, @Param("WORKSHOP_NAME")String WORKSHOP_NAME);
	List<ClassVO> getSearchList(@Param("keyword") String keyword, @Param("searchType") String searchType, @Param("WORKSHOP_NAME")String WORKSHOP_NAME);
	
	List<WsMemberVO> getMemberList(@Param("WORKSHOP_NUM") int WORKSHOP_NUM);
	List<WsMemberVO> getMemberSearch (@Param("keyword") String keyword, @Param("searchType") String searchType, @Param("WORKSHOP_NUM") int WORKSHOP_NUM);
	
	int deleteManagementMember(@Param("MY_CLASS_MEMBERNUM") int MY_CLASS_MEMBERNUM);
	int updateClassStatus(@Param("CLASS_NUMBER") int CLASS_NUMBER);
	
	ClassVO getclassDetail(@Param("CLASS_NUMBER") int CLASS_NUMBER);
	int updateClass(ClassVO classVO);
	
	int modifyWorkshop(WorkShopMemberVO workshopVO);
	
	
	//선주 리뷰,문의
	ArrayList<Map<String, Object>> getclassReviewList(HashMap<String, Object> map);
	ArrayList<Map<String, Object>> getclassQnaList(HashMap<String, Object> map);
	
	//대시보드
	ArrayList<Map<String, Object>> getDashboardQna(@Param("WORKSHOP_NUM")int WORKSHOP_NUM);
	int countOrderState(@Param("number")int number, @Param("WORKSHOP_NUM")int WORKSHOP_NUM);
}
