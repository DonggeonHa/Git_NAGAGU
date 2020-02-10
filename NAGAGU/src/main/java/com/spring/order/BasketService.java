package com.spring.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public interface BasketService {
	int insertCart(BasketVO basketVO);
	int countBasket(int num);
	int deleteBasket(BasketVO basketVO);
	int updateAmount(BasketVO basketVO);
	int updateCheck(BasketVO basketVO);
	int insertOrder(ProductOrderVO productOrderVO);
	ArrayList<Map<String, Object>> getbasketList(HashMap<String, Object> map);//장바구니 리스트
	ArrayList<Map<String, Object>> getOrderList(HashMap<String, Object> map);//주문 리스트
}
