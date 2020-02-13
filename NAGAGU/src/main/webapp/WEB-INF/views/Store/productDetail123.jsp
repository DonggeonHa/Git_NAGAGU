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

	//WORKSHOP이 댓글 달 때 필요
	String WORKSHOP_PICTURE = (String)session.getAttribute("WORKSHOP_PICTURE");
	String WORKSHOP_NAME = (String)session.getAttribute("WORKSHOP_NAME");

	System.out.println("WORKSHOP_PICTURE="+WORKSHOP_PICTURE);
	System.out.println("WORKSHOP_NAME="+WORKSHOP_NAME);	

	//로그인 상태 체크 위한
	Integer MEMBER_STATUS = 100;	//비로그인시 100
	if(MEMBER_NUM != null) {
		MEMBER_STATUS = (Integer)session.getAttribute("MEMBER_STATUS");		
	}
	Integer WORKSHOP_STATUS = 100;	//비로그인시 100
	if(WORKSHOP_NAME != null) {
		WORKSHOP_STATUS = (Integer)session.getAttribute("WORKSHOP_STATUS");		
	}

	System.out.println("MEMBER_STATUS="+MEMBER_STATUS);
	System.out.println("WORKSHOP_STATUS="+WORKSHOP_STATUS);
	
	//(QNA)글쓴이만 답글 버튼이 보인다. 글쓴이인지 체크하기 위해 이 글의 WORKSHOP_NUM 받아옴
	int WorkshopMatchingNumber = (int)request.getAttribute("WorkshopMatchingNumber");
	Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");

	System.out.println("WotkshopMatchingNumber="+WorkshopMatchingNumber);


	
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

	//qna 관련
	ArrayList<Product_qnaVO> qnaList = (ArrayList<Product_qnaVO>) request.getAttribute("qnaList");
	ArrayList<Product_qnaVO> qna_RE_List = (ArrayList<Product_qnaVO>) request.getAttribute("qna_RE_List");	
	int qnaCount = ((Integer) request.getAttribute("qnaCount")).intValue(); 
	int qna_RE_Count = ((Integer) request.getAttribute("qna_RE_Count")).intValue(); 
	int qnanowpage = ((Integer) request.getAttribute("qnapage")).intValue();
	int qnamaxpage = ((Integer) request.getAttribute("qnamaxpage")).intValue();
	int qnastartpage = ((Integer) request.getAttribute("qnastartpage")).intValue();
	int qnaendpage = ((Integer) request.getAttribute("qnaendpage")).intValue();   

	
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
<%-- 		<script src="<c:url value="/resources/js/Store/productdetail.js"/>"></script>		 --%>
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
		/*input type=file css*/
		.file_input label {
			position:relative;
			cursor:pointer;
			display:inline-block;
			vertical-align:middle;
			overflow:hidden;
			width:80px;
			height:30px;
			background:RGBA(204, 204, 204, 0.5);
			color:black;
			text-align:center;
			line-height:30px;
			margin-bottom:0;
			font-size:0.8rem;
			padding:1px 1px;
			border-radius:3px;
		}
		.file_input label input {
			position:absolute;
			width:0;
			height:0;
			overflow:hidden;
		}
		.file_input input[type=text] {
			vertical-align:middle;
			display:inline-block;
			width:400px;
			height:28px;
			line-height:28px;
			font-size:11px;
			padding:0;
			border:0;
		}
		
		/*댓글달기 버튼*/
		.ReviewformSection {
			display:none;		
		}
		
		.imgs_wrap {
			display:none;
		}

		.review_img {
			width:100px;
			height:100px;
		}
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
		<div class="container class-detail-container category_st">
			<div class="row justify-content-between title">
				<h6><a href="productlist.pro?PRODUCT_CATEGORY=all">STORE</a> > 상세보기 </h6>
            </div>
			<div class="col-12 text-center" style="padding-bottom:5%;">
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
					<br/><br/><br/>
		
		
					<div class="ReviewSection"> <!-- ReviewSection start (리뷰 전체 영역) : 하나 -->
						<div class="row justify-content-center review_btn_section pt-3 pb-3"> <!-- 리뷰 댓글달기 버튼 -->
							<button class="btn btn-dark btn-sm review_btn">댓글 달기</button>
						</div>
						<div class="ReviewSection_wrap pb-1"> <!-- wrap영역(리뷰 전체 영역 wrap): 하나 -->
							<form id="reviewForm" name="REVIEW_CONTENT" enctype="multipart/form-data"> <!-- 리뷰 작성 폼 영역 : 하나 -->
								<div class="ReviewformSection" style="padding:8px 0; border-bottom:1px solid gray;"> 
									<div class="row justify-content-center">
										<div class="col-1 justify-content-end">
											<img src="<%=MEMBER_PICTURE %>" alt="" class="rounded-circle">
										</div>
										<div class="col-11">
											<div class="row pb-1">
												<div class="col-2 justify-content-end name"><%=MEMBER_NICK %></div>
												<div class="col-8 justify-content-center"></div>
												<div class="col-2 justify-content-center smallfont"></div>
											</div>
											<div class="row pb-1"> <!-- 평점 -->
												<div class="col-3 pr-0">
													<img src="${pageContext.request.contextPath}/resources/images/star1.png" alt="" width="15px" height="15px" >
													&nbsp;
													<select name="REVIEW_GRADE" id="REVIEW_GRADE" style="width=15px;" >
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
												<div class="9"></div>
											</div>
											<div class="row pb-1"> <!-- 파일 -->
												<div class="col-12">
													<div class="file_input">
													    <label>
													        사진 업로드
													        <input type="file" multiple="multiple" name="REVIEW_FILE" id="input_imgs">
													    </label>
													    <input type="text" readonly="readonly" title="File Route" value="선택된 파일이 없습니다">
													</div>			
												</div>
											</div>
											<div class="row pb-1">
												<div class="col-12 imgs_wrap">
													<img id="inputimg" >
												</div>
											</div>
											<div class="row pb-1">	<!-- 내용 textarea -->
												<div class="col-11 pr-0">
													<textarea rows="3" name="REVIEW_CONTENT" class="col-12 pl-0 pr-0" 
														id=""></textarea>
												</div>	
											</div>
											<div class="row"> <!-- 답글, 수정, 삭제 -->
												<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;"></div>
												<div class="col-8 justify-content-center"></div>
												<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;">
													<a class="" style="cursor: pointer;">작성</a> &nbsp;
													<a class="formCancel" value="reviewForm" style="cursor: pointer;">취소</a>
												</div>
											</div>
										</div>
									</div>
								</div> 
							</form> <!-- 리뷰 작성영역(리뷰 작성 폼) 끝 -->
							<div class="ReviewtableSection pb-2"> <!-- 리뷰 테이블 : insert시 삽입되는 영역 + List영역(+답글) : 하나-->
								<div class="reviewInsertSpace pb-2" > <!-- 작성한 리뷰가 들어오는 영역 : 하나 -->
									리뷰 들어오는 곳
								</div>
								<div class="ReviewList_Sum_section"> <!-- 리뷰 리스트들(리뷰+리뷰답글) 영역 : 하나 -->
									<!-- 반복 시작 -->
									<!-- ReviewList_Sum id값 주기 -->
									<div class="ReviewList_Sum" style="border-bottom:1px solid gray;"> <!--ReviewList_Sum: 리뷰(하나)+리뷰 답글(여러개)이 묶여서 반복되는 영역 -->
										<!-- ReviewList id값 주기 -->
										<div class="ReviewList pb-3" style="padding-top:8px; padding-bottom:8px;"> <!-- 반복되는 리뷰영역 : 반복 -->
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
													<div class="row pb-2" id="beforeGrade1"> <!-- 수정 전 평점(원래 평점) -->
														<div class="col-12" style="font-size:0.7em; font-weight:bold;">
															0.5 &nbsp;
															<span class='star-rating'>
																<span style ="width:10%"></span>
															</span>
														</div>
													</div>					
													<div class="row afterGrade pb-2" id="afterGrade1" style="display:none;"> <!-- 수정 후 평점 (수정할 평점) -->
														<div class="col-3 pr-0">
															<img src="${pageContext.request.contextPath}/resources/images/star1.png" alt="" width="15px" height="15px" >
															&nbsp;
															<select name="REVIEW_GRADE" id="REVIEW_GRADE1" style="width=15px;" >
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
														<div class="9"></div>
													</div>
													<div class="row pb-2"> <!-- 사진 -->
														<div class="col-12">														       
															<img src="/productupload/image/2b9b8321164b4ce9aaf0f3c7cbf00ee3.jpg" class="review_img">   &nbsp;&nbsp; 
															<img src="/productupload/image/2b9b8321164b4ce9aaf0f3c7cbf00ee3.jpg" class="review_img">   &nbsp;&nbsp; 
															<img src="/productupload/image/2b9b8321164b4ce9aaf0f3c7cbf00ee3.jpg" class="review_img">   &nbsp;&nbsp; 
														</div>
													</div>     													
													<div class="row pb-2" id="beforeContent1">	<!-- 내용 -->
														<div class="col-11 pr-0">
															얘는 답글이 없음 ㅎㅎㅎㅎ 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 
														</div>	
													</div>
													<div class="row afterContent" id="afterContent1" style="display:none;">	<!-- 수정폼 대비 -->
														<div class="col-11 pr-0">
															<input type="hidden" name="REVIEW_NUM" value="1">
															<textarea rows="2" name="REVIEW_CONTENT" class="col-12 pl-0 pr-0" 
																id="qna_re_content">답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 하하하하하하하하하하하하</textarea>
														</div>	
													</div>
													<div class="row"> <!-- 답글, 수정, 삭제 -->
														<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;">답글</div>
														<div class="col-8 justify-content-center"></div>
														<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;">
															<input type="hidden" name="REVIEW_NUM" value="1">
															<a class="modifyReview" value="" style="cursor: pointer;">수정</a> &nbsp;
															<a class="deleteReview" value="" style="cursor: pointer;">삭제</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>	<!-- ReviewList_Sum 1 end -->
									<!-- 선 -->
									
									<div class="ReviewList_Sum" style="border-bottom:1px solid gray;"> <!--ReviewList_Sum: 리뷰(하나)+리뷰 답글(여러개)이 묶여서 반복되는 영역 -->
										<div class="ReviewList pb-3" style="padding-top:8px; padding-bottom:8px;"> <!-- 리뷰영역 2 -->
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
															평점 수정
														</div>
													</div>
													<div class="row pb-2">	<!-- 내용 -->
														<div class="col-11 pr-0">
															얘는 답글이 없음 ㅎㅎㅎㅎ 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 
														</div>	
													</div>
													<div class="row">	<!-- 수정폼 대비 -->
														<div class="col-11 pr-0">
															<textarea rows="2" name="REVIEW_CONTENT" class="col-12 pl-0 pr-0" 
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
										<div class="Review_ReplyList"> <!-- 리뷰 답글 영역 -->
											<div class="Review_ReplyList pb-2"> <!-- 리뷰 답글이 반복되는 영역(review_re) -->
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
											
											<div class="Review_ReplyList pb-2"> <!-- 리뷰 답글이 반복되는 영역(review_re) 2-->
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
									
									
									
									
									
									
									
									
									
											
									
									
									
									
									
								</div> <!-- ReviewList_Sum_section end -->
							</div> <!-- ReviewtableSection end -->
						</div><!-- ReviewSection_wrap end -->
					</div>	<!-- ReviewSection end -->
				
				
				<br/></br><!-- 페이지네이션 영역 -->
				<div class="ReviewListSection22"></div>
				<br/></br>				
				
				
				
				
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
							<% if(WORKSHOP_STATUS == null && MEMBER_STATUS == null) { %> <%-- 비로그인일 때 --%>
								<button type="button" class="btn btn-outline-dark btn-md" data-toggle="modal" data-target="#exampleModalCenter">
									<input type="hidden" name = "PRODUCT_NUM" value="<%=PRODUCT_NUM %>">♥
								</button>	
								<button type="button" class="btn btn-outline-dark btn-md" data-toggle="modal" data-target="#exampleModalCenter" >장바구니</button>
								<button type="button" class="btn btn-outline-dark btn-md" data-toggle="modal" data-target="#exampleModalCenter" >바로구매</button>
							<% } else if(WORKSHOP_STATUS != null){ %>	<%-- 공방 로그인일 때(하트 안 보임) --%>
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
		
//취소버튼들
		$(document).on("click",".formCancel",function(event){
			console.log(this)
			console.log($(this).attr('value'))
			var formType = $(this).attr('value');
			
			
			if(formType=='reviewForm') {
				$('.review_btn').html('댓글 달기');
 				$(".ReviewformSection").css('display','none');
				$('#reviewForm').each(function() {  
					this.reset();  
				});  
				$('.imgs_wrap').empty();
				$(".review_btn_section").show();
			}
			event.preventDefault();	
		});

//Review 등록하기----------------------------------------------------------------------------------------------------	    

		//Review 등록하기 버튼
		$(document).on("click",".review_btn",function(event){
			if(<%=MEMBER_STATUS%> == 100){
				if(<%=WORKSHOP_STATUS%> == 100) {
					alert('로그인 해주세요!');					
				} else {
					alert('리뷰는 회원만 작성 가능합니다.');
				}
				return;
			}
			
			if($(this).html() == '댓글 달기') { //댓글달기이면 hidden구역 보이고 버튼은 닫기로 바뀜      
				$(".ReviewformSection").css('display','block');
				$(this).html('닫기');   
				$(".review_btn_section").css('display','none');	//댓글달기버튼영역 숨김
			} else { //버튼이 닫기이면 hidden 구역이 닫히고 버튼은 댓글 달기로 바뀜
				$(this).html('댓글 달기');
				$(".ReviewformSection").css('display','none');
			}   
		})
		
		
		
		
		
		
		
		$('.file_input input[type=file]').change(function() {
			var fileName = $(this).val();
			var fileCount = $(this).get(0).files.length;
			if($(this).get(0).files.length == 1){
				$('.file_input input[type=text]').val(fileName);
			}
			else {
				$('.file_input input[type=text]').val('파일 '+fileCount+'개');
			}
		});
	
		
		
		//-----------------------------------review insert
		//다중이미지 업로드
		$('#input_imgs').on("change", handleImgFileSelect);
		
		
		/*다중 이미지 업로드*/
		//이미지 정보들을 담을 배열
		var sel_files= [];   
    
		function handleImgFileSelect(e) {
			$('.imgs_wrap').css('display','block');
			//이미지 정보들을 초기화
			sel_files = [];
			$('.imgs_wrap').empty();
			
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			var index = 0;
			filesArr.forEach(function(f) {
				if(!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
          
				sel_files.push(f);
				
				var reader = new FileReader();
				reader.onload = function(e) {
					var html="<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile pr-1' title='Click to remove' width='100' height='100'></a>";
					
					$(".imgs_wrap").append(html);
					index++;
				}
				reader.readAsDataURL(f);          
			});
		}      

		//파일 선택 후 클릭해서 삭제 가능
		/*특정 이미지 삭제*/
		function deleteImageAction(index) {
			var delete_confirm = confirm("삭제하시겠습니까?");
			if(delete_confirm) {
				console.log("index : " + index);
				sel_files.splice(index, 1);
				
				var img_id = "#img_id_" + index;
				console.log("img_id : " + img_id);
				$(img_id).remove();
				
				console.log("sel_files : " + sel_files);            
			} 
		}

		
		
//Review 수정하기----------------------------------------------------------------------------------------------------	  		
				
		$(document).on("click",".modifyReview",function(event){
			var REVIEW_NUM = $(this).prev().val();
			console.log("REVIEW_NUM : " + REVIEW_NUM)
			
			$('#beforeGrade'+REVIEW_NUM).css('display', 'none');	//원래 평점은 숨김
			$('#afterGrade'+REVIEW_NUM).css('display', 'block');	//수정할 평점 폼 보임 
			
			$('#beforeContent'+REVIEW_NUM).css('display', 'none');	//원래 내용은 숨김
			$('#afterContent'+REVIEW_NUM).css('display', 'block');	//수정할 내용 폼 보임
			
			//원래 평점을 set해줌
			$("#REVIEW_GRADE"+REVIEW_NUM).val("0.5").prop("selected", true); //값이 1인 option 선택(값 가져와야함)
			
			//이미지 가져와서 뿌려줘야함
			
			
		});
		
		
//Review 삭제하기----------------------------------------------------------------------------------------------------	  		
				
		$(document).on("click",".deleteReview",function(event){
			var REVIEW_NUM = $(this).prev().prev().val();
			console.log("REVIEW_NUM : " + REVIEW_NUM)		
		});
		
		
		
		
		
		/*날짜 형식 변경*/
		function date_format(format) {
			var year = format.getFullYear();
			var month = format.getMonth() + 1;
			if(month<10) {
				month = '0' + month;
			}
			var date = format.getDate();
			if(date<10) {
				date = '0' + date;
			}
			
			return year + "-" + month + "-" + date + " " ;
		}		
		
		/*
		
var review_DATE = new Date(data.review_DATE);
                     var date = date_format(review_DATE);		
		*/
		
		
		//리뷰 이미지를 클릭하면 원본 사이즈로 커짐(기본은 100)
		$(".review_img").click(function(){
			if($(this).css('width') != '100px' ) {
				$(this).css({'width':'100','height':'100'});
			} else {
				$(this).css({'width':'100%','height':'100%'});
			}
		})		
	</script>	
		
		
		
		
	</body>
</html>