package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.academy.ClassVO;
import com.spring.workshopMypage.WsMemberVO;

public interface AcademyManagementMapper {
	List<ClassVO> getManagementClassList(@Param("selectClassType") String selectClassType, @Param("WORKSHOP_NAME")String WORKSHOP_NAME);
	List<ClassVO> getSearchList(@Param("keyword") String keyword, @Param("searchType") String searchType, @Param("WORKSHOP_NAME")String WORKSHOP_NAME);
	
	List<WsMemberVO> getMemberList(@Param("WORKSHOP_NUM") int WORKSHOP_NUM);
	List<WsMemberVO> getMemberSearch (@Param("keyword") String keyword, @Param("searchType") String searchType, @Param("WORKSHOP_NUM") int WORKSHOP_NUM);
}
