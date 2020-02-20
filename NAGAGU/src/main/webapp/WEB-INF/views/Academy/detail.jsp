<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import = "com.spring.academy.*"%>
<%@ page import = "com.spring.workshop.*" %>
<%@ page import = "com.spring.member.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%
	ClassVO cl = (ClassVO)request.getAttribute("ClassVO");
	WorkShopMemberVO ws = (WorkShopMemberVO)request.getAttribute("WorkShopVO");
	
	int bannerImgCount = StringUtils.countOccurrencesOf(cl.getCLASS_BANNER(), ",");
	
	String MEMBER_EMAIL = null;
	String MEMBER_NAME = null;
	String MEMBER_PHONE = null;
	int MEMBER_NUM = 0;
	
	String WORKSHOP_CEO_NAME = (String)session.getAttribute("WORKSHOP_CEO_NAME");
	String MEMBER_NICK = (String)session.getAttribute("MEMBER_NICK");
	
	if (session.getAttribute("MEMBER_EMAIL") == null) {
		MEMBER_NUM = 0;
		MEMBER_EMAIL = "로그인 해주세요";
		MEMBER_NAME = "로그인 해주세요";
		MEMBER_PHONE = "로그인 해주세요";
	} else {
		MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
		MEMBER_EMAIL = (String)session.getAttribute("MEMBER_EMAIL");
		MEMBER_NAME = (String)session.getAttribute("MEMBER_NAME");
		MEMBER_PHONE = (String)session.getAttribute("MEMBER_PHONE");
	}

%>

<%
	//선주꺼 붙임.....
	//멤버가 댓글 작성시 필요
	String MEMBER_PICTURE = (String)session.getAttribute("MEMBER_PICTURE"); 
	String WORKSHOP_PICTURE = (String)session.getAttribute("WORKSHOP_PICTURE");
	String WORKSHOP_NAME = (String)session.getAttribute("WORKSHOP_NAME");
	
	//로그인 상태 체크 위한
	Integer MEMBER_STATUS = 100;	//비로그인시 100
	if(session.getAttribute("MEMBER_EMAIL") != null) {
		MEMBER_STATUS = (Integer)session.getAttribute("MEMBER_STATUS");		
	}
	Integer WORKSHOP_STATUS = 100;	//비로그인시 100
	if(WORKSHOP_CEO_NAME != null) {
		WORKSHOP_STATUS = (Integer)session.getAttribute("WORKSHOP_STATUS");		
	}
	
	//(QNA)글쓴이만 답글 버튼이 보인다. 글쓴이인지 체크하기 위해 이 글의 WORKSHOP_NUM 받아옴
	int WorkshopMatchingNumber = (int)request.getAttribute("WorkshopMatchingNumber");
	Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");
	//날짜 포맷 형식
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	
	int CLASS_NUMBER = cl.getCLASS_NUMBER();

%>


