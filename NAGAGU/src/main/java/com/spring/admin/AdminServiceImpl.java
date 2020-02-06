package com.spring.admin;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.AdminMapper;
import com.spring.workshop.WorkShopMemberVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSession sqlSession;
	
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

	/* 공방회원승인 */
	@Override
	public ArrayList<WorkShopMemberVO> getWMembers(int startrow, int endrow) {
		ArrayList<WorkShopMemberVO> wmemberList = new ArrayList<WorkShopMemberVO>();
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		
		wmemberList = adminMapper.getWMembers(startrow, endrow);
		
		return wmemberList;
	}

	@Override
	public WorkShopMemberVO getWMember(WorkShopMemberVO vo) {
		WorkShopMemberVO member = new WorkShopMemberVO();
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		
		member = adminMapper.getWMember(vo);
		System.out.println("getWMember 넘어감");
		
		return member;
	}

	@Override
	public void deleteWMember(WorkShopMemberVO vo) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		adminMapper.deleteWMember(vo);
	}

	@Override
	public void updateStatus(WorkShopMemberVO vo) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		adminMapper.updateStatus(vo);
	}

	@Override
	public int getListCount() {
		int x = 0;
		int result = 0;
		
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		result = adminMapper.getListCount();
		
		if (result != 0)
			x = result;
		
		return x;
	}
}
