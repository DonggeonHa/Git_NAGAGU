package com.spring.estimate;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public interface EstimateService {
	public ArrayList<EstimateVO> estimateList(int startpage, int endpage);
	public int estimateInsert (EstimateVO vo);
	public int estimateCount ();
	public String imageUpload(String url, MultipartFile file) throws Exception;
	public EstimateVO estimateDetail(int ESTIMATE_NUM);
	public ArrayList<EstimateOfferVO> offerList(int ESTIMATE_NUM, int startpage, int endpage);
    public int offerCount (int ESTIMATE_NUM);
	public int offerInsert (EstimateOfferVO vo);
}
