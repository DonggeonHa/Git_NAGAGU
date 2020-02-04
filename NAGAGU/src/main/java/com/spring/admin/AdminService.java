package com.spring.admin;

public interface AdminService {
	public int insert_admin(AdminMemberVO memberVO); //회원 가입 후 넣기
	public int user_chk(AdminMemberVO adminVO);
}
