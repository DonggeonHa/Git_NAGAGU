package com.spring.workshopMypage;

import java.util.ArrayList;
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
	public ArrayList<Map<String, Object>> getManagementProductList() {
		ArrayList<Map<String, Object>> mypageCProductList = null;
		
		ProductManagementMapper managementMapper = sqlSession.getMapper(ProductManagementMapper.class);
		mypageCProductList = managementMapper.getManagementProductList();
		
		return mypageCProductList;
	}
}
