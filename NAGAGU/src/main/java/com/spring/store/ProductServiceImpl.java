package com.spring.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public int getproductcount(HashMap<String, Object> map) {
		int productcount;
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		productcount = productMapper.getproductcount(map);
		return productcount;
	}

	@Override
	public ArrayList<ProductVO> getproductlist(HashMap<String, Object> map) {
		ArrayList<ProductVO> productList = null;
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		productList = productMapper.getproductlist(map);
		return productList;
	}

	
	@Override
	public ProductVO getproductVO(int PRODUCT_NUM) {
		ProductVO productVO;
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		productVO = productMapper.getproductVO(PRODUCT_NUM);
		return productVO;
	}



	








	
}
