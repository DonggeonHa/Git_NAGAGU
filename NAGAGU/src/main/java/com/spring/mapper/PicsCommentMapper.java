package com.spring.mapper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.community.PicsCommentDB;

public interface PicsCommentMapper {
	ArrayList<PicsCommentDB> getCommentList(int num);
	ArrayList<Map<String, Object>> getLoginMemberReply(HashMap<String, Object> map);
	int insertComment(PicsCommentDB db);
	int updateComment(PicsCommentDB db);
	int updateStep(PicsCommentDB db);//댓글 스텝
	int deleteComment(int num);	
	int getMaxNum();
	int getCount();
	//String passwdcheck(int num);
}
