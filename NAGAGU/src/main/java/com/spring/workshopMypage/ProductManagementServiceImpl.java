package com.spring.workshopMypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ProductManagementMapper;
import com.spring.store.ProductVO;



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
	public ArrayList<Map<String, Object>> getproductQnaList(HashMap<String, Object> map) {
		ArrayList<Map<String, Object>> searchList = null;
		
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		searchList = managementMapper.getproductQnaList(map);
		
		return searchList;
	}


	@Override
	public ArrayList<Map<String, Object>> getproductList(HashMap<String, Object> map) {
		ArrayList<Map<String, Object>> productList = null;
		
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		productList = managementMapper.getproductList(map);
		
		return productList;
	}


	@Override
	public int modifyStatus(HashMap<String, Object> map) {
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		
		int res = managementMapper.modifyStatus(map); 
		System.out.println("result="+res);
		return res;
	}


	@Override
	public int deleteProducts(HashMap<String, Object> map) {
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		
		int res = managementMapper.deleteProducts(map); 
		System.out.println("result="+res);
		return res;
	}

	@Override
	public ProductVO getProductVoOfWorkshop(HashMap<String, Object> map) {
		ProductVO ProductVO = null;
		
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		ProductVO = managementMapper.getProductVoOfWorkshop(map);
		
		return ProductVO;
	}


}
