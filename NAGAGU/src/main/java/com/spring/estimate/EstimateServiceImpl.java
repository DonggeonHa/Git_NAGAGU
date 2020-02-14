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

@Service("estimateServce")
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
	public int estimateModify (EstimateVO vo) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		int res = mapper.estimateUpdate(vo);
		
		return res;
	}
	
	@Override
	public int estimateDelete (int ESTIMATE_NUM) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		int res = 0;
		
		HashMap <String, Object> map = new HashMap<String, Object>();
		map.put("ESTIMATE_NUM", ESTIMATE_NUM);
		int offerCnt = mapper.offerCount(map);
		if (offerCnt > 0) {
			int delOffer = mapper.offerDeleteAll(ESTIMATE_NUM);
			
			if (delOffer == 0) {
				return 0;
			}
		}
		
		res = mapper.estimateDelete(ESTIMATE_NUM);
		
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
	
	@Override public int imageDelete(String[] filesrc) { 
		String uploadPath="C://Project138//upload"; 
		int res = 0; 
		for (int i=0; i<filesrc.length; i++) { 
			String path = uploadPath + filesrc[i]; 
			System.out.println("file path : " + path); 
			File file = new File(path); 
			if (file.exists()) { 
				file.delete(); 
			} 
			res++; 
		} 
		return res; 
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
		
		System.out.println(ESTIMATE_NUM);
		System.out.println(startpage);
		System.out.println(endpage);
		System.out.println(OFFER_WORKSHOP);
		
		HashMap <String, Object> map = new HashMap <String, Object>();
		map.put("ESTIMATE_NUM", ESTIMATE_NUM);
		map.put("startRow", startpage);
		map.put("endRow", endpage);
		map.put("OFFER_WORKSHOP", OFFER_WORKSHOP);
		
		ArrayList<EstimateOfferVO> offerList = mapper.offerList(map);
		
		return offerList;
	}
	
	@Override
	 public EstimateOfferVO offerDetail (int OFFER_NUM) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		EstimateOfferVO vo = mapper.offerDetail(OFFER_NUM);

		return vo;
	}
	
    @Override
    public int offerCount (HashMap <String, Object> map) {
        EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		System.out.println("OFFER_WORKSHOP :: " + map.get("OFFER_WORKSHOP"));
        
        int cnt = mapper.offerCount(map);
        
        return cnt;
    }
	
	@Override
	public int offerInsert (EstimateOfferVO vo) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		int res = 0;
		
		int res1 = mapper.offerInsert(vo);
		
		if (res1 == 1) {
			int ESTIMATE_NUM = vo.getOFFER_ESTIMATE();
			int ESTIMATE_MINPRICE = mapper.estimateMinPrice(ESTIMATE_NUM);
			
			EstimateVO estimatevo = new EstimateVO();
			estimatevo.setESTIMATE_NUM(ESTIMATE_NUM);
			estimatevo.setESTIMATE_MINPRICE(ESTIMATE_MINPRICE);
			
			HashMap <String, Object> map = new HashMap <String, Object>();
			map.put("ESTIMATE_NUM", ESTIMATE_NUM);
			int ESTIMATE_OFFERCOUNT = mapper.offerCount(map);
			estimatevo.setESTIMATE_OFFERCOUNT(ESTIMATE_OFFERCOUNT);
			
			res = mapper.offerSetInfo(estimatevo);
		}
		
		return res;
	}
	
	@Override
	public int offerModify (EstimateOfferVO vo) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		int res = 0;
		
		int res1 = mapper.offerModify(vo);
		if (res1 == 1) {
			int ESTIMATE_NUM = vo.getOFFER_ESTIMATE();
			int ESTIMATE_MINPRICE = mapper.estimateMinPrice(ESTIMATE_NUM);

			EstimateVO estimatevo = new EstimateVO();
			estimatevo.setESTIMATE_NUM(ESTIMATE_NUM);
			estimatevo.setESTIMATE_MINPRICE(ESTIMATE_MINPRICE);
			
			res = mapper.offerSetInfo(estimatevo);
		}
		
		return res;
	}
	
	@Override
	public int offerDelete (int ESTIMATE_NUM, int OFFER_NUM) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		int res = 0;
		int res1 = mapper.offerDelete(OFFER_NUM);
		
		if (res1 == 1) {
			HashMap <String, Object> map = new HashMap <String, Object>();
			map.put("ESTIMATE_NUM", ESTIMATE_NUM);
			int ESTIMATE_OFFERCOUNT = mapper.offerCount(map);
			int ESTIMATE_MINPRICE = 0;
			
			if (ESTIMATE_OFFERCOUNT > 0) {
				ESTIMATE_MINPRICE = mapper.estimateMinPrice(ESTIMATE_NUM);
			}
			
			
			EstimateVO estimatevo = new EstimateVO();
			estimatevo.setESTIMATE_NUM(ESTIMATE_NUM);
			estimatevo.setESTIMATE_MINPRICE(ESTIMATE_MINPRICE);
			
			estimatevo.setESTIMATE_OFFERCOUNT(ESTIMATE_OFFERCOUNT);
			
			res = mapper.offerSetInfo(estimatevo);
		}
		
		return res;
	}
	
	@Override
	public int offerBidSet (int OFFER_STATE, int OFFER_NUM) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		EstimateOfferVO vo = new EstimateOfferVO();
		vo.setOFFER_NUM(OFFER_NUM);
		vo.setOFFER_STATE(OFFER_STATE);
		
		int res = mapper.offerBidSet(vo);
		
		return res;
	}
	
	@Override
	public int estimateBidSet (int ESTIMATE_STATE, int ESTIMATE_NUM) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		EstimateVO vo = new EstimateVO();
		vo.setESTIMATE_NUM(ESTIMATE_NUM);
		vo.setESTIMATE_STATE(ESTIMATE_STATE);
		
		int res = mapper.estimateBidSet(vo);
		
		return res;
	}
	
	/* !----- 개인 회원 : 견적 주문 리스트 -----! */
	
	@Override
	public ArrayList<EstimateOrderVO> esOrderList(HashMap<String, Object> map) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		ArrayList<EstimateOrderVO> esOrderList = mapper.esOrderList(map);
		
		return esOrderList;
	}
	
	@Override
	public int esOrderInsert (EstimateOrderVO vo) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		int res = mapper.esOrderInsert(vo);
		
		return res;
	}
	
	@Override
	public int esOrderDelete (int ESTIMATE_NUM) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		int res = mapper.esOrderDelete(ESTIMATE_NUM);
		
		return res;
	}
	
	@Override 
	public int esOrderCount (HashMap<String, Object> map) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		int cnt = mapper.esOrderCount(map);
		
		return cnt;
	}

	/* !----- 공방 회원 : 견적 제안 댓글 리스트 -----! */
	
	@Override
	public ArrayList<HashMap <String, Object>> workOfferList (HashMap<String, Object> map) {
		EstimateMapper mapper = sqlSession.getMapper(EstimateMapper.class);
		
		ArrayList<HashMap <String, Object>> woList = mapper.workOfferList(map);
		System.out.println("woList size : " + woList.size());
		
		return woList;
	}
}
