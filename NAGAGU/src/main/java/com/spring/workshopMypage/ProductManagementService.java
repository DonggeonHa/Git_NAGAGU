package com.spring.workshopMypage;

import java.util.ArrayList;
import java.util.Map;

public interface ProductManagementService {
	ArrayList<Map<String, Object>> getManagementProductList();
//	List<ProductVO> getSearchList(@Param("keyword") String keyword, @Param("searchType") String searchType);

}
