package com.spring.admin;

import java.util.ArrayList;

import com.spring.member.MemberVO;
import com.spring.workshop.WorkShopMemberVO;

public interface AdminService {
	public int insert_admin(AdminMemberVO memberVO); //회원 가입 후 넣기
	public int user_chk(AdminMemberVO adminVO);
	
	/* 일반회원관리 */
	public int memberListCount();
	public ArrayList<MemberVO> getMembers(int startrow, int endrow);
	public int deleteMember(MemberVO vo);
	
	/* 공방회원관리 */
	public int WmemberListCount();
	public ArrayList<WorkShopMemberVO> getWMembers(int startrow, int endrow);
	public void deleteWMember(WorkShopMemberVO vo);
	public void updateStatus(WorkShopMemberVO vo);
}
