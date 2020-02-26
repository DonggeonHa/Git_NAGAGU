package com.spring.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.member.MemberVO;
import com.spring.workshop.WorkShopMemberVO;

/**
 * Handles requests for the application home page.
 */

@Controller
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@RequestMapping(value="chatRoom.ch")
	public String enterChatRoom(HttpServletRequest request, HttpSession session, Model model) {
		MemberVO vo = new MemberVO();
		WorkShopMemberVO wvo = new WorkShopMemberVO();
		
		if (session.getAttribute("MEMBER_EMAIL") != null) {
			vo = chatService.getMember((String)session.getAttribute("MEMBER_EMAIL"));
			model.addAttribute("MEMBER_EMAIL", (String)session.getAttribute("MEMBER_EMAIL"));
			model.addAttribute("MEMBER_NICK", vo.getMEMBER_NICK());
			model.addAttribute("MEMBER_PICTURE", vo.getMEMBER_PICTURE());
		}
		else if (session.getAttribute("WORKSHOP_EMAIL") != null) {
			wvo = chatService.getWorkshop((String)session.getAttribute("WORKSHOP_EMAIL"));
			model.addAttribute("MEMBER_EMAIL", (String)session.getAttribute("WORKSHOP_EMAIL"));
			model.addAttribute("MEMBER_NICK", wvo.getWORKSHOP_NAME());
			model.addAttribute("MEMBER_PICTURE", wvo.getWORKSHOP_PICTURE());
		}
		
		int MSG_CHATROOM_NUM = Integer.parseInt(request.getParameter("ES_ORDER_NUM"));
		ArrayList<MessageVO> msgList = chatService.getChatMsg(MSG_CHATROOM_NUM);
		HashMap <String, Object> chatMap = chatService.chatroomDetail(MSG_CHATROOM_NUM);
		
		model.addAttribute("MSGLIST", msgList);
		model.addAttribute("CHATROOM_NUM", MSG_CHATROOM_NUM);
		
		return "Mypage/NoTiles/chatRoom";
	}
	
	@RequestMapping(value="sendChat.ch", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> sendChat(@RequestBody Map <String, Object> msg) {
		MessageVO vo = new MessageVO();
		
		vo.setMSG_CHATROOM_NUM((int)msg.get("MSG_CHATROOM_NUM"));
		vo.setMSG_CONTENT((String)msg.get("MSG_CONTENT"));
		vo.setMSG_DATE((String)msg.get("MSG_DATE"));
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try {
			int res = chatService.insertChatMsg(vo);
			
			if (res == 1)
				retVal.put("res", "Success");
			else
				retVal.put("res", "Not saved");
		}
		catch (Exception e) {
			retVal.put("res", "FAIL");
		}
		
		return retVal;
	}
	
	@RequestMapping(value="session1.ch")
	public String session1(HttpSession session) {
		session.setAttribute("MEMBER_EMAIL", "cndanrh26@naver.com");
		
		return "index";
	}
	
	@RequestMapping(value="session2.ch")
	public String session2(HttpSession session) {
		session.setAttribute("MEMBER_EMAIL", "hadonggun@gmail.com");
		
		return "index";
	}
}
