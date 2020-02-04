package com.spring.workshop;

public interface WorkShopMemberService {
	public int insert_workshop_member(WorkShopMemberVO workshopVO);
	public int workshop_user_chk(WorkShopMemberVO workshopVO);
	public int workshop_name_chk(WorkShopMemberVO workshopVO);
	public int workshop_email_chk(WorkShopMemberVO workshopVO);
	public WorkShopMemberVO select_workshop_member(WorkShopMemberVO workshopVO);
	public WorkShopMemberVO selectwmember(WorkShopMemberVO workshopVO);
}
