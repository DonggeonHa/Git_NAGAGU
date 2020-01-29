package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.academy.ClassVO;

public interface AcademyMapper {
	ArrayList<ClassVO> getClassList(HashMap<String, Object> map);
	int insertClass(ClassVO academy);
	int getCount(HashMap<String, Object> map);
	ClassVO getDetail(ClassVO academy);
}
