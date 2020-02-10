package com.spring.admin;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.community.PicsVO;
import com.spring.mapper.AdminMapper;
import com.spring.member.MemberVO;
import com.spring.workshop.WorkShopMemberVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSession sqlSession;
	
	/*============================= 어드민 ===============================*/
	@Override
	public int insert_admin(AdminMemberVO adminVO) {
		int res = 0;
		
		try {
			AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
			res = adminMapper.insert_admin(adminVO);
		} catch (Exception e) {
			System.out.println("회원 정보 입력 실패!" + e.getMessage());
		}
		
		return res;
	}

	@Override
	public int user_chk(AdminMemberVO adminVO) {
		AdminMemberVO admin_chk = null;
		String get_mapper_admin_id, get_mapper_admin_pass = null;
		String id, pass = null;
		int result = -1;	//아이디 비번이 틀렸을 경우 결과값
		
		try {
			AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
			admin_chk = adminMapper.user_chk(adminVO);	//이메일 비번 체크
			
			get_mapper_admin_id = admin_chk.getADMIN_ID();
			get_mapper_admin_pass = admin_chk.getADMIN_PASS();
			id = adminVO.getADMIN_ID();
			pass = adminVO.getADMIN_PASS();
			
			System.out.println("admin id : " + get_mapper_admin_id);
			System.out.println("admin pass : " + get_mapper_admin_pass);
			System.out.println("id : " + id);
			System.out.println("pass : " + pass);
			
			//아이디, 비밀번호 같을 경우
			if(get_mapper_admin_id.equals(id) && get_mapper_admin_pass.equals(pass)) {
				result = 1;
			}
			
			System.out.println("result : " + result);
		} catch (Exception e) {
			System.out.println("로그인 실패!" + e.getMessage());
		}
		
		return result;	//결과값이 1,0,-1
	}

	/* ================================= 일반회원관리 ======================================*/
	@Override
	public List<MemberVO> getMembers() {
		List<MemberVO> memberList = null;
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		memberList = adminMapper.getMembers();
		
		return memberList;
	}

	@Override
	public int deleteMember(MemberVO vo) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int res = adminMapper.deleteMember(vo);
		
		return res;
		
	}
	
	/* ================================= 공방회원관리 ======================================*/
	@Override
	public List<WorkShopMemberVO> getWMembers() {
		List<WorkShopMemberVO> wmemberList = new ArrayList<WorkShopMemberVO>();
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		wmemberList = adminMapper.getWMembers();
		
		return wmemberList;
	}

	@Override
	public int deleteWMember(WorkShopMemberVO vo) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int res = adminMapper.deleteWMember(vo);
		
		return res;
	}

	@Override
	public int updateWMember(WorkShopMemberVO vo) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int res = adminMapper.updateWMember(vo);
		
		return res;
	}

	/* ================================= 커뮤니티관리 ======================================*/
	@Override
	public List<PicsVO> getPICS() {
		List<PicsVO> picsList = new ArrayList<PicsVO>();
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		picsList = adminMapper.getPICS();
		
		return picsList;
	}

	@Override
	public int deletePICS(PicsVO vo) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int res = adminMapper.deletePICS(vo);
		
		return res;
	}
}
