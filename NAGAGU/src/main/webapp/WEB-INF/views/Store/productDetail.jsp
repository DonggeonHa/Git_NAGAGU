<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@page import="com.spring.order.BasketVO"%>
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

//	System.out.println("MEMBER_NUM="+MEMBER_NUM);
//	System.out.println("MEMBER_PICTURE="+MEMBER_PICTURE);
//	System.out.println("MEMBER_NICK="+MEMBER_NICK);

	//WORKSHOP이 댓글 달 때 필요
	String WORKSHOP_PICTURE = (String)session.getAttribute("WORKSHOP_PICTURE");
	String WORKSHOP_NAME = (String)session.getAttribute("WORKSHOP_NAME");

//	System.out.println("WORKSHOP_PICTURE="+WORKSHOP_PICTURE);
//	System.out.println("WORKSHOP_NAME="+WORKSHOP_NAME);	

	//로그인 상태 체크 위한
	Integer MEMBER_STATUS = 100;	//비로그인시 100
	if(MEMBER_NUM != null) {
		MEMBER_STATUS = (Integer)session.getAttribute("MEMBER_STATUS");		
	}
	Integer WORKSHOP_STATUS = 100;	//비로그인시 100
	if(WORKSHOP_NAME != null) {
		WORKSHOP_STATUS = (Integer)session.getAttribute("WORKSHOP_STATUS");		
	}

	//로그인 상태 체크 위한2
	String WORKSHOP_CEO_NAME = (String)session.getAttribute("WORKSHOP_CEO_NAME");
	String MEMBER_EMAIL = (String)session.getAttribute("MEMBER_EMAIL");
	
//	System.out.println("MEMBER_STATUS="+MEMBER_STATUS);
//	System.out.println("WORKSHOP_STATUS="+WORKSHOP_STATUS);
	
	//(QNA)글쓴이만 답글 버튼이 보인다. 글쓴이인지 체크하기 위해 이 글의 WORKSHOP_NUM 받아옴
	int WorkshopMatchingNumber = (int)request.getAttribute("WorkshopMatchingNumber");
	Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");

//	System.out.println("WotkshopMatchingNumber="+WorkshopMatchingNumber);


	
	//상품상세 관련
	ProductVO vo = (ProductVO)request.getAttribute("productVO");
	String PRODUCT_CATEGORY = (String)request.getAttribute("PRODUCT_CATEGORY");
	int PRODUCT_NUM = ((Integer)request.getAttribute("PRODUCT_NUM")).intValue();
	String PRODUCT_COLOR = vo.getPRODUCT_COLOR();
	String PRODUCT_SIZE = vo.getPRODUCT_SIZE();
	int bannerImgCount = StringUtils.countOccurrencesOf(vo.getPRODUCT_BANNER(), ",");
	System.out.println('1');
	
	
	

	System.out.println('3');

/* 	
	//qna 답글 공방 멤버 관련
	int WorkshopNum = ((Integer) request.getAttribute("WorkshopNum")).intValue();
	String WorkshopName = (String)request.getAttribute("WorkshopName");
	String WorkshopPicture = (String)request.getAttribute("WorkshopPicture");
//	System.out.println("WorkshopName="+WorkshopName);
//	System.out.println("WorkshopPicture="+WorkshopPicture);
	
 */

	//날짜 포맷 형식
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	BasketVO basketVO = new BasketVO();
	
	//상품 이미지 관련
	String images = vo.getPRODUCT_BANNER();
	String[] imgArr = images.split(",");
