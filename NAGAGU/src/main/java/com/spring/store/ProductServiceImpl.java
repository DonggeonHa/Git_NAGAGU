package com.spring.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.community.PicsVO;
import com.spring.mapper.AcademyMapper;
import com.spring.mapper.CommunityMapper;
import com.spring.mapper.ProductMapper;
import com.spring.member.MemberVO;
import com.spring.workshop.WorkshopVO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public WorkshopVO selectWorkshop(ProductVO vo) {
		WorkshopVO workshop = null;
		
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
		ProductVO productVO;
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
	public ArrayList<ProductVO> getMemberLikeProduct(HashMap<String, Object> map) {
		ArrayList<ProductVO> vo = null; 
		try { 
			ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
			//memberMapper memberMapper= sqlSession.getMapper(memberMapper.class);
			vo = productMapper.getMemberLikeProduct(map);
			System.out.println("RESULT="+vo);
		} catch (Exception e) {
			e.printStackTrace();
		}  
		return vo;
	}




	








	
}
