package com.spring.mypage;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.CommunityMapper;
import com.spring.mapper.MypageMemberMapper;
import com.spring.mapper.ProductMapper;
import com.spring.member.MemberVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int editMember(MemberVO memberVO) {
		int res = 0;
		
		try {
			MypageMemberMapper mypageMemberMapper = sqlSession.getMapper(MypageMemberMapper.class);
			System.out.println(memberVO.getADDRESS_ADDRESS1());
			System.out.println(memberVO.getADDRESS_ADDRESS2());
			System.out.println(memberVO.getADDRESS_ZIP());
			System.out.println(memberVO.getMEMBER_EMAIL());
			System.out.println(memberVO.getMEMBER_NAME());
			System.out.println(memberVO.getMEMBER_NICK());
			System.out.println(memberVO.getMEMBER_PICTURE());
			System.out.println(memberVO.getMEMBER_PHONE());
			
			res = mypageMemberMapper.edit_member(memberVO);
			
			System.out.println("회원정보 수정 결과는: " + res);
		} catch(Exception e) {
			System.out.println("회원정보 수정 실패" + e.getMessage());
		}
		
		return res;
	}

}
