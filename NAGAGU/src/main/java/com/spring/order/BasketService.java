package com.spring.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public interface BasketService {
	int insertCart(BasketVO basketVO);
	int countBasket(int num);
	int deleteBasket(BasketVO basketVO);
	ArrayList<Map<String, Object>> getbasketList(HashMap<String, Object> map);//장바구니 리스트
}
