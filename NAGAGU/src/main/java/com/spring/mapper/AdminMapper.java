package com.spring.mapper;

import com.spring.admin.AdminMemberVO;

public interface AdminMapper {
	int insert_admin(AdminMemberVO memberVO);		//회원가입
	AdminMemberVO user_chk(AdminMemberVO adminVO);		//로그인

	

}
