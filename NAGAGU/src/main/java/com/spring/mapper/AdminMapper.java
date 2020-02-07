package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.admin.AdminMemberVO;
import com.spring.member.MemberVO;
import com.spring.workshop.WorkShopMemberVO;

public interface AdminMapper {
	int insert_admin(AdminMemberVO adminVO);		//회원가입
	AdminMemberVO user_chk(AdminMemberVO adminVO);		//로그인

	
	/* 일반회원관리 */
	int memberListCount();
	List<MemberVO> getMembers();
	int deleteMember(MemberVO vo);
	
	/* 공방회원관리 */
	int WmemberListCount();
	ArrayList<WorkShopMemberVO> getWMembers(@Param("startrow") int startrow, @Param("endrow") int endrow);
	void deleteWMember(WorkShopMemberVO vo);
	void updateStatus(WorkShopMemberVO vo);

}
