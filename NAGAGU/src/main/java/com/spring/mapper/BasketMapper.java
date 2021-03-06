package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.order.BasketVO;
import com.spring.order.ProductOrderVO;

public interface BasketMapper {
	int insertCart(BasketVO basketVO);//장바구니 담기
	int countBasket(int num);//장바구니 담기
	int deleteBasket(BasketVO basketVO);
	int updateAmount(BasketVO basketVO);
	int updateCheck(HashMap<String, Object> map);
	int insertOrder(ProductOrderVO productOrderVO);
	ArrayList<Map<String, Object>> getbasketList(HashMap<String, Object> map);//장바구니 리스트
	ArrayList<Map<String, Object>> getOrderList(HashMap<String, Object> map);//장바구니 리스트
	ArrayList<Map<String, Object>> getPaidList(HashMap<String, Object> map);//장바구니 리스트
	ArrayList<Map<String, Object>> getPaidDetail(HashMap<String, Object> map);//장바구니 더보기
	ArrayList<Map<String, Object>> getCount(HashMap<String, Object> map);//장바구니 리스트
}
