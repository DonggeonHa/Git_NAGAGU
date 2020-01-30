package com.spring.community;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.member.MemberVO;


public interface CommunityService {
	ArrayList<PicsVO> getPicsAll(HashMap<String, Object> map);
	int getPicsCount(HashMap<String, Object> map);
	PicsVO getPicsDetail(PicsVO picsVO);
	ArrayList<PicsVO> getPicsOfMemberUpload(PicsVO picsVO);
	int insertPics(PicsVO picsVO);
	int deletePics(PicsVO picsVO);
	int updatePics(PicsVO picsVO);
	int deletePicsFile(PicsVO picsVO);
	int insertMemberLike(HashMap<String, Object> map);
	//삭제예정
	//ArrayList<PicsVO> getPicsCategory(HashMap<String, Object> map);
	//int getPicsCountAll();
	
}
