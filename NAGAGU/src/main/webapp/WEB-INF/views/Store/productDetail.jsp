<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
	System.out.println("ProductDetail.jsp");
	
	//로그인 상태 체크 위한
	String MEMBER_NICK = (String)session.getAttribute("MEMBER_NICK");
	
	MemberVO LoginMemberVO = null;
	String MEMBER_PICTURE = null;
	if((MemberVO)request.getAttribute("LoginMemberVO") != null) {
		LoginMemberVO = (MemberVO)request.getAttribute("LoginMemberVO");
		MEMBER_PICTURE = LoginMemberVO.getMEMBER_PICTURE();
	}
	//상품상세 관련
	ProductVO vo = (ProductVO)request.getAttribute("productVO");
	String PRODUCT_CATEGORY = (String)request.getAttribute("PRODUCT_CATEGORY");
	int PRODUCT_NUM = ((Integer)request.getAttribute("PRODUCT_NUM")).intValue();
	String PRODUCT_COLOR = vo.getPRODUCT_COLOR();
	String PRODUCT_SIZE = vo.getPRODUCT_SIZE();
	String PRODUCT_OPTION = vo.getPRODUCT_OPTION();
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
	System.out.println("qnaList.size = " + qnaList.size());
	
	int qnaCount = ((Integer) request.getAttribute("qnaCount")).intValue(); // (전체/카테고리)글 개수
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
	//날짜 포맷 형식
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
		<script src="<c:url value="/js/jquery.form.min.js"/>"></script>	
		<script src="<c:url value="/js/jquery-3.1.0.min.js"/>"></script>				
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">



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
			
			.navbar-nav>li {
				padding-left: 30px;
				padding-right: 30px;
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
				background-color: #FAFAFA;
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
		</style>

	</head>
	<body class="order-body">
		<!-- content start -->
		<div class="container class-detail-container">
			<div class="col-12 text-center" style="padding-bottom: 5%;">
				<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
 					<div class="carousel-inner text-center">
    					<div class="carousel-item active">
    						<img src=<%=vo.getPRODUCT_PIC().split(",")[0]%> alt="" class="img-responsive img-rounded w-100" width="100%" />
    					</div>
    					<div class="carousel-item">
    						<img src=<%=vo.getPRODUCT_PIC().split(",")[1]%>	alt="" class="img-responsive img-rounded w-100" width="100%" />
    					</div>
    					<div class="carousel-item">
      						<img src=<%=vo.getPRODUCT_PIC().split(",")[2]%>	alt="" class="img-responsive img-rounded w-100" />
    					</div>
    					<div class="carousel-item">
      						<img src=<%=vo.getPRODUCT_PIC().split(",")[3]%>	alt="" class="img-responsive img-rounded w-100" />
    					</div>
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
							<dt><h3>메이킹퍼니처 | 원목테이블</h3><br></dt>
							<dl><h5>합판과 나사못을 전혀 사용하지 않는 가구</h5></dl>
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
					<%
						if (vo.getPRODUCT_PIC_COUNT() > 0) {
							if (vo.getPRODUCT_PIC_COUNT() > 3) { //본문 이미지는 i=4부터 출력
								//System.out.println("vo.getPRODUCT_PIC_COUNT()=" + vo.getPRODUCT_PIC_COUNT());
								for (int i = 4; i < vo.getPRODUCT_PIC_COUNT(); i++) {
									
									
					%>
									<img src=<%=vo.getPRODUCT_PIC().split(",")[i]%> alt="" class="img-responsive img-rounded" />
					<%
								}
							} else { //본문 사진이 없을 경우
					%>
								<table width="50%" border="0" cellpadding="0" cellspacing="0" align="center" valign="middle">
									<tr align="center" valign="middle">
										<td align="right"><font size=2>상세 정보 입력 전입니다.</font></td>
									</tr>
								</table>
					<%
							}
					%>
					<br /><br />
					<%
						} else {
					%>
							<!-- vo.getPRODUCT_PIC_COUNT() = 0 인 경우-->
							<table width="50%" border="0" cellpadding="0" cellspacing="0" align="center" valign="middle">
								<tr align="center" valign="middle">
									<td align="right"><font size=2>등록된 상품 내용이 없습니다.</font></td>
								</tr>
							</table>
					<%
						}
					%>
				</div>
				<!-- 상세 사진정보 끝 -->
				
				
				<span id="t2"></span>
				<br /><br /><hr />
				
				<!-- 리뷰 테이블 시작 -->
				<h3 id="review_scroll" >Review</h3>
				<br /><br />
				<div class="reviews_table" >
					<!-- 리뷰 작성시 Ajax로 이 자리에 insert -->
					<div class="review_sum justify-content-center" >
						<div class="row justify-content-center reviewspace">
							
						</div>
					</div>

				<%
					if (reviewCount > 0) {
						for (int i = 0; i < reviewList.size(); i++) {
							MemberVO memberVO = reviewMemberList.get(i);
							Product_reviewVO reviewVO = reviewList.get(i);						
				%>		
					
					<div class="review_sum justify-content-center" id="review_<%=reviewVO.getREVIEW_NUM() %>">	
						<div class="row justify-content-center"> 				
							<div class="col-1 justify-content-end">
								<img src="<%=memberVO.getMEMBER_PICTURE() %>" alt="" class="rounded-circle">
							</div>
							<div class="col-11">
								<div class="row">
								<%
								System.out.println();
								System.out.println("닉네임="+memberVO.getMEMBER_NICK());
								System.out.println("member 번호="+memberVO.getMEMBER_NUM());
								System.out.println("이메일="+memberVO.getMEMBER_EMAIL());
								System.out.println();
								%>
									<div class="col-10 justify-content-end name"><%=memberVO.getMEMBER_NICK() %></div>
									<div class="col-2 justify-content-center smallfont"><%=sdf.format(reviewVO.getREVIEW_DATE())%></div>
								</div>
								<div class="row">
									<!-- 새로 -->
									<div class="col-12 " style="font-size:0.7em; font-weight:bold;">
										<%
										Double rate = 20 * reviewVO.getREVIEW_GRADE();
										%>
										<%=reviewVO.getREVIEW_GRADE() %> &nbsp;
										<span class='star-rating'>
										<span style ="width:<%=rate %>%"></span>
										</span>
									</div>
								</div>
								<div class="row"> <!-- 사진 -->
									<div class="col-12">
									<%
										for(int k = 0; k < (reviewImgCount[i])+1; k++) {
											if(reviewVO.getREVIEW_FILE().equals("#")) {
									%>			
												<img src="#" class="review_img" style="display:none;">	&nbsp;&nbsp; 
									<%			
											} else {
									%>
												<img src="/productupload/image/<%=reviewVO.getREVIEW_FILE().split(",")[k]%>" class="review_img">	&nbsp;&nbsp; 
										
									<%		
											}
										}
									%>
									</div>
								</div>		
								<div class="row ">
									<div class="col rep_content">
										<%=reviewVO.getREVIEW_CONTENT()%>
									</div>
								</div>
								<div class="pb-1 ">
									<div class="review_re pr-4">
											<a id="review_reply<%=reviewVO.getREVIEW_NUM() %>" class="review_reply" style="cursor: pointer;">
												<input type="hidden" name="REVIEW_NUM" value="<%=reviewVO.getREVIEW_NUM() %>">
												답글
											</a>
									</div>
								</div>
								<!-- 답글 달기(review_re) -->
								<div>
									<div class="review_re_hidden pt-3" id="review_re_hidden_<%=reviewVO.getREVIEW_NUM() %>">
										<div class="row">
											<div class="col-1">
											<%
												if(MEMBER_NICK != null) {
											%>	
													<img src="<%=MEMBER_PICTURE%>" alt="" class="rounded-circle">	 
											<%
												}
											%>	
											
											</div>
											<div class="col-11">
												<form name="review_re_form" id="review_re_form<%=reviewVO.getREVIEW_NUM() %>">
													<input type="hidden" name="REVIEW_PRODUCT" value="<%=reviewVO.getREVIEW_PRODUCT() %>">
													<input type="hidden" name="REVIEW_NUM" value="<%=reviewVO.getREVIEW_NUM() %>">
													<input type="hidden" name="REVIEW_RE" value="<%=reviewVO.getREVIEW_NUM() %>">
													<textarea name="REVIEW_CONTENT" placeholder="답글을 작성해주세요!" cols="80%" rows="5"></textarea>
												</form>
											</div>
										</div>
									</div>
								</div>								
								<div class="review_control_hidden pb-3 " id="review_control<%=reviewVO.getREVIEW_NUM() %>">
									<div class="review_control pr-4">
										<form name="review_numform">
											<a class="review_modify" style="cursor: pointer;">
												<input type="hidden" name="REVIEW_NUM" value="<%=reviewVO.getREVIEW_NUM() %>">
												수정
											</a> &nbsp;
											<a class="review_delete" style="cursor: pointer;">
												<input type="hidden" name="REVIEW_NUM" value="<%=reviewVO.getREVIEW_NUM() %>">
												삭제
											</a>
										</form>
									</div>							
								</div>
								<div class="review_re_insert_hidden pb-3 " id="review_re_insert<%=reviewVO.getREVIEW_NUM() %>">
									<div class="review_re_insert pr-4" >
											<a class="insert_review_re"style="cursor: pointer;">
												<input type="hidden" name="REVIEW_NUM" value="<%=reviewVO.getREVIEW_NUM() %>">
												답글 작성
											</a>
									</div>							
								</div>
							</div>
						</div>									
					</div>
					<!-- 수정폼 추가 -->
					<div class="review_mod_sum justify-content-center" id="review_mod_<%=reviewVO.getREVIEW_NUM() %>">
	
					</div>			
					<!-- 수정폼 끝 -->
					
					<!-- 답글 관련 (review_re)-->
					<div class="review_re_table" >
						<div class="row">
							<div class="col-1">
							</div>
							<div class="col-11">
								<div class="review_re_sum justify-content-center pr-2" >	
									<!-- review_re insert시 여기에 삽입 -->
									<div class="row review_re_space justify-content-center" id="review_re_space<%=reviewVO.getREVIEW_NUM() %>"> 				
									</div>
								</div>
							</div>
						</div>	
					</div>
				<%
							if(review_RE_Count > 0) {
								for(int j=0; j<review_RE_List.size(); j++)  {
									MemberVO member_re_VO = review_RE_MemberList.get(j);
									Product_reviewVO review_re_VO = review_RE_List.get(j);
									
									if(reviewVO.getREVIEW_NUM() == review_RE_List.get(j).getREVIEW_RE()) { 
									
				%>						
					<!-- 답글 리스트 출력(review_re) -->
					<div class="review_re_table">
						<div class="row pb-3">
							<div class="col-1">
							</div>
							<div class="col-11">
								<div class="review_re_sum justify-content-center pr-2">
									<div class="row review_re_space justify-content-center" id="review_re_space<%=reviewVO.getREVIEW_NUM() %>"> 				
										<div class="col-1 justify-content-end">
											<img src="<%=member_re_VO.getMEMBER_PICTURE() %>" alt="" class="rounded-circle">
										</div>
										<div class="col-11">
											<div class="row">
												<div class="col-10 justify-content-end name"><%=member_re_VO.getMEMBER_NICK() %></div>
												<div class="col-2 justify-content-center smallfont"><%=sdf.format(review_re_VO.getREVIEW_DATE())%></div>
											</div>
											<div class="row">
												<div class="col rep_content" id="review_RE_modify_block<%=review_re_VO.getREVIEW_NUM() %>"><%=review_re_VO.getREVIEW_CONTENT() %></div>
												<form name="review_RE_modifyform">
													<div class="col">
														<textarea rows="2" cols="80%" class="review_RE_modify_hidden" id="review_RE_modify_hidden<%=review_re_VO.getREVIEW_NUM() %>">
															<%=review_re_VO.getREVIEW_CONTENT() %>
														</textarea>
													</div>
												</form>
											</div>
											<div class="row review_RE_control" id="review_RE_control<%=reviewVO.getREVIEW_NUM() %>">											
												<a class="review_RE_modify" style="cursor: pointer;">
													<input type="hidden" name="REVIEW_NUM" value="<%=review_re_VO.getREVIEW_NUM() %>">
													수정
												</a> &nbsp;
												<a class="review_RE_delete" style="cursor: pointer;">
													<input type="hidden" name="REVIEW_NUM" value="<%=review_re_VO.getREVIEW_NUM() %>">
													삭제
												</a>												
											</div>
											<div class="row review_RE_control_hidden" id="review_RE_control<%=reviewVO.getREVIEW_NUM() %>">											
												<a class="review_RE_modify_Process" style="cursor: pointer;">
													<input type="hidden" name="REVIEW_NUM" value="<%=review_re_VO.getREVIEW_NUM() %>">
													수정하기
												</a>												
											</div>
										</div>
									</div>
								</div>
							</div>	
						</div>		
					</div>	
					
					
					
				<%
									}
								}
							}
						} //for문 끝
			
					} else {
					%>	
						<input type="text" id = "comment_info" value="등록된 댓글이 없습니다" readonly style="border:none; text-align:center;">	
					<%
					}
					%>
								
						
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
									&nbsp; : &nbsp; <input type="text" name="REVIEW_GRADE" size="3" style="height:90%;"> &nbsp;/5.0
								
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
									<button class="btn btn-dark btn-sm" id="insert_review" style="cursor: pointer;">등록</button>
								</div>
							</div>
						</form>   
					</div>			
					<!-- 리뷰 등록 끝 -->
						
					<!-- 리뷰 pagenation -->
					<br/>
				<%
				if (reviewCount > 0) {
				%>				
					<div class="row justify-content-center">
						<div class="pagination">
						<%
							if (nowpage <= 1) {
						%>			
								&laquo;
						<%
							} else {
						%>
								<a href="./productList.pro?page=<%=nowpage - 1%>">&laquo;</a>
						<%
							}
						%>
						
						<%
							for (int a = startpage; a <= endpage; a++) {
								if (a == nowpage) {
						%><!-- 현재 보고있는 페이지에는 링크를 걸지 않겠다. --> 
									<%=a%>
						<%
								} else {
						%>
									<a href="./productList.pro?page=<%=a%>"><%=a%></a>
						<%
								}
							}
						%><!-- 현재 보는 페이지가 마지막 페이지 이면 -->
						<%
							if (nowpage >= maxpage) {
						%>
								&raquo;
						<%
							} else {
						%>			
								<a href="./productList.pro?page=<%=nowpage + 1%>">&raquo;</a>
						<%
							}
						%>
						</div>
					</div>	<!-- pagenation 끝 -->	
				<%
				}
				%>
					
					
					<br />
				</div><!-- <div class="reviews_table" > 끝 -->
				<!-- 리뷰 테이블 끝 -->
		
				<span id="t3"></span>
				<br />
				<br />
				<hr />
				
				<!-- Q&A 테이블 시작 -->
				<h3 >Q&A</h3>
				<br />
				<br />
				<div class="qnas_table">
					<!-- qna 작성시 Ajax로 이 자리에 insert -->
					<div class="qna_sum justify-content-center">
						<div class="row qnaspace"> <!-- justify-content-center qnaspace -->
							
						</div>
					</div>
				<%
				System.out.println(qnaList.size());
					if(qnaCount > 0) {
						for(int i = 0; i < qnaList.size(); i++) {
							Product_qnaVO qnaVO = qnaList.get(i);
							MemberVO memberVO = qnaMemberList.get(i);
				%>
					<div class="qna_sum justify-content-center" id="qna_<%=qnaVO.getQNA_NUM() %>">
						<div class="row">
							<div class="col-1 justify-content-end">
								<img src="<%=memberVO.getMEMBER_PICTURE() %>" alt="" class="rounded-circle">
							</div>
							<div class="col-11">
								<div class="row">
									<div class="col-10 justify-content-end name"><%=memberVO.getMEMBER_NICK() %></div>
									<div class="col-2 justify-content-center smallfont"><%=sdf.format(qnaVO.getQNA_DATE())%></div>
								</div>
								<div class="row ">
									<div class="col rep_content"><%=qnaVO.getQNA_CONTENT()%></div>
								</div>								
								<div class="row" style="height: 20px;">
									<a href="#" class="smallfont">답글달기</a> &nbsp;&nbsp; 
									<a href="#"	class="smallfont">신고하기</a>
								</div>
							</div>
						</div>
					</div>		
					<br />						
				<%
						} //for문 끝
				%>
				
				<%
					}else {
				%>
					<input type="text" id = "qna_info" value="등록된 질문이 없습니다" readonly style="border:none; text-align:center;">	
				<%
					}
				%>
						
							
								

<%-- 					
					<div class="qna_sum justify-content-center" >
						<div class="row">
							<div class="col-1 justify-content-end">
								<img src="${pageContext.request.contextPath}/resources/images/Community/peko.png" alt="" class="img-circle">
							</div>
							<div class="col-11">
								<div class="row">
									<div class="col-10 justify-content-end name">박이름</div>
									<div class="col-2 justify-content-center smallfont">2020-01-08</div>
								</div>
								<div class="row ">
									<div class="col justify-content:space-end rep_content">
										안녕하세요	주말 1명 참여 가능한 가장 빠른 클래스가 언제인가요?</div>
								</div>
								<div class="row" style="height: 20px;">
									<a href="#" class="smallfont">답글달기</a> &nbsp;&nbsp; 
									<a href="#"	class="smallfont">신고하기</a>
								</div>
							</div>
						</div>
					</div>
		
					<br />
					<div class="qna_reply_wrap"	style="width: 88%; margin: 0 auto; background-color: #FAFAFA;">
						<div class="qna_reply " style="width: 95%; margin: 0 auto;">
							<div class="row justify-content-start ml-0  name">
								<i class="fab fa-replyd"></i>&nbsp;&nbsp;메이킹퍼니처
							</div>
							<div class="row justify-content-start ml-0 rep_content">안녕하세요 요번 주 토요일
								12시요~</div>
							<div class="row" style="height: 20px;">
								<a href="#" class="smallfont ml-0">&nbsp;&nbsp;&nbsp;&nbsp;답글달기</a>
								&nbsp;&nbsp; <a href="#" class="smallfont ml-0">신고하기</a>
							</div>
						</div>
					</div>
					<br />
					
 --%>

					
 					<!-- qna 등록하기 -->		
					<br />
					<div class="qna_add_section justify-content-center" style="width: 100%; margin: 0 auto;">
						<div class="row justify-content-center">
							<div class="col-10">
								<textarea name="PICS_RE_CONTENT" class="col-12" rows="2"></textarea>
							</div>
							<div class="col-1">
								<div class=" row justify-content-center">
									<a class="btn btn-outline-dark btn-sm " onClick="location.href='#'" style="cursor: pointer;">등록</a>
								</div>
							</div>
						</div>
					</div>
					<!-- qna 등록 끝 -->
					
					
					<br />
				</div>
				<!-- Q&A 테이블 끝 -->
		
				<br />
				<br />
				<hr />
	
		
				<!-- 배송 및 환불 시작 -->
		
				<h3 id="t4">배송 및 환불</h3>
				<br />
				<br />
				<div class="ship_info" style="width: 100%; margin: 0 auto; font-size: 0.9em; color: #212529;">
					<div class="row_ship_info">
						<h5>배송정보</h5>
						모든 제품은 메이킹퍼니처 직원이 직접 배송하며 배송비는 고객 부담입니다. 지역, 제품 수량 또는 설치 여부에 따라 주문 시
						배송비를 미리 안내해드립니다. 기본 배송비 외에 사다리차, 엘레베이터, 주차비 사용료 등 추가 비용이 발생 시 고객님
						부담입니다.
					</div>
					<br />
		
		
					<div class="row_ship_info">
						<h5>A/S</h5>
						핸드메이드 제품으로 나뭇결, 무늬, 옹이의 형태나 파임, 칠과 색상이 다를 수 있고 약간의 흠집이나 찍힘(표면의 크랙 또는
						뜯김)이 있을 수 있으며, 100% 원목으로 기후변화에 따른 수축, 팽창으로 인한 휘어짐(상판), 갈라짐(마구리면)이
						발생할 수 있습니다. 이런 자연스러운 현상들은 교체 및 교환 대상이 아니며 무상 A/S 사유가 되지 않습니다. 구매 전 꼭
						참고해주시기 바랍니다.
					</div>
					<br />
		
		
					<div class="row_ship_info">
						<h5>Wood Furniture</h5>
						원목가구의 수축 및 팽창은 원목만의 자연스러운 특징입니다.<br /> -지나치게 건조한 곳, 습한 곳은 피하세요. -가구의
						수평을 유지해주세요.(수평이 안 맞게 되면 가구가 뒤틀려버립니다.) -가구에 화학약품(신나, 메니큐어 등)이 닿지 않게
						해주세요. -평소에는 물걸레 청소하시면 됩니다. -뜨거운 냄비와 같은 고온의 뜨거운 물체에 직접 닿는 것은 피하시기
						바랍니다. -한 달에 1~2번 가구용 왁스로 닦아주세요. -원목가구는 수축기와 팽창기(계절의 변화)에 따라 갈라짐이나
						미세한 크랙이 발생할 수 있으며, 시간이 경과하면 원상회복이 될 수 있습니다. 이는 원목가구만의 자연스러운 현상이며 제품의
						하자가 아닙니다.
					</div>
					<br />
		
					<div class="row_ship_info">
						<h5>A/S규정[1년 무상]</h5>
						무상 A/S -보증기간 이내의 제품으로 정상적인 상태에서 제조상의 결함 제품 -원/부나내의 결함이 발생된 경우
						-메이킹퍼니처의 귀책 사유로 인한 결함 발생 제품
					</div>
					<div class="row_ship_info">유상 A/S -고객의 취급 부주의 및 고의적 훼손 경우 -고객 임의 개조에 의한
						파손의 경우나 타 업체에서 수리해 변경된 경우 -유상 서비스 요금은 [수리비+부품비+출장비+기타실 비용] 등이 포함됩니다.
					</div>
				</div>
					
			</div>
			<div class="col-4">
				<div class="sticky2" style="border: 1px solid #EAEAEA;">
					<form name="goodsform" action="#" method="post">
						<div class="row pt-4 pl-4">
							<div class="col-3" >
								<img src="${pageContext.request.contextPath}/resources/images/Community/peko.png" width="95%" >
							</div><hr>
							<div class="col-9">
								<h3><%=vo.getPRODUCT_SHOPNAME()%></h3>
								<p><font size="2"><%=vo.getPRODUCT_TITLE()%></font></p>
							</div>
						</div>
						<div>
							<table class="table table-borderless">
								<thead>
								    <tr>
								    	<th scope="col">가격</th>
								    	<th scope="col"><%=vo.getPRODUCT_PRICE()%>원</th>
								    </tr>
								</thead>
								<tbody>
								    <tr>
								    	<th scope="row">배송비</th>
								    	<td><%=vo.getPRODUCT_SHIP_PRICE()%>원</td>
								    </tr>
								    <tr>
								    	<th scope="row">색상선택</th>
								    	<td>
									      	<select name="color" size="1">
												<option value="">선택</option>
												<c:forTokens var="color" items="<%=PRODUCT_COLOR %>"
													delims=",">
													<option value="${fn:trim(color)}">${fn:trim(color)}</option>
												</c:forTokens>
											</select>
								    	</td>
								    </tr>
								    <tr>
								    	<th scope="row">사이즈선택</th>
								    	<td>
									      	<select name="size" size="1">
												<option value="">선택</option>
												<c:forTokens var="size" items="<%=PRODUCT_SIZE %>" delims=",">
													<option value="${fn:trim(size)}">${fn:trim(size)}</option>
												</c:forTokens>
																					
												
											</select>
								    	</td>
								    </tr>
								    <tr>
								    	<th scope="row">옵션선택</th>
								    	<td>
									      	<select name="option" size="1">
												<option value="">선택</option>
												<c:forTokens var="option" items="<%=PRODUCT_OPTION %>" delims=",">
													<option value="${fn:trim(option)}">${fn:trim(option)}</option>
												</c:forTokens>
											</select>
								    	</td>
								    </tr>
								    <tr>
								    	<th scope="row">수량</th>
								    	<td>
								      		<input name="amount" type="text" style="text-align: right" value="1" size="4" /> 
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
							<a href="classreservation.ac" class="btn btn-outline-dark btn-lg" role="button" aria-pressed="true">장바구니</a>
							<a href="#" class="btn btn-outline-dark btn-lg" role="button" aria-pressed="true">바로구매</a>
						</div>
						<br/>
					</form>
					
				</div>
			</div>
		</div>
		<br>
	</div>
	<!-- content end -->
			

	
	<script type="text/javascript">
	var loginmember_pic = '<%=MEMBER_PICTURE%>';
	var loginmember_nick = '<%=MEMBER_NICK%>';
		/*장바구니 수량 변경*/
		function count_change(temp) {
			var test = document.goodsform.amount.value;
			if (temp == 0) {
				test++;
			} else if (temp == 1) {
				if (test > 1)
					test--;
			}
			document.goodsform.amount.value = test;
		}
		
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
		
		/*댓글 등록시 빈 칸 체크*/
		function check() {
			var content = reviewform.REVIEW_CONTENT.value;
			var grade = reviewform.REVIEW_GRADE.value;
			if(content=="") {
				alert('후기 내용을 입력해주세요!');
				reviewform.REVIEW_CONTENT.focus();
				return false;
			} else if(grade=="") {
				alert('평점을 선택해주세요!');
				reviewform.REVIEW_GRADE.focus();
				return false;
			} else {
				for (i = 0; i < grade.length; i++) 
				{
					alert(grade.length);
					ch = grade.substring(i, i + 1);
					if (!(ch >= "0" && ch <= "5")) // 0부터 5사이 숫자가 아닐시.
					{
						alert("평점은 0부터 5까지 숫자를 입력해주세요!");
						reviewform.REVIEW_GRADE.focus();
						return false;
					}
				}
			}
			return true;
		}	

		/*댓글 수정시 빈 칸 체크*/
		function mod_check(REVIEW_NUM) {
			var modifyform = 'modifyform_' + REVIEW_NUM;
			var content = document.getElementById('modifyform_'+REVIEW_NUM).REVIEW_CONTENT.value;
			var grade = document.getElementById('modifyform_'+REVIEW_NUM).REVIEW_GRADE.value;
	
			if(content=="") {
				alert('후기 내용을 입력해주세요!');
				document.getElementById('modifyform_'+REVIEW_NUM).REVIEW_CONTENT.focus();
				return false;
			} else if(grade=="") {
				alert('평점을 선택해주세요!');
				document.getElementById('modifyform_'+REVIEW_NUM).REVIEW_GRADE.focus();
				return false;
			} else {
				for (i = 0; i < grade.length; i++) 
				{
					alert(grade.length);
					ch = grade.substring(i, i + 1);
					if (!(ch >= "0" && ch <= "5")) // 0부터 5사이 숫자가 아닐시.
					{
						alert("평점은 0부터 5까지 숫자를 입력해주세요!");
						document.getElementById('modifyform_'+REVIEW_NUM).REVIEW_GRADE.focus();
						return false;
					}
				}
			}
			return true;
		}	
		
		/*답글 수정시 빈 칸 체크*/
		function re_check(REVIEW_NUM) {
			
			var replyform = 'review_re_form' + REVIEW_NUM;
			var content = document.getElementById(replyform).REVIEW_CONTENT.value;

			if(content=="") {
				alert('내용을 입력해주세요!');
				document.getElementById(replyform).REVIEW_CONTENT.focus();
				return false;
			} 
			return true;
		}	
		
		
		/*댓글 등록할 때 사진 여러개일 때 쪼개주는 함수*/
		// , 가 몇 개 있는지만 구하면 된다
		function splitImg(review_FILE) {
			var reviewImgArray = review_FILE.split(',');
			return reviewImgArray;
		}				
		
		/*다중 이미지 업로드*/
		//이미지 정보들을 담을 배열
		var sel_files= [];	
		
		function handleImgFileSelect(e) {
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
					var html="<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove' width='100' height='100'></a>";
					
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
		
		
		
 		/*수정하기 버튼 이벤트*/
 		//수정 process
		$(document).on("click",".review_modify_process",function(e){ 

			var REVIEW_NUM = $(this).children('input').val();			
			if(mod_check(REVIEW_NUM)) {

				var form = new FormData(document.getElementById('modifyform_'+REVIEW_NUM));
				
				$.ajax({
					url : "/NAGAGU/modify_review.do", 
					data : form,
					dataType: 'json',
					processData : false,
					contentType : false,
					type : 'POST',
					success:function(data) {
					
						var output = '';
						var REVIEW_NUM = data.review_NUM;
						var review_DATE = new Date(data.review_DATE);
						var date = date_format(review_DATE);
						var rate = 20*data.review_GRADE;
						var review_FILE = data.review_FILE;
						
						$('#review_mod_'+REVIEW_NUM).css('display','none');
						$('#review_'+REVIEW_NUM).empty();
						
						output += '<div class="row justify-content-center">';
						output += '<div class="col-1 justify-content-end">';
						output += '<img src="'+loginmember_pic+'" alt="" class="rounded-circle"></div>'; 
						output += '<div class="col-11"><div class="row pb-1">';
						output += '<div class="col-10 justify-content-end name">';
						output += loginmember_nick;
						output += '</div>';
						output += '<div class="col-2 justify-content-center smallfont">' + date;
						output += '</div></div><div class="row pb-1">';
						
						output += '<div class="col-12 " style="font-size:0.7em; font-weight:bold;">';
						output += data.review_GRADE + '&nbsp;<span class="star-rating">';
						output += '<span style ="width:' + rate + '%"></span></span></div></div>';
						
						output += '<div class="row pb-2 "><div class="col-12">';
						if(review_FILE == '#') {
							output += '<img src="#" class="review_img"  style="display:none;">	&nbsp;&nbsp;';				
						} else {
							//split함수 호출 //, 가 몇 개 있는지 구해서 //for문으로 그 개수만큼 돌림...review_file[i]
							var reviewImgArray = splitImg(review_FILE);
							for(i=0;i<reviewImgArray.length;i++) {
								output += '<img src="/productupload/image/' + reviewImgArray[i] + '" class="review_img">	&nbsp;&nbsp;';								
							}					
						}
						output += '</div></div>';
						output += '<div class="row rep_content pb-1">';
						output += '<div class="col-12 pr-5">';
						output += data.review_CONTENT ;
						output += '</div></div>';
						output += '<div class="pb-1 "><div class="review_re pr-4">';
						output += '<form name="review_reform">';
						output += '<a id="review_reply'+ data.review_NUM +'" class="review_reply" style="cursor: pointer;">';
						output += '<input type="hidden" name="REVIEW_NUM" value="' + data.review_NUM + '">';
						output += '답글</a></form></div></div>'
						output += '<div class="pb-3 "><div class="review_control pr-4">';
						output += '<form name="review_numform">';
						output += '<a class="review_modify" style="cursor: pointer;">';
						output += '<input type="hidden" name="REVIEW_NUM" value="' + data.review_NUM + '">';
						output += '수정</a> &nbsp;';
						output += '<a class="review_delete" style="cursor: pointer;">';
						output += '<input type="hidden" name="REVIEW_NUM" value="' + data.review_NUM + '">';
						output += '삭제</a></form></div></div></div></div>';
						
						console.log("output:" + output);
						$('#review_'+REVIEW_NUM).append(output);
						$('#review_'+REVIEW_NUM).css('display','block');
                  },
                  error:function() {
                     alert("ajax통신 실패!!!");
                  }
				});
			}		
			event.preventDefault();

		 });		 
		
		
		//댓글 수정시 이미지 추가 가능(삭제는 deleteImageAction(index) 가능)
		$(document).on("change","#modify_input_imgs",function(e){ 
			sel_files = [];
			$('.modify_imgs_wrap').empty();
			
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
					var html="<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile review_img_modify ' title='Click to remove' width='100' height='100'></a>";
					
					$(".modify_imgs_wrap").append(html);
					index++;
				}
				reader.readAsDataURL(f);
			});
		 });			
		
		
		//댓글 수정시 기존 이미지 삭제할 때 ajax 이용하여 이미지 display 삭제, db의 REVIEW_FILE 수정한다
		function imgPath_delete(getREVIEW_NUM, i, reviewImgArraylength){
			var REVIEW_NUM = getREVIEW_NUM;
			var imgLength = reviewImgArraylength;
			var index = i;
			var delete_confirm = confirm("삭제하시겠습니까?");
			if (delete_confirm) {
				var img_id = "#img_" + index;
				alert("img_id = " + img_id)

				$.ajax({
					url: '/NAGAGU/review_img_delete.do' ,
					type:'GET',
					data : {'REVIEW_NUM':REVIEW_NUM, 'index':index},		
					dataType : 'json', 
					async: false,
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success: function (newReviewImg) {
						REVIEW_FILE = newReviewImg; //db삭제 후 , 업데이트한 경로
						reLoadImg(img_id, imgLength, REVIEW_NUM, REVIEW_FILE);
					},
					error:function(request, error) {
						alert("message:"+request.responseText);
					}
				});				
			}
			return true;
		} 
		
		//리뷰 댓글 수정할 때, img_i 새로 부여하기 위해 col-12부분만 다시 reload
		function reLoadImg(img_id, imgLength, REVIEW_NUM, REVIEW_FILE) {

			var a = $('#imgReload');
			var b = a.find('.img');
			b.remove('.img');
			
			var mod_form = '';
		 	mod_form += '<span class="col-12" id="imgReload">';
			if(REVIEW_FILE == '#') {
				mod_form += '<img src="#" class="review_img"  style="display:none;">	&nbsp;&nbsp;';				
			} else {
				//split함수 호출 //, 가 몇 개 있는지 구해서 //for문으로 그 개수만큼 돌림...review_file[i]
				var reviewImgArray = splitImg(REVIEW_FILE);
				for(i=0;i<reviewImgArray.length;i++) {
					mod_form += '<span class="img" >';								
					mod_form += '<span><img src="/productupload/image/' + reviewImgArray[i] + '" class="review_img_modify img" id="img_'+i+'" ></span>	';								
					mod_form += '<span class="hover-image review_img_modify" id="test" >'; 
					mod_form += '<a href="javascript:imgPath_delete(\''+getREVIEW_NUM+'\',\''+i+'\',\''+reviewImgArray.length+'\');">'; 
					mod_form += '<span class="button"><i class="fas fa-times"></i></span>'; 
					mod_form += '</a>'; 
					mod_form += '</span>'; 
					mod_form += '</span>';
				}					
			}
			mod_form += '<span class="modify_imgs_wrap"><img id="modify_inputimg" ></span></span>';
			$('#imgReload').prepend(mod_form);
		}	

		
		/*document.ready*/
		$(document).ready(function(){
			//리뷰 이미지를 클릭하면 원본 사이즈로 커짐(기본은 100)
			$(".review_img").click(function(){
				if($(this).css('width') != '100px' ) {
					$(this).css({'width':'100','height':'100'});
				} else {
					$(this).css({'width':'100%','height':'100%'});
				}
			})
			
			//확인!!!
			//댓글 등록 위해 댓글달기 버튼 눌렀을 시 css
			$(".review_add").click(function() {
				if($(this).html() == '댓글 달기') { //댓글달기이면 hidden구역 보이고 버튼은 닫기로 바뀜
					var nick = '<%=MEMBER_NICK%>';
					if(nick == null) {
						alert('로그인 해주세요!');
						return false;
					}					
					$(".review_hidden").css('display','block');
					$(this).html('닫기');	
				} else { //버튼이 닫기이면 hidden 구역이 닫히고 버튼은 댓글 달기로 바뀜
					$(this).html('댓글 달기');
					$(".review_hidden").css('display','none');
				}	
			})
			
			//-----------------------------------review insert
			//다중이미지 업로드
			$('#input_imgs').on("change", handleImgFileSelect);

			function infochange() {
				if($('#comment_info').val() == '등록된 댓글이 없습니다') {
					alert('a');
					$('#comment_info').val('');
				}
			}
			
			
			/*댓글 등록시 insert ajax*/
			$('#insert_review').click(function(event) {
				if(check()) {
					var form = new FormData(document.getElementById('reviewform'));
					
					$.ajax({
						url : "/NAGAGU/insert_review.do", 
						data : form,
						dataType: 'json',
						processData : false,
						contentType : false,
						type : 'POST',
						success:function(data) {
							alert('성공!');
							
							var output = '';
							var REVIEW_NUM = data.review_NUM;
							var review_DATE = new Date(data.review_DATE);
							var date = date_format(review_DATE);
							var rate = 20*data.review_GRADE;
							var review_FILE = data.review_FILE;
							
							output += '<div class="col-1 justify-content-end">';
							output += '<img src="'+loginmember_pic+'" alt="" class="rounded-circle"></div>'; 
							output += '<div class="col-11"><div class="row">';
							output += '<div class="col-10 justify-content-end name">';
							output += loginmember_nick + '</div>';
							output += '<div class="col-2 justify-content-center smallfont">' + date;
							output += '</div></div><div class="row">';
							output += '<div class="col-12 " style="font-size:0.7em; font-weight:bold;">';
							output += data.review_GRADE + '&nbsp;<span class="star-rating">';
							output += '<span style ="width:' + rate + '%"></span></span></div></div>';
							output += '<div class="row"><div class="col-12">';
							if(review_FILE == '#') {
								output += '<img src="#" class="review_img"  style="display:none;">	&nbsp;&nbsp;';				
							} else {
								var reviewImgArray = splitImg(review_FILE);
								for(i=0;i<reviewImgArray.length;i++) {
									output += '<img src="/productupload/image/' + reviewImgArray[i] + '" class="review_img">	&nbsp;&nbsp;';								
								}					
							}
							output += '</div></div>';
							output += '<div class="row">';
							output += '<div class="col rep_content">';
							output += data.review_CONTENT + '</div></div>' ;
							output += '<div class="pb-1 "><div class="review_re pr-4">';
							output += '<form name="review_reform">';
							output += '<a id="review_reply'+ data.review_NUM +'" class="review_reply" style="cursor: pointer;">';
							output += '<input type="hidden" name="REVIEW_NUM" value="' + data.review_NUM + '">';
							output += '답글</a></form></div></div>'
							output += '<div class="pb-3 "><div class="review_control pr-4">';
							output += '<form name="review_numform">';
							output += '<a class="review_modify" style="cursor: pointer;">';
							output += '<input type="hidden" name="REVIEW_NUM" value="' + data.review_NUM + '">';
							output += '수정</a> &nbsp;';
							output += '<a class="review_delete" style="cursor: pointer;">';
							output += '<input type="hidden" name="REVIEW_NUM" value="' + data.review_NUM + '">';
							output += '삭제</a></form></div></div></div>';
							output += '<div class="review_mod_sum justify-content-center" id="review_mod_'+ data.review_NUM +'">';
							output += '<form name="modifyform" id="modifyform_'+data.review_NUM+'" enctype="multipart/form-data" method="post">';
							output += '</form></div>';
							
							console.log("output:" + output);
							$('.reviewspace').append(output);
							$('#REVIEW_CONTENT').val('');
							$('#REVIEW_GRADE').val('');
							$('#input_imgs').val('');
							$('.imgs_wrap').empty();
							infochange();
							$(".review_hidden").css('display','none');
							$(".review_add").html('댓글 달기');
							document.getElementById('review_scroll').scrollIntoView();							
	                  },
	                  error:function() {
	                     alert("ajax통신 실패!!!");
	                  }
					});
				}
				event.preventDefault();
			});	
			
			//검색수정
			$('.review_RE_modify').on('click', function() {
				var REVIEW_RE_NUM = $(this).children('input').val();
				$('#review_RE_modify_hidden'+REVIEW_RE_NUM).css('display','block');
				$('#review_RE_modify_block'+REVIEW_RE_NUM).css('display','none');
				$('#review_RE_control'+REVIEW_RE_NUM).css('display','none');
				$('#review_RE_control_hidden'+REVIEW_RE_NUM).css('display','block');
				

			});
			
			//수정폼
			$('.review_modify').on('click', function(event) {
				var nick = '<%=MEMBER_NICK%>';
				if(nick == null) {
					alert('로그인 해주세요!');
					return false;
				}
				
				var modify_confirm = confirm("수정하시겠습니까?");
				if(modify_confirm) {										
					var REVIEW_NUM = $(this).children('input').val();
					var date = '';
					var getREVIEW_GRADE = '';
					var getREVIEW_FILE = '';
					var getREVIEW_CONTENT = '';
	
					var mod_form = '';
					
					$.ajax({
						url: '/NAGAGU/modify_review_form.do' ,
						type:'GET',
						data : {'REVIEW_NUM':REVIEW_NUM},
						dataType : 'json', // 서버에서 보내줄 데이터 타입
						async: false,
						contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						success:function(data) {
							$('#review_'+REVIEW_NUM).css('display','none');
							
							var getreview_DATE = new Date(data.review_DATE);
							date += date_format(getreview_DATE);
							
							getREVIEW_NUM = data.review_NUM;
							getREVIEW_GRADE = data.review_GRADE;
							getREVIEW_FILE = data.review_FILE;
							getREVIEW_CONTENT = data.review_CONTENT;
							
						},
						error:function(request, error) {
							alert("message:"+request.responseText);
						}
					});
					
					mod_form += '<form name="modifyform" id="modifyform_'+ REVIEW_NUM +'" enctype="multipart/form-data" method="post">';
					mod_form += '<div class="row justify-content-center">';
					mod_form += '<div class="col-1 justify-content-end">';
					mod_form += '<img src="'+loginmember_pic+'" alt="" class="rounded-circle"></div>';
//					mod_form += '<img src="=memberVO.getMEMBER_PICTURE() %>" alt="" class="rounded-circle">';
					mod_form += '<div class="col-11"><div class="row">';
					mod_form += '<div class="col-10 justify-content-end name">';
					mod_form += loginmember_nick+'</div>';
					mod_form += '<div class="col-2 justify-content-center smallfont">';
					mod_form += date + '</div></div>';
					mod_form += '<div class="row">';
					
					mod_form += '<div class="col-12 review_grade pb-1" >';
					mod_form += '<img src="${pageContext.request.contextPath}/resources/images/star1.png" alt="" width="15px" height="15px">';
					mod_form += '&nbsp; : &nbsp;<input type="text" name="REVIEW_GRADE" value="'+getREVIEW_GRADE+'" size="2" style="height:90%;"> &nbsp;/5.0';
					mod_form += '</div></div><div class="row "><div class="col-12 pb-1" id="imgReload">'; //
					if(getREVIEW_FILE == '#') {
						mod_form += '<img src="#" class="review_img"  style="display:none;">	&nbsp;&nbsp;';				
					} else {
						//split함수 호출 //, 가 몇 개 있는지 구해서 //for문으로 그 개수만큼 돌림...review_file[i]
						var reviewImgArray = splitImg(getREVIEW_FILE);
						for(i=0;i<reviewImgArray.length;i++) {
							mod_form += '<span class="img" >';								
							mod_form += '<span><img src="/productupload/image/' + reviewImgArray[i] + '" class="review_img_modify img" id="img_'+i+'" ></span>	';								
							mod_form += '<span class="hover-image review_img_modify" id="test" >'; 
							
							mod_form += '<a href="javascript:imgPath_delete(\''+getREVIEW_NUM+'\',\''+i+'\',\''+reviewImgArray.length+'\');">'; 
							mod_form += '<span class="button"><i class="fas fa-times"></i></span>'; 
							mod_form += '</a>'; 
							mod_form += '</span>'; 
							mod_form += '</span>';
							
						}					
					}
					
					mod_form += '<span class="modify_imgs_wrap"><img id="modify_inputimg" ></span>';
					mod_form += '</div><div class="col-12 pb-2"><span class="input_wrap">';			/////////////////		
					mod_form += '파일추가&nbsp; : &nbsp;<input multiple="multiple" type="file" name="REVIEW_FILE" id="modify_input_imgs">';					
					mod_form += '</span>';			
					mod_form += '</div></div>';
					mod_form += '<div class="row"><div class="col rep_content ">';
					mod_form += '<textarea name="REVIEW_CONTENT" id = "REVIEW_CONTENT" placeholder="" cols="90%" rows="5">'+getREVIEW_CONTENT+'</textarea>';
					mod_form += '</div></div>';				
					mod_form += '<div class="pb-1 "><div class="review_control pr-4">';				
					mod_form += '<a href="javascript:void(0);" class="review_modify_process" value="'+REVIEW_NUM+'" style="cursor: pointer;">';										
					mod_form += '<input type="hidden" name="REVIEW_NUM" value="'+getREVIEW_NUM+'">';										
					mod_form += '수정하기</a>';			
					mod_form += '<a class="review_modify_cancel" style="cursor: pointer;">';													
					mod_form += ' &nbsp;취소</a></div></div></div></div></form>';			
					
					$('#review_mod_'+REVIEW_NUM).append(mod_form);
					
				}
				
			
			});		
			

			
			
			
			$('.review_delete').on('click', function() {
				var nick = '<%=MEMBER_NICK%>';
				if(nick == null) {
					alert('로그인 해주세요!');
					return false;
				}
				
				var delete_confirm = confirm("삭제하시겠습니까?");
				if(delete_confirm) {
										
					var REVIEW_NUM = $(this).children('input').val();
					alert('REVIEW_NUM='+REVIEW_NUM);

					$.ajax({
						url: '/NAGAGU/delete_review.do' ,
						type:'GET',
						data : {'REVIEW_NUM':REVIEW_NUM},
						dataType : 'json', // 서버에서 보내줄 데이터 타입
						async: false,
						contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						success:function(retVal) {
							if(retVal.res == "OK") {
								alert('댓글이 삭제되었습니다.');
								$('#review_'+REVIEW_NUM).css('display','none');
								
								document.getElementById('review_scroll').scrollIntoView();
							}
							else {
								alert("삭제 ajax 실패!");
							}
						},
						error:function(request, error) {
							alert("message:"+request.responseText);
						}
					});
				}
			});		
			
			
			
			//review 답글 달기
			$('.review_reply').on('click', function(event) {
				var nick = '<%=MEMBER_NICK%>';
				if(nick == null) {
					alert('로그인 해주세요!');
					return false;
				}
				
				var REVIEW_NUM = $(this).children('input').val();
				
				alert(REVIEW_NUM);
				alert('안녕');
				$('#review_re_hidden_'+REVIEW_NUM).css('display','block');
				$('#review_reply'+REVIEW_NUM).css('display','none');
				$('#review_control'+REVIEW_NUM).css('display','none');
				$('#review_re_insert'+REVIEW_NUM).css('display','block');
				
				
			});
			
			
			//답글 insert
			/*review의 답글 등록시 insert ajax*/
			//ajax로 답글 db에 등록 후 review_re_space에 출력해줌
			$('.insert_review_re').click(function(event) {
				alert("왔다");
				var REVIEW_NUM = $(this).children('input').val();
				alert(REVIEW_NUM);
				if(re_check(REVIEW_NUM)) {
					
					var form = new FormData(document.getElementById('review_re_form'+REVIEW_NUM));
					
					$.ajax({
						url : "/NAGAGU/insert_review.do", 
						data : form,
						dataType: 'json',
						processData : false,
						contentType : false,
						type : 'POST',
						success:function(data) {
							alert('성공!');
							
							var re_form = '';
							var review_DATE = new Date(data.review_DATE);
							var date = date_format(review_DATE);
							var rate = 20*data.review_GRADE;
		
							
							re_form += '<div class="col-1 justify-content-end">';
							re_form += '<img src="#" alt="" class="rounded-circle">';
							re_form += '<img src="'+loginmember_pic+'" alt="" class="rounded-circle">';
							re_form += '</div>';
							re_form += '<div class="col-11">';
							re_form += '<div class="row">';
							re_form += '<div class="col-10 justify-content-end name">';
							re_form += loginmember_nick;
							re_form += '</div>';
							re_form += '<div class="col-2 justify-content-center smallfont">' + date + '</div>';
							re_form += '</div>';	
							re_form += '<div class="row">';
							re_form += '<div class="col rep_content">';
							re_form += data.review_CONTENT; 
							re_form += '</div>';
							re_form += '</div>';	
							
				
							//data.review_RE는 원글의 num과 같다(REVIEW_NUM)
							$('#review_re_space'+data.review_RE).append(re_form);	
							
							$('#review_re_hidden_'+data.review_RE).css('display','none');
							$('#review_re_insert'+data.review_RE).css('display','none');
							$('#review_control'+data.review_RE).css('display','block');
							$('#review_reply'+data.review_RE).css('display','block');
					
							
	                  },
	                  error:function() {
	                     alert("ajax통신 실패!!!");
	                  }
					});
				}
				
			});	
			
			
		}); //document.ready 끝
	</script>
	

	</body>
</html>