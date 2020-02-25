package com.spring.workshop;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.WorkShopMemberMapper;
import com.spring.mapper.memberMapper;

@Service("workShopMemberService")
public class WorkShopMemberServiceImpl implements WorkShopMemberService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insert_workshop_member(WorkShopMemberVO workshopVO) {
		int res = 0;
		
		try {
			WorkShopMemberMapper workshopMapper = sqlSession.getMapper(WorkShopMemberMapper.class);
			workshopVO.setWORKSHOP_PICTURE("./resources/images/Mypage/Basic_Picture.png");
			res = workshopMapper.insert_workshop_member(workshopVO);
			
		} catch (Exception e) {
			System.out.println("공방 회원 정보 입력 실패!" + e.getMessage());
		}
		return res;
	}

	@Override
	public int workshop_user_chk(WorkShopMemberVO workshopVO) {
		WorkShopMemberVO workshop_chk = null;
		String get_workshop_member_email, get_workshop_member_pass = null;
		String email, pass = null;
		int workshop_status = 0;
		int result = -1;
		
		try {
			WorkShopMemberMapper workshopMapper = sqlSession.getMapper(WorkShopMemberMapper.class);
			workshop_chk = workshopMapper.workshop_user_chk(workshopVO);
			
			get_workshop_member_email = workshop_chk.getWORKSHOP_EMAIL();
			get_workshop_member_pass = workshop_chk.getWORKSHOP_PASS();
			
			email = workshopVO.getWORKSHOP_EMAIL();
			pass = workshopVO.getWORKSHOP_PASS();
			
			//이메일, 비밀번호 같을 경우
			if(get_workshop_member_email.equals(email) && get_workshop_member_pass.equals(pass)) {
				workshop_status = workshopMapper.workshop_status_chk(workshopVO);	//이메일 인증 확인 여부
				System.out.println("공방 상태정보: " + workshop_status);
				
				if(workshop_status != 0) {	//이메일 인증(완료)
					result = 1;
				}else {	//이메일,비번은 맞지만 이메일 미인증일 때
					result = 0;
				}
			}
		} catch (Exception e) {
			System.out.println("공방 로그인 실패!" + e.getMessage());
		}
		
		return result;	//결과값이 1,0,-1
	}

	@Override
	public int workshop_email_chk(WorkShopMemberVO workshopVO) {
		WorkShopMemberVO workshop_email = null;
		int res = -1;
		
		try {
			WorkShopMemberMapper workshopMapper = sqlSession.getMapper(WorkShopMemberMapper.class);
			
			workshop_email = workshopMapper.workshop_email_chk(workshopVO);
			
			if(workshop_email != null) {
				res = 1;	//이메일 중복
			} else {
				res = 0;
			}
		} catch (Exception e) {
			System.out.println("공방 회원 이메일 중복 확인 실패." + e.getMessage());
		}
		
		return res;
	}

	@Override
	public int workshop_name_chk(WorkShopMemberVO workshopVO) {
		WorkShopMemberVO workshop_name = null;
		int res = -1;
		
		try {
			WorkShopMemberMapper workshopMapper = sqlSession.getMapper(WorkShopMemberMapper.class);
			
			workshop_name = workshopMapper.workshop_name_chk(workshopVO);
			
			if(workshop_name != null) {
				res = 1;	//공방이름 중복
			} else {
				res = 0;
			}
		} catch (Exception e) {
			System.out.println("공방 회원 이름 중복 확인 실패." + e.getMessage());
		}
		
		return res;
	}

	@Override
	public WorkShopMemberVO select_workshop_member(WorkShopMemberVO workshopVO) {
		WorkShopMemberVO workshopMember = null;
		
		try {
			WorkShopMemberMapper workshopMapper = sqlSession.getMapper(WorkShopMemberMapper.class);
			
			workshopMember = workshopMapper.select_workshop_member(workshopVO);
			
			return workshopMember;
		} catch (Exception e) {
			System.out.println("공방회원 가져오기 실패!" + e.getMessage());
		}
		
		return null;
	}

	@Override
	public WorkShopMemberVO selectwmember(WorkShopMemberVO workshopVO) {
		WorkShopMemberVO workshopMember = null;
		
		try {
			WorkShopMemberMapper workshopMapper = sqlSession.getMapper(WorkShopMemberMapper.class);
			
			workshopMember = workshopMapper.selectwmember(workshopVO);
			
			return workshopMember;
		} catch (Exception e) {
			System.out.println("공방회원 가져오기 실패! num" + e.getMessage());
		}
		
		return null;
	}

	@Override
	public int deleteWMember(WorkShopMemberVO workshopVO) {
		int res = 0;
		
		try {
			WorkShopMemberMapper workshopMapper = sqlSession.getMapper(WorkShopMemberMapper.class);
			res = workshopMapper.deleteWMember(workshopVO);
		} catch (Exception e) {
			System.out.println("공방멤버 삭제 실패!" + e.getMessage());
		}
		
		return res;
	}

	@Override
	public int duplicateWMember(WorkShopMemberVO workshopVO) {
		int res = 0;
		
		try {
			WorkShopMemberMapper workshopMapper = sqlSession.getMapper(WorkShopMemberMapper.class);
			res = workshopMapper.duplicateWMember(workshopVO);
		} catch (Exception e) {
			System.out.println("공방멤버 이동 실패!" + e.getMessage());
		}
		
		return res;
	}

	@Override
	public int sysdateWMember(WorkShopMemberVO workshopVO)  {
		int res = 0;
	
		try {
			WorkShopMemberMapper workshopMapper = sqlSession.getMapper(WorkShopMemberMapper.class);
			res = workshopMapper.sysdateWMember(workshopVO);
		} catch (Exception e) {
			System.out.println("SYSDATE 추가 실패" + e.getMessage());
		}
		
		return res;
	}
	
	/* 기재 */
	
	@Override
	public WorkShopMemberVO selectByName (String WORKSHOP_NAME) {
		WorkShopMemberMapper workshopMapper = sqlSession.getMapper(WorkShopMemberMapper.class);
		WorkShopMemberVO wsvo = workshopMapper.selectByName(WORKSHOP_NAME);
		
		return wsvo;
	}
}
