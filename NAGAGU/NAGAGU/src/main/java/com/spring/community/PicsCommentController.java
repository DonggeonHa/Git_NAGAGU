package com.spring.community;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.member.MemberService;
import com.spring.member.MemberVO;


@RestController
public class PicsCommentController {
		@Autowired
		private CommunityService communityService;
		@Autowired
		private MemberService memberService;
		@Autowired
		private PicsCommentService picsCommentService;
		
		@PostMapping(value="/getCommentList.cm", produces="application/json;charset=UTF-8")
		public ArrayList<PicsCommentDB> getCommentList(PicsCommentDB db){
			System.out.println(db.getPICS_RE_PICS());
			ArrayList<PicsCommentDB> list = picsCommentService.getCommentList(db.getPICS_RE_PICS());
			return list;
		}
		@PostMapping(value="/insertComment.cm",produces="application/json;charset=UTF-8")
		public Map<String, Object> insertComment(PicsCommentDB db){
			System.out.println("insert컨트롤러");
			System.out.println("ref값="+db.getPICS_RE_REF());
			Map<String, Object> retVal = new HashMap<String, Object>();
			try {
				int res=picsCommentService.insertComment(db);
				retVal.put("res", "OK");
			}catch(Exception e) {
				retVal.put("res", "FAIL");
				retVal.put("message", "Failure");
			}
			return retVal;
		}
		
		@PostMapping(value="/deleteComment.cm",produces="application/json;charset=UTF-8")
		public Map<String, Object> deleteComment(@RequestParam(value="delNum", required=false) int delNum){
			Map<String, Object> retVal = new HashMap<String, Object>();
			try {
				int res=picsCommentService.deleteComment(delNum);
				retVal.put("res","OK");
			}catch(Exception e) {
				retVal.put("res", "FAIL");
				retVal.put("message", "Failure");
			}

			return retVal;
		}
		@PostMapping(value="/updateComment.cm",produces="application/json;charset=UTF-8")
		public Map<String, Object> updateComment(PicsCommentDB db){
			Map<String, Object> retVal = new HashMap<String, Object>();
			try {
				int res=picsCommentService.updateComment(db);
				retVal.put("res", "OK");
			}catch(Exception e) {
				retVal.put("res", "FAIL");
				retVal.put("message", "Failure");
			}
			return retVal;
		}
	 
	
}
