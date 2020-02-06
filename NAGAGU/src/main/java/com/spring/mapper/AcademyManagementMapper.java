package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.academy.ClassVO;

public interface AcademyManagementMapper {
	List<ClassVO> getManagementClassList();
	List<ClassVO> getSearchList(@Param("keyword") String keyword, @Param("searchType") String searchType);
}
