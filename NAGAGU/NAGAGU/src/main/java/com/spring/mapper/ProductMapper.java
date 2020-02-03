package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.store.ProductVO;

public interface ProductMapper {
	int getproductcount(HashMap<String, Object> map);
	public ArrayList<ProductVO> getproductlist(HashMap<String, Object> map);
	ProductVO getproductVO(int PRODUCT_NUM);
}
