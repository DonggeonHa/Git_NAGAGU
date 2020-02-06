package com.spring.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.BasketMapper;

@Service
public class BasketServiceImpl implements BasketService{

	@Autowired
	private SqlSession sqlSession;
	@Override
	public int insertCart(BasketVO basketVO) {
		BasketMapper basket = sqlSession.getMapper(BasketMapper.class);
		int result =basket.insertCart(basketVO);
		System.out.println("insertcart결과"+result);
		return result;
	}
	@Override
	public int countBasket(int num) {
		BasketMapper basket = sqlSession.getMapper(BasketMapper.class);
		return basket.countBasket(num);
	}
	@Override
	public ArrayList<Map<String, Object>> getbasketList(HashMap<String, Object> map) {
		BasketMapper basket = sqlSession.getMapper(BasketMapper.class);
		ArrayList<Map<String, Object>> result =basket.getbasketList(map);
		System.out.println("getbasketList결과"+result);
		return result;
	}
	@Override
	public int deleteBasket(BasketVO basketVO) {
		BasketMapper basket = sqlSession.getMapper(BasketMapper.class);
		int result =basket.deleteBasket(basketVO);
		System.out.println("deleteBasket결과"+result);
		return 0;
	}
 
	
}
