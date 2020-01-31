package com.spring.member;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.community.LikeVO;
import com.spring.community.PicsVO;
import com.spring.mapper.MemberLikeMapper;
import com.spring.mapper.memberMapper;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int email_chk(MemberVO memberVO) {
		MemberVO member_email = null;
		int res = -1;

		try {
			memberMapper memberMapper = sqlSession.getMapper(memberMapper.class);
			System.out.println(memberVO.getMEMBER_EMAIL());

			member_email = memberMapper.email_chk(memberVO);
			System.out.println("mapper값: " + member_email);
			
			if (member_email != null) {
				res = 1; // 이메일 중복.

			} else { // 이메일 중복체크 했을 때 중복되지 않는 값
				res = 0; // 이메일이 없는것

			}
			System.out.println(res);
		} catch (Exception e) {
			System.out.println("이메일 중복 확인 실패." + e.getMessage());
		}
		return res;
	}

	@Override
	public int nickname_chk(MemberVO memberVO) {
		MemberVO member_nickname = null;
		int res = -1;

		try {
			memberMapper memberMapper = sqlSession.getMapper(memberMapper.class);
			System.out.println(memberVO.getMEMBER_NICK());

			member_nickname = memberMapper.nickname_chk(memberVO);

			if (member_nickname != null) {
				res = 1; // 닉네임 중복.

			} else { // 닉네임 중복체크 했을 때 중복되지 않는 값
				res = 0; // 닉네임이 없는것

			}
			System.out.println(res);
		} catch (Exception e) {
			System.out.println("닉네임 중복 확인 실패." + e.getMessage());
		}
		return res;
	}

	@Override
	public int emailLink_chk(MemberVO memberVO) {
		
		int res = 0;	//회원상태 결과값을 받아오는 변수

		try {
			memberMapper memberMapper = sqlSession.getMapper(memberMapper.class);
			System.out.println(memberVO.getMEMBER_EMAIL());

			res = memberMapper.emailLink_chk(memberVO);	//업데이트한 결과 값을 받아옴

			System.out.println(res);
		} catch (Exception e) {
			System.out.println("회원 상태 업데이트 실패." + e.getMessage());
		}
		return res;
	}

	@Override
	public int insert_member(MemberVO memberVO) {
		int res = 0;
		
		try {
			memberMapper memberMapper = sqlSession.getMapper(memberMapper.class);
			memberVO.setMEMBER_PICTURE("./resources/images/main_1.jpg");
			res = memberMapper.insert_member(memberVO);
		} catch (Exception e) {
			System.out.println("회원 정보 입력 실패!" + e.getMessage());
		}
		
		return res;
	}

	@Override
	public int insert_sns_member(MemberVO memberVO) {
		int res = 0;
		
		try {
			memberMapper memberMapper = sqlSession.getMapper(memberMapper.class);
			res = memberMapper.insert_sns_member(memberVO);
		} catch (Exception e) {
			System.out.println("sns 회원가입 실패!" + e.getMessage());
		}
		
		return res;
	}
	
	@Override
	public int user_chk(MemberVO memberVO) {
		MemberVO member_chk = null;
		String get_mapper_member_email, get_mapper_member_pass = null;
		String email, pass = null;
		int status_chk = 0;
		int result = -1;	//이메일 비번이 틀렸을 경우 결과값
		
		try {
			memberMapper memberMapper = sqlSession.getMapper(memberMapper.class);
			member_chk = memberMapper.user_chk(memberVO);	//이메일 비번 체크
			System.out.println("캐스트 오류:" + member_chk);
			
			get_mapper_member_email = member_chk.getMEMBER_EMAIL();
			get_mapper_member_pass = member_chk.getMEMBER_PASS();
			email = memberVO.getMEMBER_EMAIL();
			pass = memberVO.getMEMBER_PASS();
			
			//이메일, 비밀번호 같을 경우
			if(get_mapper_member_email.equals(email) && get_mapper_member_pass.equals(pass)) {
				status_chk = memberMapper.member_status_chk(memberVO);	//이메일 인증 확인 여부
				System.out.println("상태정보: " + status_chk);
				
				if(status_chk == 1) {	//이메일 인증(완료)
					result = 1;
				}else {	//이메일,비번은 맞지만 이메일 미인증일 때
					result = 0;
				}
			}
			
		} catch (Exception e) {
			System.out.println("로그인 실패!" + e.getMessage());
		}
		
		return result;	//결과값이 1,0,-1
	}

	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		MemberVO member = null;
		
		try {
			memberMapper memberMapper = sqlSession.getMapper(memberMapper.class);
			member = memberMapper.selectMember(memberVO);
			
			return member;
		} catch (Exception e) {
			System.out.println("멤버 리스트 가져오기 실패!" + e.getMessage());
		}
		return null;
		
	}
	
	@Override
	public ArrayList<MemberVO> get_nick_list() {
		try {
			memberMapper memberMapper = sqlSession.getMapper(memberMapper.class);
			ArrayList<MemberVO> nickList = memberMapper.nick_list();
			
			return nickList;
		} catch (Exception e) {
			System.out.println("닉네임 리스트 가져오기 실패!" + e.getMessage());
		}
		return null;
		
	}
	
	

	@Override
	public ArrayList<MemberVO> getMemberList(HashMap<String, Object> map) {
		ArrayList<MemberVO> MemberList = null;
		try {
			memberMapper memberMapper= sqlSession.getMapper(memberMapper.class);
			MemberList = memberMapper.getMemberList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return MemberList;
	}
	@Override
	public MemberVO getMemberDetail(MemberVO memberVO) {
		MemberVO vo = null;
		try {
			memberMapper memberMapper= sqlSession.getMapper(memberMapper.class);
			vo = memberMapper.getMemberDetail(memberVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	@Override
	public MemberVO getMemberDetailbyEmail(MemberVO memberVO) {
		MemberVO vo = null;
		try {
			memberMapper memberMapper= sqlSession.getMapper(memberMapper.class);
			vo = memberMapper.getMemberDetailbyEmail(memberVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	@Override 
	public ArrayList<LikeVO> getMemberLikePics(MemberVO memberVO) {
		ArrayList<LikeVO> vo = null;
		try {
			MemberLikeMapper memberlikeMapper=sqlSession.getMapper(MemberLikeMapper.class);
			//memberMapper memberMapper= sqlSession.getMapper(memberMapper.class);
			vo = memberlikeMapper.getMemberLikePics(memberVO);
			System.out.println("RESULT="+vo);
		} catch (Exception e) {
			e.printStackTrace();
		}  
		return vo;
	}

}
