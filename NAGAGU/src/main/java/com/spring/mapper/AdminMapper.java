package com.spring.mapper;

import java.util.List;

import com.spring.admin.AdminMemberVO;
import com.spring.community.PicsVO;
import com.spring.member.MemberVO;
import com.spring.workshop.WorkShopMemberVO;

public interface AdminMapper {
	int insert_admin(AdminMemberVO adminVO);		//회원가입
	AdminMemberVO user_chk(AdminMemberVO adminVO);		//로그인

	/* 일반회원관리 */
	List<MemberVO> getMembers();
	int deleteMember(MemberVO vo);
	
	/* 공방회원관리 */
	List<WorkShopMemberVO> getWMembers();
	int deleteWMember(WorkShopMemberVO vo);
	int updateWMember(WorkShopMemberVO vo);
	
	/* 커뮤니티관리*/
	List<PicsVO> getPICS();
	int deletePICS(PicsVO vo);

}
