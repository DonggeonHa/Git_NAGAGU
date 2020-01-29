package com.spring.store;

import java.util.ArrayList;
import java.util.HashMap;

public interface ProductService {

	
	
	//ProductList
	int getproductcount(HashMap<String, Object> map);
	public ArrayList<ProductVO> getproductlist(HashMap<String, Object> map);
	
	
	
	//ProductDetail
	ProductVO getproductVO(int PRODUCT_NUM);
	
}
