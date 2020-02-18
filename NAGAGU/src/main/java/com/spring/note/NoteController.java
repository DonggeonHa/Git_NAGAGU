package com.spring.note;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.member.MemberVO;
import com.spring.workshop.WorkShopMemberVO;

@Controller
public class NoteController {
	
	@Autowired
	NoteService noteService;
	
	@RequestMapping(value="receiveList.nt")
	public String noteReceive(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		
		String member_mail = (String)session.getAttribute("MEMBER_EMAIL");
		String workshop_name = (String)session.getAttribute("WORKSHOP_NAME");
		String receiver = member_mail;
		
		if (member_mail == null && workshop_name != null) {
			
			WorkShopMemberVO workshopvo = new WorkShopMemberVO();
			workshopvo.setWORKSHOP_NAME(workshop_name);
			receiver = noteService.getWorkshopMail(workshopvo);
		}
		
		
		int page = 1;
		int limit = 10;

		int countReceive = noteService.countReceive(receiver);
		int countReceiveNotRead = noteService.countReceiveNotRead(receiver);
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int maxpage = (int)((double)countReceive/limit+0.95);
		int startRow = (page-1)*limit + 1;
		int endRow = startRow+limit-1;
		int startpage = (((int) ((double)page/10 + 0.9)) - 1) * 5 + 1;
		int endpage = startpage+4;

		if (page == maxpage)
			endRow = countReceive;

		if (endpage > maxpage)
			endpage = maxpage;
		
		ArrayList<NoteVO> receiveList = noteService.receiveList(receiver, startRow, endRow);
		
		model.addAttribute("page", page);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("receiveList", receiveList);
		model.addAttribute("countReceive", countReceive);
		model.addAttribute("countReceiveNotRead", countReceiveNotRead);
		
		return "Mypage/Note/receive";
	}
	
	@RequestMapping(value="sendList.nt")
	public String noteSend(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		String member_mail = (String)session.getAttribute("MEMBER_EMAIL");
		String workshop_name = (String)session.getAttribute("WORKSHOP_NAME");
		String sender = member_mail;
		
		if (member_mail == null && workshop_name != null) {
			
			WorkShopMemberVO workshopvo = new WorkShopMemberVO();
			workshopvo.setWORKSHOP_NAME(workshop_name);
			sender = noteService.getWorkshopMail(workshopvo);
		}
		
		
		int page = 1;
		int limit = 10;

		int countSend = noteService.countSend(sender);
		int countSendNotRead = noteService.countSendNotRead(sender);
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int maxpage = (int)((double)countSend/limit+0.95);
		int startRow = (page-1)*limit + 1;
		int endRow = startRow+limit-1;
		int startpage = (((int) ((double)page/10 + 0.9)) - 1) * 5 + 1;
		int endpage = startpage+4;

		if (page == maxpage)
			endRow = countSend;
		
		if (endpage > maxpage)
			endpage = maxpage;
		
		ArrayList<NoteVO> sendList = noteService.sendList(sender, startRow, endRow);
		
		model.addAttribute("page", page); 
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("sendList", sendList);
		model.addAttribute("countSend", countSend);
		model.addAttribute("countSendNotRead", countSendNotRead);
		
		return "Mypage/Note/send";
	}
	
	@RequestMapping(value="boxedList.nt")
	public String noteBoxed(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		String member_mail = (String)session.getAttribute("MEMBER_EMAIL");
		String workshop_name = (String)session.getAttribute("WORKSHOP_NAME");
		String boxer = member_mail;
		
		if (member_mail == null && workshop_name != null) {
			
			WorkShopMemberVO workshopvo = new WorkShopMemberVO();
			workshopvo.setWORKSHOP_NAME(workshop_name);
			boxer = noteService.getWorkshopMail(workshopvo);
		}
		
		int page = 1;
		int limit = 10;

		int countBoxed = noteService.countBoxed(boxer);
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int maxpage = (int)((double)countBoxed/limit+0.95);
		int startRow = (page-1)*limit + 1;
		int endRow = startRow+limit-1;
		int startpage = (((int) ((double)page/10 + 0.9)) - 1) * 5 + 1;
		int endpage = startpage+4;

		if (page == maxpage)
			endRow = countBoxed;
		
		if (endpage > maxpage)
			endpage = maxpage;
		
		ArrayList<NoteVO> boxedList = noteService.boxedList(boxer, startRow, endRow);
		
		model.addAttribute("page", page); 
		model.addAttribute("maxpage", maxpage); 
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("boxedList", boxedList);
		model.addAttribute("countBoxed", countBoxed);
		
		return "Mypage/Note/boxed";
	}
	
