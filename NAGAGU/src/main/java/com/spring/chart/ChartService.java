package com.spring.chart;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.academy.ClassVO;

public interface ChartService {
	int CountBoard(@Param("selectDate")String selectDate) throws Exception;
	ArrayList<ClassVO> PopularClass() throws Exception;
	int insertMemberCount(@Param("selectDate")String selectDate) throws Exception;
	int insertWSMemberCount(@Param("selectDate")String selectDate) throws Exception;
}
