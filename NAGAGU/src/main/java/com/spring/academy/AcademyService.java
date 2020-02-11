package com.spring.academy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.mapper.ProductReviewMapper;
import com.spring.workshop.WorkShopMemberVO;
import com.spring.workshop.WorkshopVO;

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
}