%>  





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

		/*댓글 폼 영역*/
		#ReviewformSection {
			display:none ;
			padding:8px 0; 
			border-bottom:1px solid gray;		
		}
		/*ReviewAndReply_Sum : 리뷰(하나)+리뷰 답글(여러개)이 묶여서 반복되는 영역 - bottom에 회색 구분선*/
		.ReviewAndReply_Sum {
			border-bottom:1px solid gray;		
		}

		
		.imgs_wrap {
			display:none;
		}

		.review_img {
			width:100px;
			height:100px;
		}

		.replytext {	
			font-size:0.7em; font-weight:bold;	/*답글 버튼*/
		}
		
		.ReviewList {
			padding-top:8px; 
			padding-bottom:8px;
		}		
		
		

		/*REVIEW*/
		#REVIEW_GRADE{
			width=15px;			/*리뷰 입력폼에서 별점 선택창*/
		}
		.insertReview {
			cursor: pointer;	/*리뷰 입력폼에서 작성버튼*/
		}
		.formCancel {
			cursor: pointer;	/*Review, ReviewReply 입력취소, 수정 취소버튼*/
		}		
		

		/*REVIEW_REPLY*/

		.review_replybtn {
			cursor: pointer;	/*리뷰 리스트에서 답글달기 폼 버튼*/
		}
		.gomodifyReviewform {
			cursor: pointer;	/*리뷰 수정버튼*/
		}
		.deleteReview {
			cursor: pointer;	/*Review, ReviewReply 삭제*/
		}		
		
		
		.beforeControl {
			font-size:0.7em; 
			font-weight:bold;
		}
		.afterControl {
			display:none;	
			font-size:0.7em; 
			font-weight:bold;	
		}
		
		.ReviewReplyformSection {
			padding:8px 0;		/*?*/
		}
		.afterModifyReviewReply {
			display:none;		/*리뷰 답글 작성폼*/	
		}
				
		.insertReviewReply {
			cursor: pointer;	/*리뷰답글 작성*/
		}
		.gomodifyReviewReplyform, modifyReviewReply {
			cursor: pointer;	/*ReviewReply 수정폼 버튼, ReviewReply 수정버튼*/
		}






	
		/* 상품 이미지 관련*/
		.thumbMain {
			width: 510px;
			height: 510px;
			overflow: hidden;
			display: block;
			margin-right: 10px;
		}
		
		.thumbMain img {
			display: block;
			min-height: 100%;
			min-width: 100%;
			-ms-interpolation-mode: bicubic;
		}
		
		.thumbItem {
			width: 95px;
			height: 95px;
			overflow: hidden;
			display: block;
			margin: 6px;
		}
		
		.thumbCheck {
			border: 2px solid #ef902e;
			border-radius: 4px;
		}
		
		.thumbItem img {
			display: block;
			min-height: 100%;
			min-width: 100%;
			-ms-interpolation-mode: bicubic;
			transition: transform 0.2s;
		}
		
		.thumbItem img:hover {
			transform: scale(1.05);
			cursor: pointer;
		}




	/*qna*/
		#QnaformSection {
			display:none ;
			padding:8px 0; 
			border-bottom:1px solid gray;		
		}
		/*QnaAndReply_Sum : 리뷰(하나)+리뷰 답글(여러개)이 묶여서 반복되는 영역 - bottom에 회색 구분선*/
		.QnaAndReply_Sum {
			border-bottom:1px solid gray;		
		}		
		.QnaList {
			padding-top:8px; 
			padding-bottom:8px;
		}	
		.insertQna {
			cursor: pointer;	/*리뷰 입력폼에서 작성버튼*/
		}	
		.qna_replybtn {
			cursor: pointer;	/*리뷰 리스트에서 답글달기 폼 버튼*/
		}
		.gomodifyQnaform {
			cursor: pointer;	/*리뷰 수정버튼*/
		}
		.deleteQna {
			cursor: pointer;	/*Qna, QnaReply 삭제*/
		}			
		.QnaReplyformSection {
			padding:8px 0;		/*?*/
		}
		.afterModifyQnaReply {
			display:none;		/*리뷰 답글 작성폼*/	
		}
				
		.insertQnaReply {
			cursor: pointer;	/*리뷰답글 작성*/
		}
		.gomodifyQnaReplyform, modifyQnaReply {
			cursor: pointer;	/*QnaReply 수정폼 버튼, QnaReply 수정버튼*/
		}			
	</style>




		<div class="container class-detail-container">
			<div class="row justify-content-between title">
				<h6>
					<a href="productlist.pro?PRODUCT_CATEGORY=all">STORE</a> > 상세보기
				</h6>
			</div>
			<div class="row" style="padding-bottom: 5%;">
				<div class="col-7">
					<div class="row justify-content-center pt-4">
						<div class="thumbList">
							<%
								for (int i = 0; i < imgArr.length; i++) {
							%>
							<div class="thumbItem<%if (i == 0) {%> thumbCheck <%}%>"
								thumb-idx=<%=i%>>
								<img src=<%=imgArr[i]%>>
							</div>
							<%
								}
							%>
						</div>
						<div class="thumbMain">
							<a href=<%=imgArr[0]%> target="_blank"><img
								src=<%=imgArr[0]%>></a>
						</div>
					</div>
				</div>
				<div class="col-5">
					<form name="goodsform" action="#" method="post" id="goodsform">
						<div class="row pt-4 pl-4">
							<div class="col-3">
								<img
									src="${pageContext.request.contextPath}/resources/images/Community/peko.png"
									width="95%">
							</div>
							<hr>
							<div class="col-9">
								<h3 name="PRODUCT_SHOPNAME"><%=vo.getPRODUCT_SHOPNAME()%></h3>
								<p name="PRODUCT_TITLE">
									<font size="2"><%=vo.getPRODUCT_BRIEF()%></font>
								</p>
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
										<td><select name="BASKET_COLOR" size="1"
											class="form-control BASKET_COLOR">
												<option value="">선택</option>
												<c:forTokens var="color" items="<%=PRODUCT_COLOR %>"
													delims=",">
													<option value="${fn:trim(color)}">${fn:trim(color)}</option>
												</c:forTokens>
										</select></td>
									</tr>
									<tr>
										<th scope="row">사이즈선택</th>
										<td><select name="BASKET_SIZE" size="1"
											class="form-control BASKET_SIZE">
												<option value="">선택</option>
												<c:forTokens var="size" items="<%=PRODUCT_SIZE %>" delims=",">
													<option value="${fn:trim(size)}">${fn:trim(size)}</option>
												</c:forTokens>
										</select></td>
									</tr>
									<tr>
										<th scope="row">수량</th>
										<td>
											<div>
												<select name="BASKET_AMOUNT" size="1" class="form-control BASKET_AMOUNT">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">총 합계금액</th>
										<td></td>
									</tr>
									<tr>
										<td colspan="2">
											<div class="d-flex justify-content-between">
												<% 
														if(WORKSHOP_CEO_NAME == null && MEMBER_EMAIL == null) { 
													%>
												<%-- 비로그인일 때 --%>
												<div>
													<button type="button" class="btn btn-outline-dark btn-lg"
														data-toggle="modal" data-target="#exampleModalCenter">
														<input type="hidden" name="PRODUCT_NUM"
															value="<%=PRODUCT_NUM %>">♥
													</button>
												</div>
												<div style="width: 45%;">
													<button type="button"
														class="btn btn-outline-dark btn-lg btn-block"
														data-toggle="modal" data-target="#exampleModalCenter">장바구니</button>
												</div>
												<div style="width: 45%;">
													<button type="button"
														class="btn btn-outline-dark btn-lg btn-block"
														data-toggle="modal" data-target="#exampleModalCenter">바로구매</button>
												</div>
												<% 
														} else if(WORKSHOP_CEO_NAME != null) { 
													%>
												<%-- 공방 로그인일 때(하트 안 보임) --%>
												<div style="width: 50%;">
													<a href="classreservation.ac"
														class="btn btn-outline-dark btn-lg btn-block disabled"
														role="button" aria-pressed="true">장바구니</a>
												</div>
												<div style="width: 50%;">
													<a href="#"
														class="btn btn-outline-dark btn-lg btn-block disabled"
														role="button" aria-pressed="true">바로구매</a>
												</div>
												<% 
														} else { 
													%>
												<%-- 일반회원일때 --%>
												<div>
													<a href="#" class="btn btn-outline-dark btn-lg LikeAjax"
														role="button" aria-pressed="true"> <input
														type="hidden" name="PRODUCT_NUM" value="<%=PRODUCT_NUM %>">♥
													</a>
												</div>
												<div style="width: 45%;">
													<a href="#" class="btn btn-outline-dark btn-lg btn-block"
														role="button" aria-pressed="true" id="basket_btn">장바구니</a>
												</div>
												<div style="width: 45%;">
													<a href="#" class="btn btn-outline-dark btn-lg btn-block"
														role="button" aria-pressed="true" id="order_btn">바로구매</a>
												</div>
												<% 
														} 
													%>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="btnArea text-center"></div>
						<br />
					</form>
				</div>
			</div>
			<div class="row" style="padding: 15px 15px;">
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
					
					<div id="ReviewSection">
						<div id="ReviewButtonSection">	
							<div class="row justify-content-center pt-3 pb-3"> <!-- 리뷰 댓글달기 버튼 -->
								<button class="btn btn-dark btn-sm review_btn">댓글 달기</button>
							</div>
						</div>
						<div id="ReviewWrapSection" class="pb-1">
							<div id="ReviewformSection" class="pb-2">
								<form id="ReviewForm" name="REVIEW_CONTENT" enctype="multipart/form-data"> <!-- 리뷰 작성 폼 영역 : 하나 -->
									<input type="hidden" name="MEMBER_NUM" value="MEMBER_NUM">
									<input type="hidden" name="PRODUCT_NUM" value="<%=PRODUCT_NUM %>">
									<div class="row justify-content-center">
										<div class="col-1 justify-content-end">
											<img src="<%=MEMBER_PICTURE%>" alt="" class="rounded-circle">
										</div>
										<div class="col-11">
											<div class="row pb-1">
												<div class="col-2 justify-content-end name"><%=MEMBER_NICK%> </div>
												<div class="col-8 justify-content-center"></div>
												<div class="col-2 justify-content-center smallfont"></div>
											</div>
											<div class="row pb-1"> <!-- 평점 -->
												<div class="col-3 pr-0">
													<img src="${pageContext.request.contextPath}/resources/images/star1.png" alt="" width="15px" height="15px" >
													&nbsp;
													<select name="REVIEW_GRADE" id="REVIEW_GRADE" style="">
														<option value="0">0</option>
														<option value="0.5">0.5</option>
														<option value="1">1.0</option>
														<option value="1.5">1.5</option>
														<option value="2">2.0</option>
														<option value="2.5">2.5</option>
														<option value="3">3.0</option>
														<option value="3.5">3.5</option>
														<option value="4">4.0</option>
														<option value="4.5">4.5</option>
														<option value="5">5.0</option>
													</select>											
												</div>
												<div class="9"></div>
											</div>
											
											<div class="row pb-2"> <!-- 파일 -->
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
											<div class="row pb-2">
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
											<div class="row"> <!-- 수정, 삭제 -->
												<div class="col-2 justify-content-center"></div>
												<div class="col-8 justify-content-center"></div>
												<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;">
													<a class="insertReview">작성</a> &nbsp;
													<a class="formCancel" value="ReviewForm">취소</a>
												</div>
											</div>
										</div>
									</div>
								</form>		
							</div>
							<div id="ReviewtableSection" class="pb-2">
							
								
							</div>
						</div>
					</div>
	
	                  
					<!-- 리뷰 pagenation -->
					<br/>
					
					
					<br />
					<!-- 리뷰 pagenation 끝 -->
		
		
			
					<span id="t3"></span>
					<br /><br /><hr />
					
					<!-- Q&A 테이블 시작 -->
					<h3 id="qna_scroll">Q&A</h3>
					<br /><br />
		
	            
					<div id="QnaSection">
						<div id="QnaButtonSection">	
							<div class="row justify-content-center pt-3 pb-3"> <!-- 리뷰 댓글달기 버튼 -->
								<button class="btn btn-dark btn-sm qna_btn">문의하기</button>
							</div>
						</div>
						<div id="QnaWrapSection" class="pb-1">
							<div id="QnaformSection" class="pb-2">
								<form id="QnaForm" name="QNA_CONTENT"> <!-- 리뷰 작성 폼 영역 : 하나 -->
									<input type="hidden" name="MEMBER_NUM" value="MEMBER_NUM">
									<input type="hidden" name="PRODUCT_NUM" value="<%=PRODUCT_NUM %>">
									<div class="row justify-content-center">
										<div class="col-1 justify-content-end">
											<img src="<%=MEMBER_PICTURE%>" alt="" class="rounded-circle">
										</div>
										<div class="col-11">
											<div class="row pb-1">
												<div class="col-2 justify-content-end name"><%=MEMBER_NICK%> </div>
												<div class="col-8 justify-content-center"></div>
												<div class="col-2 justify-content-center smallfont"></div>
											</div>
											<div class="row pb-1">	<!-- 내용 textarea -->
												<div class="col-11 pr-0">
													<textarea rows="3" name="QNA_CONTENT" class="col-12 pl-0 pr-0" 
														id=""></textarea>
												</div>	
											</div>
											<div class="row"> <!-- 수정, 삭제 -->
												<div class="col-2 justify-content-center"></div>
												<div class="col-8 justify-content-center"></div>
												<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;">
													<a class="qnaReview">작성</a> &nbsp;
													<a class="formCancel" value="QnaForm">취소</a>
												</div>
											</div>
										</div>
									</div>
								</form>		
							</div>
							<div id="QnatableSection" class="pb-2">
							
								
							</div>
						</div>
					</div>
				
				
					<!-- Q&A pagenation -->
					<br/>
					
					
					<br />
					<!-- Q&A pagenation 끝 -->			
				
				
				
				
				
					<!-- Q&A 테이블 끝 -->
					
					<br /><br /><hr />
		
		      
		            <!-- 배송 및 환불 시작 -->
		      
		            <h3 id="t4">배송 및 환불</h3>
		            <br /><br />
					<div class="ship_info" style="width: 100%; margin: 0 auto; font-size: 0.9em; color: #212529;">
						<div class="row_ship_info">
					    	<h5>배송정보</h5>
							모든 제품은 메이킹퍼니처 직원이 직접 배송하며 배송비는 고객 부담입니다. 지역, 제품 수량 또는 설치 여부에 따라 주문 시
							배송비를 미리 안내해드립니다. 기본 배송비 외에 사다리차, 엘레베이터, 주차비 사용료 등 추가 비용이 발생 시 고객님
							부담입니다.
							<%=vo.getPRODUCT_SHIP_INFO() %>
						</div>
						<div class="row_ship_info">
							<h5>배송정보</h5>
							모든 제품은 메이킹퍼니처 직원이 직접 배송하며 배송비는 고객 부담입니다. 지역, 제품 수량 또는 설치 여부에 따라 주문 시
							배송비를 미리 안내해드립니다. 기본 배송비 외에 사다리차, 엘레베이터, 주차비 사용료 등 추가 비용이 발생 시 고객님
							부담입니다.
							반품 배송지 : <%=vo.getPRODUCT_SHIP_RETURN_PLACE() %>
						</div>
						<br />
						
						<div class="row_ship_info">
							<h5>A/S</h5>
							핸드메이드 제품으로 나뭇결, 무늬, 옹이의 형태나 파임, 칠과 색상이 다를 수 있고 약간의 흠집이나 찍힘(표면의 크랙 또는
							뜯김)이 있을 수 있으며, 100% 원목으로 기후변화에 따른 수축, 팽창으로 인한 휘어짐(상판), 갈라짐(마구리면)이
							발생할 수 있습니다. 이런 자연스러운 현상들은 교체 및 교환 대상이 아니며 무상 A/S 사유가 되지 않습니다. 구매 전 꼭
							참고해주시기 바랍니다.
							<%=vo.getPRODUCT_AS_INFO() %>
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
							<%=vo.getPRODUCT_STORE_INFO() %>
						</div>
						<br />
						
						<div class="row_ship_info">
							<h5>A/S규정[1년 무상]</h5>
							무상 A/S -보증기간 이내의 제품으로 정상적인 상태에서 제조상의 결함 제품 -원/부나내의 결함이 발생된 경우
							-메이킹퍼니처의 귀책 사유로 인한 결함 발생 제품
							<%=vo.getPRODUCT_RETURN_INFO() %>
						</div>
						<div class="row_ship_info">
							유상 A/S -고객의 취급 부주의 및 고의적 훼손 경우 -고객 임의 개조에 의한 파손의 경우나 타 업체에서 수리해 변경된 경우 -유상 서비스 요금은 [수리비+부품비+출장비+기타실 비용] 등이 포함됩니다.
						</div>
					</div>
				</div>
				<div class="col-4">
		        	<div class="sticky2" style="border: 1px solid #EAEAEA;">
		            	<form name="goodsform" action="#" method="post" id="goodsform">
		                	<div>
		                    	<table class="table table-borderless">
		                        	<tbody>
			                            <tr>
											<th scope="row">색상선택</th>
											<td>
												<select name="BASKET_COLOR" size="1" class="form-control BASKET_COLOR">
													<option value="">선택</option>
													<c:forTokens var="color" items="<%=PRODUCT_COLOR %>" delims=",">
														<option value="${fn:trim(color)}">${fn:trim(color)}</option>
													</c:forTokens>
												</select>
											</td>
										</tr>
										<tr>
											<th scope="row">사이즈선택</th>
											<td>
												<select name="BASKET_SIZE" size="1" class="form-control BASKET_SIZE">
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
												<div>
													<select name="BASKET_AMOUNT" size="1" class="form-control BASKET_AMOUNT">
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
													</select>
												</div>
											</td>
										</tr>
										<tr><td></td></tr>
										<tr><td></td></tr>
										<tr><td></td></tr>
										<tr><td></td></tr>
										<tr><td></td></tr>
										<tr><td></td></tr>
										<tr><td></td></tr>
										<tr><td></td></tr>
										<tr><td></td></tr>
										<tr><td></td></tr>
										<tr><td></td></tr>
									</tbody>
								</table>
		                  	</div>
		                  	<div>
		                  		<table class="table table-borderless">
		                  			<tbody>
		                  				<tr>
											<th scope="row">총 합계금액</th>
											<td></td>
										</tr>
		                  			</tbody>
		                  		</table>
		                  	</div>
							<div class="d-flex justify-content-between d-flex align-items-end">
								<% 
									if(WORKSHOP_CEO_NAME == null && MEMBER_EMAIL == null) { 
								%> <%-- 비로그인일 때 --%>
									<div>
										<button type="button" class="btn btn-outline-dark btn-lg" data-toggle="modal" data-target="#exampleModalCenter">
											<input type="hidden" name = "PRODUCT_NUM" value="<%=PRODUCT_NUM %>">♥
										</button>
									</div>	
									<div style="width:45%;">
										<button type="button" class="btn btn-outline-dark btn-lg btn-block" data-toggle="modal" data-target="#exampleModalCenter" >장바구니</button>
									</div>
									<div style="width:45%;">
										<button type="button" class="btn btn-outline-dark btn-lg btn-block" data-toggle="modal" data-target="#exampleModalCenter" >바로구매</button>
									</div>
								<% 
									} else if(WORKSHOP_CEO_NAME != null) { 
								%>	<%-- 공방 로그인일 때(하트 안 보임) --%>
										<div style="width:50%;">
											<a href="classreservation.ac" class="btn btn-outline-dark btn-lg btn-block disabled" role="button" aria-pressed="true">장바구니</a>
										</div>
										<div style="width:50%;">
											<a href="#" class="btn btn-outline-dark btn-lg btn-block disabled" role="button" aria-pressed="true" >바로구매</a>
										</div>
								<% 
									} else { 
								%> <%-- 일반회원일때 --%>
										<div>
											<a href="#" class="btn btn-outline-dark btn-lg LikeAjax" role="button" aria-pressed="true">
												<input type="hidden" name = "PRODUCT_NUM" value="<%=PRODUCT_NUM %>">♥
											</a>
										</div>
										<div style="width:45%;">
											<a href="#" class="btn btn-outline-dark btn-lg btn-block" role="button" aria-pressed="true" id="basket_btn">장바구니</a>
										</div>
										<div style="width:45%;">
											<a href="#" class="btn btn-outline-dark btn-lg btn-block" role="button" aria-pressed="true" id="order_btn">바로구매</a>
										</div>
								<% 
									} 
								%>
							</div>
							<br/>
						</form>
					</div>
				</div>
			</div>
    		<br>
		</div>
   <!-- content end -->
