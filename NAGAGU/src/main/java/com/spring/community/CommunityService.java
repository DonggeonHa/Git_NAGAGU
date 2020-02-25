package com.spring.community;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.member.MemberVO;


public interface CommunityService {
	ArrayList<HashMap<String, Object>> getPicsAll(HashMap<String, Object> map);
	int getPicsCount(HashMap<String, Object> map);
	PicsVO getPicsDetail(PicsVO picsVO);
	ArrayList<PicsVO> getPicsOfMemberUpload(PicsVO picsVO);
	int insertPics(PicsVO picsVO);
	int deletePics(PicsVO picsVO);
	int updatePics(PicsVO picsVO);
	int deletePicsFile(PicsVO picsVO);
	HashMap<String, Object> insertMemberLike(HashMap<String, Object> map);
	ArrayList<PicsVO> getMemberLikePics(HashMap<String, Object> map);//좋아요 사진 리스트
	HashMap<String, Object> followAction(HashMap<String, Object> map);//팔로우 액션
	ArrayList<MemberVO> getFollowMembers(HashMap<String, Object> map);//팔로우 리스트
	ArrayList<MemberVO> getFollowedMembers(HashMap<String, Object> map);//팔로우 당한 리스트
}
