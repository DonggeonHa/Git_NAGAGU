package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.community.PicsVO;


public interface CommunityMapper {
	//리스트
	ArrayList<PicsVO> getPicsAll(HashMap<String, Object> map);
	//사진 개수
	int getPicsCount(HashMap<String, Object> map);
	//조회수1증가
	void updatePicsReadCount(PicsVO picsVO);
	//사진 디테일 불러오기
	PicsVO getPicsDetail(PicsVO picsVO);
	//디테일멤버가 올린 사진들 리스트
	ArrayList<PicsVO> getPicsOfMemberUpload(PicsVO picsVO);
	//글쓰기 폼
	int insertPics(PicsVO picsVO);
	//글 삭제
	int deletePics(PicsVO picsVO);
	//글 업데이트
	int updatePics(PicsVO picsVO);
	//사진(수정폼) 삭제
	int deletePicsFile(PicsVO picsVO);
	//좋아요 수 업데이트
	int updatePicsLike(HashMap<String, Object> map);
	//멤버가 좋아요 한 사진 리스트
	ArrayList<PicsVO> getMemberLikePics(HashMap<String, Object> map);
//	ArrayList<PicsVO> getPicsCategory(HashMap<String, Object> map);
//	int getPicsCountAll();
} 