	@RequestMapping(value="noteView.nt", method=RequestMethod.GET) 
	public String noteView (HttpServletRequest request, Model model) throws Exception {
		int note_num = Integer.parseInt(request.getParameter("note_num"));
		NoteVO notevo = noteService.noteView(note_num);
		
		if (notevo.getNOTE_READCOUNT() == 0 ) {
			int res = noteService.increaseReadcount(note_num);
		}
		
		model.addAttribute("notevo", notevo);
		model.addAttribute("page", request.getParameter("page"));
		model.addAttribute("redirection", request.getParameter("redirection"));
		
		return "Mypage/Note/noteView";
	}
	
	@RequestMapping(value="noteBoxing.nt")
	public String noteBoxing (HttpServletRequest request) throws Exception {
		
		System.out.println("noteBoxing Start");
		String redirection = null;

		if (request.getParameterValues("chk") != null) {
			
			String[] noteNums = request.getParameterValues("chk");
			int boxedCount = 0;
			
			for (String noteNum : noteNums) {
				System.out.println(noteNum);
				int note_num = Integer.parseInt(noteNum);
				
				boxedCount += noteService.noteBoxing(note_num);
			}
			
			redirection = "redirect:/receiveList.nt";
			
			String pageNum = (String)request.getAttribute("page");
			
			if (pageNum != null) {
				redirection += "?page=";
				redirection += pageNum;
			}
		
		}
		
		else {
			int note_num = Integer.parseInt(request.getParameter("note_num"));
			int boxedCount = noteService.noteBoxing(note_num);

			System.out.println("boxing result : " + boxedCount);
			redirection = "redirect:/noteView.nt?note_num=";
			redirection += note_num;
			redirection += "&redirection=";
			redirection += request.getParameter("redirection");
			redirection += "&page=";
			redirection += request.getParameter("page");
			System.out.println(redirection);	
		}
		
		return redirection;
	}
	
	@RequestMapping(value="noteUnboxing.nt", method=RequestMethod.POST)
	public String noteUnboxing (HttpServletRequest request) throws Exception {
		
		System.out.println("noteUnboxing Start");
		String redirection = null;

		if (request.getParameterValues("chk") != null) {
			
			String[] noteNums = request.getParameterValues("chk");
			int unboxedCount = 0;
			
			for (String noteNum : noteNums) {
				System.out.println(noteNum);
				int note_num = Integer.parseInt(noteNum);
				unboxedCount += noteService.noteUnboxing(note_num);
			}
			
			redirection = "redirect:/boxedList.nt";
			
			String pageNum = (String)request.getAttribute("page");
			
			if (pageNum != null) {
				redirection += "?page=";
				redirection += pageNum;
			}
	
			System.out.println("unboxing result : " + unboxedCount);
		
		}
		
		return redirection;
	}

	@RequestMapping(value="noteDelete.nt")
	public String noteDelete (HttpServletRequest request) throws Exception {
		
		System.out.println("noteDelete Start");
		
		String redirection = "redirect:/";
		redirection += (String)request.getParameter("redirect");
		System.out.println(redirection);
		
		if (request.getParameterValues("chk") != null) {
			String[] noteNums = request.getParameterValues("chk");
			int deleteCount = 0;
			
			for (String noteNum : noteNums) {
				System.out.println(noteNum);
				int note_num = Integer.parseInt(noteNum);
				deleteCount += noteService.noteDelete(note_num);
			}

			System.out.println("delete result : " + deleteCount);
			
			String pageNum = (String)request.getAttribute("page");
			
			if (pageNum != null) {
				redirection += "?page=";
				redirection += pageNum;
			}
		
		} 
		
		else {
			int note_num = Integer.parseInt(request.getParameter("note_num"));
			int boxedCount = noteService.noteDelete(note_num);

			System.out.println("delete result  : " + boxedCount);
			redirection = "redirect:/";
			redirection += request.getParameter("redirection");
			redirection += "?page=";
			redirection += request.getParameter("page");
			System.out.println(redirection);	
		}
		
		return redirection;
	}
	
