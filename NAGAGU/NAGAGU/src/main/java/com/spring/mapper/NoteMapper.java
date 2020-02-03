package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.note.NoteVO;

public interface NoteMapper {
	public ArrayList<NoteVO> selectReceive (HashMap<String, Object> vo);
	public ArrayList<NoteVO> selectSend (HashMap<String, Object> vo);
	public ArrayList<NoteVO> selectBoxed (HashMap<String, Object> vo);
	public int countReceive (String receiver);
	public int countReceiveNotRead (String receiver);
	public int countSend (String receiver);
	public int countSendNotRead (String receiver);
	public int countBoxed (String receiver);
	public int checkReceiver (String receiver);
	public int noteSend (NoteVO vo);
	public int noteDelete (int note_num);
	public int noteBoxing (int note_num);
	public int noteUnboxing (int note_num);
	public NoteVO noteView (int note_num);
	public int noteReadcount (int note_num);
	
}
