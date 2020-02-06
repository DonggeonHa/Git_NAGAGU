package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.order.BasketVO;

public interface BasketMapper {
	int insertCart(BasketVO basketVO);//장바구니 담기
	int countBasket(int num);//장바구니 담기
	int deleteBasket(BasketVO basketVO);
	ArrayList<Map<String, Object>> getbasketList(HashMap<String, Object> map);//장바구니 리스트
}
