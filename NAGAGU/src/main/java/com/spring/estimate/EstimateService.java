package com.spring.estimate;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

public interface EstimateService {
	public ArrayList<EstimateVO> estimateList(HashMap <String, Object> map);
	public int estimateInsert (EstimateVO vo);
	public int estimateCount (HashMap <String, Object> map);
	public String imageUpload(String url, MultipartFile file) throws Exception;
	public EstimateVO estimateDetail(int ESTIMATE_NUM);
	public ArrayList<EstimateOfferVO> offerList(int ESTIMATE_NUM, int startpage, int endpage, String OFFER_WORKSHOP);
    public int offerCount (int ESTIMATE_NUM, String OFFER_WORKSHOP);
	public int offerInsert (EstimateOfferVO vo);
	public ArrayList<EstimateOrderVO> esOrderList(int ES_ORDER_BUYER);
}