<script>

   	$('#basket_btn').on('click',function(){
		var params=$("#goodsform").serialize();
		$.ajax({
			  url: "/NAGAGU/insertBasket.my",
              type: "POST",
              data: params,
              contentType:
  				'application/x-www-form-urlencoded; charset=utf-8',
              success: function (retVal) {
            	  console.log(params)
        		if(retVal.res=="OK"){
        			if(confirm('장바구니로 이동하시겠습니까?')){
        				location.href= '${pageContext.request.contextPath}/mypage_basket.my'
        			}else{
        				alert("장바구니에 담겼습니다")
        			}
				}else{
					alert("update fail");
				}  
			 },
			error:function(){
				alert("ajax통신 실패!!");
			}
		})
   	});
   	$('#order_btn').on('click',function(){
		if(confirm('이동?')){
			var url = '${pageContext.request.contextPath}/mypage_order.my'
				+ '?PRODUCT_NUM='+<%=vo.getPRODUCT_NUM()%>
			var frm=document.getElementById("goodsform");
			//frm.action=url;
			//frm.submit();
			//location.href=url;			
		}	
   	})

    /*장바구니 수량 변경*/
	function count_change(temp) {
		var test = document.goodsform.BASKET_AMOUNT.value;
		if (temp == 0) {
			test++;
		} else if (temp == 1) {
			if (test > 1)
				test--;
		}
		document.goodsform.BASKET_AMOUNT.value = test;
	}
      
  //장바구니 2개 밸류 일치시키기
    $('select[name=BASKET_COLOR]').on('change',function(){
       var value = $(this).val()
       $('.BASKET_COLOR').val(value)
    })
    $('select[name=BASKET_SIZE]').on('change',function(){
       var value = $(this).val()
       $('.BASKET_SIZE').val(value)
    })
    $('select[name=BASKET_AMOUNT]').on('change',function(){
       var value = $(this).val()
       $('.BASKET_AMOUNT').val(value)
    })

 
	function infochange() {
		if($('#comment_info').val() == '등록된 댓글이 없습니다') {
			$('#comment_info').val('');
		} else {
		//  	  $('#comment_info').val('등록된 댓글이 없습니다');
		}
		if($('#qna_info').val() == '등록된 문의가 없습니다') {
		$('#qna_info').val('');
		} else {
		//      	  $('#qna_info').val('등록된 문의가 없습니다');  
		}
	}      
      

      
      
	//좋아요 기능
	$(document).ready(function(){  
		//처음 로드되고 로그인 사용자가 누른글 하트는 검게 바꿔줌
		function heart_check(){
			var PRODUCT_NUM = <%=PRODUCT_NUM%>;
			if(<%=MEMBER_STATUS%> == 100){
				return;
			}
			$.ajax({
				url: "/NAGAGU/getProductLike.pro",
				type: "POST",
				data: { 'PRODUCT_NUM' : PRODUCT_NUM},
				datatype: 'json',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function (retVal) {
					if(retVal.status==0){
						$('.LikeAjax').removeClass('addlike');
					}else {
						$('.LikeAjax').addClass('addlike');
					}
				},
				error:function(){
					alert("heart_check ajax통신 실패!!");
				}
			})
		}
		heart_check()
         
         
		//좋아요 누르는 기능
		$(document).on("click",".LikeAjax",function getLike(){
			if(<%=MEMBER_STATUS%> == 100){
				alert('로그인 해주세요!');
				return
			}
			var MEMBER_NUM = <%=MEMBER_NUM%>;
			alert(MEMBER_NUM);		
			
            var PRODUCT_NUM = $(this).children('input').val();
            alert(PRODUCT_NUM);
			$.ajax({
				url: "/NAGAGU/insertProLike.pro",
				type: "POST",
				data: { 'MEMBER_NUM' : MEMBER_NUM , 'PRODUCT_NUM' : PRODUCT_NUM},
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function (retVal) {
					alert(retVal.cnt);
					if(retVal.cnt=='0') {
					   
						$('.LikeAjax').addClass('addlike');                     
					} else {
						$('.LikeAjax').removeClass('addlike');
					   
					}
				     
				},
				error:function(){
					alert("LikeAjax ajax통신 실패!!");   
				}
			})
			event.preventDefault();
         });
	 });      
      

	//------------------------------------------- 상품 이미지 관련
	$(document).delegate('.thumbItem', 'click', function() {
		var idx = $(this).attr('thumb-idx');
		$('.thumbItem').removeClass('thumbCheck');
		$(this).addClass('thumbCheck');
		if (idx == 0) {
			$('.thumbMain').html('<a href="' + '<%=imgArr[0]%>' + '" target="_blank"><img src="' + '<%=imgArr[0]%>' + '"></a>');
		} <% if (imgArr.length > 1) { %> else if (idx == 1) {
			$('.thumbMain').html('<a href="' + '<%=imgArr[1]%>' + '" target="_blank"><img src="' + '<%=imgArr[1]%>' + '"></a>');
		} <% } if (imgArr.length > 2) { %> else if (idx == 2) {
			$('.thumbMain').html('<a href="' + '<%=imgArr[2]%>' + '" target="_blank"><img src="' + '<%=imgArr[2]%>' + '"></a>');
		} <% } if (imgArr.length > 3) { %> else if (idx == 3) {
			$('.thumbMain').html('<a href="' + '<%=imgArr[3]%>' + '" target="_blank"><img src="' + '<%=imgArr[3]%>' + '"></a>');
		} <% } if (imgArr.length > 4) { %> else if (idx == 4) {
			$('.thumbMain').html('<a href="' + '<%=imgArr[4]%>' + '" target="_blank"><img src="' + '<%=imgArr[4]%>' + '"></a>');
		} <% } %>
	});
	 
	 

	$(document).ready(function() {
		
//		pageMove(1);	//페이지에 처음 들어올 경우 고려

		/*댓글 등록할 때 사진 여러개일 때 쪼개주는 함수*/
		function splitImg(REVIEW_FILE) {		// , 가 몇 개 있는지만 구하면 된다
			var reviewImgArray = REVIEW_FILE.split(',');
			return reviewImgArray;
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
		

		function getReviewList() {
			$('#ReviewtableSection').empty();	//table 내부 내용을 제거(초기화)
			$.ajax({
				url:'/NAGAGU/getReviewList.pro',
				type:'POST',
				data : { 'PRODUCT_NUM' : <%=PRODUCT_NUM%> },
				dataType : "json", // 서버에서 보내줄 데이터 타입
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success:function(retVal) {
					var reviewCount = retVal.reviewCount;
					console.log(retVal.reviewList)
					console.log("retVal.reviewCount : "+retVal.reviewCount)
					console.log("retVal.reviewList : "+retVal.reviewList)
					console.log("retVal.review_RE_Count : "+retVal.review_RE_Count)
					console.log("retVal.review_RE_List : "+retVal.review_RE_List)
					
					
					
					if(retVal.reviewCount > 0) {
						for(var i=0; i<retVal.reviewList.length; i++) {	//reviewCount도 상관 없음
							var output='';
							var REVIEW_NUM = retVal.reviewList[i].REVIEW_NUM;
							var MEMBER_PICTURE = retVal.reviewList[i].MEMBER_PICTURE;
							var MEMBER_NICK = retVal.reviewList[i].MEMBER_NICK;
							var REVIEW_DATE = new Date(retVal.reviewList[i].REVIEW_DATE);
							var date = date_format(REVIEW_DATE);
							var REVIEW_GRADE = retVal.reviewList[i].REVIEW_GRADE;
							var rate = 20*retVal.reviewList[i].REVIEW_GRADE;
							var REVIEW_FILE = retVal.reviewList[i].REVIEW_FILE;
							var REVIEW_CONTENT = retVal.reviewList[i].REVIEW_CONTENT;

							output += '<div class="ReviewAndReplySum pb-3" id="ReviewAndReplySum'+REVIEW_NUM+'">';
							output += '<div class="ReviewSum" id="ReviewSum'+REVIEW_NUM+'">';
							output += '<div class="ReviewList pb-3" id="ReviewList'+REVIEW_NUM+'">';
							output += '<div class="beforeModifyReview" id="beforeModifyReview'+REVIEW_NUM+'">';
							output += '<div class="row justify-content-center">';
							output += '<div class="col-1 justify-content-end"><img src="'+MEMBER_PICTURE+'" alt="" class="rounded-circle"></div>';
							output += '<div class="col-11">';
							output += '<div class="row pb-1">';
							output += '<div class="col-2 justify-content-end name">'+MEMBER_NICK+'</div>';
							output += '<div class="col-8 justify-content-center"></div>';
							output += '<div class="col-2 justify-content-center smallfont">'+date+'</div>';
							output += '</div>';
							output += '<div class="row pb-2">';
							output += '<div class="col-12" style="font-size:0.7em; font-weight:bold;">'+REVIEW_GRADE+' &nbsp;';
							output += '<span class="star-rating">';
							output += '<span style ="width:'+rate+'%"></span>';
							output += '</span></div></div>';
							output += '<div class="row pb-2">';
							output += '<div class="col-12">';
							
							if(REVIEW_FILE == '#') {
								output += '<img src="#" class="review_img"  style="display:none;">   &nbsp;&nbsp;';            
							} else {
								//split함수 호출 //, 가 몇 개 있는지 구해서 //for문으로 그 개수만큼 돌림...review_file[i]
								var reviewImgArray = splitImg(REVIEW_FILE);
								for(var k=0;k<reviewImgArray.length;k++) {
									output += '<img src="/productupload/image/' + reviewImgArray[k] + '" class="review_img">&nbsp;';                        
								}               
							}
							
							output += '</div></div>';
							output += '<div class="row pb-2">';
							output += '<div class="col-11 pr-0">' + REVIEW_CONTENT + '</div></div>';
							output += '<div class="row">';
							output += '<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold; cursor: pointer;">';
							output += '<a class="review_replybtn" id="review_replybtn' + REVIEW_NUM + '" value="' + REVIEW_NUM + '">답글</a>';
							output += '</div>';
							output += '<div class="col-8 justify-content-center"></div>';
							console.log("MEMBER_NICK = " + MEMBER_NICK)
							//작성 본인만 수정,삭제버튼 보인다
							if('<%=MEMBER_NICK%>' == MEMBER_NICK) {
								output += '<div class="col-2 beforeControl justify-content-center" id="beforeControl'+REVIEW_NUM+'" style="font-size:0.7em; font-weight:bold;">';
								output += '<input type="hidden" name="REVIEW_NUM" value="'+REVIEW_NUM+'">';
								output += '<a class="gomodifyReviewform">수정</a> &nbsp;';
								output += '<a class="deleteReview">삭제</a>';
								output += '</div>';
							}
							
							output += '</div></div></div></div>';
							output += '<div class="afterModifyReview" id="afterModifyReview'+REVIEW_NUM+'"></div>';
							output += '</div></div>';
							
							output += '<div class="ReviewReplySum" id="ReviewReplySum'+REVIEW_NUM+'">';
							output += '<div class="ReviewReplyformSection" id="ReviewReplyformSection'+REVIEW_NUM+'"></div>';
					//		output += '<div class="ReviewReplyInsertSpace" id="ReviewReplyInsertSpace'+REVIEW_NUM+'"></div>';
							if(retVal.review_RE_Count>0) {
								for(var j=0; j<retVal.review_RE_List.length; j++) {
									if(REVIEW_NUM == retVal.review_RE_List[j].REVIEW_RE) {
										var REPLY_NUM = retVal.review_RE_List[j].REVIEW_NUM;
										var REPLY_NICK = retVal.review_RE_List[j].MEMBER_NICK;
										var REPLY_PICTURE = retVal.review_RE_List[j].MEMBER_PICTURE;
										var REPLY_CONTENT = retVal.review_RE_List[j].REVIEW_CONTENT;
										var REPLY_DATE = new Date(retVal.review_RE_List[j].REVIEW_DATE);
										var replydate = date_format(REPLY_DATE);

										//리뷰 출력
										output += '<div class="ReviewReplyList pb-2" id="ReviewReplyList'+REPLY_NUM+'">';
										output += '<div class="row justify-content-center">';
										output += '<div class="col-1"></div>';
										
										output += '<div class="col-1"><img src="'+REPLY_PICTURE+'" alt="" class="rounded-circle"></div>';
										output += '<div class="col-10">';
										output += '<div class="row">';
										output += '<div class="col-2 justify-content-end name">'+REPLY_NICK+'</div>';
										output += '<div class="col-8 justify-content-center"></div>';
										output += '<div class="col-2 justify-content-center smallfont pl-1">'+replydate+'</div>';
										output += '</div>';
										output += '<div class="beforeModifyReviewReply" id="beforeModifyReviewReply'+REPLY_NUM+'">';
										output += '<div class="row">';
										output += '<div class="col-11 pr-0">'+REPLY_CONTENT;
										output += '</div></div></div>';
										output += '<div class="afterModifyReviewReply" id="afterModifyReviewReply'+REPLY_NUM+'">';
										output += '<form class="modifyReviewReplyForm" id="modifyReviewFormReply'+REPLY_NUM+'">';	
										output += '<div class="row">';			
										output += '<div class="col-11 pr-0">';			
										output += '<input type="hidden" name="REVIEW_NUM" value="'+REPLY_NUM+'">';			
										output += '<textarea rows="2" name="REVIEW_CONTENT" id="REVIEW_CONTENT'+REPLY_NUM+'" class="col-12 pl-0 pr-0">'+REPLY_CONTENT+'</textarea>';			
										output += '</div></div></form></div>';
										output += '<div class="row">';
										output += '<div class="col-2 replytext justify-content-center"></div>';
										output += '<div class="col-8 justify-content-center"></div>';
										
										//작성 본인만 수정,삭제버튼 보인다
										if('<%=MEMBER_NICK%>' == REPLY_NICK) {
										
											output += '<div class="col-2 beforeControl justify-content-center pl-1" id="beforeControl'+REPLY_NUM+'">';								
											output += '<input type="hidden" name="REVIEW_NUM" value="'+REPLY_NUM+'">';
											output += '<a class="gomodifyReviewReplyform">수정</a> &nbsp;';
											output += '<a class="deleteReview">삭제</a>';
											output += '</div>';
											output += '<div class="col-2 afterControl justify-content-center pl-1" id="afterControl'+REPLY_NUM+'">';
											output += '<input type="hidden" name="REVIEW_NUM" value="'+REPLY_NUM+'">';
											output += '<a class="modifyReviewReply">수정</a> &nbsp;';
											output += '<a class="formCancel" value="reviewReplyModify">취소</a>';
											output += '</div>';
										}
										output += '</div></div></div></div>';
									}			
								}
							}
							
							output += '</div></div>';
							$('#ReviewtableSection').append(output);				
						}	//for 끝					
					} else {
						var output = '등록된 댓글이 없습니다.';
						$('#ReviewtableSection').append(output);	//이상한데...!?!?!?
					}


		          },
		          error:function() {
		             alert("getReviewList ajax통신 실패!!!");
		          }
	       });
		}
		

	
		//Review 등록하기 버튼(insert) //원글
		$(document).on("click",".insertReview",function(event){
			var formId = 'ReviewForm';
			var REVIEW_RE = 0;	//원글
	
	
			var form = new FormData(document.getElementById(formId));
		
			$.ajax({
				url : "/NAGAGU/insertReview.do", 
				data : form,
				dataType: 'json',
				processData : false,
				contentType : false,
				type : 'POST',				
				success:function(retVal) {
					if(retVal.insertres == "OK") {
		 				$("#ReviewformSection").css('display','none');	//댓글 등록 성공하면 form은 초기화
						$('#ReviewForm').each(function() {  
							this.reset();  
						});  
						$('.imgs_wrap').empty();
						$("#ReviewButtonSection").show();
						getReviewList();
					} else {
						alert("insert 실패!!!");
					}
				},
				error:function() {
					alert("ajax통신 실패!!!");
				}
				
			});
			event.preventDefault();		
		})

		

		//Review 등록하기 버튼(insert) //답글
		$(document).on("click",".insertReviewReply",function(event){
			var REVIEW_NUM = $(this).prev().val();	//원글번호(review_re로 저장할 것)
			console.log("REVIEW_NUM : " + REVIEW_NUM)
			
			var formId = 'ReviewReplyform'+REVIEW_NUM;
			var form = new FormData(document.getElementById(formId));
			$.ajax({
				url : "/NAGAGU/insertReview.do", 
				data : form,
				dataType: 'json',
				processData : false,
				contentType : false,
				type : 'POST',				
				success:function(retVal) {
					if(retVal.insertres == "OK") {
		 				
						getReviewList();
					} else {
						alert("insert 실패!!!");
					}
				},
				error:function() {
					alert("ajax통신 실패!!!");
				}
			});
			event.preventDefault();			

		})
		
		
//Review 수정하기----------------------------------------------------------------------------------------------------	  		
			
		//review 수정 폼 (원글)
		$(document).on("click",".gomodifyReviewform",function(event){
			var REVIEW_NUM = $(this).prev().val();
			console.log("REVIEW_NUM : " + REVIEW_NUM)
			
			$('#beforeModifyReview'+REVIEW_NUM).css('display', 'none');
			

			$.ajax({
				url : "/NAGAGU/gomodifyReviewform.do", 
				data : { 'REVIEW_NUM' : REVIEW_NUM },
				dataType: 'JSON',
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				type : 'POST',				
				success:function(retVal) {
					console.log(retVal)
					if(retVal.res == "OK") {
		 				var output='';
						var REVIEW_NUM = retVal.reviewVO.review_NUM;
						var REVIEW_DATE = new Date(retVal.reviewVO.review_DATE);
						var date = date_format(REVIEW_DATE);
						var REVIEW_GRADE = retVal.reviewVO.review_GRADE;
						var REVIEW_FILE = retVal.reviewVO.review_FILE;
						var REVIEW_CONTENT = retVal.reviewVO.review_CONTENT;		 
		 				var beforeimgcount = 0;	//수정폼 뿌렸을 때 기존 이미지 n개 표시하기 위해
						
		 				output += '<form class="modifyReviewForm" id="modifyReviewForm'+REVIEW_NUM+'">';
		 				output += '<div class="row justify-content-center">';
		 				output += '<div class="col-1 justify-content-end"><img src="<%=MEMBER_PICTURE%>" alt="" class="rounded-circle"></div>';
		 				output += '<div class="col-11">';
		 				output += '<div class="row pb-1">';
		 				output += '<div class="col-2 justify-content-end name"><%=MEMBER_NICK%></div>';
		 				output += '<div class="col-8 justify-content-center"></div>';
		 				output += '<div class="col-2 justify-content-center smallfont">'+date+'</div>';
		 				output += '</div>';
		 				output += '<div class="row pb-2">';
		 				output += '<div class="col-3 pr-0">';
		 				output += '<img src="${pageContext.request.contextPath}/resources/images/star1.png" alt="" width="15px" height="15px">&nbsp;';
		 				output += '<select name="REVIEW_GRADE" id="REVIEW_GRADE'+REVIEW_NUM+'"style="width=15px;">';
		 				output += '<option value="0">0</option><option value="0.5">0.5</option><option value="1">1.0</option><option value="1.5">1.5</option>';
		 				output += '<option value="2">2.0</option><option value="2.5">2.5</option><option value="3">3.0</option><option value="3.5">3.5</option>';
		 				output += '<option value="4">4.0</option><option value="4.5">4.5</option><option value="5">5.0</option></select></div>';
		 				output += '<div class="9"></div></div>';
		 				output += '<div class="row ">';
		 				output += '<div class="col-12 pb-2">';
						if(REVIEW_FILE == '#') {
							output += '<img src="#" class="review_img"  style="display:none;">   &nbsp;&nbsp;';            
						} else {
							output += '<div class="before_imgs_wrap">';
							reviewImgArray = splitImg(REVIEW_FILE);
							beforeimgcount = reviewImgArray.length;
							for(var k=0;k<reviewImgArray.length;k++) {
								output += '<a onclick="deleteBeforeImageAction('+k+')" id="beforeimg_id_'+k+'">';                        
								output += '<img src="/productupload/image/' + reviewImgArray[k] + '" class="review_img beforeimg" value="'+reviewImgArray[k]+'" title="Click to remove" width="100" height="100">&nbsp;';                        
								output += '</a>';
							}     
							output += '</div>';
							output += '<div class="modify_imgs_wrap">';
							output += '<img id="modify_inputimg" >';
							output += '</div>';
						}
						output += '</div>';
						output += '<div class="col-12 pb-2">';
		 				output += '<div class="file_input">';		
		 				output += '<label>추가 업로드<input type="file" multiple="multiple" name="REVIEW_FILE" id="modify_input_imgs"></label>';		
		 				output += '<input type="text" readonly="readonly" title="File Route" value="기존 파일'+beforeimgcount+'개">';		
		 				output += '</div></div></div>';		
		 				output += '<div class="row">';		
		 				output += '<div class="col-11 pr-0">';		
		 				output += '<textarea rows="3" name="REVIEW_CONTENT" id="REVIEW_CONTENT'+REVIEW_NUM+'" class="col-12 pl-0 pr-0">'+REVIEW_CONTENT+'</textarea>';		
		 				output += '</div></div>';	
		 				output += '<div class="row">';	
		 				output += '<div class="col-2 justify-content-center"></div>';	
		 				output += '<div class="col-8 justify-content-center"></div>';	
		 				output += '<div class="col-2 justify-content-center" id="review_control" style="font-size:0.7em; font-weight:bold;">';
		 				output += '<input type="hidden" name="deleteImg" value="">';		
		 				output += '<input type="hidden" name="beforeImg" value="">';		
		 				output += '<input type="hidden" name="REVIEW_NUM" value="'+REVIEW_NUM+'">';	
		 				output += '<a class="modifyReview" style="cursor: pointer;">수정</a> &nbsp;';	
		 				output += '<a class="formCancel" value="reviewModify" style="cursor: pointer;">취소</a>';	
		 				output += '</div></div></div></div></form>';
		 				
		 				$('#afterModifyReview'+REVIEW_NUM).append(output);
		 				$("#REVIEW_GRADE"+REVIEW_NUM).val(+REVIEW_GRADE).prop("selected", true); //원래 평점을 set해줌
					} else {
						alert("수정폼 데이터 가져오기 실패!!!");
					}
				},
				error:function() {
					alert("ajax통신 실패!!!");
				}
			});
			event.preventDefault();		
		})		
		
		
		
		//review 수정 process (원글)
		$(document).on("click",".modifyReview",function(event){
			var REVIEW_NUM = $(this).prev().val();
			console.log("REVIEW_NUM"+REVIEW_NUM)
			
			//deleteImg는 기존 이미지 중 삭제 원하는 사진
			//beforeImg는 기존 이미지 중 원하는 사진은 삭제하고 남은 사진들. 새로 추가한 사진과 함께 db에 다시 업로드할 것임
			var beforeImg = '';		//beforeImg는 
			for(var i=0;i<$('.beforeimg').length;i++) {
				var tmp = $('.beforeimg')[i];
				beforeImg += $(tmp).attr("value") + ',';
			}
			console.log("beforeImg : "+beforeImg)
			$("input[type=hidden][name=beforeImg]").val(beforeImg);

 			var formId = 'modifyReviewForm'+REVIEW_NUM;
 	 		var form = new FormData(document.getElementById(formId));
			$.ajax({
				url : "/NAGAGU/modifyReview.do", 
				data : form,
				dataType: 'json',
				processData : false,
				contentType : false,
				type : 'POST',				
				success:function(retVal) {
					if(retVal.res == "OK") {
						getReviewList();
					} else {
						alert("수정 실패!!!");
					}
				},
				error:function() {
					alert("ajax통신 실패!!!");
				}
			});
			event.preventDefault();				
		})		
		
		//review 수정 process (답글)
		$(document).on("click",".modifyReviewReply",function(event){
			var REVIEW_NUM = $(this).prev().val();
			console.log("REVIEW_NUM"+REVIEW_NUM)


 			var formId = 'modifyReviewFormReply'+REVIEW_NUM;
			console.log("formId"+formId)
 	 		var form = new FormData(document.getElementById(formId));
 	 		
			$.ajax({
				url : "/NAGAGU/modifyReviewReply.do", 
				data : form,
				dataType: 'json',
				processData : false,
				contentType : false,
				type : 'POST',				
				success:function(retVal) {
					if(retVal.res == "OK") {
						getReviewList();
					} else {
						alert("수정 실패!!!");
					}
				},
				error:function() {
					alert("ajax통신 실패!!!");
				}
			});
			event.preventDefault();				
		})				
//Review 삭제하기----------------------------------------------------------------------------------------------------	  

		//원글, 답글 same
		$(document).on("click",".deleteReview",function(event){
			var REVIEW_NUM = $(this).prev().prev().val();
			console.log("REVIEW_NUM : " + REVIEW_NUM)
			var delete_confirm = confirm("삭제하시겠습니까?");
			if(delete_confirm) {
				$.ajax({
					url : "/NAGAGU/deleteReview.do", 
					type:'GET',
					data : {'REVIEW_NUM':REVIEW_NUM},
					dataType : 'json', // 서버에서 보내줄 데이터 타입
					async: false,
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success:function(retVal) {
						if(retVal.res == "OK") {
							getReviewList();
						} else if(retVal.res == "Children"){
							alert("답글이 존재하는 댓글은 삭제할 수 없습니다.");
						} else {
							alert("삭제 실패!");
						}
					},
					error:function() {
						alert("ajax통신 실패!!!");
					}
				});
				event.preventDefault();					
			}
		})				
		
		
	//ready 끝	
	getReviewList();
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

	


//취소버튼들
		//Review입력폼 / Qna입력폼
		$(document).on("click",".formCancel",function(event){
			console.log(this)
			console.log($(this).attr('value'))
			var formType = $(this).attr('value');
			
			if(formType=='ReviewForm') {	//리뷰 입력폼에서 취소
 				$("#ReviewformSection").css('display','none');
				$('#ReviewForm').each(function() {  
					this.reset();  
				});  
				$('.imgs_wrap').empty();
				$("#ReviewButtonSection").show();
			} 
			else if(formType=='reviewModify') {	//리뷰 수정폼에서 취소
				var REVIEW_NUM = $(this).prev().prev().val();
	
				$('#beforeModifyReview'+REVIEW_NUM).css('display', 'block');	//수정,삭제버튼 보임
				$('#afterModifyReview'+REVIEW_NUM).empty();

			}
			else if(formType=='reviewReply') {	//답글 입력 취소
				var REVIEW_NUM = $(this).prev().prev().val();
				console.log(REVIEW_NUM)
				$("#review_replybtn"+REVIEW_NUM).css('display','block');	//답글버튼 보임
				$("#ReviewReplyformSection"+REVIEW_NUM).empty();	//답글 지움

			}
			else if(formType=='reviewReplyModify') {	//답글 수정 취소
				var REVIEW_NUM = $(this).prev().prev().val();

				$('#beforeModifyReviewReply'+REVIEW_NUM).css('display', 'block');
				$('#afterModifyReviewReply'+REVIEW_NUM).css('display', 'none'); 
				$('#beforeControl'+REVIEW_NUM).css('display', 'block');	//수정,삭제버튼 보임
				$('#afterControl'+REVIEW_NUM).css('display', 'none'); 	//수정,취소버튼 숨김
//				$('#modifyReviewFormReply'+REVIEW_NUM).empty();	//수정폼 초기화(content)
				$('#modifyReviewFormReply'+REVIEW_NUM).each(function() {  
					this.reset();  
				});  
			}
			event.preventDefault();	
		});





//input type=file 이미지 업로드/수정----------------------------------------------------------------------------------------------------	    	
		//파일 업로드창 css 바꾸기
		$('.file_input [id="input_imgs"]').change(function() {
			var fileName = $(this).val();
			var fileCount = $(this).get(0).files.length;
			var tmpvar = $('.file_input input[type=text]')[0];
			if($(this).get(0).files.length == 1){
				$(tmpvar).val(fileName);
			}
			else {
				$(tmpvar).val('파일 '+fileCount+'개');
			}
		});
		$('.file_input [id="modify_input_imgs"]').change(function() {
			alert('ccc')
			var fileName = $(this).val();
			var fileCount = $(this).get(0).files.length;
			var tmpvar = $('.file_input input[type=text]')[1];
			if($(this).get(0).files.length == 1){
				$(tmpvar).val(fileName);
				alert('bbbbb')
			}
			else {
				alert('aaaa')
				$(tmpvar).val('추가 업로드 파일 '+fileCount+'개');
			}
		});
		
		
		//입력-------------------------------------------------------------
		//ReviewForm 다중이미지 업로드
		$('#input_imgs').on("change", handleImgFileSelect);
		
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
					var html="<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='review_img' title='Click to remove' width='100' height='100'>&nbsp;</a>";
					
					$(".imgs_wrap").append(html);
					index++;
				}
				reader.readAsDataURL(f);          
			});
		}      

		//파일 선택 후 클릭해서 삭제 가능
		//ReviewForm 이미지 삭제
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
		
		//수정-------------------------------------------------------------
		//Review Modify 댓글 수정시 이미지 추가 가능
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
					var html="<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='review_img ' title='Click to remove' width='100' height='100'>&nbsp;</a>";
					
					$(".modify_imgs_wrap").append(html);
					index++;
				}
				reader.readAsDataURL(f);
			 });
		 });    

		//Review Modify - 댓글 수정시 before 이미지 삭제
		function deleteBeforeImageAction(index) {
			var delete_confirm = confirm("삭제하시겠습니까?");
			if(delete_confirm) {
				console.log("index : " + index);
				sel_files.splice(index, 1);
				
				var img_id = "#beforeimg_id_" + index;
				console.log("#beforeimg_id_+index : " + img_id);
		
					
				
				var deleteImg=$("input[type=hidden][name=deleteImg]").val();	//기본은 ""
				deleteImg += $(img_id).children().attr('value')+',';	//삭제할 때마다 deleteImg의 value에 추가됨
				console.log("deleteImg : " + deleteImg);
				$("input[type=hidden][name=deleteImg]").val(deleteImg);
					
				$(img_id).remove();
				
				
				console.log("sel_files : " + sel_files);            
			} 
		}


		
		
