package com.spring.mapper;
import java.util.ArrayList;
import com.spring.community.PicsCommentDB;

public interface PicsCommentMapper {
	ArrayList<PicsCommentDB> getCommentList(int num);
	int insertComment(PicsCommentDB db);
	int updateComment(PicsCommentDB db);
	int updateStep(PicsCommentDB db);//댓글 스텝
	int deleteComment(int num);	
	int getMaxNum();
	int getCount();
	//String passwdcheck(int num);
}
