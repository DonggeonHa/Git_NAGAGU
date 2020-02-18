package com.spring.workshop;

public interface WorkShopMemberService {
	public int insert_workshop_member(WorkShopMemberVO workshopVO);
	public int workshop_user_chk(WorkShopMemberVO workshopVO);
	public int workshop_name_chk(WorkShopMemberVO workshopVO);
	public int workshop_email_chk(WorkShopMemberVO workshopVO);
	public WorkShopMemberVO select_workshop_member(WorkShopMemberVO workshopVO);
	public WorkShopMemberVO selectwmember(WorkShopMemberVO workshopVO);
	
	/* 회원 탈퇴 */
	public int deleteWMember(WorkShopMemberVO workshopVO);
	public int duplicateWMember(WorkShopMemberVO workshopVO);
	public int sysdateWMember(WorkShopMemberVO workshopVO);
}
