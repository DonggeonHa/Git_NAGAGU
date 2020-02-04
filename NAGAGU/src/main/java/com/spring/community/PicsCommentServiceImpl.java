package com.spring.community;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MemberLikeMapper;
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
		//int re_ref = db.getPICS_RE_REF();	//원글 1;
		int re_step = db.getPICS_RE_STEP();//원글 0
		//int re_lev = db.getRE_LEV();//원글 0
		if(commentmapper.getCount()!=0){
			number = commentmapper.getMaxNum() + 1;
		}
		else
		number = 1;	
		
		
		//re_step = re_step +1;
		
		if(db.getPICS_RE_REF()==0) {
			db.setPICS_RE_REF(number);
		}else {
			commentmapper.updateStep(db);
		}
		
		db.setPICS_RE_NUM(number);
		db.setPICS_RE_STEP(re_step);		
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
	@Override
	public ArrayList<Map<String, Object>> getLoginMemberReply(HashMap<String, Object> map) {
		System.out.println("start");
		ArrayList<Map<String, Object>> commentList =null;
		PicsCommentMapper commentmapper = sqlSession.getMapper(PicsCommentMapper.class);
		commentList= commentmapper.getLoginMemberReply(map);
		System.out.println("getLoginMemberReply Impl결과="+commentList);
		return commentList;
	}

	
}
