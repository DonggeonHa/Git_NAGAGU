package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.estimate.EstimateOfferVO;
import com.spring.estimate.EstimateOrderVO;
import com.spring.estimate.EstimateVO;

public interface EstimateMapper {
	public int estimateInsert (EstimateVO vo);
	public int estimateUpdate (EstimateVO vo);
	public int estimateDelete (int ESTIMATE_NUM);
	public ArrayList<EstimateVO> estimateList (HashMap<String, Object> map);
	public int estimateCount (HashMap <String, Object> map);
	public EstimateVO estimateDetail (int ESTIMATE_NUM);
	public int estimateBidSet (EstimateVO vo);
	public ArrayList<EstimateOfferVO> offerList (HashMap<String, Object> map);    
	public int offerCount (HashMap<String, Object> map);
	public EstimateOfferVO offerDetail (int OFFER_NUM);
    public int offerInsert (EstimateOfferVO vo);
    public int offerModify (EstimateOfferVO vo);
    public int offerDelete (int OFFER_NUM);
    public int offerDeleteAll (int ESTIMATE_NUM);
    public int offerBidSet (EstimateOfferVO vo);
	public int offerSetInfo (EstimateVO vo);
	public int estimateMinPrice (int OFFER_NUM);
	public ArrayList<EstimateOrderVO> esOrderList (HashMap<String, Object> map);
	public EstimateOrderVO esOrserDetail (int ES_ORDER_NUM);
	public int esOrderInsert(EstimateOrderVO vo);
	public int esOrderDelete(int ESTIMATE_NUM);
	public int esOrderCount(HashMap<String, Object> map);
	public ArrayList<HashMap <String, Object>> workOfferList (HashMap<String, Object> map);
}
