package com.spring.chat;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ChatMapper;
import com.spring.mapper.memberMapper;
import com.spring.member.MemberVO;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVO getMember(String MEM_MAIL) {
		memberMapper mapper = sqlSession.getMapper(memberMapper.class);
		
		System.out.println("Service : " + MEM_MAIL);
		MemberVO membervo = mapper.getMember(MEM_MAIL);
		System.out.println("Service : " + membervo.getMEMBER_NICK());
		
		return membervo;
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

}
