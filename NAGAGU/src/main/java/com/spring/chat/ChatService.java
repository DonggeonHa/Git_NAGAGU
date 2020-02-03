package com.spring.chat;

import java.util.ArrayList;

import com.spring.member.MemberVO;

public interface ChatService {
	public MemberVO getMember(String mem_mail);
	public ArrayList<MessageVO> getChatMsg (int chatroom_num);
	public int insertChatMsg (MessageVO vo);
}
