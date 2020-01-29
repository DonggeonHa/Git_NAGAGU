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
//	ArrayList<PicsVO> getPicsCategory(HashMap<String, Object> map);
//	int getPicsCountAll();
} 
