package com.spring.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberAjaxController {

	@Autowired(required = false)
	private MemberService memberService;
	
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
	public Map<String, Object> nicknameChk(MemberVO memberVO) {
		Map<String, Object> retVal = new HashMap<String, Object>(); // 리턴값 저장
		System.out.println("컨트롤러 nickname=" + memberVO.getMEMBER_NICK());
		try {

			int res = memberService.nickname_chk(memberVO);

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

	@PostMapping(value = "/login.su", produces = "application/json;charset=UTF-8")
	public Map<String, Object> login(MemberVO memberVO, HttpSession session) {
		Map<String, Object> retVal = new HashMap<String, Object>(); // 리턴값 저장
		System.out.println("컨트롤러 로그인체크: " + memberVO.getMEMBER_EMAIL() + memberVO.getMEMBER_PASS());
		
		try {
			int res = memberService.user_chk(memberVO);
			System.out.println("res는" + res);
			
			if (res == 1) {	//로그인(아이디,비번 맞음)-이메일 인증 완료
				session.setAttribute("MEMBER_EMAIL", memberVO.getMEMBER_EMAIL());
//				session.setAttribute("member_pass", memberVO.getMember_pass());
				
				
				retVal.put("res", "login_success");
				
			} else if(res == 0) { //아이디,비번은 맞지만 이메일 미인증일 때
				retVal.put("res", "loginFail_unconfirm");
				
			} else {	//아이디or비번 틀렸을 때
				retVal.put("res", "login_IdPw_fail");
				
			}
		} catch (Exception e) {
			retVal.put("res", "AjaxControllerFAIL");
		}
		
		return retVal;
	}
}
