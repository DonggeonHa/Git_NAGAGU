package com.spring.academy;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.AcademyMapper;
import com.spring.mapper.memberMapper;
import com.spring.member.MemberVO;

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
	public MemberVO selectMember(ClassVO academy) {
		MemberVO member = null;
		
		try {
			AcademyMapper memberMapper = sqlSession.getMapper(AcademyMapper.class);
			member = memberMapper.selectMember(academy);
			
			System.out.println("멤버 리스트 가져오기 성공!");
			return member;
		} catch (Exception e) {
			System.out.println("멤버 리스트 가져오기 실패!" + e.getMessage());
		}
		return null;
		
	}
}
