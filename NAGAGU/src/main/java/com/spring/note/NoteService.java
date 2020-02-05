package com.spring.note;

import java.util.ArrayList;

import com.spring.chat.WorkshopVO;
import com.spring.member.MemberVO;
import com.spring.workshop.WorkShopMemberVO;

public interface NoteService {
	public ArrayList<NoteVO> receiveList(String receiver, int startRow, int endRow) throws Exception;
	public ArrayList<NoteVO> sendList(String sender, int startRow, int endRow) throws Exception;
	public ArrayList<NoteVO> boxedList(String boxer, int startRow, int endRow) throws Exception;
	public int countReceive(String receiver) throws Exception;
	public int countReceiveNotRead(String receiver) throws Exception;
	public int countSend(String sender) throws Exception;
	public int countSendNotRead(String sender) throws Exception;
	public int countBoxed(String sender) throws Exception;
	public int noteBoxing(int note_num) throws Exception;
	public int noteUnboxing(int note_num) throws Exception;
	public int noteDelete(int note_num) throws Exception;
	public NoteVO noteView (int note_num) throws Exception;
	public int checkMember(String mem_mail) throws Exception;
	public MemberVO getMember(String mem_mail) throws Exception;
	public WorkShopMemberVO getWorkshop(String mem_mail) throws Exception;
	public String getWorkshopMail(WorkShopMemberVO workshopVO);
	public int noteSend (NoteVO vo) throws Exception;
	public int increaseReadcount (int note_num) throws Exception;
}
