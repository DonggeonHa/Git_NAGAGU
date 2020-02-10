package com.spring.estimate;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.mapper.EstimateMapper;

@Service
public class EstimateServiceImpl implements EstimateService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<EstimateVO> estimateList (HashMap <String, Object> map) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		
		ArrayList <EstimateVO> eList = mapper.estimateList(map);
		
		return eList;
	}
	
	@Override
	public int estimateInsert(EstimateVO vo) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		int res = mapper.estimateInsert(vo);
		
		return res;
	}
	
	@Override
	public int estimateCount (HashMap <String, Object> map) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		int cnt = mapper.estimateCount(map);
		
		return cnt;
	}
	
	@Override
	public String imageUpload(String url, MultipartFile file) throws Exception {
		try {
			if (file.isEmpty()) {
				throw new Exception ("Failed to store file " + file.getOriginalFilename());
			}
			
			String storedFileName = null;
			
			
			if(file.getSize()!=0) {
			
			String originalFileExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
			
			file.transferTo(new File(url+storedFileName));
			
			}
			
			return storedFileName;
		}
		catch (IOException e) {
			throw new Exception("Failed to store file " + file.getOriginalFilename(), e);
		}
	}
	
	@Override
	public EstimateVO estimateDetail(int ESTIMATE_NUM) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		EstimateVO vo = mapper.estimateDetail(ESTIMATE_NUM);
		
		return vo;
	}
	
	@Override
	public ArrayList<EstimateOfferVO> offerList(int ESTIMATE_NUM, int startpage, int endpage, String OFFER_WORKSHOP) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		HashMap <String, Object> map = new HashMap <String, Object>();
		map.put("ESTIMATE_NUM", ESTIMATE_NUM);
		map.put("startRow", startpage);
		map.put("endRow", endpage);
		map.put("OFFER_WORKSHOP", OFFER_WORKSHOP);
		
		ArrayList<EstimateOfferVO> offerList = mapper.offerList(map);
		
		return offerList;
	}
	
    @Override
    public int offerCount (int ESTIMATE_NUM, String OFFER_WORKSHOP) {
        EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		HashMap <String, Object> map = new HashMap <String, Object>();
		map.put("ESTIMATE_NUM", ESTIMATE_NUM);
		map.put("OFFER_WORKSHOP", OFFER_WORKSHOP);
		
        int cnt = mapper.offerCount(map);
        
        return cnt;
    }
	
	@Override
	public int offerInsert (EstimateOfferVO vo) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		int res = 0;
		int ESTIMATE_NUM = vo.getOFFER_ESTIMATE();
		int ESTIMATE_MINPRICE = mapper.estimateMinPrice(ESTIMATE_NUM);
		
		EstimateVO estimatevo = new EstimateVO();
		estimatevo.setESTIMATE_NUM(ESTIMATE_NUM);
		estimatevo.setESTIMATE_MINPRICE(ESTIMATE_MINPRICE);
		
		int res1 = mapper.offerInsert(vo);
		
		if (res1 == 1) {
			HashMap <String, Object> map = new HashMap <String, Object>();
			map.put("ESTIMATE_NUM", ESTIMATE_NUM);
			int ESTIMATE_OFFERCOUNT = mapper.offerCount(map);
			estimatevo.setESTIMATE_OFFERCOUNT(ESTIMATE_OFFERCOUNT);
			
			res = mapper.offerSetInfo(estimatevo);
		}
		
		return res;
	}

	@Override
	public ArrayList<EstimateOrderVO> esOrderList(int ES_ORDER_BUYER) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		ArrayList<EstimateOrderVO> esOrderList = mapper.esOrderList(ES_ORDER_BUYER);
		
		return esOrderList;
	}

}
