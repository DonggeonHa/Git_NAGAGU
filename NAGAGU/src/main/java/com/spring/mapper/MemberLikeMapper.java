package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.community.LikeVO;
import com.spring.member.MemberVO;

public interface MemberLikeMapper {
	int insertMemberLike(HashMap<String, Object> map);
	int deleteMemberLike(HashMap<String, Object> map);
	int selectMemberLike(HashMap<String, Object> map);
	ArrayList<LikeVO> getMemberLikePics(MemberVO memberVO);
}
