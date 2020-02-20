package com.spring.chat;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.member.MemberVO;
import com.spring.workshop.WorkShopMemberVO;

public interface ChatService {
	public MemberVO getMember(String MEM_MAIL);
	public WorkShopMemberVO getWorkshop(String MEM_MAIL);
	public ArrayList<MessageVO> getChatMsg (int chatroom_num);
	public int insertChatMsg (MessageVO vo);
	public int chatroomCreate (ChatRoomVO vo);
	public int chatroomDelete (int CHATROOM_NUM);
	public HashMap<String, Object> chatroomDetail (int CHATROOM_NUM);
}
