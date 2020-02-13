package com.spring.estimate;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

public interface EstimateService {
	public ArrayList<EstimateVO> estimateList(HashMap <String, Object> map);
	public int estimateInsert (EstimateVO vo);
	public int estimateModify (EstimateVO vo);
	public int estimateDelete (int ESTIMATE_NUM);
	public int estimateCount (HashMap <String, Object> map);
	public int estimateBidSet (int ESTIMATE_STATE, int ESTIMATE_NUM);
	public String imageUpload(String url, MultipartFile file) throws Exception;
	public int imageDelete(String[] filesrc);
	public EstimateVO estimateDetail(int ESTIMATE_NUM);
	public ArrayList<EstimateOfferVO> offerList(int ESTIMATE_NUM, int startpage, int endpage, String OFFER_WORKSHOP);
    public EstimateOfferVO offerDetail (int OFFER_NUM);
	public int offerCount (int ESTIMATE_NUM, String OFFER_WORKSHOP);
	public int offerInsert (EstimateOfferVO vo);
	public int offerModify (EstimateOfferVO vo);
	public int offerDelete (int ESTIMATE_NUM, int OFFER_NUM);
	public int offerBidSet (int OFFER_STATE, int OFFER_NUM);
	public ArrayList<EstimateOrderVO> esOrderList(HashMap<String, Object> map);
	public int esOrderInsert (EstimateOrderVO vo);
	public int esOrderDelete (int ES_ORDER_NUM);
	public int esOrderCount (HashMap<String, Object> map);
}
