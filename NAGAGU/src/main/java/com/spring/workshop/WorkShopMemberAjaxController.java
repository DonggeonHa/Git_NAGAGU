package com.spring.workshop;

import java.util.HashMap;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class WorkShopMemberAjaxController {

	@Autowired(required = false)
	private WorkShopMemberService workShopMemberService;
	
	@PostMapping(value = "/workshopEmailChk.ws", produces = "application/json;charset=UTF-8")
	public Map<String, Object> emailChk(WorkShopMemberVO workshopVO) {
		Map<String, Object> retVal = new HashMap<String, Object>(); // 리턴값 저장
		
		try {

			int res = workShopMemberService.workshop_email_chk(workshopVO);

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
	
	@PostMapping(value = "/workshopNicknameChk.ws", produces = "application/json;charset=UTF-8")
	public Map<String, Object> nicknameChk(WorkShopMemberVO workshopVO) {
		Map<String, Object> retVal = new HashMap<String, Object>(); // 리턴값 저장
		
		try {
			int res = workShopMemberService.workshop_name_chk(workshopVO);

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
}
