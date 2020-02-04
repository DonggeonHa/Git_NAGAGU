<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import = "com.spring.academy.*"%>
<%@ page import = "com.spring.workshop.*" %>
<%@ page import = "com.spring.member.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%
	ClassVO cl = (ClassVO)request.getAttribute("ClassVO");
	WorkShopMemberVO ws = (WorkShopMemberVO)request.getAttribute("WorkShopVO");
	
	int bannerImgCount = StringUtils.countOccurrencesOf(cl.getCLASS_BANNER(), ",");
	
	String MEMBER_EMAIL = null;
	String MEMBER_NAME = null;
	String MEMBER_PHONE = null;
	String WORKSHOP_NUM = (String)session.getAttribute("WORKSHOP_NUM");
	String MEMBER_NICK = (String)session.getAttribute("MEMBER_NICK");
	
	if (session.getAttribute("MEMBER_EMAIL") == null) {
		MEMBER_EMAIL = "로그인 해주세요";
		MEMBER_NAME = "로그인 해주세요";
		MEMBER_PHONE = "로그인 해주세요";
	} else {
		MEMBER_EMAIL = (String)session.getAttribute("MEMBER_EMAIL");
		MEMBER_NAME = (String)session.getAttribute("MEMBER_NAME");
		MEMBER_PHONE = (String)session.getAttribute("MEMBER_PHONE");
	}
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.css">
		<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		<script type="text/javascript">      
			$(document).ready(function() {
				$('#sel').on('change', function(e) {
					$('#Amount').empty();
					var amount = (<%=cl.getCLASS_AMOUNT()%> * $('#sel').val());
					$('#Amount').html(amount.toLocaleString()+"원");
				});
			});
		</script>
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
			
			.nav-link.active {
				background-color: #EAEAEA !important;
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
	</head>
	<body class="order-body">
		<div class="container class-detail-container">
			<div class="col-12 text-center" style="padding-bottom: 5%;">
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
					
					<!-- 댓글 테이블 끝 -->
					<!-- Q&A 테이블 시작 -->
					
					<!-- Q&A 테이블 끝 -->
				</div>
				<div class="col-4">
					<div class="sticky2" style="border: 1px solid #EAEAEA; padding-top: 5%;">
						<div class="row pt-4 pl-4">
							<div class="col-3">
								<img src="<%=cl.getWORKSHOP_PICTURE()%>" style="width: 95%;">
							</div><hr>
							<div class="col-9">
								<h3><p><%=cl.getWORKSHOP_NAME()%></p></h3>
								<p><font size="2"><%=cl.getCLASS_ABRIEF()%></font></p>
							</div>
						</div>
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
						<% if(MEMBER_NICK == null && WORKSHOP_NUM == null) { %>
							<button type="button" class="btn btn-outline-dark btn-lg" data-toggle="modal" data-target="#exampleModalCenter">예약 하기</button>
							<a href="#" class="btn btn-outline-dark btn-lg" role="button" aria-pressed="true">
								<i class="far fa-heart"></i>
							</a>
						<% } else { %>
							<button type="button" class="btn btn-outline-dark btn-lg" data-toggle="modal" data-target="#Booking">예약 하기</button>
							<a href="#" class="btn btn-outline-dark btn-lg" role="button" aria-pressed="true">
								<i class="far fa-heart"></i>
							</a>
						<% } %>
						
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
											<td>댕댕댕</td>
										</tr>
										<tr>
											<th scope="row">사업자 번호</th>
											<td>089-53-85692</td>
										</tr>
										<tr>
											<th scope="row">연락처</th>
											<td>010-5468-8466</td>
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
											<img width="64"	src="https://scontent-icn1-1.xx.fbcdn.net/v/t1.0-9/p960x960/52775098_2282365115374551_3623666965651914752_o.png?_nc_cat=109&_nc_ohc=l2DGRIBJakYAX-7EhT8&_nc_ht=scontent-icn1-1.xx&oh=a98e852e8cfa475f79014246688b9965&oe=5E97B88B" alt="Kakao">
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
		
		function Payment_Card() {
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
	                    url: "./success.ac", //cross-domain error가 발생하지 않도록 주의해주세요
	                    type: 'POST',
	                    dataType: 'json',
	                    data: {
	                        'amount5' : Amount,
	                        'CLASS_NUMBER' : <%=cl.getCLASS_NUMBER()%>
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
		</script>
		<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>	
		<script src="https://kit.fontawesome.com/b74b42490f.js" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>