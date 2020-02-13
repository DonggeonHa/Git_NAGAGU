package com.spring.mypage;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.member.MemberVO;

@Controller
public class MypageEditController {
	
	@Autowired(required = false)
	private MypageService mypageService;
	
	@RequestMapping(value = "/edit_member_form.my", method = RequestMethod.POST) 
	public String edit_member_form(MultipartHttpServletRequest request, HttpSession session, MemberVO memberVO) throws Exception { 
		String MEMBER_EMAIL = (String)session.getAttribute("MEMBER_EMAIL");
		MultipartFile mf = request.getFile("img"); // 파일
		
		try {
			
			if(mf.isEmpty()) {	//이미지가 비어있을 경우 넣음
				memberVO.setMEMBER_PICTURE("./resources/images/Mypage/Basic_Picture.png");
			} else {
				//파일업로드 시작=-------------------------------------------------
				String uploadPath="C:\\Project138\\upload\\";
				String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
	            //중복없이 저장
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
				
				if(mf.getSize() != 0) {
					// getSize()메소드는 파일 용량을 구해줌 / 첨부할 파일이 존재할 때 실행
					mf.transferTo(new File(uploadPath + storedFileName));	//원하는 위치에 저장해줌
					memberVO.setMEMBER_PICTURE("/communityupload/image/" + storedFileName);
				}

			}
		
			memberVO.setMEMBER_EMAIL(MEMBER_EMAIL);
			memberVO.setMEMBER_NICK(request.getParameter("MEMBER_NICK"));
			memberVO.setMEMBER_NAME(request.getParameter("MEMBER_NAME"));
			memberVO.setMEMBER_PHONE(request.getParameter("MEMBER_PHONE"));
			memberVO.setADDRESS_ZIP(Integer.parseInt((request.getParameter("ADDRESS_ZIP"))));
			memberVO.setADDRESS_ADDRESS1(request.getParameter("ADDRESS_ADDRESS1"));
			memberVO.setADDRESS_ADDRESS2(request.getParameter("ADDRESS_ADDRESS2"));
			
			int result = mypageService.editMember(memberVO);
			
			if(result != 0) {
				//out객체 사용해서 null이나 아웃사용 리턴문만나기전 호출
				session.setAttribute("MEMBER_NICK", memberVO.getMEMBER_NICK());
				session.setAttribute("MEMBER_NAME", memberVO.getMEMBER_NAME());
				session.setAttribute("MEMBER_PHONE", memberVO.getMEMBER_PHONE());
				session.setAttribute("MEMBER_PICTURE", memberVO.getMEMBER_PICTURE());
				
				return "redirect:/index.ma";
			}
		} catch (Exception e) {
			System.out.println("회원정보 수정 실패!");
		}
		return "redirect:/mypage_edit.my";
	}
}
