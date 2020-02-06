package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.admin.AdminMemberVO;
import com.spring.workshop.WorkShopMemberVO;

public interface AdminMapper {
	int insert_admin(AdminMemberVO adminVO);		//회원가입
	AdminMemberVO user_chk(AdminMemberVO adminVO);		//로그인

	/* 공방회원가입 등급신청용 */
	int getListCount();
	ArrayList<WorkShopMemberVO> getWMembers(@Param("startrow") int startrow, @Param("endrow") int endrow);
	WorkShopMemberVO getWMember(WorkShopMemberVO vo);
	void deleteWMember(WorkShopMemberVO vo);
	void updateStatus(WorkShopMemberVO vo);

}
