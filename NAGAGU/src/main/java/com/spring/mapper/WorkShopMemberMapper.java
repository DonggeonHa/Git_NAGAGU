package com.spring.mapper;

import java.util.ArrayList;

import com.spring.workshop.WorkShopMemberVO;
import com.spring.workshop.WorkshopVO;

public interface WorkShopMemberMapper {
	int insert_workshop_member(WorkShopMemberVO workshopVO);
	WorkShopMemberVO workshop_user_chk(WorkShopMemberVO workshopVO);
	int workshop_status_chk(WorkShopMemberVO workshopVO);
	WorkShopMemberVO workshop_name_chk(WorkShopMemberVO workshopVO);
	WorkShopMemberVO workshop_email_chk(WorkShopMemberVO workshopVO);
	WorkShopMemberVO select_workshop_member(WorkShopMemberVO workshopVO);
	WorkShopMemberVO selectwmember(WorkShopMemberVO workshopVO);
	int name_cnt(String WORKSHOP_NAME);
	
	/* 경태 */
	ArrayList<WorkshopVO> getClassList(WorkShopMemberVO workshopVO);
}
