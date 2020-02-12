<%@page import="com.spring.order.BasketVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="com.spring.store.ProductVO" %>
<%@ page import="com.spring.store.Product_reviewVO" %>
<%@ page import="com.spring.store.Product_qnaVO" %>
<%@ page import="com.spring.member.MemberVO" %>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	System.out.println("=========================================");
	System.out.println("=========================================");
	System.out.println("ProductDetail.jsp");
	
	//멤버가 댓글 작성시 필요
	String MEMBER_PICTURE = (String)session.getAttribute("MEMBER_PICTURE"); 
	String MEMBER_NICK = (String)session.getAttribute("MEMBER_NICK"); 
	Integer MEMBER_NUM = (Integer)session.getAttribute("MEMBER_NUM"); 

	System.out.println("MEMBER_NUM="+MEMBER_NUM);
	System.out.println("MEMBER_PICTURE="+MEMBER_PICTURE);
	System.out.println("MEMBER_NICK="+MEMBER_NICK);
	

	//로그인 상태 체크 위한
	String WORKSHOP_CEO_NAME = (String)session.getAttribute("WORKSHOP_CEO_NAME");
	String MEMBER_EMAIL = (String)session.getAttribute("MEMBER_EMAIL");

	System.out.println("WORKSHOP_CEO_NAME="+WORKSHOP_CEO_NAME);
	
	//(QNA)글쓴이만 답글 버튼이 보인다. 글쓴이인지 체크하기 위해 이 글의 WORKSHOP_NUM 받아옴
	int WorkshopMatchingNumber = (int)request.getAttribute("WorkshopMatchingNumber");
	Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");

	System.out.println("WotkshopMatchingNumber="+WorkshopMatchingNumber);

	//WORKSHOP이 댓글 달 때 필요
	String WORKSHOP_PICTURE = (String)session.getAttribute("WORKSHOP_PICTURE");
	String WORKSHOP_NAME = (String)session.getAttribute("WORKSHOP_NAME");

	System.out.println("WORKSHOP_PICTURE="+WORKSHOP_PICTURE);
	System.out.println("WORKSHOP_NAME="+WORKSHOP_NAME);

	
	//상품상세 관련
	ProductVO vo = (ProductVO)request.getAttribute("productVO");
	String PRODUCT_CATEGORY = (String)request.getAttribute("PRODUCT_CATEGORY");
	int PRODUCT_NUM = ((Integer)request.getAttribute("PRODUCT_NUM")).intValue();
	String PRODUCT_COLOR = vo.getPRODUCT_COLOR();
	String PRODUCT_SIZE = vo.getPRODUCT_SIZE();
	int bannerImgCount = StringUtils.countOccurrencesOf(vo.getPRODUCT_BANNER(), ",");
	
	//리뷰 관련
	ArrayList<Product_reviewVO> reviewList = (ArrayList<Product_reviewVO>) request.getAttribute("reviewList");
	ArrayList<Product_reviewVO> review_RE_List = (ArrayList<Product_reviewVO>) request.getAttribute("review_RE_List");
	int reviewCount = ((Integer) request.getAttribute("reviewCount")).intValue(); // (전체/카테고리)글 개수
	int review_RE_Count = ((Integer) request.getAttribute("review_RE_Count")).intValue(); // (전체/카테고리)글 개수
	int nowpage = ((Integer) request.getAttribute("reviewpage")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
	//리뷰 이미지 수 구하기
	int[] reviewImgCount = new int[reviewList.size()];	
	for(int i=0; i<reviewImgCount.length; i++) {
		reviewImgCount[i] = StringUtils.countOccurrencesOf(reviewList.get(i).getREVIEW_FILE(), ",");
		/*
		System.out.println("--------------------------");
		System.out.println( i + "번째 reviewImgCount = " +  reviewImgCount[i]);
		System.out.println( "reviewImgCount["+i+"]="+reviewImgCount[i]);
		*/
	}
	//리뷰 멤버 관련
	ArrayList<MemberVO> reviewMemberList = (ArrayList<MemberVO>) request.getAttribute("reviewMemberList");
	ArrayList<MemberVO> review_RE_MemberList = (ArrayList<MemberVO>) request.getAttribute("review_RE_MemberList");
	System.out.println("reviewMemberList.size() = " + reviewMemberList.size());
	/*
	for(int i = 0; i < reviewMemberList.size(); i++) {      
	   System.out.println(
	         "reviewMemberList.get(0).getMEMBER_NICK()" +
	         reviewMemberList.get(0).getMEMBER_NICK()
	         );
	}
	*/
	//qna 관련
	ArrayList<Product_qnaVO> qnaList = (ArrayList<Product_qnaVO>) request.getAttribute("qnaList");
	ArrayList<Product_qnaVO> qna_RE_List = (ArrayList<Product_qnaVO>) request.getAttribute("qna_RE_List");	
	int qnaCount = ((Integer) request.getAttribute("qnaCount")).intValue(); 
	int qna_RE_Count = ((Integer) request.getAttribute("qna_RE_Count")).intValue(); 
	int qnanowpage = ((Integer) request.getAttribute("qnapage")).intValue();
	int qnamaxpage = ((Integer) request.getAttribute("qnamaxpage")).intValue();
	int qnastartpage = ((Integer) request.getAttribute("qnastartpage")).intValue();
	int qnaendpage = ((Integer) request.getAttribute("qnaendpage")).intValue();   
	//qna 멤버 관련
	ArrayList<MemberVO> qnaMemberList = (ArrayList<MemberVO>) request.getAttribute("qnaMemberList");
	System.out.println("qnaMemberList.size() = " + qnaMemberList.size());
	/*
	for(int i = 0; i < qnaMemberList.size(); i++) {
	   System.out.println(
	         "reviewMemberList.get(0).getMEMBER_NICK()" +
	         reviewMemberList.get(0).getMEMBER_NICK()
	         );
	}
	*/
	System.out.println("qnaCount = " + qnaCount);
	//qna 원글 일반 멤버 관련
	
	//qna 답글 공방 멤버 관련
	int WorkshopNum = ((Integer) request.getAttribute("WorkshopNum")).intValue();
	String WorkshopName = (String)request.getAttribute("WorkshopName");
	String WorkshopPicture = (String)request.getAttribute("WorkshopPicture");
	System.out.println("WorkshopName="+WorkshopName);
	System.out.println("WorkshopPicture="+WorkshopPicture);
	
	//날짜 포맷 형식
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	BasketVO basketVO = new BasketVO();

	/*
      if(MEMBER_EMAIL != null && MEMBER_NUM != 0) {}
	
	*/
	
%>  

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
		<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/js/Store/pager.js">
		  --%>
	<style>
         @charset "UTF-8";
         
         img {
            max-width: 100%;
            height: auto;
         }
         
         table {
            font-size: 0.98em;
         }
         
         .nav_tab {
            background-color: #FEE100;
         }
         
         /*안 먹힘*/
         @media screen and (max-width: 375px) { 
            .nav-item {
               font-size:0.5em !important;
            }
            
         }
         
         .name {
            font-weight: bold;
         }
         
         .smallfont {
            font-size: 0.7em;
         }
         
         a {
            color: gray;
            text-decoration: none;
         }
         

         .row_ship_info {
            padding:3px;
         }      
      
         @font-face {
            font-family: 'KOMACON';
            src:
               url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')
               format('woff');
            font-weight: normal;
            font-style: normal;
         }
         
         .Precautions dl dd {
            font-size: 0.7rem;
         }
         
         #subject {
            font-size: 1.0rem;
         }
         
         .class-detail-container {
            margin-top: 100px;
            margin-bottom: 100px;
         }
         
         .hr-class {
            width: 100%;
            color: #f6f6f6;
            margin-top: 100px;
            margin-bottom: 100px;
         }
         
         .order-body {
            font-family: '만화진흥원체', 'KOMACON', KOMACON;
         }
         
         .sticky {
            padding-top: 5%;
            z-index:2;
            position: -webkit-sticky;
            position: sticky;
            background-color: #FFFFFF;
            top: 0;
         }
         
         .sticky2 {
            z-index:2;
            position: -webkit-sticky;
            position: sticky;
            background-color: #FFFFFF;
            top: 20px;
         }
         
         .nav-item .nav-link {
            color: #9d9d9d;
         }
         
         .comments_table {
            font-size: 1rem;
         }
         
         @media ( max-width : 700px) {
            .comments_table {
               font-size: 0.7rem;
            }
         }
         
         div.col-2 img {
            width: 100%;
            height: 100%;
         }
         
         
         .rep_content {
            font-size: 1.0em;
         }
         
         hr {
            background-color: #EF902E;
         }
      
         /*review*/
         .reviews_table {
            color: #212529;
         }
         .review_sum {
            width: 100%; 
            margin: 0 auto;
            background-color:#FAFAFA;
            border-radius:10px;
            /*border-top:1px solid RGBA(239, 144, 46, 0.3);*/
            padding: 10px 0 3px 10px;
            
         }
         .review_img {
            width:100px;
            height:100px;
         }
         .review_add_section {
         /*
            background-color: #FAFAFA;
         */
         }
         .review_hidden {
            display:none;
            border:1px solid RGBA(35, 39, 43, 0.3);
            border-radius:10px;
            padding:15px 0;
            margin:0 20px;
         }
         .review_file_preview {
            width:100px;
            height:100px;
         }
         .review_grade {
            width: 80% !important; 
            margin: 0 auto !important;         
         }
         .review_file_upload {
            width: 80% !important; 
            margin: 0 auto !important;               
         }
         .reviewspace {
            display:block;
         }
         .review_control {
            text-align:right;
         }
         .review_control a {
            color : #343A40;
            font-weight:bold;
            font-size:0.7rem;
         }
         /*review 답글*/
         .review_re {
            text-align:right;
         }
         .review_re a {
            color : #343A40;
            font-weight:bold;
            font-size:0.7rem;
         }
         .review_RE_control {
            text-align:right;
         }
         .review_RE_control a {
            color : #343A40;
            font-weight:bold;
            font-size:0.7rem;
         }
         .review_RE_control_hidden {
            text-align:right;
            display:none;
         }
         .review_RE_control_hidden a {
            color : #343A40;
            font-weight:bold;
            font-size:0.7rem;
         }
         .review_re_hidden {
            display:none;
         }
         .review_re_insert_hidden {
            display:none;
         }
         
         .review_re_insert {
            text-align:right;
         }
         .review_re_insert a {
            color : #343A40;
            font-weight:bold;
            font-size:0.7rem;         
         }
         
         .review_re_sum {
            width: 100%; 
            margin: 0 auto;
            padding: 3px 0;
         }
         .review_RE_modify_hidden {
            display:none;
         }
         
         
         /*qna*/
         
         .qnas_table {
            color: #212529;
         }         
         
         .qna_sum {
            width: 100%; 
            margin: 0 auto;
         }

         .qna_add_section {
	         display:none;
            background-color: #FAFAFA;
         }         
         
         .qna_mod_section {
         	display:none;
         }
         
         .qna_control {
            text-align:right;
         }
         .qna_control a {
            color : #343A40;
            font-weight:bold;
            font-size:0.7rem;
         }
         
         .qna_control_hidden {
         	text-align:right;
         }
         
         .qna_control_hidden a {
         	color : #343A40;
            font-weight:bold;
            font-size:0.7rem;
         }
         
         .qna_re_form {
         	display:none;
         }

         .qna_re_control {
			text-align:right;         
         }
         .qna_re_control a {
			color : #343A40;
            font-weight:bold;
            font-size:0.7rem;         
         }
         
         .qna_re_control_hidden {
			text-align:right;
			display:none;         
         }
         
         .qna_re_control_hidden a{
			color : #343A40;
            font-weight:bold;
            font-size:0.7rem;  
         }
                  
         
         /*별점주기*/
         .star-rating { 
            width:52px; 
         }
         .star-rating,.star-rating span { 
            display:inline-block; height:10px; overflow:hidden; background:url('${pageContext.request.contextPath}/resources/images/star_2.png') no-repeat; 
         }
         .star-rating span{ 
            background-position:left bottom; line-height:0; vertical-align:top; 
         }   
         
         
         /*리뷰 이미지 호버*/   
         .img {
            width:100px;
         }
         .review_img_modify {
            width:100px;
            height:100px;         
         }      
         .hover-image {
            transition: .5s ease;
            opacity: 0;
            position:relative;
            top: 7%;
            left: -8.5%;
            transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
         }
         .img:hover .img {
            opacity: 0.3;
         }
         .img:hover #test {
            opacity: 1;
         }            
         
         .addlike {
            background-color:#23272B !important;
            color:white !important; 
         }
         .row h6{
         	margin-left:30px; 
         }
         .row h6 a,.row h6 a:link,.row h6 a:hover{
		  text-decoration: none !important;
		  color: black !important;
		}
		
		.clickable {cursor: pointer;}
		.hover {text-decoration: underline;}
		.odd{ background: #FFC;}
		.even{ background: #FF9;}
		.active{ width:10px; height:10px; background:#f60; color:white;}	 
	</style>

	<script>
	$(document).ready(function() {
//			getReviewList();
//			  pageMove(1);	//페이지에 처음 들어올 경우 고려
	});	
 
	//https://www.podo-dev.com/blogs/15
<%-- 	function pageMove(pg){
		console.log(pg)
		console.log(<%=PRODUCT_NUM%>)
		var perPgLine = 5;
		$.ajax({
			type : "POST",
			url : "/NAGAGU/getReviewList.pro",
            dataType : 'json',
            contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			data : { 'pg' : pg, 'PRODUCT_NUM' : <%=PRODUCT_NUM%> },	//pg:선택한 페이지, perPgLine : 페이지당 게시글 개수
			dataType: 'JSON',
			success : function(retVal) {
				console.log(retVal)
				if(retVal.res == "OK") {
					var arr = retVal.reviewList;
					var reviewCount = retVal.reviewCount;
					var page = pg;
					//update board from data	//게시글을 다시 그려줌
					//페이징을 다시 그려줌
					updatePaging("pageMove", page, reviewCount, 5, 3); 
					
				} else if (retVal.res == "FAIL") {
					alert("FAIL");
				}
				 
				
			},
			error : function(e) {
				alert('실패')
				console.log(e);
			}
		});
	}	
	//페이징 다시 그려줌
	//callFunc : 페이지 클릭 시 호출되는 함수이다. 1을 누르면 pagemove(1) 호출.
	//page  : 현재 페이지
	//allRowCnt : 전체 게시글 수
	//perPgLine : 페이지당 게시글 수
	//pgGrpCnt : 페이징을 몇개씩 묵을 것인가. ex.3인경우  (1,2,3) (4,5,6)
	function updatePaging(callFunc, page, allRowCnt, perPgLine, pgGrpCnt){
		console.log("callFunc = "+callFunc)
		console.log("page = "+page)
		console.log("allRowCnt = "+allRowCnt)
		console.log("perPgLine = "+perPgLine)
		console.log("pgGrpCnt = "+pgGrpCnt)
//		var boardPager	= $('.ReviewListSection22');	//페이징을 담을 곳
		var boardPager	= $('.ReviewList_Sum');	//페이징을 담을 곳
		var	pager		= drawPager(callFunc, page, allRowCnt, perPgLine, pgGrpCnt);
				
		boardPager.empty();
		boardPager.append(pager);
	}
	// drawPager() 함수를 호출하여, 그려진 페이징을 가져오자.
	function drawPager(callFunc, page, allRowCnt, perPgLine, pgGrpCnt) {
		var output='';
		output += '<div class="ReviewList">'		
		output += '<div class="col-1 justify-content-end">'		
		
		return output;
	} 
	 --%>

	
	</script>	
	
	
</head>
	<body class="order-body">
		<!-- content start -->
		<div class="container class-detail-container">
			<div class="row justify-content-between title">
				<h6><a href="productlist.pro?PRODUCT_CATEGORY=all">STORE</a> > 상세보기 </h6>
            </div>
			<div class="col-12 text-center" style="padding-bottom: 5%;">
				<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
					<div class="carousel-inner text-center">
					<% for(int i = 0; i < (bannerImgCount)+1; i++) { 
						if(vo.getPRODUCT_BANNER().equals("#")) { %>
						<div class="carousel-item"><img src="#" class="d-block w-100" style="display: none;"></div>
					<% 	} else {
							if(i == 0) { %>
								<div class="carousel-item active" style="width: 1300px; height: 530px;">
									<img src="/productupload/image/<%=vo.getPRODUCT_BANNER().split(",")[i]%>" class="d-block w-100" style="max-width: 100%; height: 100%;">
								</div>
					<% 			continue;
							} 
					%>            
						<div class="carousel-item" style="width: 1300px; height: 530px;">
							<img src="/productupload/image/<%=vo.getPRODUCT_BANNER().split(",")[i]%>" class="d-block w-100" style="max-width: 100%; height: 100%;">
						</div>                            
					<%
						}
					} %>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col-8">
					<div style="line-height: 0.5em;" id="t1">
					<dl>
						<dt><h3><%=vo.getPRODUCT_TITLE() %></h3><br></dt>
						<dl><h5><%=vo.getPRODUCT_BRIEF() %></h5></dl>
					</dl>
					</div>
					<div class="row sticky">
						<div class="col-12">
							<ul class="nav nav-tabs nav-fill h-30">
								<li class="nav-item">
								   <a class="nav-link" href="#t1"><h5>상품정보</h5></a>
								</li>
								<li class="nav-item">
								   <a class="nav-link" href="#t2"><h5>리뷰</h5></a>
								</li>
								<li class="nav-item">
								   <a class="nav-link" href="#t3"><h5>Q&A</h5></a>
								</li>
								<li class="nav-item">
							      <a class="nav-link" href="#t4"><h5>배송/환불</h5></a>
							   </li>
							</ul>
						</div>
					</div>
					<div class="row justify-content-center">
					<% if (vo.getPRODUCT_INFO() != null) { %>
						<%=vo.getPRODUCT_INFO() %>
						<br /><br />
					<% } else { %>
						<!-- vo.getPRODUCT_INFO() = 없는 경우-->
						<table width="50%" border="0" cellpadding="0" cellspacing="0" align="center" valign="middle">
							<tr align="center" valign="middle">
								<td align="right"><font size=2>상세 정보가 없습니다.</font></td>
							</tr>
						</table>
					<% } %>
					</div>
					<!-- 상세 사진정보 끝 -->
					
					<span id="t2"></span>
					<br /><br /><hr />
	            
					<!-- 리뷰 테이블 시작 -->
					<h3 id="review_scroll" >Review</h3>
					<br /><br />
				
					<!-- ajax 이용해 뿌려주기 (미완성)-->		
					<div class="ReviewListSection22"></div>
					<br/><br/><br/><br/><br/>
		
		
					<div class="ReviewSection"> <!-- ReviewSection start (리뷰 전체 영역) -->
						<div class="ReviewSection_wrap">
							<div class="ReviewformSection" style="padding:8px 0; border-bottom:1px solid gray;"> <!-- 리뷰 작성 영역 -->
								<div class="row justify-content-center">
									<div class="col-1 justify-content-end">
										프사
									</div>
									<div class="col-11">
										<div class="row">
											<div class="col-2 justify-content-end name">닉네임</div>
											<div class="col-8 justify-content-center"></div>
											<div class="col-2 justify-content-center smallfont">날짜</div>
										</div>
										<div class="row"> <!-- 파일, 평점 -->
											<div class="col-9"></div>
											<div class="col-1 pl-0 pr-0">
												<img src="${pageContext.request.contextPath}/resources/images/star1.png" alt="" width="15px" height="15px">
											</div>
											<div class="col-2 pl-0">									
												<select name="REVIEW_GRADE" id="REVIEW_GRADE" class="form-control input-sm" style="height:80%">
													<option value="0">0</option>
													<option value="0.5">0.5</option>
													<option value="1.0">1.0</option>
													<option value="1.5">1.5</option>
													<option value="2.0">2.0</option>
													<option value="2.5">2.5</option>
													<option value="3.0">3.0</option>
													<option value="3.5">3.5</option>
													<option value="4.0">4.0</option>
													<option value="4.5">5.5</option>
													<option value="5.0">5.0</option>
												</select>
											</div>
										</div>
										<div class="row">	<!-- 내용 -->
											<div class="col">
												내용 insertform
											</div>	
										</div>
										<div class="row"> <!-- 답글, 수정, 삭제 -->
											<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;">답글</div>
											<div class="col-8 justify-content-center"></div>
											<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;">
												<a class="">수정</a> &nbsp;
												<a class="">삭제</a>
											</div>
										</div>
									</div>
								</div>
							</div> <!-- 리뷰 작성영역 끝 -->
							
							<div class="ReviewtableSection pb-2" style="padding-top:8px; padding-bottom:8px; "> <!-- 리뷰 테이블 : insert시 삽입되는 영역 + List영역(+답글)-->
								<div class="reviewInsertSpace pb-2" > <!-- 작성한 리뷰가 들어오는 영역 -->
								
								</div>
								<div class="ReviewList_Sum"> <!-- 리뷰 리스트들(리뷰+리뷰답글) -->
									<div class="ReviewList pb-3"> <!-- 리뷰영역 -->
										<div class="row justify-content-center">
											<div class="col-1 justify-content-end">
												프사
											</div>
											<div class="col-11">
												<div class="row pb-1">
													<div class="col-2 justify-content-end name">닉네임</div>
													<div class="col-8 justify-content-center"></div>
													<div class="col-2 justify-content-center smallfont">날짜</div>
												</div>
												<div class="row pb-2"> <!-- 평점 -->
													<div class="col-12 " style="font-size:0.7em; font-weight:bold;">
														평점
													</div>
												</div>
												<div class="row pb-2"> <!-- 평점 hidden -->
													<div class="col-12 " style="font-size:0.7em; font-weight:bold;">
														평점
													</div>
												</div>
												<div class="row pb-2">	<!-- 내용 -->
													<div class="col-11 pr-0">
														얘는 답글이 없음 ㅎㅎㅎㅎ 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 
													</div>	
												</div>
												<div class="row pb-2">	<!-- 수정폼 대비 -->
													<div class="col-11 pr-0">
														<textarea rows="2" name="REVIEW_CONTENT" class="col-12 pl-0" 
															id="qna_re_content">답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 하하하하하하하하하하하하</textarea>
													</div>	
												</div>
												<div class="row"> <!-- 답글, 수정, 삭제 -->
													<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;">답글</div>
													<div class="col-8 justify-content-center"></div>
													<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;">
														<a class="">수정</a> &nbsp;
														<a class="">삭제</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 선 -->
									<div class="ReviewList pb-2" style="border-top:1px solid gray;"> <!-- 리뷰영역 -->
										<div class="row justify-content-center">
											<div class="col-1 justify-content-end">
												프사
											</div>
											<div class="col-11">
												<div class="row">
													<div class="col-2 justify-content-end name">닉네임</div>
													<div class="col-8 justify-content-center"></div>
													<div class="col-2 justify-content-center smallfont">날짜</div>
												</div>
												<div class="row"> <!-- 평점 -->
													<div class="col-12 " style="font-size:0.7em; font-weight:bold;">
														평점
													</div>
												</div>
												<div class="row">	<!-- 내용 -->
													<div class="col">
														내용2
													</div>	
												</div>
												<div class="row"> <!-- 답글, 수정, 삭제 -->
													<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;">답글</div>
													<div class="col-8 justify-content-center"></div>
													<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;">
														<a class="">수정</a> &nbsp;
														<a class="">삭제</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="Review_ReplyList"> <!-- 리뷰 답글 영역 -->
										<div class="row justify-content-center">
											<div class="col-1"></div>
											<div class="col-1">프사</div>
											<div class="col-10">
												<div class="row">
													<div class="col-2 justify-content-end name">닉네임</div>
													<div class="col-8 justify-content-center"></div>
													<div class="col-2 justify-content-center smallfont pl-1">날짜</div>
												</div>
												<div class="row"> <!-- 평점 -->
													<div class="col-12 " style="font-size:0.7em; font-weight:bold;">
														
													</div>
												</div>
												<div class="row">	<!-- 내용 -->
													<div class="col">
														답글내용
													</div>	
												</div>
												<div class="row"> <!-- 답글, 수정, 삭제 -->
													<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;"></div>
													<div class="col-8 justify-content-center"></div>
													<div class="col-2 justify-content-center pl-1" style="font-size:0.7em; font-weight:bold;">
														<a class="">수정</a> &nbsp;
														<a class="">삭제</a>
													</div>
												</div>
													
											</div>
										</div>
									</div>
									
									
									
									
									
									
									
									
									
									
											
									
									
									
									
									
								</div>
							</div>
						</div>
					</div>	<!-- ReviewSection end -->
				
				
				<br/></br><!-- 페이지네이션 영역 -->
				<div class="ReviewListSection22"></div>
				<br/></br>				
				
				
				
				
					<hr style="border:1px solid gray;"></hr>
					<!-- 리뷰 등록하기 -->      
					<br/>
					<div class="review_add_section justify-content-center"  style="width: 100%; margin: 0 auto;">
					             <div class="row justify-content-center pt-3 pb-3">
					                <button class="btn btn-dark btn-sm review_add">댓글 달기</button>
					             </div>
					<form id="reviewform" enctype="multipart/form-data">
						<input type="hidden" name="REVIEW_PRODUCT" value="<%=PRODUCT_NUM %>">
					<div class="review_hidden">
						<div class="review_grade" >
							<img src="${pageContext.request.contextPath}/resources/images/star1.png" alt="" width="15px" height="15px"> 
					&nbsp; : &nbsp; 
					<input type="text" id="gradetext" name="REVIEW_GRADE" size="3" style="height:90%;"> &nbsp;/5.0
					</div>
					<div class="review_file_upload pb-2"  >
						<div class="row pt-2 pb-2" >
							<div class="input_wrap">
								<input multiple="multiple" type="file" name="REVIEW_FILE" id="input_imgs">
							</div>
						</div>
						<div>
							<div class="imgs_wrap">
								<img id="inputimg" >
							</div>
						</div>
					</div>
					<div class="row justify-content-center pb-3">
						<textarea name="REVIEW_CONTENT" id = "REVIEW_CONTENT" placeholder="후기를 작성해주세요!" cols="90%" rows="5"></textarea>
					</div>
					<div class=" row justify-content-center pb-3">
						<button class="btn btn-dark btn-sm" id="review_insert" style="cursor: pointer;">등록</button>
								</div>
							</div>
						</form>   
					</div>         
					<!-- 리뷰 등록 끝 -->				
	
					<!-- 리뷰 테이블 끝 -->
			
					<span id="t3"></span>
					<br />
					<br />
					<hr />
            
					<!-- Q&A 테이블 시작 -->
					<h3 id="qna_scroll">Q&A</h3>
					<!-- Q&A 테이블 끝 -->
					
					
					<!-- 배송 및 환불 시작 -->
					<h3 id="t4">배송 및 환불</h3>
					<!-- 배송 및 환불 끝 -->
               
				</div>
				<div class="col-4">
					<div class="sticky2" style="border: 1px solid #EAEAEA;">
						<form name="goodsform" action="#" method="post" id="goodsform">
							<div class="row pt-4 pl-4">
								<div class="col-3" >
									<img src="${pageContext.request.contextPath}/resources/images/Community/peko.png" width="95%" >
								</div><hr>
								<div class="col-9">
									<%-- <input type="hidden" name="PRODUCT_NUM" value="<%=vo.getPRODUCT_NUM()%>"> --%>
									<h3 name="PRODUCT_SHOPNAME"><%=vo.getPRODUCT_SHOPNAME()%></h3>
									<p name="PRODUCT_TITLE"><font size="2"><%=vo.getPRODUCT_TITLE()%></font></p>
								</div>
							</div>
							<div>
								<table class="table table-borderless">
									<thead>
										<tr>
											<th scope="col">가격</th>
											<th scope="col" name="PRODUCT_PRICE"><%=vo.getPRODUCT_PRICE()%>원</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">배송비</th>
											<td name="PRODUCT_SHIP_PRICE"><%=vo.getPRODUCT_SHIP_PRICE()%></td>
										</tr>
										<tr>
											<th scope="row">배송 기간</th>
											<td name="PRODUCT_SHIP_DAYS"><%=vo.getPRODUCT_SHIP_DAYS()%>일</td>
										</tr>
										<tr>
											<th scope="row">색상선택</th>
											<td>
												<select name="BASKET_COLOR" size="1">
												<option value="" >선택</option>
												<c:forTokens var="color" items="<%=PRODUCT_COLOR %>" delims=",">
													<option value="${fn:trim(color)}">${fn:trim(color)}</option>
												</c:forTokens>
											</select>
											</td>
										</tr>
										<tr>
											<th scope="row">사이즈선택</th>
											<td>
												<select name="BASKET_SIZE" size="1">
													<option value="">선택</option>
													<c:forTokens var="size" items="<%=PRODUCT_SIZE %>" delims=",">
														<option value="${fn:trim(size)}">${fn:trim(size)}</option>
													</c:forTokens>
												</select>
											</td>
										</tr>
										<tr>
											<th scope="row">수량</th>
											<td>
												<input name="BASKET_AMOUNT" type="text" style="text-align: right" value="1" size="4" /> 
												<a href="JavaScript:count_change(0)">▲</a> 
												<a href="JavaScript:count_change(1)">▼</a> 개
											</td>
										</tr>
										<tr>
											<th scope="row">총 합계금액</th>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="btnArea text-center">
							<% if(WORKSHOP_CEO_NAME == null && MEMBER_EMAIL == null) { %> <%-- 비로그인일 때 --%>
								<button type="button" class="btn btn-outline-dark btn-md" data-toggle="modal" data-target="#exampleModalCenter">
									<input type="hidden" name = "PRODUCT_NUM" value="<%=PRODUCT_NUM %>">♥
								</button>	
								<button type="button" class="btn btn-outline-dark btn-md" data-toggle="modal" data-target="#exampleModalCenter" >장바구니</button>
								<button type="button" class="btn btn-outline-dark btn-md" data-toggle="modal" data-target="#exampleModalCenter" >바로구매</button>
							<% } else if(WORKSHOP_CEO_NAME != null){ %>	<%-- 공방 로그인일 때(하트 안 보임) --%>
								<a href="classreservation.ac" class="btn btn-outline-dark btn-md disabled" role="button" aria-pressed="true">장바구니</a>
								<a href="#" class="btn btn-outline-dark btn-md disabled" role="button" aria-pressed="true" >바로구매</a>
							<% } else { %> <%-- 일반회원일때 --%>
								<a href="#" class="btn btn-outline-dark btn-md " role="button" aria-pressed="true" id="LikeAjax">
									<input type="hidden" name = "PRODUCT_NUM" value="<%=PRODUCT_NUM %>">♥
								</a>
								<a href="#" class="btn btn-outline-dark btn-md" role="button" aria-pressed="true" id="basket_btn">장바구니</a>
								<a href="#" class="btn btn-outline-dark btn-md" role="button" aria-pressed="true" id="order_btn">바로구매</a>
							<% } %>
							</div>
							<br/>
						</form>
					</div>
				</div>
			</div>
			<br/>
		</div>
		<!-- content end -->
		
		
	<script>
	function ReviewList() {
		
		
		
	};
	
	
	</script>	
		
		
		
		
	</body>
</html>