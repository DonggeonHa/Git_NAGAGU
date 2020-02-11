package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.academy.ClassVO;
import com.spring.academy.MyClassVO;
import com.spring.workshop.WorkShopMemberVO;

public interface AcademyMapper {
	ArrayList<ClassVO> getClassList(HashMap<String, Object> map);
	int insertClass(ClassVO academy);
	int getCount(HashMap<String, Object> map);
	ClassVO getDetail(ClassVO academy);
	WorkShopMemberVO selectWMember(ClassVO academy);
	int countUp(ClassVO academy);
	
	int insertClassInfo(MyClassVO vo); // 회원관리
	//경태 마이페이지 강의목록
	public ArrayList<Map<String, Object>> getLoginMemberClass(HashMap<String, Object> map);
	ArrayList<ClassVO> getClassListOfMember(HashMap<String, Object> map) throws Exception;
}
