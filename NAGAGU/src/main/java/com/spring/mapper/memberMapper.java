package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.spring.member.MemberVO;
import com.spring.workshop.WorkShopMemberVO;

public interface memberMapper {
	MemberVO nickname_chk(MemberVO memberVO);	//별명 중복체크
	MemberVO email_chk(MemberVO memberVO);		//이메일 중복체크, 이메일 가지고 사용자 정보 가져오기
	int emailLink_chk(MemberVO memberVO);		//이메일 인증
	int insert_member(MemberVO memberVO);		//회원가입
	int insert_sns_member(MemberVO memberVO);	//sns회원가입
	MemberVO user_chk(MemberVO memberVO);		//로그인
	int member_status_chk(MemberVO memberVO);	//로그인 시 이메일 인증 여부 확인
	ArrayList<MemberVO> nick_list();
	MemberVO selectMember(MemberVO memberVO); // 로그인 시 세션에 넣을 Member_NUM 호출
	int findMemberPW(MemberVO memberVO);	//비밀번호 찾기
	int updateMemberPW(MemberVO memberVO);
	int lastPwUpdate(@Param("pass1") String pass1, @Param("member_email") String member_email);
	MemberVO findMemberEmail(MemberVO memberVO);
	
	/* 경태 */
	ArrayList<MemberVO> getMemberList(HashMap<String, Object> map);
	MemberVO getMemberDetail(MemberVO memberVO);
	//MemberVO getMemberDetailbyEmail(MemberVO memberVO);
	
	
	/* 기재 */
	MemberVO getMember(String MEM_MAIL);
	WorkShopMemberVO getWorkshop(String MEM_MAIL);
	int countMember(String MEM_MAIL);
	int countWorkshop(String MEM_MAIL);


	/* 회원 탈퇴 */
	int deleteMember(MemberVO memberVO);
	int duplicateMember(MemberVO deleteVO);
	int sysdateMember(MemberVO deleteVO);

}
