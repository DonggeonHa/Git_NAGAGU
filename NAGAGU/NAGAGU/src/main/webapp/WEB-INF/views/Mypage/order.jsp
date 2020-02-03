<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문/결제</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="./resources/css/Mypage/order.css">
  		
		<style type="text/css">
			@font-face { font-family: 'KOMACON'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff') format('woff'); font-weight: normal; font-style: normal; }
			
			.order-body {
			   font-family: '만화진흥원체', 'KOMACON', KOMACON;
			   font-size: 15px;
			}
			
			.order-container {
				margin-top: 100px;
				margin-bottom: 100px;
			}
			
			.nav-link.active {
				background-color: #EAEAEA !important;
			}
		</style>
	</head>
	<body class="order-body">
		<div class="container order-container">
			<div class="second-container">
				<div>
				<h3>주문/결제</h3>
				<br/><br/>

				<h5 style="padding-bottom: 2%;">주문상품</h5>
				</div>
				<div class="mb-5">
					<table class="table table-hover">
						<tr>
							<td align="center">
								<img class="basket-size" src="${pageContext.request.contextPath}/resources/images/Mypage/basket.jpg" style="padding: 0 3% 3% 0;">
							</td>
							<td colspan="2">
								<dl>
									<dt>모던 트롤리 스윙 빨래바구니 2단/3단</dt>
									<dd>★반짝특가★ 03_모던 트롤리 뉴 스윙 2단 빨래바구니</dd>
									<dd>23,900원 | 1개</dd>
								</dl>
							</td>
							<td>
								<dl>
									<dt>&nbsp;</dt>
									<dd class="text-center">무료배송</dd>
									<dd>&nbsp;</dd>
								</dl>
	
							</td>
						</tr>
						<tr>
							<td align="center">
								<img class="basket-size" src="${pageContext.request.contextPath}/resources/images/Mypage/basket.jpg" style="padding: 0 3% 3% 0;">
							</td>
							<td colspan="2">
								<dl>
									<dt>모던 트롤리 스윙 빨래바구니 2단/3단</dt>
									<dd>★반짝특가★ 03_모던 트롤리 뉴 스윙 2단 빨래바구니</dd>
									<dd>23,900원 | 1개</dd>
								</dl>
							</td>
							<td>
								<dl>
									<dt>&nbsp;</dt>
									<dd class="text-center">무료배송</dd>
									<dd>&nbsp;</dd>
								</dl>
							</td>
						</tr>
					</table><hr>
				</div>
	
				<div style="padding: 0 0 5% 0;">
					<div class="row mt-5">
						<div class="col-2">
							<h5 style="padding-top: 2%;">배송지</h5>
						</div>
						<div class="col-10">
							
						</div>
					</div>
					<hr>
					<form>
						<div class="form-group row">
							<div class="col-2">
								<label for="inputAddress">받는분</label>
							</div>
							<div class="col-5">
								<input type="text" class="form-control">
							</div>
							<div class="col-5">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-2">
								<label for="inputAddress">우편번호</label>
							</div>
							<div class="col-3">
								<input type="text" class="form-control">
							</div>
							<div class="col-2">
								<a href="#" class="btn btn-dark text-white w-100" role="button" aria-pressed="true">우편번호</a>
							</div>
							<div class="col-5">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-2">
								<label for="inputAddress">주소</label>
							</div>
							<div class="col-10 input-group">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-2">
								
							</div>
							<div class="col-10 input-group">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-2">
								<label for="inputAddress">휴대전화</label>
							</div>
							<div class="col-5">
								<input type="text" class="form-control">
							</div>
							<div class="col-5">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-2">
								<label for="inputAddress">배송 메모</label>
							</div>
							<div class="col-10 input-group">
								<input type="text" class="form-control">
							</div>
						</div>
					</form>
				</div>
	
				<div>
					<div class="row">
						<div class="col-2">
							<h5 style="padding-top: 2%;">주문자</h5>
						</div>
						<div class="col-10">
							<button type="button" class="btn btn-outline-dark"><font size="2">배송지 정보와 동일하게 채우기</button>
							
						</div>
					</div>
					<hr>
					<form>
						<div class="form-group row">
							<div class="col-2">
								<label for="inputAddress">이름</label>
							</div>
							<div class="col-5">
								<input type="text" class="form-control">
							</div>
							<div class="col-5">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-2">
								<label for="inputAddress">이름</label>
							</div>
							<div class="col-5">
								<input type="text" class="form-control">
							</div>
							<div class="col-5">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-2">
								<label for="inputAddress">휴대전화</label>
							</div>
							<div class="col-5">
								<input type="text" class="form-control">
							</div>
							<div class="col-2">
								<a href="#" class="btn btn-dark text-white w-100" role="button" aria-pressed="true">인증받기</a>
							</div>
							<div class="col-3">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-2">
							</div>
							<div class="col-6">
								<div class="custom-control custom-checkbox my-1 mr-sm-2">
								    <input type="checkbox" class="custom-control-input" id="customControlInline">
								    <label class="custom-control-label" for="customControlInline"><font size="3">SMS 수신동의</font> (배송 정보를 SMS로 보내드립니다)</label>
								  </div>
							</div>
							<div class="col-4">
							</div>
						</div>
					</form>
				</div>
	
				<div>
					<div class="row">
						<div class="col-4">
							<h5 style="padding-top: 2%;">최종 결제 금액</h5>
						</div>
						<div class="col-8">
						</div>
					</div>
					<hr>
					<div class="row" style="font-size: 16px; padding-bottom: 1%;">
						<div class="col-2">
							총 상품 금액
						</div>
						<div class="col-8">
						</div>
						<div class="col-2 d-flex justify-content-end">
							83,700
						</div>
					</div>
					<div class="row" style="font-size: 16px; padding-bottom: 1%;">
						<div class="col-2">
							배송비
						</div>
						<div class="col-8">
						</div>
						<div class="col-2 d-flex justify-content-end">
							0
						</div>
					</div>
					<div class="row" style="font-size: 30px; padding-bottom: 1%;">
						<div class="col-2">
						</div>
						<div class="col-7">
						</div>
						<div class="col-3 d-flex justify-content-end">
							83,700원
						</div>
					</div>
				</div>
				<div>
					<div class="row mt-3">
						<div class="col-4">
							<h5 style="padding-top: 2%;">결제 수단</h5>
						</div>
						<div class="col-8">
						</div>
					</div>
					<hr>
					<div>
						<ul class="nav nav-pills mb-3 table table-bordered" id="pills-tab" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" id="pills-toss-tab" data-toggle="pill" href="#pills-toss" role="tab" aria-controls="pills-home" aria-selected="true">
									<label>
										<img width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/toss.png" alt="Toss">
										<div class="text-center"><font color="black">토스</font></div>
									</label>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="pills-card-tab" data-toggle="pill" href="#pills-card" role="tab" aria-controls="pills-home" aria-selected="true">
									<label>
										<img width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/card.png" alt="Toss">
										<div class="text-center"><font color="black">카드</font></div>
									</label>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="pills-naver-tab" data-toggle="pill" href="#pills-naver" role="tab" aria-controls="pills-home" aria-selected="true">
									<label>
										<img width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/naver.png" alt="Toss">
										<div class="text-center"><font color="black">네이버페이</font></div>
									</label>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="pills-vbank-tab" data-toggle="pill" href="#pills-vbank" role="tab" aria-controls="pills-home" aria-selected="true">
									<label>
										<img width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/vbank.png" alt="Toss">
										<div class="text-center"><font color="black">무통장입금</font></div>
									</label>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="pills-phone-tab" data-toggle="pill" href="#pills-phone" role="tab" aria-controls="pills-home" aria-selected="true">
									<label>
										<img width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/phone.png" alt="Toss">
										<div class="text-center"><font color="black">핸드폰</font></div>
									</label>
								</a>
							</li>
						</ul>
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade active show" id="pills-toss" role="tabpanel" aria-labelledby="pills-toss-tab">
								<div style="background-color: #EAEAEA; padding: 1%; " class="radius mb-5">
									<dl>
										<dt><font size="3">토스 결제 혜택</font></dt>
										<dd>- 수/목요일에 10만원 이상 결제 시 7천원 즉시 할인</dd>
										<dd>- 1월 중 1인 1회 한정</dd>
									</dl>
								</div>
								<div style="padding-left: 3%;">
									<dl>
										<dt>
											<input type="checkbox" class="custom-control-input" id="tossControlInline">
											<label class="custom-control-label" for="tossControlInline">
												<font size="3">결제 진행 필수사항 동의</font>
											</label>
										</dt>
										<dd>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</dd>
									</dl>
								</div>
							</div>
							<div class="tab-pane fade" id="pills-card" role="tabpanel" aria-labelledby="pills-card-tab"  style="padding-left: 3%;">
								<dl>
									<dt>
										<input type="checkbox" class="custom-control-input" id="cardControlInline">
										<label class="custom-control-label" for="cardControlInline">
											<font size="3">결제 진행 필수사항 동의</font>
										</label>
									</dt>
									<dd>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</dd>
								</dl>
							</div>
							<div class="tab-pane fade" id="pills-naver" role="tabpanel" aria-labelledby="pills-naver-tab"  style="padding-left: 3%;">
								<dl>
									<dt>
										<input type="checkbox" class="custom-control-input" id="naverControlInline">
										<label class="custom-control-label" for="naverControlInline">
											<font size="3">결제 진행 필수사항 동의</font>
										</label>
									</dt>
									<dd>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</dd>
								</dl>
							</div>
							<div class="tab-pane fade" id="pills-vbank" role="tabpanel" aria-labelledby="pills-vbank-tab"  style="padding-left: 3%;">
								<dl>
									<dt>
										<input type="checkbox" class="custom-control-input" id="vbankControlInline">
										<label class="custom-control-label" for="vbankControlInline">
											<font size="3">결제 진행 필수사항 동의</font>
										</label>
									</dt>
									<dd>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</dd>
								</dl>
							</div>
							<div class="tab-pane fade" id="pills-phone" role="tabpanel" aria-labelledby="pills-phone-tab"  style="padding-left: 3%;">
								<dl>
									<dt>
										<input type="checkbox" class="custom-control-input" id="phoneControlInline">
										<label class="custom-control-label" for="phoneControlInline">
											<font size="3">결제 진행 필수사항 동의</font>
										</label>
									</dt>
									<dd>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</dd>
								</dl>
							</div>
						</div>
						<div class="row mt-5">
							<div class="col-12" style="padding-bottom:5%;">
								<a href="./order_vbank.my" class="btn btn-dark btn-lg text-white w-100" role="button" aria-pressed="true">결제하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		

		<script src="https://kit.fontawesome.com/b74b42490f.js" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="	sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>