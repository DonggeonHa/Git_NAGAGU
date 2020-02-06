package com.spring.workshopMypage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.academy.ClassVO;

public interface AcademyManagementService {
	List<ClassVO> getManagementClassList();
	List<ClassVO> getSearchList(@Param("keyword") String keyword, @Param("searchType") String searchType);
}
