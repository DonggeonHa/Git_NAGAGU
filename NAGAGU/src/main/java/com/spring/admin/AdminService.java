package com.spring.admin;

import java.util.ArrayList;

import com.spring.workshop.WorkShopMemberVO;

public interface AdminService {
	public int insert_admin(AdminMemberVO memberVO); //회원 가입 후 넣기
	public int user_chk(AdminMemberVO adminVO);
	
	/* 공방회원가입 등급신청용 */
	public int getListCount();
	public ArrayList<WorkShopMemberVO> getWMembers(int page, int limit);
	public WorkShopMemberVO getWMember(WorkShopMemberVO vo);
	public void deleteWMember(WorkShopMemberVO vo);
	public void updateStatus(WorkShopMemberVO vo);
}
