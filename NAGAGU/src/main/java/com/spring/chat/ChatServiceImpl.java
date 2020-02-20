package com.spring.chat;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ChatMapper;
import com.spring.mapper.WorkShopMemberMapper;
import com.spring.mapper.memberMapper;
import com.spring.member.MemberVO;
import com.spring.workshop.WorkShopMemberVO;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVO getMember(String MEM_MAIL) {
		memberMapper mapper = sqlSession.getMapper(memberMapper.class);
		
		MemberVO membervo = mapper.getMember(MEM_MAIL);
		
		return membervo;
	}
	
	@Override
	public WorkShopMemberVO getWorkshop(String MEM_MAIL) {
		WorkShopMemberMapper mapper = sqlSession.getMapper(WorkShopMemberMapper.class);
		WorkShopMemberVO wvo = new WorkShopMemberVO();
		wvo.setWORKSHOP_EMAIL(MEM_MAIL);
		
		WorkShopMemberVO vo = mapper.select_workshop_member(wvo);
		
		return vo;
	}
	
	@Override
	public ArrayList<MessageVO> getChatMsg (int chatroom_num) {
		ChatMapper mapper = sqlSession.getMapper(ChatMapper.class);
		ArrayList<MessageVO> msgList = mapper.allMsg(chatroom_num);
		
		return msgList;
	}
	
	@Override
	public int insertChatMsg (MessageVO vo) {
		ChatMapper mapper = sqlSession.getMapper(ChatMapper.class);
		int res = mapper.insertMsg(vo);
		
		return res;
	}

	@Override
	public int chatroomCreate (ChatRoomVO vo) {
		ChatMapper mapper = sqlSession.getMapper(ChatMapper.class);
		int res = mapper.chatroomCreate(vo);
		
		return res;
	}
	
	@Override
	public int chatroomDelete (int CHATROOM_NUM) {
		ChatMapper mapper = sqlSession.getMapper(ChatMapper.class);
		int res = mapper.chatroomDelete(CHATROOM_NUM);
		
		return res;
	}
	
	@Override
	public HashMap<String, Object> chatroomDetail (int CHATROOM_NUM) {
		ChatMapper mapper = sqlSession.getMapper(ChatMapper.class);
		HashMap<String, Object> map = mapper.chatroomDetail(CHATROOM_NUM);
		
		return map;
		
	}
}
