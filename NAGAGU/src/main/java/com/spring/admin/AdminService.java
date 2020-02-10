package com.spring.admin;

import java.util.List;

import com.spring.community.PicsVO;
import com.spring.member.MemberVO;
import com.spring.workshop.WorkShopMemberVO;

public interface AdminService {
	public int insert_admin(AdminMemberVO memberVO); //회원 가입 후 넣기
	public int user_chk(AdminMemberVO adminVO);
	
	/* 일반회원관리 */
	public List<MemberVO> getMembers();
	public int deleteMember(MemberVO vo);
	
	/* 공방회원관리 */
	public List<WorkShopMemberVO> getWMembers();
	public int deleteWMember(WorkShopMemberVO vo);
	public int updateWMember(WorkShopMemberVO vo);
	
	/* 커뮤니티관리 */
	public List<PicsVO> getPICS();
	public int deletePICS(PicsVO vo);
}
