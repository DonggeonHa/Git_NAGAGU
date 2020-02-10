package com.spring.workshopMypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ProductManagementMapper;



@Service
public class ProductManagementServiceImpl implements ProductManagementService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<Map<String, Object>> getproductReviewList(HashMap<String, Object> map) {
		ArrayList<Map<String, Object>> ProductReviewList = null;
		
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		ProductReviewList = managementMapper.getproductReviewList(map);
		
		return ProductReviewList;
	}


	@Override
	public ArrayList<Map<String, Object>> getReviewSearchList(HashMap<String, Object> map) {
		ArrayList<Map<String, Object>> searchList = null;
		
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		searchList = managementMapper.getReviewSearchList(map);
		
		return searchList;
	}
	
	
	@Override
	public ArrayList<Map<String, Object>> getproductQnaList(HashMap<String, Object> map) {
		ArrayList<Map<String, Object>> ProductQnaList = null;
		
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		ProductQnaList = managementMapper.getproductQnaList(map);
		for(int i=0; i<ProductQnaList.size(); i++) {
			System.out.println("ProductQnsList["+i+"]번째 QNA_STATUS = " + ProductQnaList.get(i).get("QNA_STATUS"));
		}

		return ProductQnaList;
	}	
	
	@Override
	public ArrayList<Map<String, Object>> getQnaSearchList(HashMap<String, Object> map) {
		ArrayList<Map<String, Object>> searchList = null;
		
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		searchList = managementMapper.getQnaSearchList(map);
		
		return searchList;
	}


	@Override
	public ArrayList<Map<String, Object>> getproductList(HashMap<String, Object> map) {
		ArrayList<Map<String, Object>> productList = null;
		
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		productList = managementMapper.getproductList(map);
		
		return productList;
	}


}
