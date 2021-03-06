package com.spring.workshopMypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ProductManagementMapper;
import com.spring.order.ProductOrderVO;
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
	public ArrayList<Map<String, Object>> getSelledproductList(HashMap<String, Object> map) {
		ArrayList<Map<String, Object>> productList = null;
		
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		productList = managementMapper.getSelledproductList(map);
		
		return productList;
	}

	@Override
	public ArrayList<Map<String, Object>> getSelledInfo(HashMap<String, Object> map) {
		ArrayList<Map<String, Object>> getSelledInfo = null;
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		getSelledInfo = managementMapper.getSelledInfo(map);
		
		return getSelledInfo;
	}
	
	@Override
	public ArrayList<Map<String, Object>> getListOrderbyPrice(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public String[] getOrder_amount(HashMap<String, Object> map) {
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		
		String[] order_amount = managementMapper.getOrder_amount(map); 
	//	System.out.println("order_amount="+order_amount);
		return order_amount;
	}

	@Override
	public int modifyStatus(HashMap<String, Object> map) {
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		
		int res = managementMapper.modifyStatus(map); 
		System.out.println("result="+res);
		return res;
	}


	@Override
	public int modifySelledStatus(HashMap<String, Object> map) {
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);

		int res = managementMapper.modifySelledStatus(map); 
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

	@Override
	public int checkQnaCount(HashMap<String, Object> map) {
		int count = 0;
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		count = managementMapper.checkQnaCount(map);
		
		return count;
	}
	
	@Override
	public int checkReviewCount(HashMap<String, Object> map) {
		int count = 0;
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		count = managementMapper.checkReviewCount(map);
		
		return count;
	}

	@Override
	public ProductVO getproductDetail(int PRODUCT_NUM) {
		ProductVO productVO = null;
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		productVO = managementMapper.getproductDetail(PRODUCT_NUM);
		
		return productVO;
	}

	@Override
	public int updateProduct(ProductVO productVO) {
		int result = 0;
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		result = managementMapper.updateProduct(productVO);
		
		return result;
	}


	

}
