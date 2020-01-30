package com.spring.note;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.chat.WorkshopVO;
import com.spring.mapper.NoteMapper;
import com.spring.mapper.memberMapper;
import com.spring.member.MemberVO;

@Service
public class NoteServiceImpl implements NoteService {
	
	@Autowired
	SqlSession sqlSession;
	
	public ArrayList<NoteVO> receiveList(String receiver, int startRow, int endRow) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		
		HashMap<String, Object> vo = new HashMap<String, Object>();
		vo.put("NOTE_RECEIVER_MAIL", receiver);
		vo.put("startRow", startRow);
		vo.put("endRow", endRow);
		
		ArrayList<NoteVO> receiveList = mapper.selectReceive(vo);
		
		return receiveList;
	}

	public ArrayList<NoteVO> sendList(String sender, int startRow, int endRow) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		
		HashMap<String, Object> vo = new HashMap<String, Object>();
		vo.put("NOTE_SENDER_MAIL", sender);
		vo.put("startRow", startRow);
		vo.put("endRow", endRow);
		
		ArrayList<NoteVO> sendList = mapper.selectSend(vo);
		
		return sendList;
	}
	
	public ArrayList<NoteVO> boxedList(String boxer, int startRow, int endRow) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		
		HashMap<String, Object> vo = new HashMap<String, Object>();
		vo.put("NOTE_RECEIVER_MAIL", boxer);
		vo.put("startRow", startRow);
		vo.put("endRow", endRow);
		
		ArrayList<NoteVO> boxedList = mapper.selectBoxed(vo);
		
		return boxedList;
	}
	
	public int countReceive(String receiver) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		int countReceive = mapper.countReceive(receiver);
		
		return countReceive;
	}
	
	public int countReceiveNotRead(String receiver) throws Exception{
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		int countReceiveNotRead = mapper.countReceiveNotRead(receiver);
		
		return countReceiveNotRead;
	}
	
	public int countSend(String sender) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		int countSend = mapper.countSend(sender);
		
		return countSend;
	}
	
	public int countSendNotRead(String sender) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		int countSendNotRead = mapper.countSendNotRead(sender);
		
		return countSendNotRead;
	}
	
	public int countBoxed(String sender) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		int countBoxed = mapper.countBoxed(sender);
		
		return countBoxed;
	}

	public int noteBoxing(int note_num) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		
		int noteBoxed = mapper.noteBoxing(note_num);
		
		return noteBoxed;
	}
	
	public int noteUnboxing(int note_num) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		int noteUnboxed = mapper.noteUnboxing(note_num);
		
		return noteUnboxed;
	}
	
	public int noteDelete(int note_num) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		int noteDelete = mapper.noteDelete(note_num);
		
		return noteDelete;
	}
	
	public NoteVO noteView (int note_num) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		NoteVO notevo = mapper.noteView(note_num);
		
		return notevo;
	}
	

	public int checkMember(String mem_mail) throws Exception {
		memberMapper mapper = sqlSession.getMapper(memberMapper.class);
		
		if (mapper.countMember(mem_mail) == 1) {
			return 1;
		}
		
		else {
			if (mapper.countWorkshop(mem_mail) == 1) {
				return 2;
			}
			
			else
				return 0;
		}
	}
	
	public MemberVO getMember(String mem_mail) throws Exception {
		memberMapper mapper = sqlSession.getMapper(memberMapper.class);
		MemberVO vo = mapper.getMember(mem_mail);
		
		return vo;
	}
	public WorkshopVO getWorkshop(String mem_mail) throws Exception {
		memberMapper mapper = sqlSession.getMapper(memberMapper.class);
		WorkshopVO vo = mapper.getWorkshop(mem_mail);
		System.out.println("getWorkshop : " + vo.getWORK_MAIL());
		
		return vo;
		
	}
	
	public int noteSend (NoteVO vo) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		
		int res = mapper.noteSend(vo);
		
		return res;
	}

	public int increaseReadcount (int note_num) throws Exception {
		NoteMapper mapper = sqlSession.getMapper(NoteMapper.class);
		
		int res = mapper.noteReadcount(note_num);
		
		return res;
	}
}
