package com.spring.mapper;

import java.util.ArrayList;
import java.util.Map;

public interface ProductManagementMapper {
	ArrayList<Map<String, Object>> getManagementProductList();
//	List<ClassVO> getSearchList(@Param("keyword") String keyword, @Param("searchType") String searchType);

}
