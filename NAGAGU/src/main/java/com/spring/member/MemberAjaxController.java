package com.spring.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.workshop.WorkShopMemberService;
import com.spring.workshop.WorkShopMemberVO;

@RestController
public class MemberAjaxController {

	@Autowired(required = false)
	private MemberService memberService;
	
	@Autowired(required = false)
	private WorkShopMemberService workShopMemberService;
	
	@PostMapping(value = "/emailChk.su", produces = "application/json;charset=UTF-8")
	public Map<String, Object> emailChk(MemberVO memberVO) {
		Map<String, Object> retVal = new HashMap<String, Object>(); // 리턴값 저장
		System.out.println("컨트롤러 emailchk = " + memberVO.getMEMBER_EMAIL());
		try {

			int res = memberService.email_chk(memberVO);

			if (res == 0) {
				retVal.put("res", "OK"); // 맵객체 "res"는 키 , "OK" 값
			} else if (res == 1) {
				retVal.put("res", "FAIL"); // 맵객체 "res"는 키 , "OK" 값
			}

		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	
	@PostMapping(value = "/nicknameChk.su", produces = "application/json;charset=UTF-8")
	public Map<String, Object> nicknameChk(MemberVO memberVO, HttpSession session) {
		Map<String, Object> retVal = new HashMap<String, Object>(); // 리턴값 저장
		String member_nick =  memberVO.getMEMBER_NICK();
		String nick_session = (String)session.getAttribute("MEMBER_NICK");
		System.out.println("컨트롤러 nickname=" + member_nick);
		
		try {
			
			if(member_nick.equals(nick_session)) {
				retVal.put("res", "OK");
			} else {
				int res = memberService.nickname_chk(memberVO);

				if (res == 0) {
					retVal.put("res", "OK"); // 맵객체 "res"는 키 , "OK" 값
				} else if (res == 1) {
					retVal.put("res", "FAIL"); // 맵객체 "res"는 키 , "OK" 값
				}
			}
			
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}

	@PostMapping(value = "/login.su", produces = "application/json;charset=UTF-8")
	public Map<String, Object> login(MemberVO memberVO, WorkShopMemberVO workshopVO, HttpSession session, Model model) {
		Map<String, Object> retVal = new HashMap<String, Object>(); // 리턴값 저장
		System.out.println("컨트롤러 로그인체크: " + memberVO.getMEMBER_EMAIL() + memberVO.getMEMBER_PASS());
		try {
			int member_chk_res = memberService.checkMember(memberVO.getMEMBER_EMAIL());
			
			if(member_chk_res == 1) {	//일반회원
				MemberVO member = null;
				member = memberService.selectMember(memberVO);
				
				if(member == null) {
					System.out.println("selectMember 가져오기 실패");
					return null;
				} 
				
				int res = memberService.user_chk(memberVO);
				System.out.println("res는" + res);
				
				if (res == 1) {	//로그인(아이디,비번 맞음)-이메일 인증 완료
					session.setAttribute("MEMBER_EMAIL", member.getMEMBER_EMAIL());
					session.setAttribute("MEMBER_NUM", member.getMEMBER_NUM());
					session.setAttribute("MEMBER_NICK", member.getMEMBER_NICK());
					session.setAttribute("MEMBER_STATUS", member.getMEMBER_STATUS());
					session.setAttribute("MEMBER_NAME", member.getMEMBER_NAME());
//					session.setAttribute("MEMBER_PICTURE", member.getMEMBER_PICTURE());
					retVal.put("res", "login_success");
					
				} else if(res == 0) { //아이디,비번은 맞지만 이메일 미인증일 때
					retVal.put("res", "loginFail_unconfirm");
					
				} else {	//아이디or비번 틀렸을 때
					retVal.put("res", "login_IdPw_fail");
					
				}
			} else if(member_chk_res == 2) {	//공방회원
				workshopVO.setWORKSHOP_EMAIL(memberVO.getMEMBER_EMAIL());
				workshopVO.setWORKSHOP_PASS(memberVO.getMEMBER_PASS());
				System.out.println("WorkshopVO 값 : " + workshopVO.getWORKSHOP_EMAIL());
				
				WorkShopMemberVO workshopMember = null;
				workshopMember = workShopMemberService.select_workshop_member(workshopVO);
				
				if (workshopMember == null){
					System.out.println("공방 selectMember 가져오기 실패");
					return null;
				}
				
				int result = workShopMemberService.workshop_user_chk(workshopVO);
				System.out.println(" result : " + result);
				
				if(result == 1) {
					session.setAttribute("WORKSHOP_STATUS", workshopMember.getWORKSHOP_STATUS());
					session.setAttribute("WORKSHOP_NAME", workshopMember.getWORKSHOP_NAME());
					
					retVal.put("res", "login_success");
				} else if(result == 0) {
					retVal.put("res", "workshop_loginFail_unconfirm");
				} else {
					retVal.put("res", "login_IdPw_fail");
				}
			}
			
			
		} catch (Exception e) {
			retVal.put("res", "AjaxControllerFAIL");
		}
		
		return retVal;
	}
}
