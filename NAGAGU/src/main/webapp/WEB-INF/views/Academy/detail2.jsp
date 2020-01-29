<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ page import = "com.spring.academy.*" %>
<%
	ClassVO cl = (ClassVO)request.getAttribute("ClassVO");
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
			  var price = parseInt($("#date_price").text().slice(0, -1).replace(/,/g,""));
			  var result = parseInt($("#result").text().slice(0, -1));
			
			  $('#plus').click(function() {
			    var amount = parseInt($("#amount").val());
			    var a = price * amount;
			    result = a;
			
			    function comma(result) {
			      str = String(result);
			
			      return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
			    }
			    $("#result").text(a+"원");
			  });
			
			  $('#minus').click(function() {
			    var amount = parseInt($("#amount").val());
			    if(amount <= 0){
			      alert("1보다 작은 숫자는 선택할 수 없습니다.");
			
			      $("#amount").val(1);
			      return;
			    }
			
			    var a = result - price;
			    result = a;
			
			    $("#result").text(a+"원");
			  });
			
			  function comma(result) {
			    str = String(result);
			
			    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
			  }
			});
			
			$("#Payment_Card").click(function() {
				var IMP = window.IMP; // 생략가능
				IMP.init('imp91912911');
				// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
				// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
				IMP.request_pay({
					pg : 'danal', // version 1.1.0부터 지원.
					/*
						'kakao':카카오페이,
						html5_inicis':이니시스(웹표준결제)
						'nice':나이스페이
						'jtnet':제이티넷
						'uplus':LG유플러스
						'danal':다날
						'payco':페이코
						'syrup':시럽페이
						'paypal':페이팔
					 */
					pay_method : 'card',
					/*
						'samsung':삼성페이,
						'card':신용카드,
						'trans':실시간계좌이체,
						'vbank':가상계좌,
						'phone':휴대폰소액결제
					 */
					merchant_uid : 'merchant_' + new Date().getTime(),
					/*
						merchant_uid에 경우
						https://docs.iamport.kr/implementation/payment
						위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
						참고하세요.
						나중에 포스팅 해볼게요.
					 */
					name : '주문명:결제테스트',
					//결제창에서 보여질 이름
					amount : 1000,
					//가격
					buyer_email : 'iamport@siot.do',
					buyer_name : '구매자이름',
					buyer_tel : '010-1234-5678',
					buyer_addr : '서울특별시 강남구 삼성동',
					buyer_postcode : '123-456',
					m_redirect_url : 'https://www.yourdomain.com/payments/complete'
					/*
						모바일 결제시,
						결제가 끝나고 랜딩되는 URL을 지정
						(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
					 */
				}, function(rsp) {
					console.log(rsp);
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						msg += '고유ID : ' + rsp.imp_uid;
						msg += '상점 거래ID : ' 	+ rsp.merchant_uid;
						msg += '결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
					}
					alert(msg);
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
    					<div class="carousel-item active">
      						<img src="${pageContext.request.contextPath}/resources/images/class/Detail1.jpg" class="d-block w-100" alt="...">
    					</div>
    					<div class="carousel-item">
      						<img src="${pageContext.request.contextPath}/resources/images/class/Detail2.jpg" class="d-block w-100" alt="...">
    					</div>
    					<div class="carousel-item">
      						<img src="${pageContext.request.contextPath}/resources/images/class/Detail3.jpg" class="d-block w-100" alt="...">
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
				<!-- 제목 -->
					<div style="line-height: 0.5em;">
						<dl>
							<dt><h3>우드슬랩 테이블&벤치 만들기(5회)</h3><br></dt>
							<dl><h5>합판과 나사못을 전혀 사용하지 않는 원목 가구 클래스</h5></dl>
						</dl>
					</div>
					<div class="row sticky">
						<div class="col-12">
							<ul class="nav nav-tabs nav-fill">
								<li class="nav-item">
									<a class="nav-link" href="#t1"><h5>예약정보</h5></a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#t2"><h5>위치정보</h5></a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#t3"><h5>예약취소 및 환불</h5></a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#t4"><h5>리뷰</h5></a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#t5"><h5>Q&A</h5></a>
								</li>
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
						<!-- 주문 주의사항 -->
							<div class="mainText" id="t1">
								<br/><br/> <!-- 상세 설명 -->
								<div class="group">
									
								</div>
								<dt id="subject"">
									<strong>공방을 소개해요</strong>
								</dt> <br/>
								<dl class="text-center">
									<dd><img src="${pageContext.request.contextPath}/resources/images/class/Class_Content.jpg" class="img-responsive center-block w-100"></dd>
									
									<dd><h5><br><br>합판과 나사못을 사용하지 않는 <br/> 원목 가구 클래스</h5> <br/></dd> 
									<dd class="text-info"><h3>원목과 짜맞춤만으로 <br/> 무공해 목재가구 만들기</h3> <br><br></dd>
									
									<dd>조금 색다른 원목 가구 클래스,</dd>
									<dd>내가 직접 가구를 만들어보는 경험 한 번 해보고 싶지 않으신가요? <br><br></dd> 
									
									<dd><img src="${pageContext.request.contextPath}/resources/images/class/Class_Content2.jpg" class="img-responsive center-block w-100"></dd>
									<dd><br>한짜임목공방은 <br/> 합판과 나사못을 사용하지 않고</dd>
									<dd><font color="orange">오로지 원목과 천연 오일로</font></dd>
									<dd>가구와 원목 소품을 만듭니다. <br><br> </dd>
									<dd><img src="${pageContext.request.contextPath}/resources/images/class/Class_Content3.jpg" class="img-responsive center-block w-100"></dd>
									<dd><br>정해진 커리큘럼보다는 <br> 개개인의 목공 기술에 따라 <br> 원하는 디자인에 따라</dd>
									<dd><font color="orange">1:1 맞춤교육으로 진행</font>됩니다.</dd>
								</dl>
							</div>
							
							<hr class="hr-class">
							<!-- 상품 필수 정보 -->
							<div class="Notice bg-light mb-5">
								<dl>
									<dt class="row" id="subject">상품 필수 정보</dt>
									<dd> 전자상거래 등에서의 상품정보 제공 고시에 따라 작성 되었습니다.</dd>
									<dd> &gt; 품명 및 모델명: (여주) 우드슬랩 테이블&벤치 만들기(5회)
										 &gt; 법의 의한 인증, 허가 확인사항 : 해당없음
									 	 &gt; 제조국 또는 원산지 : 한국 
									 	 &gt; 제조자 : 한짜임목공방(hanzzaim) 
									 	 &gt; 재질 : 우드슬랩 통판, 하드우드 제재목 등
									 	 &gt; 사이즈 : 가구에 따라 다름 
									 	 &gt; A/S 책임자/전화번호 : 고객센터 1644-1234 
									</dd>
								</dl>
							</div>
		
							<div class="location mb-5" id="t2">
							<!-- 위치 정보 -->
								<dl>
									<dt class="row mt-5" id="subject">위치 정보</dt>
									<dd>한짜임목공방</dd>
									<dd> &gt; 주소: 경기도 여주시 흥천면 샘다리길 10-15 한짜임목공방</dd>
									<dd> 전화번호 : 010-9999-9999</dd>
									<br>
									<dd><img src="${pageContext.request.contextPath}/resources/images/class/Class_location.png" class="img-responsive w-100"></dd>
								</dl>
							</div>
		
							<div class="paking mb-5">
							<!-- 주차 안내 -->
								<dl>
									<dt class="row" id="subject">주차 안내</dt>
									<dd>주차 가능합니다.</dd>
								</dl>
							</div>
		
							<div class="refund" id="t3">
							<!-- 예약 취소 및 환불 -->
								<dl>
									<dt class="row" id="subject">예약 취소 및 환불 안내</dt>
									<dd>※ 기타 문의사항은 <font color="red">고객센터(1644-1234)</font>를 이용해주시기 바랍니다</dd>
									<dd>
										<a href="#" class="btn btn-danger" role="button" aria-pressed="true">고객센터 문의</a>&nbsp;&nbsp;&nbsp;
									</dd>
								</dl>
							</div>
						</div>
					</div>
						<!-- 댓글 테이블 시작 -->
					<br />
					<br />
					<hr />
					<h3 >Review</h3>
					<br /><br />
					<div class="reviews_table" style="color: #212529;" id="t4">			 
						<div class="comment_add">
							<div class="row">
								<div class="col-1">
									<img src="${pageContext.request.contextPath}/resources/images/Community/peko.png" alt="" class="img-circle" width="100%;">
								</div>
								<div class="col-11">
									<div class="row">
										<div class="col-10 name">김이름</div>
										<div class="col-2 smallfont px-0">2020-01-08</div>
									</div>
									<div class="row">
										<div class="col comm_content">예쁘게 만드셨네요!</div>
									</div>
									<div class="row">
										<div class="col">
											<a href="#" class="smallfont">답글달기</a> <a href="#"
												class="smallfont">신고하기</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<br/>
						<div class="comment-sum">
							<div class="row justify-content-between">
								<div class="col-1"></div>
								<div class="col-9">
									<textarea name="PICS_RE_CONTENT"
										placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다:)" style="width: 100%"
										rows="2"></textarea>
								</div>
								<div class="col-2 px-0">
									<a class="btn_write"
										onClick="location.href='./community_detail.cm'">&nbsp;등록</a>
								</div>
							</div>
						</div>						
					</div>
					<!-- 댓글 테이블 끝 -->
					<!-- Q&A 테이블 시작 -->
					<h3>Q&A</h3>
					<br />
					<br />
					<div id="t5" style="color: #212529;">
						<div class="qna_sum justify-content-center"	style="width: 100%; margin: 0 auto;">
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
										<div class="col rep_content">문의합니다 문의합니다 문의합니다</div>
									</div>
									<div class="row" style="height: 20px;">
										<a href="#" class="smallfont">답글달기</a> &nbsp;&nbsp; 
										<a href="#"	class="smallfont">신고하기</a>
									</div>
								</div>
							</div>
						</div>
						<br />
						<div class="qna_sum justify-content-center" style="width: 100%; margin: 0 auto;">
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
									<i class="fab fa-replyd"></i>&nbsp;&nbsp;라라디저트
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
						<br />
						<div class="qna_add justify-content-center" style="width: 100%; margin: 0 auto;">
							<div class="row justify-content-center">
								<div class="col-10">
									<textarea name="PICS_RE_CONTENT" class="col-12" rows="2"></textarea>
								</div>
								<div class="col-1">
									<div class=" row justify-content-center">
										<a class="btn_write " onClick="location.href='#'" style="cursor: pointer;">&nbsp;등록</a>
									</div>
								</div>
							</div>
						</div>
						<br />
			
					</div>
					<!-- Q&A 테이블 끝 -->
				</div>
				<div class="col-4">
					<div class="sticky2" style="border: 1px solid #EAEAEA; padding-top: 5%;">
						<div class="row pt-4 pl-4">
							<div class="col-3">
								<img src="${pageContext.request.contextPath}/resources/images/Community/peko.png" style="width: 95%;">
							</div><hr>
							<div class="col-9">
								<h3><p class="">비트캠프 공방</p></h3>
								<p><font size="2">합판과 나사못을 전혀 사용하지 않는 원목 가구 클래스</font></p>
							</div>
						</div>
						<div>
							<table class="table table-borderless">
							  <thead>
							    <tr>
							      <th scope="col">클래스 금액</th>
							      <th scope="col">500,000원</th>
							    </tr>
							  </thead>
							  <tbody>
							    <tr>
							      <th scope="row">카테고리</th>
							      <td>테이블</td>
							    </tr>
							    <tr>
							      <th scope="row">일시</th>
							      <td>2019.02.12~2020.12.31</td>
							    </tr>
							    <tr>
							      <th scope="row">시간</th>
							      <td>총1000분(200분씩,5회)</td>
							    </tr>
							    <tr>
							      <th scope="row">지역</th>
							      <td>(여주)한짜임목공방</td>
							    </tr>
							  </tbody>
							</table>
						</div>
						<div class="btnArea text-center">
							<button type="button" class="btn btn-outline-dark btn-lg" data-toggle="modal" data-target="#Booking">예약 하기</button>
							<a href="#" class="btn btn-outline-dark btn-lg" role="button" aria-pressed="true">
								<i class="far fa-heart"></i>
							</a>
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
					<div class="modal-header mheader">
						<h5 class="modal-title" id="myExtraLargeModalLabel">우드슬랩 테이블&벤치 만들기</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body mbody">
						<p>스툴로 제작되는 원목 소가구 이며 아래 선반이 들어가는 형태로 사이드 테이블이나 화분 받침대로도 사용가능한 심플한 디자인.</p>
						<div class="row">
							<div class="col-12" id="detail">
								<div id="progress_time">진행시간</div>
								<div style="margin-top: 10px; margin-bottom: 10px; font-size: small;">3시간</div>
								<div id="progress_time">
									예약 날짜 / 시 
									<span style="color: red">
										<i class="far fa-calendar-alt blue" id="calendar"></i>
									</span>
								</div>
								<div style="margin-top: 10px; font-size: small;">2019.12.27.(금) 오전 09:00 ~ 오후 12:00</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="row" id="progress_time" style="padding: 0 0 0 16px;">참여 인원</div>
								<table class="table table-borderless table-condensed table-sm">
									<tr>
										<td scope="row"><span id="date_price">35,000원</span></td>
										<td>
											<div class="row d-flex justify-content-end">
												<form>
													<input type="button" id="minus" value="-" style="float: left;" onClick="javascript:this.form.amount.value--;"> 
													<input type="text" name="amount" id="amount" value="1" style="float: left; width: 50px; text-align: right;">
													<input type="button" id="plus" value="+" onClick="javascript:this.form.amount.value++;">
												</form>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">&nbsp;</th>
										<td>
											<div class="row d-flex justify-content-end">
												<span id="result" style="text-align: end; font-size: small;">35,000원&nbsp;&nbsp;</span>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
	
						<div class="row">
							<div class="col-12">
								<div style="font-size: large; font-weight: bolder; padding-bottom: 3%;">예약자 정보</div>
								<div>
									<table class="table table-borderless table-sm">
										<tr>
											<th scope="row">예약자</th>
											<td><input type="text" placeholder="성함"></td>
										</tr>
										<tr>
											<th scope="row">연락처</th>
											<td><input type="text" placeholder="연락처"></td>
										</tr>
										<tr>
											<th scope="row">이메일</th>
											<td><input type="text" placeholder="이메일"></td>
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
										<tr>
											<th scope="row">상호</th>
											<td>비트캠프 공방</td>
										</tr>
										<tr>
											<th scope="row">대표자 명</th>
											<td>댕댕댕</td>
										</tr>
										<tr>
											<th scope="row">소재지</th>
											<td>경기도 여주시 흥천면 샘다리길 10-15 한짜임목공방</td>
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
										<button type="button" id="btn" class="btn btn-outline-dark mr-4">예약 신청하기6</button>
										<button type="button" id="btn" class="btn btn-outline-dark">뒤로</button>
									</div>
								</div>
							</div>
						</div>
					</div>
<!-- 					<div class="center" style="padding-bottom: 2rem;"> -->
<!-- 						<button type="button" id="btn" class="btn btn-outline-dark mr-4"> -->
<!-- 							예약 신청하기</button> -->
<!-- 						<button type="button" id="btn" class="btn btn-outline-dark">뒤로</button> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
		
		
		<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>	
		<script src="https://kit.fontawesome.com/b74b42490f.js" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>