<style>
	.Precautions dl dd {
		font-size: 1rem;
	}
	
	#subject {
		font-size: 1.5rem;
	}
	
	.class-detail-container {
		margin-top: 50px;
		margin-bottom: 100px;
	}
	
	.hr-class {
		width: 100%;
		color: #f6f6f6;
		margin-top: 100px;
		margin-bottom: 100px;
	}
	
	.sticky {
		padding-top: 2%;
		z-index:2;
		position: -webkit-sticky;
		position: sticky;
		background-color: #FFFFFF;
		border-radius: 10px;
		top: 0;
	}
	
	.sticky2 {
		z-index:2;
		position: -webkit-sticky;
		position: sticky;
		background-color: #FFFFFF;
		border-radius: 10px;
		top: 20px;
	}
	
	.nl.active {
		background-color: #EAEAEA !important;
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
	
	input#minus, input#plus {
		border-radius: 70px;
		width: 30px;
		margin: 0 10px;
		background-color: #1b1b27;
		color: white;
		border: none;
	}
	
	/* Reservation 부분 =====================================================   */
	
	/* Modal 부분 ===========================================================   */
	.reservation-container {
		margin-top: 100px;
		margin-bottom: 100px;
	}
	
	.solid {
		border: 2px solid #8C92A0;
	}
	
	#class_title {
		margin-top: 4%;
		font-size: 2em;
		font-weight: bolder;
	}
	
	#detail {
		margin-bottom: 3%;
	}
	
	#progress_time {
		font-weight: bolder;
		font-size: large;
		margin-bottom: 10px;
	}
	
	#calendar {
		color: green;
	}
	
	.center {
		text-align: center !important;
	}
	
	.mbody {
		padding: 2rem !important;
	}
	
	.mheader {
		padding: 2rem !important;
	}
	
	.group {
		margin-top : 30px;
	}
	
	.modal-header {
		border-bottom: 3px solid #c9c9c9 !important;
	}
	
	/* 리뷰, QNA 부분 ===========================================================   */
	img {
		   max-width: 100%;
		   height: auto;
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
	/*ReviewAndReplySum : 리뷰(하나)+리뷰 답글(여러개)이 묶여서 반복되는 영역 - bottom에 회색 구분선*/
	.ReviewAndReplySum {
		border-bottom:1px solid RGBA(128, 128, 128, 0.5);	
		padding-bottom:8px;	
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
	
	
	.ReviewbeforeControl {
		font-size:0.7em; 
		font-weight:bold;
	}
	.ReviewafterControl {
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
	.gomodifyReviewReplyform {
		cursor: pointer;	/*ReviewReply 수정폼 버튼*/
	}

	.modifyReviewReply {
		cursor: pointer;	/*ReviewReply 수정버튼*/
	}



/*qna*/
	#QnaformSection {
		display:none ;
		padding:8px 0; 
		border-bottom:1px solid gray;		
	}
	/*QnaAndReplySum : 리뷰(하나)+리뷰 답글(여러개)이 묶여서 반복되는 영역 - bottom에 회색 구분선*/
	.QnaAndReplySum {
		border-bottom:1px solid RGBA(128, 128, 128, 0.5);	
		padding-bottom:8px;	
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
	.gomodifyQnaReplyform {
		cursor: pointer;	/*QnaReply 수정폼 버튼*/
	}	
	.modifyQnaReply {
		cursor: pointer;	/*QnaReply 수정버튼*/
	}	
		
	.QnabeforeControl {
		font-size:0.7em; 
		font-weight:bold;
	}
	.QnaafterControl {
		display:none;	
		font-size:0.7em; 
		font-weight:bold;	
	}	
	.page-link {
		color : black !important;
	}
	
</style>

<div class="container class-detail-container category_ac">
	<div class="text-center" style="padding-bottom: 5%;">
		<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
				<div class="carousel-inner text-center">
  					<%
  						for(int i = 0; i < (bannerImgCount)+1; i++) {
  							if(cl.getCLASS_BANNER().equals("#")) {	
  					%>
  								<div class="carousel-item">
    									<img src="#" class="d-block w-100" style="display: none;">
  								</div>
  					<%
  							} 
  							else {
  								if(i == 0) {
					%>    				
								<div class="carousel-item active" style="width: 1300px; height: 530px;">
   	      							<img src="/communityupload/image/<%=cl.getCLASS_BANNER().split(",")[i]%>" class="d-block w-100" style="max-width: 100%; height: 100%;">
   	    						</div>
  	    			<%
  	    							continue;
  								}
  	    			%>				
  								<div class="carousel-item" style="width: 1300px; height: 530px;">
  	      							<img src="/communityupload/image/<%=cl.getCLASS_BANNER().split(",")[i]%>" class="d-block w-100" style="max-width: 100%; height: 100%;">
  	    						</div>    								
  	    			<%
  							}
  						}
  	    			%>
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
			<!-- 제목 -->
			<div style="line-height: 0.5em;">
				<dl>
					<dt><h3><%=cl.getCLASS_NAME()%></h3><br></dt>
					<dl><h5><%=cl.getCLASS_ABRIEF()%></h5></dl>
				</dl>
			</div>
			<div class="row sticky">
				<div class="col-12">
					<ul class="nav nav-tabs nav-fill" style="z-index: 99;">
						<li class="nav-item">
							<a class="nav-link" href="#t1"><h5>공방소개</h5></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#t2"><h5>위치정보</h5></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#t3"><h5>Review</h5></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#t4"><h5>Q&A</h5></a>
						</li>
					</ul>
				</div>
			</div>
			<!-- 공방소개 시작 -->
			<span id="t1"></span>
			<div class="row">
				<div class="col-12">
				<!-- 주문 주의사항 -->
					<div class="mainText">
						<br/> <!-- 상세 설명 -->
						<dt id="subject">
							<br><br>
							<strong>공방을 소개해요</strong>
						</dt> <br/>
						<dl>
							<dd><%=cl.getCLASS_INTRODUCTION_1()%></dd>
						</dl>
						<dt id="subject">
							<strong>이렇게 진행해요</strong>
						</dt> <br/>
						<dl>
							<dd><%=cl.getCLASS_INTRODUCTION_2()%></dd>
						</dl>
						<dt id="subject">
							<strong>함께하고 싶어요</strong>
						</dt> <br/>
						<dl>
							<dd><%=cl.getCLASS_INTRODUCTION_3()%></dd>
						</dl>
						<dt id="subject">
							<strong>환불규정</strong>
						</dt> <br/>
						<dl>
							<dd>
								<div style="width:690px; font-size:12pt;line-height:16pt;">
		                			<p>NAGAGU의 결제 취소 및 환불 규정은 관련 법령인 &lt;학원의 설립ㆍ운영 및 과외교습에 관한 법률 시행령 [별표4] [시행 2017.3.21.]&gt;의 &lt;교습비 등 반환기준(제18조 제3항 관련)&gt;을 준수합니다.</p>
		                			
		                			<p><strong>1. 클래스 수업 기간이 1개월 이내인 경우 환불 기준</strong>&nbsp;</p>
		                			<p>① 클래스 시작 전 - 이미 납부한 교습비 등의 전액&nbsp;</p>
		                			<p>② 총 클래스 수업시간의 1/3 경과 전 - 이미 납부한 교습비 등의 2/3에 해당하는 금액&nbsp;</p>
		                			<p>③ 총 클래스 수업시간의 1/2 경과 전 - 이미 납부한 교습비 등의 1/2에 해당하는 금액&nbsp;</p>
		                			<p>④ 총 클래스 수업시간의 1/2 경과 후 - 반환하지 않음&nbsp;</p>
		                			
		                			<p><strong>2. 클래스 수업 기간이 1개월을 초과하는 경우</strong>&nbsp;</p>
		                			<p>① 클래스 수업 시작 전 - 이미 납부한 교습비 등의 전액&nbsp;</p>
		                			<p>② 클래스 수업 시작 후 - 환불사유가 발생한 해당 월의 환불 대상 교습비 등 (클래스 수업 기간이</p>
		                			<p>1개월 이내인 경우의 기준에 따라 산출한 금액을 말한다)과 나머지 월의 교습비 등의 전액을 합산한 금액&nbsp;</p>
		                			
		                			<p>단 클래스의 특성상 사전 준비(수업재료 준비, 장소 및 식사 사전예약 등)과정에서 불가피하게 손해비용 및 위약금 발생이 예상되는 경우, 마스터는 법령에서 제시한 내용 외에 별도의 환불규정을 수강생에게 고지할 수 있고, 수강생은 마스터가 고지한 환불수수료를 제외한 금액을 환불받을 수 있습니다.</p>
		                		</div>
							</dd>
						</dl>
						<dt id="subject">
							<strong>기타사항</strong>
						</dt><span id="t2"></span><br/>
						<dl>
							<dd><%=cl.getCLASS_ETC()%></dd>
						</dl>
						<dt id="subject" >
							<strong>공방 장소</strong>
						</dt> <br/>
						<dl>
							<dd>
								<p class="text-left"><%=cl.getCLASS_ADDRESS()%>&nbsp;&nbsp;<%=cl.getCLASS_DETAIL_ADDRESS()%></p>
								<div id="map" style="width:675px;height:500px;"></div>
							</dd>
						</dl>
					</div>
				</div>
			</div>
			
			<!-- 댓글 테이블 시작 -->
			<span id="t3"></span>
			<br /><br /><hr />
           
			<!-- 리뷰 테이블 시작 -->
			<h3 id="review_scroll"><strong>Review</strong></h3>
			<br /><br />	
			<div id="ReviewSection">
				<div id="ReviewButtonSection">	
					<div class="row justify-content-center pt-3 pb-3"> <!-- 리뷰 댓글달기 버튼 -->
						<button class="btn btn-dark btn-sm review_btn">후기 등록</button>
					</div>
				</div>
				<div id="ReviewWrapSection" class="pb-1">
					<div id="ReviewformSection" class="pb-2">
						<form id="ReviewForm" name="REVIEW_CONTENT" enctype="multipart/form-data"> <!-- 리뷰 작성 폼 영역 : 하나 -->
							<input type="hidden" name="MEMBER_NUM" value="MEMBER_NUM">
							<input type="hidden" name="CLASS_NUMBER" value="<%=CLASS_NUMBER %>">
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
			<!-- 리뷰 페이지네이션 -->
			<br/>
			<div class="d-flex justify-content-center">
				<nav aria-label="Page navigation example" class="review_paginated" id="review-page"></nav>
			</div>
			<br />
			<!-- 리뷰 페이지네이션 끝 -->			
			
			
			<!-- 댓글 테이블 끝 -->
			
			
			
			
			<!-- Q&A 테이블 시작 -->
	
			<span id="t4"></span>
			<br /><br /><hr />
			
			<!-- Q&A 테이블 시작 -->
			<h3 id="qna_scroll"><strong>Q&A</strong></h3>
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
							<input type="hidden" name="CLASS_NUMBER" value="<%=CLASS_NUMBER %>">
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
											<a class="insertQna">작성</a> &nbsp;
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
			<div class="d-flex justify-content-center">
				<nav aria-label="Page navigation example" class="qna_paginated" id="qna-page"></nav>
			</div>
			<br />
			<!-- Q&A pagenation 끝 -->		

	
	
	
			
			<!-- Q&A 테이블 끝 -->
		</div>
		<div class="col-4">
			<div class="sticky2" style="border: 1px solid #EAEAEA; padding-top: 5%;">
				<a href="./workshop_page.my?WORKSHOP_NUM=<%=cl.getWORKSHOP_NUM()%>" style="text-decoration:none !important; color : black;">
				<div class="row pt-4 pl-4">
					<div class="col-3">
						<img src="<%=ws.getWORKSHOP_PICTURE()%>" style="width: 95%; border-radius: 100px;">
					</div><hr>
					<div class="col-9">
						<h3><p><%=cl.getWORKSHOP_NAME()%></p></h3>
						<p><font size="2"><%=cl.getCLASS_ABRIEF()%></font></p>
					</div> 
				</div>
				</a>
				<div>
					<table class="table table-borderless">
						<colgroup>
							<col style="width:30%">
							<col style="width:70%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">클래스 금액</th>
								<th scope="col"><fmt:formatNumber type="number" maxFractionDigits="3" value="<%=cl.getCLASS_AMOUNT()%>" />원 </th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">카테고리</th>
								<td><%=cl.getCLASS_CATEGORY()%></td>
							</tr>
							<tr>
								<th scope="row">일시</th>
								<td><%=cl.getCLASS_DATE_CONFIGURATION_1()%> ~ <%=cl.getCLASS_DATE_CONFIGURATION_2()%></td>
							</tr>
							<tr>
								<th scope="row">지역</th>
								<td><%=cl.getCLASS_AREA()%></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btnArea text-center">
				<% 
					if(MEMBER_NICK == null && WORKSHOP_CEO_NAME == null) { 
				%>
						<!-- 비회원일때-->
						<button type="button" class="btn btn-outline-dark btn-lg" data-toggle="modal" data-target="#exampleModalCenter">예약 하기</button>
				<% 
					} else if(WORKSHOP_CEO_NAME != null){ 
				%>
						<!-- 공방회원일때 -->
						<a href="#" class="btn btn-outline-dark btn-lg disabled" tabindex="-1" role="button" aria-disabled="true">예약 하기	</a>
				<% 
					} else { 
				%>
						<!-- 일반회원일떄 -->
						<button type="button" class="btn btn-outline-dark btn-lg" data-toggle="modal" data-target="#Booking">예약 하기</button>
				<%
					}
				%>
				</div>
				<br>
			</div>
		</div>
	</div>
	<br>
</div>

<!-- Modal -->
<div class="modal fade bd-example-modal-lg" id="Booking" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header mheader d-flex justify-content-center">
				<h5 class="modal-title" id="myExtraLargeModalLabel"><%=cl.getCLASS_NAME()%></h5>
			</div>
			<div class="modal-body mbody">
				<div class="row">
					<div class="col-12">
						<div style="font-size: large; font-weight: bolder; padding-bottom: 3%;">공방 정보</div>
						<div>
							<table class="table table-borderless table-sm">
								<colgroup>
									<col style="width:5%">
									<col style="width:30%">
									<col style="width:60%">
								</colgroup>
								<tr>
									<td></td>
									<th scope="row">사용기간</th>
									<td>
										<%=cl.getCLASS_DATE_CONFIGURATION_1()%> ~ <%=cl.getCLASS_DATE_CONFIGURATION_2()%> <br>
										<font color="red">예약 후 공방 측과 예약일을 꼭 협의해주세요.</font>
									</td>
								</tr>
								<tr>
									<td></td>
									<th scope="row">공방 장소</th>
									<td><%=cl.getCLASS_ADDRESS()%>&nbsp;&nbsp;<%=cl.getCLASS_DETAIL_ADDRESS()%></td>
								</tr>
								<tr>
									<td></td>
									<th scope="row">공방 지역</th>
									<td><%=cl.getCLASS_AREA()%></td>
								</tr>
								<tr>
									<td></td>
									<th scope="row">구매 수량</th>
									<td class="d-flex justify-content-between">
										<select name="sel" id="sel" class="form-control" style="width: 100px">
											<option value="" selected>선택</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
										<div class="d-flex align-items-center" style="color: red;">
											1인당 최대 구매 가능 갯수는 5개입니다.
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-12">
						<div style="font-size: large; font-weight: bolder; padding-bottom: 3%;">예약자 정보</div>
						<div>
							<table class="table table-borderless table-sm">
								<colgroup>
									<col style="width:5%">
									<col style="width:30%">
									<col style="width:60%">
								</colgroup>
								<tr>
									<td></td>
									<th scope="row">예약자</th>
									<td><%=MEMBER_NAME%></td>
								</tr>
								<tr>
									<td></td>
									<th scope="row">연락처</th>
									<td><%=MEMBER_PHONE%></td>
								</tr>
								<tr>
									<td></td>
									<th scope="row">이메일</th>
									<td><%=MEMBER_EMAIL%></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-12">
						<div style="font-size: large; font-weight: bolder; padding-bottom: 3%;">판매자 정보</div>
						<div>
							<table class="table table-borderless table-sm">
								<colgroup>
									<col style="width:5%">
									<col style="width:30%">
									<col style="width:60%">
								</colgroup>
								<tr>
									<td></td>
									<th scope="row">공방 이름</th>
									<td><%=cl.getWORKSHOP_NAME()%></td>
								</tr>
								<tr>
									<td></td>
									<th scope="row">대표자 명</th>
									<td><%=ws.getWORKSHOP_CEO_NAME()%></td>
								</tr>
								<tr>
									<td></td>
									<th scope="row">사업자 번호</th>
									<td><%=ws.getWORKSHOP_LICENSE()%></td>
								</tr>
								<tr>
									<td></td>
									<th scope="row">연락처</th>
									<td><%=ws.getWORKSHOP_PHONE()%></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-12">
						<div>
							<table class="table table-borderless table-sm">
								<colgroup>
									<col style="width:37%">
									<col style="width:63%">
								</colgroup>
								<tr>
									<th scope="row" style="font-size: large; font-weight: bolder; padding-bottom: 3%;">결제금액</th>
									<td style="font-size: large; font-weight: bolder; padding-bottom: 3%;">
										<span id="Amount"></span>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div>
					<ul class="nav nav-pills mb-3 table table-bordered" id="pills-tab" role="tablist">
						<li class="nav-item">
							<a class="nav-link nl" id="pills-card-tab"	data-toggle="pill" href="#pills-card" role="tab" aria-controls="pills-home" aria-selected="true" style="cursor: default;"> 
								<label>
									<img width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/card.png" alt="Card">
									<div class="text-center">
										<font color="black">카드</font>
									</div>
								</label>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link nl"	id="pills-vbank-tab" data-toggle="pill" href="#pills-vbank"	role="tab" aria-controls="pills-home" aria-selected="true" style="cursor: default;">
								<label> 
									<img width="64"	src="https://bucketplace-v2-development.s3.amazonaws.com/pg/vbank.png" alt="Vbank">
									<div class="text-center">
										<font color="black">무통장입금</font>
									</div>
								</label>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link nl"	id="pills-phone-tab" data-toggle="pill" href="#pills-phone"	role="tab" aria-controls="pills-home" aria-selected="true" style="cursor: default;">
								<label> 
									<img width="64"	src="https://bucketplace-v2-development.s3.amazonaws.com/pg/phone.png" alt="Phone">
									<div class="text-center">
										<font color="black">핸드폰</font>
									</div>
								</label>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link nl" id="pills-toss-tab" data-toggle="pill" href="#pills-toss" role="tab" aria-controls="pills-home" aria-selected="true" style="cursor: default;">
								<label> 
									<img width="64"	src="https://bucketplace-v2-development.s3.amazonaws.com/pg/toss.png" alt="Toss">
									<div class="text-center">
										<font color="black">토스</font>
									</div>
								</label>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link nl"	id="pills-naver-tab" data-toggle="pill" href="#pills-naver"	role="tab" aria-controls="pills-home" aria-selected="true" style="cursor: default;">
								<label> 
									<img width="64"	src="https://bucketplace-v2-development.s3.amazonaws.com/pg/naver.png" alt="Naver">
									<div class="text-center">
										<font color="black">네이버페이</font>
									</div>
								</label>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link nl"	id="pills-kakao-tab" data-toggle="pill" href="#pills-kakao"	role="tab" aria-controls="pills-home" aria-selected="true" style="cursor: default;">
								<label> 
									<img width="64"	src="${pageContext.request.contextPath}/resources/images/Mypage/kakao.png" alt="Kakao">
									<div class="text-center">
										<font color="black">카카오페이</font>
									</div>
								</label>
							</a>
						</li>
					</ul>
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade active show" id="pills-card" role="tabpanel" aria-labelledby="pills-card-tab" style="padding-left: 3%;">
							<dl>
								<dt>
									<input type="checkbox" class="custom-control-input"	id="cardControlInline"> 
									<label class="custom-control-label" for="cardControlInline">
										<font size="3">결제 진행 필수사항 동의</font>
									</label>
								</dt>
								<dd>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</dd>
							</dl>
							
							<div class="center" style="padding-bottom: 2rem;">
								<button type="button" id="Payment_Card" class="btn btn-outline-dark mr-4">예약 신청하기</button>
								<button type="button" id="btn" class="btn btn-outline-dark">뒤로</button>
							</div>
						</div>
						<div class="tab-pane fade" id="pills-vbank" role="tabpanel"	aria-labelledby="pills-vbank-tab" style="padding-left: 3%;">
							<dl>
								<dt>
									<input type="checkbox" class="custom-control-input"	id="vbankControlInline"> 
									<label class="custom-control-label" for="vbankControlInline">
										<font size="3">결제 진행 필수사항 동의</font>
									</label>
								</dt>
								<dd>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</dd>
							</dl>
							
							<div class="center" style="padding-bottom: 2rem;">
								<button type="button" id="btn" class="btn btn-outline-dark mr-4">예약 신청하기</button>
								<button type="button" id="btn" class="btn btn-outline-dark">뒤로</button>
							</div>
						</div>
						<div class="tab-pane fade" id="pills-phone" role="tabpanel" aria-labelledby="pills-phone-tab" style="padding-left: 3%;">
							<dl>
								<dt>
									<input type="checkbox" class="custom-control-input"	id="phoneControlInline"> 
									<label class="custom-control-label" for="phoneControlInline">
										<font size="3">결제 진행 필수사항 동의</font>
									</label>
								</dt>
								<dd>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</dd>
							</dl>
							
							<div class="center" style="padding-bottom: 2rem;">
								<button type="button" id="btn" class="btn btn-outline-dark mr-4">예약 신청하기</button>
								<button type="button" id="btn" class="btn btn-outline-dark">뒤로</button>
							</div>
						</div>
						<div class="tab-pane fade" id="pills-toss" role="tabpanel" aria-labelledby="pills-toss-tab">
							<div style="background-color: #EAEAEA; padding: 1%;" class="radius mb-5">
								<dl>
									<dt>
										<font size="3">토스 결제 혜택</font>
									</dt>
									<dd>- 수/목요일에 10만원 이상 결제 시 7천원 즉시 할인</dd>
									<dd>- 1월 중 1인 1회 한정</dd>
								</dl>
							</div>
							<div style="padding-left: 3%;">
								<dl>
									<dt>
										<input type="checkbox" class="custom-control-input"	id="tossControlInline"> 
										<label class="custom-control-label" for="tossControlInline">
											<font size="3">결제 진행 필수사항 동의</font>
										</label>
									</dt>
									<dd>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</dd>
								</dl>
								
								<div class="center" style="padding-bottom: 2rem;">
									<button type="button" id="btn" class="btn btn-outline-dark mr-4">예약 신청하기</button>
									<button type="button" id="btn" class="btn btn-outline-dark">뒤로</button>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="pills-naver" role="tabpanel" aria-labelledby="pills-naver-tab" style="padding-left: 3%;">
							<dl>
								<dt>
									<input type="checkbox" class="custom-control-input"	id="naverControlInline"> 
									<label class="custom-control-label" for="naverControlInline">
										<font size="3">결제 진행 필수사항 동의</font>
									</label>
								</dt>
								<dd>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</dd>
							</dl>
							
							<div class="center" style="padding-bottom: 2rem;">
								<button type="button" id="btn" class="btn btn-outline-dark mr-4">예약 신청하기</button>
								<button type="button" id="btn" class="btn btn-outline-dark">뒤로</button>
							</div>
						</div>
						<div class="tab-pane fade" id="pills-kakao" role="tabpanel" aria-labelledby="pills-kakao-tab" style="padding-left: 3%;">
							<dl>
								<dt>
									<input type="checkbox" class="custom-control-input"	id="kakaoControlInline"> 
									<label class="custom-control-label" for="kakaoControlInline">
										<font size="3">결제 진행 필수사항 동의</font>
									</label>
								</dt>
								<dd>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</dd>
							</dl>
							
							<div class="center" style="padding-bottom: 2rem;">
								<button type="button" id="Payment_Card" class="btn btn-outline-dark mr-4" onclick="Payment_Card()">예약 신청하기</button>
								<button type="button" id="btn" class="btn btn-outline-dark">뒤로</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7db210d40be6789b9de8f86dba8b0a28&libraries=services"></script>
<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
	
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch("<%=cl.getCLASS_ADDRESS()%>", function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
	
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=cl.getCLASS_ADDRESS()%>'
		        });
		        infowindow.open(map, marker);
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
		
		function Payment_Card(){
			var Amount = $('#Amount').text();
			var IMP = window.IMP; // 생략가능
			var ticketNum = $('#sel').val()*1
			console.log(typeof(ticketNum))
			IMP.init('imp91912911');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
				pg : 'kakaopay', // version 1.1.0부터 지원.
				pay_method : 'card',
				merchant_uid : new Date().getTime(),
				name : 'NAGAGU 결제',
				//결제창에서 보여질 이름
				amount : Amount,
				//가격
				buyer_email : '<%=MEMBER_EMAIL%>',
	            buyer_name : '<%=MEMBER_NAME%>',
	            buyer_tel : '<%=MEMBER_PHONE%>',
	            buyer_addr : '서울 백악관',
	            buyer_postcode : '123-456'
				
			},function(rsp) {
	            if ( rsp.success ){
	            	console.log(Amount)
                	console.log(rsp.merchant_uid)
                	console.log(<%=cl.getCLASS_NUMBER()%>)
                	console.log(<%=MEMBER_NUM%>)
                	console.log(typeof(rsp.merchant_uid));
	            	var id = rsp.merchant_uid; 
	                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	                $.ajax({
	                    url: "./ClassInfo.ac", //cross-domain error가 발생하지 않도록 주의해주세요
	                    type: 'POST',
	                    dataType: 'json',
	                    contentType: 'application/x-www-form-urlencoded; charset=utf-8',
	                    data: {
	                        'MY_CLASS_CLASSNUM' : <%=cl.getCLASS_NUMBER()%>,
	                		'MY_CLASS_MEMBERNUM' : <%=MEMBER_NUM%>,
	                		'MY_CLASS_DATE': id,
	                		'MY_CLASS_TICKET': ticketNum,
	                		'MY_CLASS_AMOUNT' : Amount
	                        //기타 필요한 데이터가 있으면 추가 전달
	                    },
	                    contentType: 'application/x-www-form-urlencoded; charset=utf-8'
	                }).done(function(data) {
	                });
	                location.href='./success.ac?CLASS_NUMBER=<%=cl.getCLASS_NUMBER()%>&amount5=' + Amount;
	            } else {
	                msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	                //실패시 이동할 페이지
	                location.href="./index.ma";
	                alert(msg);
	            }
	        });
	    }

