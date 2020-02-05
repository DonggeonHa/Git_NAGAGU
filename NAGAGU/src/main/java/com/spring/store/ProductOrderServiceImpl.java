package com.spring.store;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ProductOrderMapper;
import com.spring.mypage.BasketVO;

@Service
public class ProductOrderServiceImpl implements ProductOrderService{

	@Autowired
	private SqlSession sqlSession;
	@Override
	public int insertCart(BasketVO basketVO) {
		ProductOrderMapper productOrder = sqlSession.getMapper(ProductOrderMapper.class);
		return productOrder.insertCart(basketVO);
	}
 
	
}
