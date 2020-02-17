package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.academy.ClassVO;

public interface ChartMapper {
	
	int CountBoard(@Param("selectDate")String selectDate);	//게시글 수
	ArrayList<ClassVO> PopularClass();	//인기 클래스
	int insertMemberCount(@Param("selectDate")String selectDate);	//일반 회원가입 수
	int insertWSMemberCount(@Param("selectDate")String selectDate);	//공방 회원가입 수
}
