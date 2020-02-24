package com.spring.academy;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.spring.member.KakaoController;
import com.spring.member.MemberVO;
import com.spring.member.NaverLoginBO;
import com.spring.workshop.WorkShopMemberVO;

@Controller
public class AcademyController {
	
	@Autowired(required = false)
	private AcademyService academyService;
	@Autowired
	private ClassReviewService reviewService;
	@Autowired
	private ClassQnaService qnaService;

	@Autowired
	MappingJackson2JsonView jsonView;	
	
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired(required = false)
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
	
	@RequestMapping(value = "/classlist.ac")
	public ModelAndView ClassList(ClassVO classVO, Model model, HttpServletRequest request, HttpSession session) throws Exception  {
		ArrayList<ClassVO> classList = new ArrayList<ClassVO>();
		ModelAndView mav = new ModelAndView();
		classVO.setCLASS_AREA(request.getParameter("CLASS_AREA"));
		classVO.setCLASS_CATEGORY(request.getParameter("CLASS_CATEGORY"));
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
	    String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	    System.out.println("네이버:" + naverAuthUrl);
	    model.addAttribute("naver_url", naverAuthUrl);
      
	    //카카오 인증 url을 view로 전달
	    String kakaoUrI = KakaoController.getAuthorizationUri(session);
	    System.out.println("카카오: "+ kakaoUrI);
	    model.addAttribute("kakao_url", kakaoUrI);
		
		int page = 1; // 초기값 1
		int limit = 12; // 한 페이지당 출력할 글의 수
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int startrow = (page - 1) * 12 + 1; // 읽기 시작할 row 번호..
		int endrow = startrow + limit - 1; //읽을 마지막 row 번호.
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startrow", startrow);
		map.put("endrow", endrow);
		

		String CLASS_CATEGORY = classVO.getCLASS_CATEGORY();
		String CLASS_AREA = classVO.getCLASS_AREA();
		
		if (CLASS_CATEGORY == null) {
			CLASS_CATEGORY = "all";
		}
		if (CLASS_AREA == null) {
			CLASS_AREA = "지역";
		}
		
		
		map.put("CLASS_AREA", CLASS_AREA);
		map.put("CLASS_CATEGORY", CLASS_CATEGORY);
		
		// addObject view에 넘어가는 데이터
		classList = academyService.getClassList(map);
		int listcount = academyService.getCount(map);
				
		
		// 총 페이지 수
		int maxpage = (int)((double)listcount / limit + 0.95);
		int startpage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = startpage + 10 - 1;
		
		if(endpage > maxpage)
			endpage = maxpage;
		
		mav.addObject("page", page);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);		
		mav.addObject("classList", classList);
		mav.addObject("listcount", listcount);
		mav.addObject("CLASS_CATEGORY", CLASS_CATEGORY);
		mav.addObject("CLASS_AREA", CLASS_AREA);
		mav.setViewName("Academy/classList");
		System.out.println(map + " 갯수 : " + listcount);
		