//Review 등록하기----------------------------------------------------------------------------------------------------	    

		//Review폼 버튼 (review)
		$(document).on("click",".review_btn",function(event){
			if(<%=MEMBER_STATUS%> == 100){
				if(<%=WORKSHOP_STATUS%> == 100) {
					alert('로그인 해주세요!');					
				} else {
					alert('회원만 작성 가능합니다.');
				}
				return;
			}
			   
			$("#ReviewformSection").css('display','block');
			$("#ReviewButtonSection").css('display','none');	//댓글달기버튼영역 숨김
			
		})
		
		//ReviewReplyform폼 버튼	//답글 버튼 (reply)
		$(document).on("click",".review_replybtn",function(event){
			if(<%=MEMBER_STATUS%> == 100){
				if(<%=WORKSHOP_STATUS%> == 100) {
					alert('로그인 해주세요!');					
				} else {
					alert('회원만 작성 가능합니다.');
				}
				return;
			}
			var REVIEW_NUM = $(this).attr('value');
			console.log(REVIEW_NUM);   
			$("#review_replybtn"+REVIEW_NUM).css('display','none');	//답글버튼 숨김
			
			var replyform = '';
			replyform += '<form class="ReviewReplyform" id="ReviewReplyform'+REVIEW_NUM+'" name="REVIEW_CONTENT" enctype="multipart/form-data">';
			replyform += '<div class="row justify-content-center">';
			replyform += '<div class="col-1"></div>';
			replyform += '<div class="col-1"><img src="<%=MEMBER_PICTURE%>" alt="" class="rounded-circle"></div>';
			replyform += '<div class="col-10">';
			replyform += '<div class="row">';
			replyform += '<div class="col-2 justify-content-end name"><%=MEMBER_NICK%></div>';
			replyform += '<div class="col-8 justify-content-center"></div>';
			replyform += '<div class="col-2 justify-content-center smallfont pl-1"></div></div>';	
			replyform += '<div class="row">';
			replyform += '<div class="col-11 pr-0">';
			replyform += '<textarea rows="3" name="REVIEW_CONTENT" class="col-12 pl-0 pr-0"></textarea>';
			replyform += '</div></div>';
			replyform += '<div class="row">';
			replyform += '<div class="col-2 replytext justify-content-center"></div>';
			replyform += '<div class="col-8 justify-content-center"></div>';
			replyform += '<div class="col-2 beforeControl justify-content-center pl-1">';
			replyform += '<input type="hidden" name="PRODUCT_NUM" value="'+<%=PRODUCT_NUM%>+'">';		
			replyform += '<input type="hidden" name="REVIEW_RE" value="'+REVIEW_NUM+'">';		
			replyform += '<a class="insertReviewReply">작성</a> &nbsp;';
			replyform += '<a class="formCancel" value="reviewReply">취소</a>';
			replyform += '</div></div></div></div></form>';
			
			$('#ReviewReplyformSection'+REVIEW_NUM).append(replyform);
			
		})

		//afterModifyReviewReply 답글수정폼 (reply)		
		$(document).on("click",".gomodifyReviewReplyform",function(event){
			var REVIEW_NUM = $(this).prev().val();
			console.log("REVIEW_NUM : " + REVIEW_NUM)
			
			$('#beforeModifyReviewReply'+REVIEW_NUM).css('display', 'none');
			$('#afterModifyReviewReply'+REVIEW_NUM).css('display', 'block'); 
			$('#beforeControl'+REVIEW_NUM).css('display', 'none');	//수정,삭제버튼 숨김
			$('#afterControl'+REVIEW_NUM).css('display', 'block'); 	//수정,취소버튼 보임
	
		})
				

		

		
		//왜 안 돼..............?????????????????????????????????????????????
		//리뷰 이미지를 클릭하면 원본 사이즈로 커짐(기본은 100)
		$(".review_img").click(function(){
			if($(this).css('width') != '100px' ) {
				$(this).css({'width':'100','height':'100'});
			} else {
				$(this).css({'width':'100%','height':'100%'});
			}
		})	
		

