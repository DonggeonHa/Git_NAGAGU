package com.spring.mapper;

import java.util.ArrayList;

import com.spring.chat.MessageVO;

public interface ChatMapper {
	public int insertMsg(MessageVO vo);
	public ArrayList<MessageVO> allMsg (int chatroom_num);
}
