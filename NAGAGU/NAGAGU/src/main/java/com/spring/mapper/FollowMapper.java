package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.member.MemberVO;

public interface FollowMapper {
	int insertFollow(HashMap<String, Object> map);
	int deleteFollow(HashMap<String, Object> map);
	int selectFollow(HashMap<String, Object> map);
	ArrayList<MemberVO> getFollowMembers(HashMap<String, Object> map);
	ArrayList<MemberVO> getFollowedMembers(HashMap<String, Object> map);
}
