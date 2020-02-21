package com.spring.mapper;

import com.spring.workshop.WorkShopMemberVO;

public interface WorkShopMemberMapper {
	int insert_workshop_member(WorkShopMemberVO workshopVO);
	WorkShopMemberVO workshop_user_chk(WorkShopMemberVO workshopVO);
	int workshop_status_chk(WorkShopMemberVO workshopVO);
	WorkShopMemberVO workshop_name_chk(WorkShopMemberVO workshopVO);
	WorkShopMemberVO workshop_email_chk(WorkShopMemberVO workshopVO);
	WorkShopMemberVO select_workshop_member(WorkShopMemberVO workshopVO);
	WorkShopMemberVO selectwmember(WorkShopMemberVO workshopVO);
	int name_cnt(String WORKSHOP_NAME);
	WorkShopMemberVO selectByName (String WORKSHOP_NAME);
	
	/* 회원 탈퇴 */
	int deleteWMember(WorkShopMemberVO workshopVO);
	int duplicateWMember(WorkShopMemberVO workshopVO);
	int sysdateWMember(WorkShopMemberVO workshopVO);
	
}
