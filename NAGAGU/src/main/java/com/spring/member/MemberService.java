package com.spring.member;

import java.util.ArrayList;
import java.util.HashMap;

public interface MemberService {
	public int email_chk(MemberVO memberVO);
	public int nickname_chk(MemberVO memberVO);
	public int emailLink_chk(MemberVO memberVO);	//이메일 인증
	public int insert_member(MemberVO memberVO); //회원 가입 후 넣기
	public int insert_sns_member(MemberVO memberVO);	//sns회원가입
	public int user_chk(MemberVO memberVO);
	public ArrayList<MemberVO> get_nick_list();
	
	ArrayList<MemberVO> getMemberList(HashMap<String, Object> map);
	MemberVO getMemberDetail(MemberVO memberVO);
}
