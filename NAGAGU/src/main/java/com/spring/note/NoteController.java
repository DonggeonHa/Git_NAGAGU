package com.spring.note;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.workshop.WorkShopMemberVO;

@Controller
public class NoteController {
	
	@Autowired
	NoteService noteService;
	
	@RequestMapping(value="receiveList.nt")
	public String noteReceive(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		session.setAttribute("mem_mail", "cndanrh26@naver.com");
		String receiver = (String)session.getAttribute("mem_mail");
		
		int page = 1;
		int limit = 10;

		int countReceive = noteService.countReceive(receiver);
		int countReceiveNotRead = noteService.countReceiveNotRead(receiver);
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int maxpage = (int)((double)countReceive/limit+0.95);
		int startpage = (((int) ((double)page/10 + 0.9)) - 1) * 10 + 1;
		int endpage = startpage+limit-1;

		if (page == maxpage)
			endpage = countReceive;
		
		ArrayList<NoteVO> receiveList = noteService.receiveList(receiver, startpage, endpage);
		
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
		session.setAttribute("mem_mail", "lagls@naver.com");
		String sender = (String)session.getAttribute("mem_mail");
		
		int page = 1;
		int limit = 10;

		int countSend = noteService.countSend(sender);
		int countSendNotRead = noteService.countSendNotRead(sender);
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int maxpage = (int)((double)countSend/limit+0.95);
		int startpage = (((int) ((double)page/10 + 0.9)) - 1) * 10 + 1;
		int endpage = startpage+10-1;
		
		if (endpage > maxpage)
			endpage = maxpage;
		
		ArrayList<NoteVO> sendList = noteService.sendList(sender, startpage, endpage);
		
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
		session.setAttribute("mem_mail", "lagls@naver.com");
		String boxer = (String)session.getAttribute("mem_mail");
		
		int page = 1;
		int limit = 10;

		int countBoxed = noteService.countBoxed(boxer);
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int maxpage = (int)((double)countBoxed/limit+0.95);
		int startpage = (((int) ((double)page/10 + 0.9)) - 1) * 10 + 1;
		int endpage = startpage+10-1;
		
		if (endpage > maxpage)
			endpage = maxpage;
		
		ArrayList<NoteVO> boxedList = noteService.boxedList(boxer, startpage, endpage);
		
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
		String workshop_name = request.getParameter("workshop_name");
		System.out.println("receive_mail : " + receive_mail);
		System.out.println("workshop_name : " + workshop_name);
		
		if (receive_mail == null && workshop_name != null) {
			System.out.println("first");
			
			WorkShopMemberVO workshopvo = new WorkShopMemberVO();
			workshopvo.setWORKSHOP_NAME(workshop_name);
			receive_mail = noteService.getWorkshopMail(workshopvo);
		}
		
		if (noteService.checkMember(receive_mail) == 1) {
			receive_nick = noteService.getMember(receive_mail).getMEMBER_NICK();
			receive_pic = noteService.getMember(receive_mail).getMEMBER_PICTURE();
			System.out.println("result : " + receive_nick);
			
			model.addAttribute("receive_mail", receive_mail);
			model.addAttribute("receive_nick", receive_nick);
			model.addAttribute("receive_pic", receive_pic);
		}
		
		else if (noteService.checkMember(receive_mail) == 2) {
			WorkShopMemberVO vo = noteService.getWorkshop(receive_mail);
			
			receive_nick = vo.getWORKSHOP_NAME();
			receive_pic = vo.getWORKSHOP_PICTURE();
			System.out.println("result : " + receive_nick);
			
			model.addAttribute("receive_mail", receive_mail);
			model.addAttribute("receive_nick", receive_nick);
			model.addAttribute("receive_pic", receive_pic);
		}
		
		String redirection = request.getParameter("redirection");
		model.addAttribute("redirection", redirection);
		System.out.println(redirection);	
		
		return "Mypage/Note/noteWrite";
	}
	
	@RequestMapping("notewrite.nt")
	public String noteWrite(HttpServletRequest request, HttpSession session) throws Exception {
		session.setAttribute("send_mail", "cndanrh26@naver.com");
		session.setAttribute("send_nick", "공방공방");
		
		NoteVO vo = new NoteVO();
		
			vo.setNOTE_SENDER_MAIL((String)session.getAttribute("send_mail"));
			vo.setNOTE_SENDER_NICK((String)session.getAttribute("send_nick"));
			vo.setNOTE_RECEIVER_MAIL(request.getParameter("receiver_mail"));
			vo.setNOTE_RECEIVER_NICK(request.getParameter("receiver_nick"));
			vo.setNOTE_TITLE(request.getParameter("note_title"));
			vo.setNOTE_CONTENT(request.getParameter("note_content"));
			
			int res = noteService.noteSend(vo);
			
		return null;
	}

}
