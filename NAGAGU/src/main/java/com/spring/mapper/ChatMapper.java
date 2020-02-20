package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.chat.ChatRoomVO;
import com.spring.chat.MessageVO;

public interface ChatMapper {
	public int insertMsg(MessageVO vo);
	public ArrayList<MessageVO> allMsg (int chatroom_num);
	public int chatroomCreate (ChatRoomVO vo);
	public int chatroomDelete (int CHATROOM_NUM);
	public HashMap<String, Object> chatroomDetail (int CHATROOM_NUM);
}
