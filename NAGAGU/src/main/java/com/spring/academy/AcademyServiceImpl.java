package com.spring.academy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.AcademyMapper;
import com.spring.mapper.ChartMapper;
import com.spring.mapper.ProductMapper;
import com.spring.store.ProductVO;
import com.spring.workshop.WorkShopMemberVO;

@Service
public class AcademyServiceImpl implements AcademyService {

	@Autowired
	private SqlSession sqlSession; // Mybatis(ibatis) 라이브러리가 제공하는 클래스
	
	@Override
	public ArrayList<ClassVO> getClassList(HashMap<String, Object> map) {
		ArrayList<ClassVO> classList = null;
		AcademyMapper classMapper = sqlSession.getMapper(AcademyMapper.class); 
		classList = classMapper.getClassList(map); 
		
		return classList;
	}

	@Override
	public boolean insertClass(ClassVO academy) {
		int result = 0;
		
		AcademyMapper classMapper = sqlSession.getMapper(AcademyMapper.class);
		result = classMapper.insertClass(academy); // 삽입후 삽입한 결과 상태 반환하기 위해 반환값을 int로 정해줌
		System.out.println("result = " + result);
		
		if(result == 0)
			return false;
		
		return true;
	}
	
	@Override
	public int getCount(HashMap<String, Object> map) {
		int count;
		
		AcademyMapper classMapper = sqlSession.getMapper(AcademyMapper.class);
		count = classMapper.getCount(map);
		
		return count;
	}

	@Override
	public ClassVO getDetail(ClassVO academy) throws Exception {
		ClassVO vo = null;
		
		AcademyMapper classMapper = sqlSession.getMapper(AcademyMapper.class);
		vo = classMapper.getDetail(academy);
			
		return vo;
	}
	
	@Override
	public WorkShopMemberVO selectWMember(ClassVO academy) throws Exception {
		WorkShopMemberVO member = null;
		
		try {
			AcademyMapper classMapper = sqlSession.getMapper(AcademyMapper.class);
			member = classMapper.selectWMember(academy);
			
			System.out.println("멤버 리스트 가져오기 성공!");
			return member;
		} catch (Exception e) {
			System.out.println("멤버 리스트 가져오기 실패!" + e.getMessage());
		}
		return null;
	}
	
	@Override
	public int countUp(ClassVO academy) {
		int count;
		
		AcademyMapper classMapper = sqlSession.getMapper(AcademyMapper.class);
		count = classMapper.countUp(academy);
		
		return count;
	}
	
	@Override
	public boolean insertClassInfo(MyClassVO vo) {
		int result = 0;
		
		AcademyMapper classMapper = sqlSession.getMapper(AcademyMapper.class);
		result = classMapper.insertClassInfo(vo); // 삽입후 삽입한 결과 상태 반환하기 위해 반환값을 int로 정해줌
		System.out.println("result = " + result);
		
		if(result == 0)
			return false;
		
		return true;
	}

	@Override
	public ArrayList<Map<String, Object>> getLoginMemberClass(HashMap<String, Object> map) {
		ArrayList<Map<String, Object>> classList =null;
		AcademyMapper classMapper = sqlSession.getMapper(AcademyMapper.class);
		classList= classMapper.getLoginMemberClass(map);
		System.out.println("getLoginMemberClass Impl결과="+classList);
		return classList;
	}

	@Override
	public ArrayList<ClassVO> getClassListOfMember(HashMap<String, Object> map) throws Exception {
		ArrayList<ClassVO> classList = null;
		AcademyMapper classMapper = sqlSession.getMapper(AcademyMapper.class); 
		classList = classMapper.getClassListOfMember(map); 
		
		return classList;
	}

	@Override
	public int updateGrade(ClassVO vo) {
		int res;
		AcademyMapper classMapper = sqlSession.getMapper(AcademyMapper.class); 
		res = classMapper.updateGrade(vo);
		return res;
	}

	@Override
	public ArrayList<ClassVO> myClassList(int WORKSHOP_NUM) throws Exception{
		ArrayList<ClassVO> myClassList = null;
		
		try {
			ChartMapper chartMapper = sqlSession.getMapper(ChartMapper.class);
			
			myClassList = chartMapper.myClassList(WORKSHOP_NUM);
		} catch (Exception e) {
			throw new Exception("chart 인기 class impl 에러", e);
		}
		
		return myClassList;
	}

	@Override
	public ArrayList<ProductVO> productSellList(int WORKSHOP_NUM) throws Exception{
		ArrayList<ProductVO> productSellList = null;
		
		try {
			ChartMapper chartMapper = sqlSession.getMapper(ChartMapper.class);
			
			productSellList = chartMapper.productSellList(WORKSHOP_NUM);
		} catch (Exception e) {
			throw new Exception("chart 인기 상품 impl 에러", e);
		}
		
		return productSellList;
	}

}
