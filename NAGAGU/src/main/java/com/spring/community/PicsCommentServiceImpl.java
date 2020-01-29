package com.spring.community;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.PicsCommentMapper;


@Service
public class PicsCommentServiceImpl implements PicsCommentService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<PicsCommentDB> getCommentList(int num) {
		ArrayList<PicsCommentDB> commentList =null;
		PicsCommentMapper commentmapper = sqlSession.getMapper(PicsCommentMapper.class);
		commentList= commentmapper.getCommentList(num);
		return commentList;
	}
	@Override
	public int insertComment(PicsCommentDB db) {
		PicsCommentMapper commentmapper = sqlSession.getMapper(PicsCommentMapper.class);
		int number=0;
		if(commentmapper.getCount()!=0){
			number = commentmapper.getMaxNum() + 1;
		}
		else
		number = 1;		
		db.setPICS_RE_NUM(number);
		db.setPICS_RE_REF(0);
		db.setPICS_RE_STEP(0);		
		int result = commentmapper.insertComment(db);
		return result;
	}
	@Override
	public int deleteComment(int num) {
		PicsCommentMapper commentmapper = sqlSession.getMapper(PicsCommentMapper.class);
		int res = commentmapper.deleteComment(num);
			System.out.println("num"+num);
			System.out.println("res"+res);
		return res;
	}
	@Override
	public int updateComment(PicsCommentDB db) {
		PicsCommentMapper commentmapper = sqlSession.getMapper(PicsCommentMapper.class);
		//왜 0으로 셋팅?
		db.setPICS_RE_STEP(0);
		int res = commentmapper.updateComment(db);
		return res;
	}
	
}
