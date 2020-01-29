<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
		</script>
		<style>
			input#minus, input#plus {
				border-radius: 70px;
				width: 30px;
				margin: 0 10px;
				background-color: #1b1b27;
				color: white;
				border: none;
			}
			
			/* Reservation 부분 =====================================================   */
			@font-face {
				font-family: 'KOMACON';
				src:
					url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')
					format('woff');
				font-weight: normal;
				font-style: normal;
			}
			
			.order-body {
				font-family: '만화진흥원체', 'KOMACON', KOMACON;
				font-size: 15px;
			}
			
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
			
			#horizon {
				margin-top: 2%;
			}
			
			#class_detailed {
				margin-top: 2%;
				padding: 5 10 10 5;
			}
			
			#detail {
				margin-top: 3%;
			}
			
			#progress_time {
				font-weight: bolder;
				font-size: large;
				margin-top: 40px;
			}
			
			div {
				margin: 1px 2px 3px 4px;
			}
			
			#calendar {
				color: green;
			}
			
			table {
				margin: 20px 0px 20px 0px;
			}
			
			.center {
				text-align: center !important;
			}
			
			.nav-link.active {
				background-color: #EAEAEA !important;
			}
		</style>
	</head>
	<body>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">모달 테스트</button>
	
		<!-- Modal -->
		<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"	aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">우드슬랩 테이블&벤치
							만들기</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>스툴로 제작되는 원목 소가구 이며 아래 선반이 들어가는 형태로 사이드 테이블이나 화분 받침대로도 사용가능한
							심플한 디자인.</p>
	
						<div class="row">
							<div class="col-12" id="detail">
								<div id="progress_time">진행시간</div>
								<div style="margin-top: 10px; font-size: small;">3시간</div>
								<div id="progress_time">
									예약 날짜 / 시 <span style="color: red"><i
										class="far fa-calendar-alt blue" id="calendar"></i></span>
								</div>
								<div style="margin-top: 10px; font-size: small;">2019.12.27.(금)
									오전 09:00 ~ 오후 12:00</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12" id="detail">
								<div class="row" id="progress_time" style="padding: 0 0 0 20px;">
									참여 인원</div>
								<table class="table table-borderless table-condensed">
									<tr>
										<td scope="row"><span id="date_price">35,000원</span></td>
										<td>
											<div class="row justify-content-end">
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
											<div class="row justify-content-end">
												<span id="result" style="text-align: end; font-size: small;">35,000원</span>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
	
						<div class="row">
							<div class="col-12">
								<div style="font-size: large; font-weight: bolder;">예약자 정보</div>
								<div>
									<table class="table table-borderless">
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
							<div class="col-12" id="seller">
								<div style="font-size: large; font-weight: bolder;">판매자 정보</div>
								<div>
									<table class="table">
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
						<hr>
						<div>
							<ul class="nav nav-pills mb-3 table table-bordered" id="pills-tab" role="tablist">
								<li class="nav-item">
									<a class="nav-link active" id="pills-toss-tab" data-toggle="pill" href="#pills-toss" role="tab" aria-controls="pills-home" aria-selected="true">
										<label> 
											<img width="64"	src="https://bucketplace-v2-development.s3.amazonaws.com/pg/toss.png" alt="Toss">
											<div class="text-center">
												<font color="black">토스</font>
											</div>
										</label>
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="pills-card-tab"	data-toggle="pill" href="#pills-card" role="tab" aria-controls="pills-home" aria-selected="true"> 
										<label>
											<img width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/card.png" alt="Card">
											<div class="text-center">
												<font color="black">카드</font>
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
							</ul>
							<div class="tab-content" id="pills-tabContent">
								<div class="tab-pane fade active show" id="pills-toss" role="tabpanel" aria-labelledby="pills-toss-tab">
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
									</div>
								</div>
								<div class="tab-pane fade" id="pills-card" role="tabpanel" aria-labelledby="pills-card-tab" style="padding-left: 3%;">
									<dl>
										<dt>
											<input type="checkbox" class="custom-control-input"	id="cardControlInline"> 
											<label class="custom-control-label" for="cardControlInline">
												<font size="3">결제 진행 필수사항 동의</font>
											</label>
										</dt>
										<dd>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</dd>
									</dl>
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
								</div>
							</div>
						</div>
					</div>
					<div class="center">
						<button type="button" id="btn" class="btn btn-outline-dark mr-4">
							예약 신청하기</button>
						<button type="button" id="btn" class="btn btn-outline-dark">뒤로</button>
					</div>
				</div>
			</div>
		</div>
	
		<script src="https://kit.fontawesome.com/b74b42490f.js" crossorigin="anonymous"></script>
		<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"	crossorigin="anonymous"></script>
		<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	</body>
</html>