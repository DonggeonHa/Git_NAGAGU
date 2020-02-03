package com.spring.community;

import java.util.ArrayList;



public interface PicsCommentService {

	ArrayList<PicsCommentDB> getCommentList(int num);
	int insertComment(PicsCommentDB db);
	int deleteComment(int num);
	int updateComment(PicsCommentDB db);
}