	@RequestMapping("noteForm.nt")
	public String noteForm (HttpServletRequest request, HttpSession session, Model model) throws Exception {
		String receive_nick = null;
		String receive_pic = null;
		
		String receive_mail = request.getParameter("receive_mail");
		
		int memberChk = noteService.checkMember(receive_mail);
		
		if (memberChk == 1) {
			receive_nick = noteService.getMember(receive_mail).getMEMBER_NICK();
			receive_pic = noteService.getMember(receive_mail).getMEMBER_PICTURE();
			
			model.addAttribute("receive_mail", receive_mail);
			model.addAttribute("receive_nick", receive_nick);
			model.addAttribute("receive_pic", receive_pic);
		}
		
		else if (memberChk == 2) {
			WorkShopMemberVO vo = noteService.getWorkshop(receive_mail);
			
			receive_nick = vo.getWORKSHOP_NAME();
			receive_pic = vo.getWORKSHOP_PICTURE();
			
			model.addAttribute("receive_mail", receive_mail);
			model.addAttribute("receive_nick", receive_nick);
			model.addAttribute("receive_pic", receive_pic);
		}
		
		String redirection = request.getParameter("redirection");
		model.addAttribute("redirection", redirection);
		
		return "Mypage/Note/noteWrite";
	}
	
	@RequestMapping("selectedForm.nt")
	public String selectedSend (HttpServletRequest request, HttpSession session, Model model) throws Exception {
		System.out.println("테스팅");
		String sender_mail = "";
		String sender_nick = "";
		
		if (session.getAttribute("MEMBER_EMAIL") != null) {
			sender_mail = (String)session.getAttribute("MEMBER_EMAIL");
			sender_nick = (String)session.getAttribute("MEMBER_NICK");
		}
		else if (session.getAttribute("WORKSHOP_EMAIL") != null) {
			sender_mail = (String)session.getAttribute("WOKRSHOP_EMAIL");
			sender_nick = (String)session.getAttribute("WOKRSHOP_NAME");
		}
		
			
		String[] receivers = request.getParameterValues("chk2");
		receivers = new HashSet<String>(Arrays.asList(receivers)).toArray(new String[0]);

		ArrayList<MemberVO> receiverList = new ArrayList<MemberVO>();
		
		int receiverCount = 0;

		for (String receiver_mail : receivers) {
			MemberVO vo = new MemberVO();
			String receiver_nick = null;
			String receiver_pic = null;
			
			int chk = noteService.checkMember(receiver_mail);
			
			if (chk == 1) {
				MemberVO membervo = noteService.getMember(receiver_mail);
				receiver_nick = membervo.getMEMBER_NICK();
				receiver_pic = membervo.getMEMBER_PICTURE();
				
			}
			else if (chk == 2) {
				WorkShopMemberVO workshopvo = noteService.getWorkshop(receiver_mail);
				receiver_nick = workshopvo.getWORKSHOP_NAME();
				receiver_pic = workshopvo.getWORKSHOP_PICTURE();
			}

			vo.setMEMBER_EMAIL(receiver_mail);
			vo.setMEMBER_NICK(receiver_nick);
			vo.setMEMBER_PICTURE(receiver_pic);
			
			receiverList.add(vo);
			receiverCount++;
		}
		
		model.addAttribute("receiverList", receiverList);
		
		return "Mypage/Note/noteWriteSelected";
	}
	
	@RequestMapping("notewrite.nt")
	@ResponseBody
	public String noteWrite(HttpServletRequest request, HttpSession session) throws Exception {
		NoteVO vo = new NoteVO();
		String sender_mail = "";
		String sender_nick = "";
		System.out.println("test1 : " + (String)session.getAttribute("MEMBER_EMAIL"));
		System.out.println("test1 : " + (String)session.getAttribute("WORKSHOP_EMAIL"));
		
		if (session.getAttribute("MEMBER_EMAIL") != null) {
			sender_mail = (String)session.getAttribute("MEMBER_EMAIL");
			sender_nick = (String)session.getAttribute("MEMBER_NICK");
		}
		else if (session.getAttribute("WORKSHOP_EMAIL") != null) {
			sender_mail = (String)session.getAttribute("WORKSHOP_EMAIL");
			sender_nick = (String)session.getAttribute("WORKSHOP_NAME");
		}
			vo.setNOTE_SENDER_MAIL(sender_mail);
			vo.setNOTE_SENDER_NICK(sender_nick);
			vo.setNOTE_RECEIVER_MAIL(request.getParameter("receiver_mail"));
			vo.setNOTE_RECEIVER_NICK(request.getParameter("receiver_nick"));
			vo.setNOTE_TITLE(request.getParameter("note_title"));
			vo.setNOTE_CONTENT(request.getParameter("note_content"));
			
			int res = noteService.noteSend(vo);
			
		return null;
	}

}
