package com.spring.academy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.store.ProductVO;
import com.spring.workshop.WorkShopMemberVO;

public interface AcademyService {
	public boolean insertClass(ClassVO academy) throws Exception;
	public int getCount(HashMap<String, Object> map) throws Exception;
	ArrayList<ClassVO> getClassList(HashMap<String, Object> map) throws Exception;
	public ClassVO getDetail(ClassVO academy) throws Exception;
	public WorkShopMemberVO selectWMember(ClassVO academy) throws Exception;
	public int countUp(ClassVO academy) throws Exception;
	
	public boolean insertClassInfo(MyClassVO vo) throws Exception;
	//경태 마이페이지 강의목록
	public ArrayList<Map<String, Object>> getLoginMemberClass(HashMap<String, Object> map);
	ArrayList<ClassVO> getClassListOfMember(HashMap<String, Object> map) throws Exception;
	//선주
	int updateGrade(ClassVO vo);
	
	//대시보드
	ArrayList<ClassVO> myClassList(@Param("WORKSHOP_NUM")int WORKSHOP_NUM) throws Exception;
	ArrayList<ProductVO> productSellList(@Param("WORKSHOP_NUM")int WORKSHOP_NUM) throws Exception;
}