//선주(ready 안)		

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
				$('#ReviewbeforeControl'+REVIEW_NUM).css('display', 'block');	//수정,삭제버튼 보임
				$('#ReviewafterControl'+REVIEW_NUM).css('display', 'none'); 	//수정,취소버튼 숨김
//				$('#modifyReviewFormReply'+REVIEW_NUM).empty();	//수정폼 초기화(content)
				$('#modifyReviewFormReply'+REVIEW_NUM).each(function() {  
					this.reset();  
				});  
			}
			else if(formType=='QnaForm') {	//문의 입력폼에서 취소
 				$("#QnaformSection").css('display','none');
				$('#QnaForm').each(function() {  
					this.reset();  
				});  
				$("#QnaButtonSection").show();
			} 
			else if(formType=='qnaModify') {	//리뷰 수정폼에서 취소
				var QNA_NUM = $(this).prev().prev().val();
				$('#beforeModifyQna'+QNA_NUM).css('display', 'block');	//수정,삭제버튼 보임
				$('#afterModifyQna'+QNA_NUM).empty();

			}
			else if(formType=='qnaReply') {	//답글 입력 취소
				var QNA_NUM = $(this).prev().prev().val();
				console.log(QNA_NUM)
				$("#qna_replybtn"+QNA_NUM).css('display','block');	//답글버튼 보임
				$("#QnaReplyformSection"+QNA_NUM).empty();	//답글 지움

			}
			else if(formType=='qnaReplyModify') {	//답글 수정 취소
				var QNA_NUM = $(this).prev().prev().val();

				$('#beforeModifyQnaReply'+QNA_NUM).css('display', 'block');
				$('#afterModifyQnaReply'+QNA_NUM).css('display', 'none'); 
				$('#QnabeforeControl'+QNA_NUM).css('display', 'block');	//수정,삭제버튼 보임
				$('#QnaafterControl'+QNA_NUM).css('display', 'none'); 	//수정,취소버튼 숨김
//				$('#modifyQnaFormReply'+QNA_NUM).empty();	//수정폼 초기화(content)
				$('#modifyQnaFormReply'+QNA_NUM).each(function() {  
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
			var fileName = $(this).val();
			var fileCount = $(this).get(0).files.length;
			var tmpvar = $('.file_input input[type=text]')[1];
			if($(this).get(0).files.length == 1){
				$(tmpvar).val(fileName);
			}
			else {
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
			replyform += '<div class="col-2 ReviewbeforeControl justify-content-center pl-1">';
			replyform += '<input type="hidden" name="CLASS_NUMBER" value="'+<%=CLASS_NUMBER%>+'">';		
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
			$('#ReviewbeforeControl'+REVIEW_NUM).css('display', 'none');	//수정,삭제버튼 숨김
			$('#ReviewafterControl'+REVIEW_NUM).css('display', 'block'); 	//수정,취소버튼 보임
	
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
//Review 등록하기----------------------------------------------------------------------------------------------------	    

		//Qna폼 버튼 (qna)
		$(document).on("click",".qna_btn",function(event){
			if(<%=MEMBER_STATUS%> == 100){
				if(<%=WORKSHOP_STATUS%> == 100) {
					alert('로그인 해주세요!');					
				} else {
					alert('회원만 작성 가능합니다.');
				}
				return;
			}
			   
			$("#QnaformSection").css('display','block');
			$("#QnaButtonSection").css('display','none');	//댓글달기버튼영역 숨김
			
		})
		
		//QnaReplyform폼 버튼	//답글 버튼 (reply)
		$(document).on("click",".qna_replybtn",function(event){

			var QNA_NUM = $(this).attr('value');
			console.log(QNA_NUM);   
			$("#qna_replybtn"+QNA_NUM).css('display','none');	//답글버튼 숨김
			
			var replyform = '';
			replyform += '<form class="QnaReplyform" id="QnaReplyform'+QNA_NUM+'" name="QNA_CONTENT">';
			replyform += '<div class="row justify-content-center">';
			replyform += '<div class="col-1"></div>';
			replyform += '<div class="col-1"><img src="<%=WORKSHOP_PICTURE%>" alt="" class="rounded-circle"></div>';
			replyform += '<div class="col-10">';
			replyform += '<div class="row">';
			replyform += '<div class="col-2 justify-content-end name"><%=WORKSHOP_NAME%></div>';
			replyform += '<div class="col-8 justify-content-center"></div>';
			replyform += '<div class="col-2 justify-content-center smallfont pl-1"></div></div>';	
			replyform += '<div class="row">';
			replyform += '<div class="col-11 pr-0">';
			replyform += '<textarea rows="3" name="QNA_CONTENT" class="col-12 pl-0 pr-0"></textarea>';
			replyform += '</div></div>';
			replyform += '<div class="row">';
			replyform += '<div class="col-2 replytext justify-content-center"></div>';
			replyform += '<div class="col-8 justify-content-center"></div>';
			replyform += '<div class="col-2 QnabeforeControl justify-content-center pl-1">';
			replyform += '<input type="hidden" name="CLASS_NUMBER" value="'+<%=CLASS_NUMBER%>+'">';		
			replyform += '<input type="hidden" name="QNA_RE" value="'+QNA_NUM+'">';		
			replyform += '<a class="insertQnaReply">작성</a> &nbsp;';
			replyform += '<a class="formCancel" value="qnaReply">취소</a>';
			replyform += '</div></div></div></div></form>';
			
			$('#QnaReplyformSection'+QNA_NUM).append(replyform);
		})

		//afterModifyQnaReply 답글수정폼 (reply)		
		$(document).on("click",".gomodifyQnaReplyform",function(event){
			var QNA_NUM = $(this).prev().val();
			console.log("QNA_NUM : " + QNA_NUM)
			
			$('#beforeModifyQnaReply'+QNA_NUM).css('display', 'none');
			$('#afterModifyQnaReply'+QNA_NUM).css('display', 'block'); 
			$('#QnabeforeControl'+QNA_NUM).css('display', 'none');	//수정,삭제버튼 숨김
			$('#QnaafterControl'+QNA_NUM).css('display', 'block'); 	//수정,취소버튼 보임
	
		})
				

		
		
		
		$(document).ready(function() {
			$('#sel').on('change', function(e) {
				$('#Amount').empty();
				var amount = (<%=cl.getCLASS_AMOUNT()%> * $('#sel').val());
				$('#Amount').html(amount.toLocaleString()+"원");
			});
			//선주
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
					url:'/NAGAGU/getReviewList.acdo',
					type:'POST',
					data : { 'CLASS_NUMBER' : <%=CLASS_NUMBER%> },
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

								output += '<div class="ReviewAndReplySum pt-2 pb-1" id="ReviewAndReplySum'+REVIEW_NUM+'">';
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
									output += '<div class="col-2 ReviewbeforeControl justify-content-center" id="ReviewbeforeControl'+REVIEW_NUM+'" style="font-size:0.7em; font-weight:bold;">';
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
											
												output += '<div class="col-2 ReviewbeforeControl justify-content-center pl-1" id="ReviewbeforeControl'+REPLY_NUM+'">';								
												output += '<input type="hidden" name="REVIEW_NUM" value="'+REPLY_NUM+'">';
												output += '<a class="gomodifyReviewReplyform">수정</a> &nbsp;';
												output += '<a class="deleteReview">삭제</a>';
												output += '</div>';
												output += '<div class="col-2 ReviewafterControl justify-content-center pl-1" id="ReviewafterControl'+REPLY_NUM+'">';
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
							}					
						} else {
							var output = '<div class="justify-content-center pt-3 pb-1" style="text-align:center;">등록된 댓글이 없습니다.</div>';
							$('#ReviewtableSection').append(output);	//이상한데...!?!?!?
						}
						review_page();
			          },
			          error:function() {
			             alert("getReviewList ajax통신 실패!!!");
			          }
		       });
			}		
			
			// 만들어진 댓글에 페이지 처리
			function review_page() { 	
				$('#remo').empty();
				var reSortColors = function($table) {};
				$('nav.review_paginated').each(function() {
					var pagesu = 10;  //페이지 번호 갯수
			  		var currentPage = 0;
			  		var numPerPage = 5;  //목록의 수
			  		var $table = $('#ReviewtableSection');    
			  		var $user = $('#review-page');
			  
					//length로 원래 리스트의 전체길이구함
					var numRows = $table.find('.ReviewAndReplySum').length;
					//Math.ceil를 이용하여 반올림
					var numPages = Math.ceil(numRows / numPerPage);
					//리스트가 없으면 종료
					if (numPages==0) return;
					//pager라는 클래스의 div엘리먼트 작성
					var $pager = $('<ul id="remo" class="pager pagination"></ul>');
					
					var nowp = currentPage;
					var endp = nowp+10;
			  
					//페이지를 클릭하면 다시 셋팅
					$table.bind('repaginate', function() {
					//기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
			  
						$table.find('.ReviewAndReplySum').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
						$("#remo").html("");
			   
						if (numPages > 1) {     // 한페이지 이상이면
							if (currentPage < 5 && (numPages-currentPage) >= 5) {   // 현재 5p 이하이면
								nowp = 0;     // 1부터 
								endp = pagesu;    // 10까지
							} else {
								nowp = currentPage -5;  // 6넘어가면 2부터 찍고
								endp = nowp+pagesu;   // 10까지
								pi = 1;
							}
						 
							if (numPages < endp) {   // 10페이지가 안되면
								endp = numPages;   // 마지막페이지를 갯수 만큼
								nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
							}
							if (nowp < 1) {     // 시작이 음수 or 0 이면
								nowp = 0;     // 1페이지부터 시작
							}
						} else {       // 한페이지 이하이면
							nowp = 0;      // 한번만 페이징 생성
							endp = numPages;
						}
						// [처음]
						$('<li class="page-item" style="cursor: pointer"><span class="page-link">처음</span></li>').bind('click', {newPage: page},function(event) {
							currentPage = 0;   
							$table.trigger('repaginate');  
							$($(".page-item")[2]).addClass('active').siblings().removeClass('active');
						}).appendTo($pager).addClass('clickable');
						
				    	// [이전]
						$('<li class="page-item" style="cursor: pointer"><span class="page-link">이전</span></li>').bind('click', {newPage: page},function(event) {
							if(currentPage == 0) return; 
							currentPage = currentPage-1;
							$table.trigger('repaginate'); 
							$($(".page-item")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
						}).appendTo($pager).addClass('clickable');
				    	
				    	// [1,2,3,4,5,6,7,8]
						for (var page = nowp ; page < endp; page++) {
							$('<li class="page-item" style="cursor: pointer"></li>').html('<span class="page-link">' + (page + 1) + '</span>').bind('click', {newPage: page}, function(event) {
								currentPage = event.data['newPage'];
								$table.trigger('repaginate');
								$($(".page-item")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
							}).appendTo($pager).addClass('clickable');
						}
				    	
				    	// [다음]
						$('<li class="page-item" style="cursor: pointer"><span class="page-link">다음</span></li>').bind('click', {newPage: page},function(event) {
							if(currentPage == numPages-1) return;
							currentPage = currentPage+1;
							$table.trigger('repaginate'); 
							$($(".page-item")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
						}).appendTo($pager).addClass('clickable');
				    	
				    	// [끝]
						$('<li class="page-item" style="cursor: pointer"><span class="page-link">끝</span></li>').bind('click', {newPage: page},function(event) {
							currentPage = numPages-1;
							$table.trigger('repaginate');
							$($(".page-item")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
						}).appendTo($pager).addClass('clickable');
				     
				     	$($(".page-item")[2]).addClass('active');
			  		});
					
					$pager.insertAfter($pager).find('li.page-item:first').next().next().addClass('active');   
					$pager.appendTo($user);
					$table.trigger('repaginate');
				});
			}
		
//Review 등록하기----------------------------------------------------------------------------------------------------	  					
			//Review 등록하기 버튼(insert) //원글
			$(document).on("click",".insertReview",function(event){
				var formId = 'ReviewForm';
				var REVIEW_RE = 0;	//원글
				
				var form = new FormData(document.getElementById(formId));
			
				$.ajax({
					url : "/NAGAGU/insertReview.acdo", 
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
							alert("review insert 실패!!!");
						}
						review_page();
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
					url : "/NAGAGU/insertReview.acdo", 
					data : form,
					dataType: 'json',
					processData : false,
					contentType : false,
					type : 'POST',				
					success:function(retVal) {
						if(retVal.insertres == "OK") {
			 				
							getReviewList();
						} else {
							alert("review reply insert 실패!!!");
						}
						review_page();
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
					url : "/NAGAGU/gomodifyReviewform.acdo", 
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
			 				output += '<div class="col-2 justify-content-center" id="ReviewafterControl" style="font-size:0.7em; font-weight:bold;">';	///응?
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
						review_page();
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
					url : "/NAGAGU/modifyReview.acdo", 
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
						review_page();
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
					url : "/NAGAGU/modifyReviewReply.acdo", 
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
						review_page();
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
						url : "/NAGAGU/deleteReview.acdo", 
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
							review_page();
						},
						error:function() {
							alert("ajax통신 실패!!!");
						}
					});
					event.preventDefault();					
				}
			})				
					

//QNA----------------------------------------------------------------------------------------------------	 		
//QNA----------------------------------------------------------------------------------------------------	 		
//QNA----------------------------------------------------------------------------------------------------	 		
			function getQnaList() {
				$('#remo2').empty();
				$('#QnatableSection').empty();	//table 내부 내용을 제거(초기화)
				$.ajax({
					url:'/NAGAGU/getQnaList.acdo',
					type:'POST',
					data : { 'CLASS_NUMBER' : <%=CLASS_NUMBER%> },
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
		
							output += '<div class="QnaAndReplySum pt-2 pb-1" id="QnaAndReplySum'+QNA_NUM+'">';

							//if
							if((<%=WORKSHOP_NUM%> == <%=WorkshopMatchingNumber%>) || ('<%=MEMBER_NICK%>' == MEMBER_NICK)) {
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
								//답글 버튼은 작성한 공방만 보인다
								if(<%=WORKSHOP_NUM%> == <%=WorkshopMatchingNumber%>) {
									output += '<a class="qna_replybtn" id="qna_replybtn' + QNA_NUM + '" value="' + QNA_NUM + '">답글</a>';
								}
								output += '</div>';		
								output += '<div class="col-8 justify-content-center"></div>';
								console.log("MEMBER_NICK = " + MEMBER_NICK)
								//수정,삭제버튼은 작성 본인만 보인다
								if('<%=MEMBER_NICK%>' == MEMBER_NICK) {
									output += '<div class="col-2 QnabeforeControl justify-content-center" id="QnabeforeControl'+QNA_NUM+'" style="font-size:0.7em; font-weight:bold;">';
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
											var WORKSHOP_PICTURE = retVal.qna_RE_List[j].WORKSHOP_PICTURE;
											var WORKSHOP_NAME = retVal.qna_RE_List[j].WORKSHOP_NAME;
											var REPLY_CONTENT = retVal.qna_RE_List[j].QNA_CONTENT;
											var REPLY_DATE = new Date(retVal.qna_RE_List[j].QNA_DATE);
											var replydate = date_format(REPLY_DATE);
		
											//리뷰 출력
											output += '<div class="QnaReplyList pb-2" id="QnaReplyList'+REPLY_NUM+'">';
											output += '<div class="row justify-content-center">';
											output += '<div class="col-1"></div>';
											output += '<div class="col-1"><img src="'+WORKSHOP_PICTURE+'" alt="" class="rounded-circle"></div>';
											output += '<div class="col-10">';
											output += '<div class="row">';
											output += '<div class="col-2 justify-content-end name">'+WORKSHOP_NAME+'</div>';
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
											
											//수정 삭제 버튼은 작성한 워크샵만 보인다
											if(<%=WORKSHOP_NUM%> == <%=WorkshopMatchingNumber%>) {
													output += '<div class="col-2 QnabeforeControl justify-content-center pl-1" id="QnabeforeControl'+REPLY_NUM+'">';								
													output += '<input type="hidden" name="QNA_NUM" value="'+REPLY_NUM+'">';
													output += '<a class="gomodifyQnaReplyform">수정</a> &nbsp;';
													output += '<a class="deleteQna">삭제</a>';
													output += '</div>';
													output += '<div class="col-2 QnaafterControl justify-content-center pl-1" id="QnaafterControl'+REPLY_NUM+'">';
													output += '<input type="hidden" name="QNA_NUM" value="'+REPLY_NUM+'">';
													output += '<a class="modifyQnaReply">수정</a> &nbsp;';
													output += '<a class="formCancel" value="qnaReplyModify">취소</a>';
													output += '</div>';
												}
												output += '</div></div></div></div>';
											}			
										}
									}
									output += '</div>';
								} else {
									output += '<div class="justify-content-center pt-1 pb-1 mt-5 mb-5 text-center">';
									output += '문의는 작성 회원만 열람 가능합니다.';
									output += '</div>';
								}
								output += '</div>';
								$('#QnatableSection').append(output);				
							}	//for 끝					
						} else {
							var output = '<div class="justify-content-center pt-3 pb-1" style="text-align:center;">등록된 문의가 없습니다.</div>';
							$('#QnatableSection').append(output);	
						}
						qna_page();
			          },
			          error:function() {
			             alert("getQnaList ajax통신 실패!!!");
			          }
		       });
			}		
			
			// 만들어진 QNA에 페이지 처리
			function qna_page() { 	
				$('#remo2').empty();
				var reSortColors = function($table) {};
				$('nav.qna_paginated').each(function() {
					var pagesu = 10;  //페이지 번호 갯수
			  		var currentPage = 0;
			  		var numPerPage = 5;  //목록의 수
			  		var $table = $('#QnatableSection');    
			  		var $user = $('#qna-page');
			  
					//length로 원래 리스트의 전체길이구함
					var numRows = $table.find('.QnaAndReplySum').length;
					//Math.ceil를 이용하여 반올림
					var numPages = Math.ceil(numRows / numPerPage);
					//리스트가 없으면 종료
					if (numPages==0) return;
					//pager라는 클래스의 div엘리먼트 작성
					var $pager = $('<ul id="remo2" class="pager pagination"></ul>');
					
					var nowp = currentPage;
					var endp = nowp+10;
			  
					//페이지를 클릭하면 다시 셋팅
					$table.bind('repaginate', function() {
					//기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
			  
						$table.find('.QnaAndReplySum').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
						$("#remo2").html("");
			   
						if (numPages > 1) {     // 한페이지 이상이면
							if (currentPage < 5 && (numPages-currentPage) >= 5) {   // 현재 5p 이하이면
								nowp = 0;     // 1부터 
								endp = pagesu;    // 10까지
							} else {
								nowp = currentPage -5;  // 6넘어가면 2부터 찍고
								endp = nowp+pagesu;   // 10까지
								pi = 1;
							}
						 
							if (numPages < endp) {   // 10페이지가 안되면
								endp = numPages;   // 마지막페이지를 갯수 만큼
								nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
							}
							if (nowp < 1) {     // 시작이 음수 or 0 이면
								nowp = 0;     // 1페이지부터 시작
							}
						} else {       // 한페이지 이하이면
							nowp = 0;      // 한번만 페이징 생성
							endp = numPages;
						}
						// [처음]
						$('<li class="page-item2" style="cursor: pointer"><span class="page-link">처음</span></li>').bind('click', {newPage: page},function(event) {
							currentPage = 0;   
							$table.trigger('repaginate');  
							$($(".page-item2")[2]).addClass('active').siblings().removeClass('active');
						}).appendTo($pager).addClass('clickable');
						
				    	// [이전]
						$('<li class="page-item2" style="cursor: pointer"><span class="page-link">이전</span></li>').bind('click', {newPage: page},function(event) {
							if(currentPage == 0) return; 
							currentPage = currentPage-1;
							$table.trigger('repaginate'); 
							$($(".page-item2")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
						}).appendTo($pager).addClass('clickable');
				    	
				    	// [1,2,3,4,5,6,7,8]
						for (var page = nowp ; page < endp; page++) {
							$('<li class="page-item2" style="cursor: pointer"></li>').html('<span class="page-link">' + (page + 1) + '</span>').bind('click', {newPage: page}, function(event) {
								currentPage = event.data['newPage'];
								$table.trigger('repaginate');
								$($(".page-item2")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
							}).appendTo($pager).addClass('clickable');
						}
				    	
				    	// [다음]
						$('<li class="page-item2" style="cursor: pointer"><span class="page-link">다음</span></li>').bind('click', {newPage: page},function(event) {
							if(currentPage == numPages-1) return;
							currentPage = currentPage+1;
							$table.trigger('repaginate'); 
							$($(".page-item2")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
						}).appendTo($pager).addClass('clickable');
				    	
				    	// [끝]
						$('<li class="page-item2" style="cursor: pointer"><span class="page-link">끝</span></li>').bind('click', {newPage: page},function(event) {
							currentPage = numPages-1;
							$table.trigger('repaginate');
							$($(".page-item2")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
						}).appendTo($pager).addClass('clickable');
				     
				     	$($(".page-item2")[2]).addClass('active');
			  		});
					
					$pager.insertAfter($pager).find('li.page-item2:first').next().next().addClass('active');   
					$pager.appendTo($user);
					$table.trigger('repaginate');
				});
			}
			
			
			//Qna 등록하기 버튼(insert) //원글
			$(document).on("click",".insertQna",function(event){
				var formId = 'QnaForm';
				var QNA_RE = 0;	//원글
			
				var form = new FormData(document.getElementById(formId));
			
				$.ajax({
					url : "/NAGAGU/insertQna.acdo", 
					data : form,
					dataType: 'json',
					processData : false,
					contentType : false,
					type : 'POST',				
					success:function(retVal) {
						if(retVal.res == "OK") {
		 				$("#QnaformSection").css('display','none');	//댓글 등록 성공하면 form은 초기화
							$('#QnaForm').each(function() {  
								this.reset();  
							});  
							$("#QnaButtonSection").show();
							getQnaList();
						} else {
							alert("qna insert 실패!!!");
						}
						qna_page();
					},
					error:function() {
						alert("qna insert ajax통신 실패!!!");
					}
					
				});
				event.preventDefault();		
			})
			
			//qna 등록하기 버튼(insert) //답글
			$(document).on("click",".insertQnaReply",function(event){
				var QNA_NUM = $(this).prev().val();	//원글번호(qna_re로 저장할 것)
				console.log("QNA_NUM : " + QNA_NUM)
				
				var formId = 'QnaReplyform'+QNA_NUM;
				var form = new FormData(document.getElementById(formId));
				$.ajax({
					url : "/NAGAGU/insertQna.acdo", 
					data : form,
					dataType: 'json',
					processData : false,
					contentType : false,
					type : 'POST',				
					success:function(retVal) {
						if(retVal.res == "OK") {
			 				
							getQnaList();
						} else {
							alert("qna reply insert 실패!!!");
						}
						qna_page();
					},
					error:function() {
						alert("qna reply ajax통신 실패!!!");
					}
				});
				event.preventDefault();			
		
			})
					
		//Qna 수정하기----------------------------------------------------------------------------------------------------	  		
				
			//qna 수정 폼 (원글)
			$(document).on("click",".gomodifyQnaform",function(event){
				var QNA_NUM = $(this).prev().val();
				console.log("QNA_NUM : " + QNA_NUM)
				
				$('#beforeModifyQna'+QNA_NUM).css('display', 'none');
		
				$.ajax({
					url : "/NAGAGU/gomodifyQnaform.acdo", 
					data : { 'QNA_NUM' : QNA_NUM },
					dataType: 'JSON',
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					type : 'POST',				
					success:function(retVal) {
						console.log(retVal)
						if(retVal.res == "OK") {
			 				var output='';
							var QNA_NUM = retVal.qnaVO.qna_NUM;
							var QNA_DATE = new Date(retVal.qnaVO.qna_DATE);
							var date = date_format(QNA_DATE);
							var QNA_CONTENT = retVal.qnaVO.qna_CONTENT;		 
			 				
			 				output += '<form class="modifyQnaForm" id="modifyQnaForm'+QNA_NUM+'">';
			 				output += '<div class="row justify-content-center">';
			 				output += '<div class="col-1 justify-content-end"><img src="<%=MEMBER_PICTURE%>" alt="" class="rounded-circle"></div>';
		 				output += '<div class="col-11">';
		 				output += '<div class="row pb-1">';
		 				output += '<div class="col-2 justify-content-end name"><%=MEMBER_NICK%></div>';
			 				output += '<div class="col-8 justify-content-center"></div>';
			 				output += '<div class="col-2 justify-content-center smallfont">'+date+'</div>';
			 				output += '</div>';		
			 				output += '<div class="row">';		
			 				output += '<div class="col-11 pr-0">';		
			 				output += '<textarea rows="3" name="QNA_CONTENT" id="QNA_CONTENT'+QNA_NUM+'" class="col-12 pl-0 pr-0">'+QNA_CONTENT+'</textarea>';		
			 				output += '</div></div>';	
			 				output += '<div class="row">';	
			 				output += '<div class="col-2 justify-content-center"></div>';	
			 				output += '<div class="col-8 justify-content-center"></div>';	
			 				output += '<div class="col-2 justify-content-center" id="QnaafterControl" style="font-size:0.7em; font-weight:bold;">';		
			 				output += '<input type="hidden" name="QNA_NUM" value="'+QNA_NUM+'">';	
			 				output += '<a class="modifyQna" style="cursor: pointer;">수정</a> &nbsp;';	
			 				output += '<a class="formCancel" value="qnaModify" style="cursor: pointer;">취소</a>';	
			 				output += '</div></div></div></div></form>';
			 				
			 				$('#afterModifyQna'+QNA_NUM).append(output);
						} else {
							alert("수정폼 데이터 가져오기 실패!!!");
						}
						qna_page();
					},
					error:function() {
						alert("ajax통신 실패!!!");
					}
				});
				event.preventDefault();		
			})			
			
			//qna 수정 process (원글)
			$(document).on("click",".modifyQna",function(event){
				var QNA_NUM = $(this).prev().val();
				console.log("QNA_NUM"+QNA_NUM)
		
					var formId = 'modifyQnaForm'+QNA_NUM;
			 		var form = new FormData(document.getElementById(formId));
				$.ajax({
					url : "/NAGAGU/modifyQna.acdo", 
					data : form,
					dataType: 'json',
					processData : false,
					contentType : false,
					type : 'POST',				
					success:function(retVal) {
						if(retVal.res == "OK") {
							getQnaList();
						} else {
							alert("수정 실패!!!");
						}
						qna_page();
					},
					error:function() {
						alert("ajax통신 실패!!!");
					}
				});
				event.preventDefault();				
			})		
			
			//qna 수정 process (답글)
			$(document).on("click",".modifyQnaReply",function(event){
				var QNA_NUM = $(this).prev().val();
				console.log("QNA_NUM"+QNA_NUM)
		
					var formId = 'modifyQnaFormReply'+QNA_NUM;
				console.log("formId"+formId)
			 		var form = new FormData(document.getElementById(formId));
			 		
				$.ajax({
					url : "/NAGAGU/modifyQna.acdo", 
					data : form,
					dataType: 'json',
					processData : false,
					contentType : false,
					type : 'POST',				
					success:function(retVal) {
						if(retVal.res == "OK") {
							getQnaList();
						} else {
							alert("수정 실패!!!");
						}
						qna_page();
					},
					error:function() {
						alert("ajax통신 실패!!!");
					}
				});
				event.preventDefault();				
			})			
			
		
		//Qna 삭제하기----------------------------------------------------------------------------------------------------	  
		
			//원글, 답글 same
			$(document).on("click",".deleteQna",function(event){
				var QNA_NUM = $(this).prev().prev().val();
				console.log("QNA_NUM : " + QNA_NUM)
				var delete_confirm = confirm("삭제하시겠습니까?");
				if(delete_confirm) {
					$.ajax({
						url : "/NAGAGU/deleteQna.acdo", 
						type:'GET',
						data : {'QNA_NUM':QNA_NUM},
						dataType : 'json', // 서버에서 보내줄 데이터 타입
						async: false,
						contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						success:function(retVal) {
							if(retVal.res == "OK") {
								getQnaList();
							} else if(retVal.res == "Children"){
								alert("답변이 존재하는 문의는 삭제할 수 없습니다.");
							} else {
								alert("삭제 실패!");
							}
							qna_page();
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
		getQnaList();	
		
		});
</script>