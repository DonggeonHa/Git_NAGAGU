package com.spring.store;

import java.util.ArrayList;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MemberLikeMapper;
import com.spring.mapper.ProductMapper;
import com.spring.order.ProductOrderVO;
import com.spring.workshop.WorkShopMemberVO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public WorkShopMemberVO selectWorkshop(ProductVO vo) {
		WorkShopMemberVO workshop = null;
		try {
			ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
			workshop = productMapper.selectWorkshop(vo);
			
			System.out.println("공방 정보 가져오기 성공!");
			return workshop;
		} catch (Exception e) {
			System.out.println("공방 정보 가져오기 실패!" + e.getMessage());
		}
		return null;
		
	}
	
	@Override
	public ArrayList<ProductVO> getAllWorkshopProduct(int WORKSHOP_NUM) {
		ArrayList<ProductVO> WorkshopProoductList = null;
		try {
			ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
			WorkshopProoductList = productMapper.getAllWorkshopProduct(WORKSHOP_NUM);
			
			System.out.println("공방의 productList 가져오기 성공!");
			return WorkshopProoductList;
		} catch (Exception e) {
			System.out.println("공방의 productList 가져오기 실패!" + e.getMessage());
		}
		return null;
	}
	
	
	@Override
	public boolean insertProduct(ProductVO vo) {
		int result = 0;
		
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		result = productMapper.insertProduct(vo); // 삽입후 삽입한 결과 상태 반환하기 위해 반환값을 int로 정해줌
		System.out.println("result = " + result);
		
		if(result == 0)
			return false;
		
		return true;
	}
	

	@Override
	public int getproductcount(HashMap<String, Object> map) {
		int productcount;
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		productcount = productMapper.getproductcount(map);
		return productcount;
	}

	@Override
	public ArrayList<ProductVO> getproductlist(HashMap<String, Object> map) {
		ArrayList<ProductVO> productList = null;
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		productList = productMapper.getproductlist(map);
		return productList;
	}

	
	@Override
	public ProductVO getproductVO(int PRODUCT_NUM) {
		ProductVO productVO = null;
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		productVO = productMapper.getproductVO(PRODUCT_NUM);
		return productVO;
	}


	@Override
	public int updateReadCount(int PRODUCT_NUM) {
		int res;
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		res = productMapper.updateReadCount(PRODUCT_NUM);
		return res;
	}


	@Override
	public int updateGrade(ProductVO vo) {
		int res;
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		res = productMapper.updateGrade(vo);
		return res;
	}

	@Override
	public HashMap<String, Object> insertProductLike(HashMap<String, Object> map){
		HashMap<String, Object> returnInfo = new HashMap<String, Object>();
		int productLikeCount = 0;
		int cnt = 0;
		try {
			ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
			MemberLikeMapper memberlikeMapper=sqlSession.getMapper(MemberLikeMapper.class);
			
			cnt = memberlikeMapper.selectMemberLike(map);
			System.out.println("cnt="+cnt);
			if(cnt==0) {	
				memberlikeMapper.insertMemberLike(map);
				map.put("count","plus");
				System.out.println("사진 좋아요 1증가=");
			}else {
				memberlikeMapper.deleteMemberLike(map);
				map.put("count", "minus");
				System.out.println("사진 좋아요 1감소=");
			}
			ProductVO productVO = new ProductVO();
			productVO.setPRODUCT_NUM(Integer.valueOf((String)map.get("PRODUCT_NUM")));
			int res = productMapper.updateProductLike(map);//count가 plus면 1증가  minus면 1 감소
			
//			productLikeCount = productVO.getPRODUCT_LIKE();
//			returnInfo.put("productLikeCount", productLikeCount);
			returnInfo.put("cnt", cnt);	//0이면 insert했다
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnInfo;
	}


	@Override
	public int getProductLike(HashMap<String, Object> map) {
		int status=-1; 
		try { 
			ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
			//memberMapper memberMapper= sqlSession.getMapper(memberMapper.class);
			status = productMapper.getProductLike(map);
			System.out.println("RESULT="+status);
		} catch (Exception e) {
			e.printStackTrace();
		}  
		return status;
	}

	@Override
	public ArrayList<ProductVO> getMemberLikeProduct(HashMap<String, Object> map) {
		ArrayList<ProductVO> vo = null; 
		try { 
			ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
			vo = productMapper.getMemberLikeProduct(map);
			System.out.println("getMemberLikeProduct RESULT="+vo);
		} catch (Exception e) {
			e.printStackTrace();
		}  
		return vo;
	}

	@Override
	public int updateSales(HashMap<String, Object> map) {
		int res;
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);

		res = productMapper.updateSales(map);
		return res;
	}












	
}