//-----------------------------------------------------------------------------
//QNA--------------------------------------------------------------------------
//-----------------------------------------------------------------------------
		function getQnaList() {
			$('#QnatableSection').empty();	//table 내부 내용을 제거(초기화)
			$.ajax({
				url:'/NAGAGU/getQnaList.pro',
				type:'POST',
				data : { 'PRODUCT_NUM' : <%=PRODUCT_NUM%> },
				dataType : "json", // 서버에서 보내줄 데이터 타입
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success:function(retVal) {
					var reviewCount = retVal.qnaCount;
					console.log(retVal.qnaList)
					console.log("retVal.qnaCount : "+retVal.qnaCount)
					console.log("retVal.qnaList : "+retVal.qnaList)
					console.log("retVal.qna_RE_Count : "+retVal.qna_RE_Count)
					console.log("retVal.qna_RE_List : "+retVal.qna_RE_List)
					
					
					
					if(retVal.qnaCount > 0) {
						for(var i=0; i<retVal.qnaList.length; i++) {	//reviewCount도 상관 없음
							var output='';
							var QNA_NUM = retVal.qnaList[i].QNA_NUM;
							var MEMBER_PICTURE = retVal.qnaList[i].MEMBER_PICTURE;
							var MEMBER_NICK = retVal.qnaList[i].MEMBER_NICK;
							var QNA_DATE = new Date(retVal.qnaList[i].QNA_DATE);
							var date = date_format(QNA_DATE);
							var QNA_CONTENT = retVal.qnaList[i].QNA_CONTENT;

							output += '<div class="QnaAndReplySum pb-3" id="QnaAndReplySum'+QNA_NUM+'">';
							output += '<div class="QnaSum" id="QnaSum'+QNA_NUM+'">';
							output += '<div class="QnaList pb-3" id="QnaList'+QNA_NUM+'">';
							output += '<div class="beforeModifyQna" id="beforeModifyQna'+QNA_NUM+'">';
							output += '<div class="row justify-content-center">';
							output += '<div class="col-1 justify-content-end"><img src="'+MEMBER_PICTURE+'" alt="" class="rounded-circle"></div>';
							output += '<div class="col-11">';
							output += '<div class="row pb-1">';
							output += '<div class="col-2 justify-content-end name">'+MEMBER_NICK+'</div>';
							output += '<div class="col-8 justify-content-center"></div>';
							output += '<div class="col-2 justify-content-center smallfont">'+date+'</div>';
							output += '</div>';
							output += '<div class="row pb-2">';
							output += '</div>';
							output += '<div class="row pb-2">';
							output += '<div class="col-11 pr-0">' + QNA_CONTENT + '</div></div>';
							output += '<div class="row">';
							output += '<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold; cursor: pointer;">';
							output += '<a class="qna_replybtn" id="qna_replybtn' + QNA_NUM + '" value="' + QNA_NUM + '">답글</a>';
							output += '</div>';
							output += '<div class="col-8 justify-content-center"></div>';
							console.log("MEMBER_NICK = " + MEMBER_NICK)
							//작성 본인만 수정,삭제버튼 보인다
							if('<%=MEMBER_NICK%>' == MEMBER_NICK) {
								output += '<div class="col-2 beforeControl justify-content-center" id="beforeControl'+QNA_NUM+'" style="font-size:0.7em; font-weight:bold;">';
								output += '<input type="hidden" name="REVIEW_NUM" value="'+QNA_NUM+'">';
								output += '<a class="gomodifyQnaform">수정</a> &nbsp;';
								output += '<a class="deleteQna">삭제</a>';
								output += '</div>';
							}
							
							output += '</div></div></div></div>';
							output += '<div class="afterModifyQna" id="afterModifyQna'+QNA_NUM+'"></div>';
							output += '</div></div>';
							
							output += '<div class="QnaReplySum" id="QnaReplySum'+QNA_NUM+'">';
							output += '<div class="QnaReplyformSection" id="QnaReplyformSection'+QNA_NUM+'"></div>';
							if(retVal.qna_RE_Count>0) {
								for(var j=0; j<retVal.qna_RE_List.length; j++) {
									if(QNA_NUM == retVal.qna_RE_List[j].QNA_RE) {
										var REPLY_NUM = retVal.qna_RE_List[j].QNA_NUM;
										var REPLY_NICK = retVal.qna_RE_List[j].MEMBER_NICK;
										var REPLY_PICTURE = retVal.qna_RE_List[j].MEMBER_PICTURE;
										var REPLY_CONTENT = retVal.qna_RE_List[j].QNA_CONTENT;
										var REPLY_DATE = new Date(retVal.qna_RE_List[j].QNA_DATE);
										var replydate = date_format(REPLY_DATE);

										//리뷰 출력
										output += '<div class="QnaReplyList pb-2" id="QnaReplyList'+REPLY_NUM+'">';
										output += '<div class="row justify-content-center">';
										output += '<div class="col-1"></div>';
										
										output += '<div class="col-1"><img src="'+REPLY_PICTURE+'" alt="" class="rounded-circle"></div>';
										output += '<div class="col-10">';
										output += '<div class="row">';
										output += '<div class="col-2 justify-content-end name">'+REPLY_NICK+'</div>';
										output += '<div class="col-8 justify-content-center"></div>';
										output += '<div class="col-2 justify-content-center smallfont pl-1">'+replydate+'</div>';
										output += '</div>';
										output += '<div class="beforeModifyQnaReply" id="beforeModifyQnaReply'+REPLY_NUM+'">';
										output += '<div class="row">';
										output += '<div class="col-11 pr-0">'+REPLY_CONTENT;
										output += '</div></div></div>';
										output += '<div class="afterModifyQnaReply" id="afterModifyQnaReply'+REPLY_NUM+'">';
										output += '<form class="modifyQnaReplyForm" id="modifyQnaFormReply'+REPLY_NUM+'">';	
										output += '<div class="row">';			
										output += '<div class="col-11 pr-0">';			
										output += '<input type="hidden" name="QNA_NUM" value="'+REPLY_NUM+'">';			
										output += '<textarea rows="2" name="QNA_CONTENT" id="QNA_CONTENT'+REPLY_NUM+'" class="col-12 pl-0 pr-0">'+REPLY_CONTENT+'</textarea>';			
										output += '</div></div></form></div>';
										output += '<div class="row">';
										output += '<div class="col-2 replytext justify-content-center"></div>';
										output += '<div class="col-8 justify-content-center"></div>';
										
										//작성 본인만 수정,삭제버튼 보인다
										if('<%=MEMBER_NICK%>' == REPLY_NICK) {
										
											output += '<div class="col-2 beforeControl justify-content-center pl-1" id="beforeControl'+REPLY_NUM+'">';								
											output += '<input type="hidden" name="QNA_NUM" value="'+REPLY_NUM+'">';
											output += '<a class="gomodifyQnaReplyform">수정</a> &nbsp;';
											output += '<a class="deleteQna">삭제</a>';
											output += '</div>';
											output += '<div class="col-2 afterControl justify-content-center pl-1" id="afterControl'+REPLY_NUM+'">';
											output += '<input type="hidden" name="QNA_NUM" value="'+REPLY_NUM+'">';
											output += '<a class="modifyQnaReply">수정</a> &nbsp;';
											output += '<a class="formCancel" value="qnaReplyModify">취소</a>';
											output += '</div>';
										}
										output += '</div></div></div></div>';
									}			
								}
							}
							
							output += '</div></div>';
							$('#QnatableSection').append(output);				
						}	//for 끝					
					} else {
						var output = '등록된 댓글이 없습니다.';
						$('#QnatableSection').append(output);	//이상한데...!?!?!?
					}


		          },
		          error:function() {
		             alert("getQnaList ajax통신 실패!!!");
		          }
	       });
		}
	 
	 
	 
	 
</script>