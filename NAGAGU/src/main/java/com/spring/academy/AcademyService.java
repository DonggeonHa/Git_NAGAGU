package com.spring.academy;

import java.util.ArrayList;
import java.util.HashMap;

public interface AcademyService {
	public boolean insertClass(ClassVO academy) throws Exception;
	public int getCount(HashMap<String, Object> map) throws Exception;
	ArrayList<ClassVO> getClassList(HashMap<String, Object> map) throws Exception;
	public ClassVO getDetail(ClassVO academy) throws Exception;
	
}
