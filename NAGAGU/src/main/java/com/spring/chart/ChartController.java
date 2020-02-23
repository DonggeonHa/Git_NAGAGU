package com.spring.chart;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.academy.ClassVO;
import com.spring.admin.AdminMemberVO;
import com.spring.admin.AdminService;

@Controller
public class ChartController {
	
	@Autowired
	private ChartService chartService;
	
	@Autowired(required = false)
	private AdminService adminService;
	
	
	@RequestMapping(value = "/Alogin.ad", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView Alogin(AdminMemberVO adminVO, HttpSession session, ModelAndView mav) throws Exception {
		int res = adminService.user_chk(adminVO);
		
		if (res == 1) {	//로그인(아이디,비번 맞음)-이메일 인증 완료
			session.setAttribute("ADMIN_NUM", adminVO.getADMIN_NUM());
			
		} else {	//아이디or비번 틀렸을 때
			System.out.println("아이디 또는 비밀번호 틀림");
			return null;
		}
		
		int memberCount = 0;
		int WSCount = 0;
		int totalCount = 0;
		
		String selectDate = null;
		int count = 0;
		
		ArrayList<ClassVO> popularList = null;
		ClassVO classVO = new ClassVO();
		String className = null;
		String workshopName = null;
		int cmemberCount = 0;
		
		
		int total_member = 0;
		int delete_member = 0;
		int delete_ws_member = 0;
		try {
			
			//커뮤니티 게시글 수 구하기, 회원가입 수
			for(int i = 0; i < 7; i++) {
	            /*현재*/
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	            Calendar c = Calendar.getInstance();
	            String pics_date = sdf.format(c.getTime());
	            /*기준이 되는 날*/
	            c.setTime(sdf.parse(pics_date));
	            c.add(Calendar.DATE, -6+i);
	            selectDate = sdf.format(c.getTime());
	            
	            memberCount = chartService.insertMemberCount(selectDate);
	            WSCount = chartService.insertWSMemberCount(selectDate);
	            delete_member = chartService.deleteMemberCount(selectDate);
	            delete_ws_member = chartService.deleteWSMemberCount(selectDate);
	            
	            totalCount = memberCount + WSCount;

	            
	            //일반 회원가입 수
	            if(memberCount == 0) {
	            	mav.addObject("memberCount"+i, 0);
	            }else {
	            	mav.addObject("memberCount"+i, memberCount);	
	            }
	            
	            //공방 회원가입 수
	            if(WSCount == 0) {
	            	mav.addObject("WSCount"+i, 0);
	            } else {
	            	mav.addObject("WSCount"+i, WSCount);	
	            }
	            
	            //탈퇴 일반회원
	            if(delete_member == 0) {
	            	mav.addObject("deleteMember"+i, 0);
	            } else {
	            	mav.addObject("deleteMember"+i, -delete_member);
	            }
	            
	            //탈퇴 공방회원
	            if(delete_ws_member == 0) {
	            	mav.addObject("deleteWSMember"+i, 0);
	            } else {
	            	mav.addObject("deleteWSMember"+i, -delete_ws_member);
	            }
	            
	            
	            mav.addObject("totalCount"+i, totalCount);	//총 회원가입 수
	            
	            count = chartService.CountBoard(selectDate);
	            
	            if(count == 0) {
	            	mav.addObject("count"+i, 0);
	            }
	            
	            mav.addObject("count"+i, count);	//게시글 수
	            mav.addObject("selectDate"+i, selectDate);	//날짜
	         }	//커뮤니티 게시글 수 구하기 끝
			
			
			
			//인기 공방 순위 구하기 
			popularList = chartService.PopularClass();
			
			for(int i=0; i<5; i++) {
				classVO = popularList.get(i);
				
				className = classVO.getCLASS_NAME();
				workshopName = classVO.getWORKSHOP_NAME();
				cmemberCount = classVO.getCLASS_COUNT_MEMBER();
				
				mav.addObject("className"+i, className);
				mav.addObject("workshopName"+i, workshopName);
				mav.addObject("cmemberCount"+i, cmemberCount);
			}//인기 공방 순위 구하기 끝
			
			
			
		} catch(Exception e) {
			e.getMessage();
		}
		
		mav.setViewName("Admin/Aindex");
		
		return mav;
	}
}
