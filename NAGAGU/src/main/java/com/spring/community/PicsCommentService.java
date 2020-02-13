package com.spring.community;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;



public interface PicsCommentService {

	ArrayList<PicsCommentDB> getCommentList(int num);
	ArrayList<PicsCommentDB> getCommentCount(int num);
	int insertComment(PicsCommentDB db);
	int deleteComment(int num);
	int updateComment(PicsCommentDB db);
	ArrayList<Map<String, Object>> getLoginMemberReply(HashMap<String, Object> map);//마이페이지에서 내 댓글리스트
}
