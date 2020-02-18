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
if(session.getAttribute("MEMBER_EMAIL") == null) {
	MEMBER_STATUS = (Integer)session.getAttribute("MEMBER_STATUS");		
}
Integer WORKSHOP_STATUS = 100;	//비로그인시 100
if(session.getAttribute("MEMBER_EMAIL") == null) {
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
	@font-face {
		font-family: 'KOMACON';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')
			format('woff');
		font-weight: normal;
		font-style: normal;
	}
	
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
	
	.order-body {
		font-family: '만화진흥원체', 'KOMACON', KOMACON;
		font-size: 15px;
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
					<ul class="nav nav-tabs nav-fill">
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
			<div class="row">
				<div class="col-12">
				<!-- 주문 주의사항 -->
					<div class="mainText" id="t1">
						<br/><br/> <!-- 상세 설명 -->
						<dt id="subject">
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
						</dt> <br/>
						<dl>
							<dd><%=cl.getCLASS_ETC()%></dd>
						</dl>
						<dt id="subject" >
							<strong>공방 장소</strong>
						</dt> <br/>
						<dl>
							<dd>
								<p class="text-left" id="t2"><%=cl.getCLASS_ADDRESS()%>&nbsp;&nbsp;<%=cl.getCLASS_DETAIL_ADDRESS()%></p>
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
							<input type="hidden" name="PRODUCT_NUM" value="<%=CLASS_NUMBER %>">
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
			
			
			<br />
			<!-- 리뷰 페이지네이션 끝 -->			
			
			
			<!-- 댓글 테이블 끝 -->
			
			
			
			
			<!-- Q&A 테이블 시작 -->
	
			<span id="t4"></span>
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
							<input type="hidden" name="PRODUCT_NUM" value="<%=CLASS_NUMBER %>">
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
				<p class="text-center"><%=cl.getCLASS_ABRIEF()%></p>
				<div class="row">
					<div class="col-12">
						<div style="font-size: large; font-weight: bolder; padding-bottom: 3%;">공방 정보</div>
						<div>
							<table class="table table-borderless table-sm">
								<colgroup>
									<col style="width:30%">
									<col style="width:70%">
								</colgroup>
								<tr>
									<th scope="row">사용기간</th>
									<td>
										<%=cl.getCLASS_DATE_CONFIGURATION_1()%> ~ <%=cl.getCLASS_DATE_CONFIGURATION_2()%> <br>
										<font color="red">예약 후 공방 측과 예약일을 꼭 협의해주세요.</font>
									</td>
								</tr>
								<tr>
									<th scope="row">공방 장소</th>
									<td><%=cl.getCLASS_ADDRESS()%>&nbsp;&nbsp;<%=cl.getCLASS_DETAIL_ADDRESS()%></td>
								</tr>
								<tr>
									<th scope="row">공방 지역</th>
									<td><%=cl.getCLASS_AREA()%></td>
								</tr>
								<tr>
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
				<div class="row">
					<div class="col-12">
						<div style="font-size: large; font-weight: bolder; padding-bottom: 3%;">예약자 정보</div>
						<div>
							<table class="table table-borderless table-sm">
								<colgroup>
									<col style="width:30%">
									<col style="width:70%">
								</colgroup>
								<tr>
									<th scope="row">예약자</th>
									<td><%=MEMBER_NAME%></td>
								</tr>
								<tr>
									<th scope="row">연락처</th>
									<td><%=MEMBER_PHONE%></td>
								</tr>
								<tr>
									<th scope="row">이메일</th>
									<td><%=MEMBER_EMAIL%></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div style="font-size: large; font-weight: bolder; padding-bottom: 3%;">판매자 정보</div>
						<div>
							<table class="table table-borderless table-sm">
								<colgroup>
									<col style="width:30%">
									<col style="width:70%">
								</colgroup>
								<tr>
									<th scope="row">공방 이름</th>
									<td><%=cl.getWORKSHOP_NAME()%></td>
								</tr>
								<tr>
									<th scope="row">대표자 명</th>
									<td><%=ws.getWORKSHOP_CEO_NAME()%></td>
								</tr>
								<tr>
									<th scope="row">사업자 번호</th>
									<td><%=ws.getWORKSHOP_LICENSE()%></td>
								</tr>
								<tr>
									<th scope="row">연락처</th>
									<td><%=ws.getWORKSHOP_PHONE()%></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div>
							<table class="table table-borderless table-sm">
								<colgroup>
									<col style="width:30%">
									<col style="width:70%">
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
							<a class="nav-link active" id="pills-card-tab"	data-toggle="pill" href="#pills-card" role="tab" aria-controls="pills-home" aria-selected="true"> 
								<label>
									<img width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/card.png" alt="Card">
									<div class="text-center">
										<font color="black">카드</font>
									</div>
								</label>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link"	id="pills-vbank-tab" data-toggle="pill" href="#pills-vbank"	role="tab" aria-controls="pills-home" aria-selected="true">
								<label> 
									<img width="64"	src="https://bucketplace-v2-development.s3.amazonaws.com/pg/vbank.png" alt="Vbank">
									<div class="text-center">
										<font color="black">무통장입금</font>
									</div>
								</label>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link"	id="pills-phone-tab" data-toggle="pill" href="#pills-phone"	role="tab" aria-controls="pills-home" aria-selected="true">
								<label> 
									<img width="64"	src="https://bucketplace-v2-development.s3.amazonaws.com/pg/phone.png" alt="Phone">
									<div class="text-center">
										<font color="black">핸드폰</font>
									</div>
								</label>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="pills-toss-tab" data-toggle="pill" href="#pills-toss" role="tab" aria-controls="pills-home" aria-selected="true">
								<label> 
									<img width="64"	src="https://bucketplace-v2-development.s3.amazonaws.com/pg/toss.png" alt="Toss">
									<div class="text-center">
										<font color="black">토스</font>
									</div>
								</label>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link"	id="pills-naver-tab" data-toggle="pill" href="#pills-naver"	role="tab" aria-controls="pills-home" aria-selected="true">
								<label> 
									<img width="64"	src="https://bucketplace-v2-development.s3.amazonaws.com/pg/naver.png" alt="Naver">
									<div class="text-center">
										<font color="black">네이버페이</font>
									</div>
								</label>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link"	id="pills-kakao-tab" data-toggle="pill" href="#pills-kakao"	role="tab" aria-controls="pills-home" aria-selected="true">
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
								<button type="button" id="Payment_Card" class="btn btn-outline-dark mr-4">예약 신청하기1</button>
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
								<button type="button" id="btn" class="btn btn-outline-dark mr-4">예약 신청하기2</button>
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
								<button type="button" id="btn" class="btn btn-outline-dark mr-4">예약 신청하기3</button>
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
									<button type="button" id="btn" class="btn btn-outline-dark mr-4">예약 신청하기4</button>
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
								<button type="button" id="btn" class="btn btn-outline-dark mr-4">예약 신청하기5</button>
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
								<button type="button" id="Payment_Card" class="btn btn-outline-dark mr-4" onclick="Payment_Card()">예약 신청하기6</button>
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
			IMP.init('imp91912911');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
				pg : 'kakaopay', // version 1.1.0부터 지원.
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : 'NAGAGU 결제',
				//결제창에서 보여질 이름
				amount : Amount,
				//가격
				buyer_email : '<%=MEMBER_EMAIL%>',
	            buyer_name : '<%=MEMBER_NAME%>',
	            buyer_tel : '<%=MEMBER_PHONE%>',
	            buyer_addr : '서울 백악관',
	            buyer_postcode : '123-456'
				
			}, function(rsp) {
	            if ( rsp.success ) {
	                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	                jQuery.ajax({
	                    url: "./ClassInfo.ac", //cross-domain error가 발생하지 않도록 주의해주세요
	                    type: 'POST',
	                    dataType: 'json',
	                    data: {
	                        'CLASS_NUMBER' : <%=cl.getCLASS_NUMBER()%>,
	                		'MEMBER_NUM' : <%=MEMBER_NUM%>
	                        //기타 필요한 데이터가 있으면 추가 전달
	                    }
	                }).done(function(data) {
	                    
	                });
	                //성공시 이동할 페이지
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
		
		$(document).ready(function() {
			$('#sel').on('change', function(e) {
				$('#Amount').empty();
				var amount = (<%=cl.getCLASS_AMOUNT()%> * $('#sel').val());
				$('#Amount').html(amount.toLocaleString()+"원");
			});
		});
</script>