		return mav;
	}
	
	
	
	

	@RequestMapping(value = "/getReviewList.acdo", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public HashMap<String, Object> getReviewList(ClassVO classVO, MemberVO memberVO, Model model, HttpServletRequest request, HttpSession session) {
		int CLASS_NUMBER= Integer.parseInt(request.getParameter("CLASS_NUMBER"));
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("CLASS_NUMBER", CLASS_NUMBER);
		
		int reviewCount;	
		int review_RE_Count;	//RE는 답글
		ArrayList<HashMap<String, Object>> reviewList = null;
		ArrayList<HashMap<String, Object>> review_RE_List = null;

		reviewCount = reviewService.getReviewCount(map);
		review_RE_Count = reviewService.getReview_RE_Count(map);
		reviewList = reviewService.getReviewList(map);
		review_RE_List = reviewService.getReview_RE_List(map);
		
		HashMap<String, Object> retVal = new HashMap<String, Object>();

		retVal.put("reviewCount", reviewCount);	//allRowCnt
		retVal.put("reviewList", reviewList);
		retVal.put("review_RE_Count", review_RE_Count);	
		retVal.put("review_RE_List", review_RE_List);	
		return retVal;
	}
	
	@RequestMapping(value = "/getQnaList.acdo", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public HashMap<String, Object> getQnaList(ClassVO classVO, MemberVO memberVO, Model model, HttpServletRequest request, HttpSession session) {
		
		int CLASS_NUMBER= Integer.parseInt(request.getParameter("CLASS_NUMBER"));
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("CLASS_NUMBER", CLASS_NUMBER);
		
		int qnaCount;	
		int qna_RE_Count;	//RE는 답글
		ArrayList<HashMap<String, Object>> qnaList = null;
		ArrayList<HashMap<String, Object>> qna_RE_List = null;
		
		qnaCount = qnaService.getQnaCount(map);
		qna_RE_Count = qnaService.getQna_RE_Count(map);
		qnaList = qnaService.getQnaList(map);
		qna_RE_List = qnaService.getQna_RE_List(map);
		
		HashMap<String, Object> retVal = new HashMap<String, Object>();
		
		retVal.put("qnaCount", qnaCount);	//allRowCnt
		retVal.put("qnaList", qnaList);
		retVal.put("qna_RE_Count", qna_RE_Count);	
		retVal.put("qna_RE_List", qna_RE_List);	
		return retVal;
	}

	
	
	
	
	
	@RequestMapping(value = "/classdetail.ac")
	public ModelAndView ClassDetail(ClassVO academy, HttpSession session, Model model) throws Exception {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
	    String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	    System.out.println("네이버:" + naverAuthUrl);
	    model.addAttribute("naver_url", naverAuthUrl);
      
	    //카카오 인증 url을 view로 전달
	    String kakaoUrI = KakaoController.getAuthorizationUri(session);
	    System.out.println("카카오: "+ kakaoUrI);
	    model.addAttribute("kakao_url", kakaoUrI);
		
		ClassVO vo = academyService.getDetail(academy);
		WorkShopMemberVO vo2 = academyService.selectWMember(vo);
		
		if (vo == null) {
			System.out.println("상세보기 실패");
			return null;
		} else if (vo2 == null) {
			System.out.println("WorkShop 가져오기 실패");
			return null;
		}
		System.out.println("vo.getCLASS_CATEGORY() = " + vo.getCLASS_CATEGORY());
		
		if (vo.getCLASS_CATEGORY().equals("table")) {
			vo.setCLASS_CATEGORY("책상");
		} else if (vo.getCLASS_CATEGORY().equals("chair")) {
			vo.setCLASS_CATEGORY("의자");
		} else if (vo.getCLASS_CATEGORY().equals("bookshelf")) {
			vo.setCLASS_CATEGORY("책장");
		} else if (vo.getCLASS_CATEGORY().equals("bed")) {
			vo.setCLASS_CATEGORY("침대");
		} else if (vo.getCLASS_CATEGORY().equals("drawer")) {
			vo.setCLASS_CATEGORY("서랍장");
		} else if (vo.getCLASS_CATEGORY().equals("sidetable")) {
			vo.setCLASS_CATEGORY("협탁");
		} else if (vo.getCLASS_CATEGORY().equals("dressing_table")) {
			vo.setCLASS_CATEGORY("화장대");
		} else if (vo.getCLASS_CATEGORY().equals("others")){
			vo.setCLASS_CATEGORY("기타");
		}
		
		System.out.println("상세보기 성공");
		
		//선주 
		WorkShopMemberVO workshopVO = academyService.selectWMember(vo);
		int WorkshopMatchingNumber = workshopVO.getWORKSHOP_NUM();
		int WorkshopNum = workshopVO.getWORKSHOP_NUM();
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ClassVO", vo);
		mav.addObject("WorkShopVO", vo2);
		mav.addObject("WorkshopNum",WorkshopNum);
		mav.addObject("WorkshopMatchingNumber",WorkshopMatchingNumber);
		
		
		mav.setViewName("Academy/detail");
		
		return mav;
	}
	
	
	
	@RequestMapping(value="/insertReview.acdo",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> insertReview(MultipartHttpServletRequest request, HttpSession session) throws Exception {
		System.out.println("academy insertReview 컨트롤러 start!");
		
		Class_reviewVO reviewVO = new Class_reviewVO();

		System.out.println("REVIEW_CONTENT=" + request.getParameter("REVIEW_CONTENT"));
	
		String str = "";
		if(!request.getFiles("REVIEW_FILE").isEmpty()) {
			List<MultipartFile> fileList = new ArrayList<MultipartFile>(); 
			
			// input file 에 아무것도 없을 경우 (파일을 업로드 하지 않았을 때 처리) 
			if(request.getFiles("REVIEW_FILE").get(0).getSize() != 0) { 
				fileList = request.getFiles("REVIEW_FILE"); 
			} 
	
			System.out.println("파일 없을 때 2");
			
			String path = "C:\\Project138\\upload\\"; 
			File fileDir = new File(path); 
			if (!fileDir.exists()) { 
				fileDir.mkdirs(); 
			} 
			
			long time = System.currentTimeMillis(); 
			
			for (MultipartFile mf : fileList) { 
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명 
				String saveFileName = String.format("%d_%s", time, originFileName);
	
				try { // 파일생성
					mf.transferTo(new File(path, saveFileName)); 
					str += saveFileName + ",";
				} catch (Exception e) { 
					e.printStackTrace(); 
					} 
				}
	
			System.out.println("str = " + str);
			
			if(str.length() != 0) {
				str = str.substring(0, str.length()-1);
			} else {
				str = "#";
			}
			
			/*
		    if (str.length() > 0 && str.charAt(str.length()-1)==',') {
		        str = str.substring(0, str.length()-1);
		      }
			*/
			
		    System.out.println("str 2 = " + str);
		} else {
			str = "#";
		}
    
		//reviewVO.setREVIEW_NUM(0); //시퀀스 이용
		reviewVO.setREVIEW_MEMBER((int)session.getAttribute("MEMBER_NUM"));
		reviewVO.setREVIEW_CLASS(Integer.parseInt(request.getParameter("CLASS_NUMBER")));
		reviewVO.setREVIEW_DATE(new Timestamp(System.currentTimeMillis()));
		reviewVO.setREVIEW_FILE(str);
		reviewVO.setREVIEW_CONTENT(request.getParameter("REVIEW_CONTENT"));
		
		//넘겨받은 REVIEW_RE가 존재하면 답글이고(원글의 REVIEW_NUM을 전달해줌), null이면 원글이다.
		if(request.getParameter("REVIEW_RE") != null) {	
			System.out.println("답글");
			//답글 - GRADE=10, RE=NUM
			reviewVO.setREVIEW_GRADE(7);
			reviewVO.setREVIEW_RE(Integer.parseInt(request.getParameter("REVIEW_RE")));
		} else {	
			System.out.println("원글");
			//원글 - GRADE=GRADE, RE=0
			reviewVO.setREVIEW_GRADE(Double.parseDouble(request.getParameter("REVIEW_GRADE")));
			reviewVO.setREVIEW_RE(0);
		}
		
		Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
		try {
			
			int res = reviewService.insertReview(reviewVO);
			retVal.put("insertres", "OK");
			retVal.put("reviewVO", reviewVO);
		} catch(Exception e) {
			retVal.put("insertres", "Fail");
		}
		
		
		
		//댓글(review) 입력시 academy grade update(답글 입력시는  grade 상관 없다)
		//update해야하는 강의의 vo 가져옴
		if(request.getParameter("REVIEW_RE") == null) {
			ClassVO classVO = new ClassVO();
			classVO.setCLASS_NUMBER(Integer.parseInt(request.getParameter("CLASS_NUMBER")));
			classVO = academyService.getDetail(classVO);
		
			double grade = classVO.getCLASS_GRADE();	//이  grade에 인원수를 곱해줘야 순수 grade누적값이 나온다.
			int gradepeoplecount = reviewService.getGradePeopleCount(Integer.parseInt(request.getParameter("CLASS_NUMBER")));	//인원수 구해오기(CLASS_NUMBER = REVIEW_CLASS)
			double totalGrade = grade * (gradepeoplecount-1);	//이전까지 total 누적 grade	//gradepeoplecount는 update된 후이므로 이전걸 계산하려면 -1해줘야함
	
			//(grade 총합+현재 리뷰 grade) / (gradepeoplecount)
			double newGrade = (totalGrade+Double.parseDouble(request.getParameter("REVIEW_GRADE"))) / (gradepeoplecount);
			
			//academy테이블에 grade update
			classVO.setCLASS_NUMBER(Integer.parseInt(request.getParameter("CLASS_NUMBER")));
			classVO.setCLASS_GRADE(newGrade);
			academyService.updateGrade(classVO);
			
		} 	
		
		return retVal;
		
	}		
	
	
	
	//리뷰 댓글 수정 폼
	@RequestMapping(value="/gomodifyReviewform.acdo",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> gomodifyReviewform(HttpServletRequest request) throws Exception {
		System.out.println("gomodifyReviewform 컨트롤러 왔다");
		int REVIEW_NUM = Integer.parseInt(request.getParameter("REVIEW_NUM"));
		System.out.println("REVIEW_NUM = " + REVIEW_NUM);
		
		Class_reviewVO reviewVO = null;
		

		Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
		try {
			reviewVO = reviewService.getReviewVO(REVIEW_NUM);
			retVal.put("res", "OK");
			retVal.put("reviewVO", reviewVO);
		} catch(Exception e) {
			retVal.put("res", "Fail");
		}
		return retVal;
		
	}		

	
	
	//리뷰 댓글 수정 process (원글)
	@RequestMapping(value="/modifyReview.acdo",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> modifyReview(MultipartHttpServletRequest request) throws Exception {
		System.out.println("modifyReview 컨트롤러 왔다");
		int REVIEW_NUM = Integer.parseInt(request.getParameter("REVIEW_NUM"));
		String beforeImg = request.getParameter("beforeImg");	//이전 이미지 중 남긴 이미지
		String deleteImg = request.getParameter("deleteImg");	//이전 이미지 중 삭제할 이미지
		String REVIEW_FILE = "";	//이전 이미지+추가 이미지
		
		if(deleteImg.equals("")) {
			System.out.println("삭제할 이미지 없음");
		}else {
			deleteImg = deleteImg.substring(0, deleteImg.length()-1);	//맨 마지막 , 떼기
			System.out.println(deleteImg);
			//기존의 이미지는 삭제
			String path = "C:\\Project138\\upload\\"; 
			String fullPath = "";
			String[] f = deleteImg.split(",");
			for(int i=0; i<f.length; i++) {
				fullPath = path+f[i];
				System.out.println("fullPath="+fullPath);
				File file = new File(fullPath);					
				file.delete();				
			}
		}
		
		//beforeImg - 이전 이미지 중 살릴 이미지
		if(beforeImg == ",") {	//기존 이미지 다 삭제했을 때, 바로 추가업로드 경로 붙일 수 있게 초기화시켜줌
			beforeImg = "";
		} 
		
		
		//사진 추가 업로드 처리
		List<MultipartFile> fileList = new ArrayList<MultipartFile>(); 
		
		// input file 에 아무것도 없을 경우 (파일을 업로드 하지 않았을 때 처리) 
		if(request.getFiles("REVIEW_FILE").get(0).getSize() != 0) { 
			fileList = request.getFiles("REVIEW_FILE"); 
		} 	
		
		String path = "C:\\Project138\\upload\\"; 
		File fileDir = new File(path); 
		if (!fileDir.exists()) { 
			fileDir.mkdirs(); 
		} 
		
		long time = System.currentTimeMillis(); 
		
		for (MultipartFile mf : fileList) { 
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명 
			String saveFileName = String.format("%d_%s", time, originFileName);

			try { // 파일생성
				mf.transferTo(new File(path, saveFileName)); 
				beforeImg += saveFileName + ",";	//beforeImg에 추가 업로드 이미지 경로 추가
			} catch (Exception e) { 
				e.printStackTrace(); 
				} 
			}

		System.out.println("beforeImg : " + beforeImg);
		
		if(beforeImg.length() != 0) {
			REVIEW_FILE = beforeImg.substring(0, beforeImg.length()-1);	//beforeImg + 추가 업로드 이미지
			
		} else {
			REVIEW_FILE = "#";	//새로운 파일 없을시 붙이지 않음
		}
					
		System.out.println("modify 전 REVIEW_FILE은 : " + REVIEW_FILE );
		
		Class_reviewVO reviewVO = new Class_reviewVO();
		reviewVO.setREVIEW_NUM(REVIEW_NUM);
		reviewVO.setREVIEW_CONTENT(request.getParameter("REVIEW_CONTENT"));
		reviewVO.setREVIEW_DATE(new Timestamp(System.currentTimeMillis()));
		reviewVO.setREVIEW_FILE(REVIEW_FILE);
		reviewVO.setREVIEW_GRADE(Double.parseDouble(request.getParameter("REVIEW_GRADE")));
		
		
		Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
		try {
			int res = reviewService.modifyReview(reviewVO);
			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "Fail");
		}
		return retVal;
	}		
	

	//리뷰 댓글 수정 process (답글)
	@RequestMapping(value="/modifyReviewReply.acdo",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object>  modifyReviewReply(HttpServletRequest request) throws Exception {
		System.out.println("modifyReviewReply 컨트롤러 왔다");
		int REVIEW_NUM = Integer.parseInt(request.getParameter("REVIEW_NUM"));
		String REVIEW_CONTENT = request.getParameter("REVIEW_CONTENT");
		Class_reviewVO vo = new Class_reviewVO();

		vo.setREVIEW_NUM(REVIEW_NUM);
		vo.setREVIEW_DATE(new Timestamp(System.currentTimeMillis()));
		vo.setREVIEW_CONTENT(REVIEW_CONTENT);
		
		Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
		try {
					
			int res = reviewService.modifyReviewReply(vo);
				retVal.put("res", "OK");
			
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}		
		
		return retVal;
	}		

	//리뷰 댓글 삭제
	@RequestMapping(value="/deleteReview.acdo",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> deleteReview(HttpServletRequest request) throws Exception {	
		System.out.println("deleteReview 컨트롤러 왔다");
		
		int REVIEW_NUM = Integer.parseInt(request.getParameter("REVIEW_NUM"));
		
		
		Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
		try {
					
			int res = 0;
			
			//답글을 가지고 있는 댓글은 삭제할 수 없다.
			//본인의 review_num을 review_re로 하는 데이터가 있을 경우, 삭제 불가
			int count = reviewService.findChildrenRE(REVIEW_NUM);
			
			if(count == 0) {	//답글이 없으므로 삭제 가능
				//upload폴더에서 파일 삭제
				String getReviewFile = reviewService.getREVIEW_FILE(REVIEW_NUM);
				if(!getReviewFile.equals("#")) {
					String path = "C:\\Project138\\upload\\"; 
					String fullPath = "";
					String[] f = getReviewFile.split(",");

					for(int i=0; i<f.length; i++) {
						fullPath = path+f[i];
						System.out.println("fullPath="+fullPath);
						File file = new File(fullPath);					
						file.delete();				
					}						
				}
				//db 삭제
				res = reviewService.deleteReview(REVIEW_NUM);
				retVal.put("res", "OK");
			} else {	//답글 존재
				retVal.put("res", "Children");
				
			}
			
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}		
		
		return retVal;
	}
			

//=====================================================
//===============================================QNA insert
//-------------------------------------------QNA_RE_insert
	@RequestMapping(value="/insertQna.acdo",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> insertQna(HttpServletRequest request, HttpSession session) throws Exception {
		System.out.println("academy insertQna 컨트롤러 start!");

		int MEMBER_NUM = 0;
		int WORKSHOP_NUM = 0;
		Class_qnaVO qnaVO = new Class_qnaVO();
		
		if(session.getAttribute("MEMBER_NUM") != null) {	//멤버로그인(원글)
			System.out.println("원글qna insert");
			MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
			qnaVO.setQNA_STATUS(0);
	    	qnaVO.setQNA_RE(0);
	    	qnaVO.setQNA_MEMBER(MEMBER_NUM);
		}else {	//공방로그인(답글)
			System.out.println("답글qna insert");
			WORKSHOP_NUM = (int)session.getAttribute("WORKSHOP_NUM");
			qnaVO.setQNA_STATUS(-1);
			qnaVO.setQNA_RE(Integer.parseInt(request.getParameter("QNA_RE")));
	    	qnaVO.setQNA_MEMBER(WORKSHOP_NUM);
		}
		
		System.out.println("QNA_CONTENT=" + request.getParameter("QNA_CONTENT"));
		System.out.println("CLASS_NUMBER=" + request.getParameter("CLASS_NUMBER"));
		System.out.println("WORKSHOP_NUM=" + WORKSHOP_NUM);
		System.out.println("MEMBER_NUM=" + MEMBER_NUM);

//		qnaVO.setQNA_NUM(qNA_NUM);	//시퀀스 이용
	    qnaVO.setQNA_CONTENT(request.getParameter("QNA_CONTENT"));
	    qnaVO.setQNA_DATE(new Timestamp(System.currentTimeMillis()));
	    qnaVO.setQNA_CLASS(Integer.parseInt(request.getParameter("CLASS_NUMBER")));
	
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			int res = qnaService.insertQna(qnaVO);
			retVal.put("res", "OK");
		}catch(Exception e) {
			retVal.put("res", "FAIL");
		}
		return retVal;
	}		

	
	//리뷰 댓글 수정 폼
	@RequestMapping(value="/gomodifyQnaform.acdo",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> gomodifyQnaform(HttpServletRequest request) throws Exception {
		System.out.println("academy gomodifyQnaform 컨트롤러 왔다");
		int QNA_NUM = Integer.parseInt(request.getParameter("QNA_NUM"));
		System.out.println("QNA_NUM = " + QNA_NUM);
		
		Class_qnaVO qnaVO = new Class_qnaVO();
		qnaVO.setQNA_NUM(QNA_NUM);
		Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
		try {
			qnaVO = qnaService.getQnaVO(qnaVO);
			retVal.put("res", "OK");
			retVal.put("qnaVO", qnaVO);
		} catch(Exception e) {
			retVal.put("res", "Fail");
		}
		return retVal;
		
	}		
	
	//===============================================QNA modify
	@RequestMapping(value="/modifyQna.acdo",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> modifyQna(Class_qnaVO vo, HttpServletRequest request) throws Exception {
		System.out.println("academy modifyQna 컨트롤러 왔다");

		vo.setQNA_DATE(new Timestamp(System.currentTimeMillis()));
		
		Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
		try {
			int res = qnaService.modifyQna(vo);

			retVal.put("res", "OK");
		} catch(Exception e) {
			retVal.put("res", "Fail");
		}
		return retVal;		
	}		
	

	//리뷰 댓글 수정 process (답글)
	@RequestMapping(value="/modifyQnaReply.acdo",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object>  modifyQnaReply(HttpServletRequest request) throws Exception {
		System.out.println("modifyQnaReply.acdo 컨트롤러 왔다");
		int QNA_NUM = Integer.parseInt(request.getParameter("QNA_NUM"));
		String QNA_CONTENT = request.getParameter("QNA_CONTENT");
		Class_qnaVO vo = new Class_qnaVO();

		vo.setQNA_NUM(QNA_NUM);
		vo.setQNA_DATE(new Timestamp(System.currentTimeMillis()));
		vo.setQNA_CONTENT(QNA_CONTENT);
		
		Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
		try {
					
		//	int res = qnaService.modifyQnaReply(vo);
				retVal.put("res", "OK");
			
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}		
		
		
		return retVal;
	}		
	
	//-------------------------------------------QNA delete
	@RequestMapping(value="/deleteQna.acdo",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> delete_qna(HttpServletRequest request) throws Exception {
		System.out.println("deleteQna.acdo 컨트롤러 왔다");
		int QNA_NUM = Integer.parseInt(request.getParameter("QNA_NUM"));
		Class_qnaVO qnaVO = new Class_qnaVO();
		qnaVO.setQNA_NUM(QNA_NUM);	
		System.out.println(qnaVO.getQNA_NUM());
		Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장
		try {
			int res = 0;
			System.out.println(res);
			
			//답글을 가지고 있는 댓글은 삭제할 수 없다.
			//삭제하고자 하는 댓글의 qna_num을 qna_re로 하는 데이터가 있을 경우, 삭제 불가
			int count = qnaService.findChildrenRE(qnaVO);
			if(count == 0) {	//답변 달려있지 않음(삭제 가능)
				res = qnaService.deleteQna(qnaVO);
				retVal.put("res", "OK");
			} else {	//답글 존재(삭제 불가능)
				retVal.put("res", "Children");
			}
			
			
		}catch(Exception e) {
			retVal.put("res", "FAIL");
		}		
		System.out.println(retVal);
		return retVal;
		
	}			
	
		
	
	
	
	@RequestMapping(value = "/classreservation.ac")
	public String ClassReservation() {
		
		return "Academy/reservation";
	}
	
	@RequestMapping(value = "/classform.ac")
	public String ClassForm() {
		
		return "Academy/classForm";
	}
	
	@RequestMapping(value = "/addclass.ac", method = RequestMethod.POST)
	public ModelAndView AddClass(MultipartHttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		boolean result = false;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		ClassVO vo = new ClassVO();
		vo.setWORKSHOP_NUM(Integer.parseInt(session.getAttribute("WORKSHOP_NUM").toString()));
		
		WorkShopMemberVO vo2 = academyService.selectWMember(vo);
		
		MultipartFile mf2 = request.getFile("CLASS_IMAGE");

		List<MultipartFile> fileList = new ArrayList<MultipartFile>(); 
		
		// input file 에 아무것도 없을 경우 (파일을 업로드 하지 않았을 때 처리) 
		if(request.getFiles("CLASS_BANNER").get(0).getSize() != 0) { 
			fileList = request.getFiles("CLASS_BANNER"); 
		} 

		System.out.println("파일 없을 때 2");
		
		String path = "C:\\Project138\\upload\\"; 
		File fileDir = new File(path); 
		if (!fileDir.exists()) { 
			fileDir.mkdirs(); 
		} 
		
		long time = System.currentTimeMillis(); 
		String str = "";
		for (MultipartFile mf : fileList) { 
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명 
			String saveFileName = String.format("%d_%s", time, originFileName);

			try { // 파일생성
				mf.transferTo(new File(path, saveFileName)); 
				str += saveFileName + ",";
			} catch (Exception e) { 
				e.printStackTrace(); 
				} 
			}
		System.out.println("str = " + str);
		
		if(str.length() != 0) {
			str = str.substring(0, str.length()-1);
		} else {
			str = "#";
		}
		
		
		vo.setCLASS_BANNER(str);
		
		
		if(!mf2.isEmpty()) {
			String uploadPath = "C:\\Project138\\upload\\";
			File fileDir2 = new File(uploadPath); 
			if (!fileDir2.exists()) { 
				fileDir2.mkdirs(); 
			} 
			String originalFileExtension = mf2.getOriginalFilename().substring(mf2.getOriginalFilename().lastIndexOf("."));
			String storedFileName2 = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
			
			if(mf2.getSize() != 0) {
				mf2.transferTo(new File(uploadPath+storedFileName2));
			}
			
			vo.setCLASS_IMAGE(storedFileName2);
		} else {
			System.out.println("썸네일 사진 넣지 않음.");
			return null;
		}
		
		
		

		vo.setWORKSHOP_NAME(vo2.getWORKSHOP_NAME());
		vo.setWORKSHOP_PICTURE(vo2.getWORKSHOP_PICTURE());
		vo.setCLASS_DIVISION(request.getParameter("CLASS_DIVISION"));
		vo.setCLASS_NAME(request.getParameter("CLASS_NAME"));
		vo.setCLASS_ABRIEF(request.getParameter("CLASS_ABRIEF"));
		vo.setCLASS_AMOUNT(Integer.parseInt(request.getParameter("CLASS_AMOUNT")));
		vo.setCLASS_DATE(new Timestamp(System.currentTimeMillis()));
		if(request.getParameter("CLASS_DIVISION").equals("정규클래스")) {
			System.out.println("정규클래스");
			vo.setCLASS_DATE_CONFIGURATION_1(request.getParameter("CLASS_DATE_CONFIGURATION_1"));
			vo.setCLASS_DATE_CONFIGURATION_2(request.getParameter("CLASS_DATE_CONFIGURATION_2"));
		} else {
			System.out.println("원데이클래스");
			vo.setCLASS_DATE_CONFIGURATION_1(request.getParameter("CLASS_DATE_CONFIGURATION_3"));
			vo.setCLASS_DATE_CONFIGURATION_2(request.getParameter("CLASS_DATE_CONFIGURATION_4"));
		}
		vo.setCLASS_AREA(request.getParameter("CLASS_AREA"));
		vo.setCLASS_CATEGORY(request.getParameter("CLASS_CATEGORY"));
		vo.setCLASS_INTRODUCTION_1(request.getParameter("CLASS_INTRODUCTION_1"));
		vo.setCLASS_INTRODUCTION_2(request.getParameter("CLASS_INTRODUCTION_2"));
		vo.setCLASS_INTRODUCTION_3(request.getParameter("CLASS_INTRODUCTION_3"));
		vo.setCLASS_ETC(request.getParameter("CLASS_ETC"));
		vo.setCLASS_ADDRESS(request.getParameter("CLASS_ADDRESS"));
		vo.setCLASS_DETAIL_ADDRESS(request.getParameter("CLASS_DETAIL_ADDRESS"));
		vo.setCLASS_GRADE(0);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:classlist.ac");
		mav.addObject("ClassVO", vo);
		
		result = academyService.insertClass(vo);
		
		if(result == false) {
			System.out.println("클래스 등록 실패!");
			return null;
		}
		System.out.println("클래스 등록 완료!");
		
		return mav;
	}
	

	@RequestMapping(value = "/success.ac")
	public ModelAndView Success(ClassVO academy, @RequestParam(value="amount5", required=false) String amount4) throws Exception {
		ClassVO vo = academyService.getDetail(academy);
		
		if (vo == null) {
			System.out.println("상세보기 실패");
			return null;
		}
		System.out.println("상세보기 성공");
		
		int res = 0;
		res = academyService.countUp(academy);
		
		if ( res == 1) {
			System.out.println("등록된 강의에 회원수 증가 완료");
		} else {
			System.out.println("등록된 강의에 회원수 증가 실패!");
			return null;
		}
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ClassVO", vo);
		mav.addObject("amount3", amount4);
		mav.setViewName("Academy/success");
		
		return mav;
	}
	
	@RequestMapping(value = "/ClassInfo.ac")
	public void ClassInfo(HttpServletRequest request,MyClassVO vo) throws Exception {
		boolean result = false;
		
		result = academyService.insertClassInfo(vo);
		
		if(result == false) {
			System.out.println("정보등록 실패");
		}
		System.out.println("정보등록 성공");
	}
}
