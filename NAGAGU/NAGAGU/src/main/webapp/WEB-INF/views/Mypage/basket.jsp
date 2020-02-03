<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/Mypage/basket.css"> --%>
</head>
<style>
.container-my {
	margin: 50px 0 100px 0;
}
.pd {
	padding: 5%;
}
.radius {
	border-radius: 10px;
}
.row-style {
	padding: 0 3%;
}
.basket-size {
	width: 70px;
	height: 70px;
}
.ordera {
	color: #000000;
}
.yang_1 {
	float: left;
}
.yang_2 {
	display: inline-block;
}
@font-face {
	font-family: 'KOMACON';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
body {
	font-family: '만화진흥원체', 'KOMACON', KOMACON !important;
	font-size: 15px;
}
</style>
<body>
	<div class="container container-my bg-light">
		<div class="row" style="padding: 0 0 0 1%;">
			<div class="btn-group-toggle" data-toggle="buttons"
				style="padding: 2% 0 3% 2%;">
				<label class="btn btn-outline-warning text-white radius"> <input
					type="checkbox" checked> <i class="fas fa-check"></i>
				</label>
			</div>
			<p style="padding: 2% 0 0 1%;">모두선택(2개)</p>
		</div>
		<div class="row">
			<div class="col-md-7 col-lg-8 sun">
				<div class="bg-white radius">
					<div class="container">
						<div class="col-12">
							<p class="text-center">네이쳐리빙 배송</p>
							<hr>
						</div>
						<div class="row">
							<div class="btn-group-toggle col-1" data-toggle="buttons"
								style="padding-left: 3%">
								<label class="btn btn-outline-warning text-white radius">
									<input type="checkbox" checked><i class="fas fa-check"></i>
								</label>
							</div>
							<div class="col-11">
								<div class="row">
									<div class="col-8">
										<a class="ordera row row-style" href="#"> <img
											class="basket-size"
											src="${pageContext.request.contextPath}/resources/images/Mypage/basket.jpg"
											style="padding: 0 3% 3% 0;">
											<dl>
												<dt>모던 트롤리 스윙 빨래바구니 2단/3단</dt>
												<dd>
													<font size="1">무료배송|일반택배</font>
												</dd>
											</dl>
										</a>
									</div>
									<div class="col-4 d-flex justify-content-end">
										<i class="fas fa-times"></i>
									</div>
								</div>
								<div class="radius"
									style="background-color: #EAEAEA; padding: 2% 0 2% 0;">
									<div class="row">
										<div class="col-10">
											<p>★반짝특가★ 03_모던 틀로리 뉴 스윙 2단 빨래바구니</p>
										</div>
										<div class="col-2 d-flex justify-content-end">
											<i class="fas fa-times"></i>
										</div>
									</div>
									<div class="row">
										<div class="col-10">
											<select>
												<option selected>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
												<option>6</option>
												<option>7</option>
												<option>8</option>
											</select>
										</div>
										<div class="col-2 d-flex justify-content-end">
											<dt class="align-self-end">23,900원</dt>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-8">
										<dd>
											<font size="2">옵션변경 | 바로구매</font>
										</dd>
									</div>
									<div class="col-4 d-flex justify-content-end">
										<p>23,900원</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12">
							<hr>
							<p class="text-center">배송비 무료</p>
						</div>
					</div>
				</div>
				<div class="bg-white radius">
					<div class="container">
						<div class="col-12">
							<p class="text-center">네이쳐리빙 배송</p>
							<hr>
						</div>
						<div class="row">
							<div class="btn-group-toggle col-1" data-toggle="buttons"
								style="padding-left: 3%">
								<label class="btn btn-outline-warning text-white radius">
									<input type="checkbox" checked><i class="fas fa-check"></i>
								</label>
							</div>
							<div class="col-11">
								<div class="row">
									<div class="col-8">
										<a class="ordera row row-style" href="#"> <img
											class="basket-size"
											src="${pageContext.request.contextPath}/resources/images/Mypage/basket.jpg"
											style="padding: 0 3% 3% 0;">
											<dl>
												<dt>모던 트롤리 스윙 빨래바구니 2단/3단</dt>
												<dd>
													<font size="1">무료배송|일반택배</font>
												</dd>
											</dl>
										</a>
									</div>
									<div class="col-4 d-flex justify-content-end">
										<i class="fas fa-times"></i>
									</div>
								</div>
								<div class="radius"
									style="background-color: #EAEAEA; padding: 2% 0 2% 0;">
									<div class="row">
										<div class="col-10">
											<p>★반짝특가★ 03_모던 틀로리 뉴 스윙 2단 빨래바구니</p>
										</div>
										<div class="col-2 d-flex justify-content-end">
											<i class="fas fa-times"></i>
										</div>
									</div>
									<div class="row">
										<div class="col-10">
											<select>
												<option selected>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
												<option>6</option>
												<option>7</option>
												<option>8</option>
											</select>
										</div>
										<div class="col-2 d-flex justify-content-end">
											<dt class="align-self-end">23,900원</dt>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-8">
										<dd>
											<font size="2">옵션변경 | 바로구매</font>
										</dd>
									</div>
									<div class="col-4 d-flex justify-content-end">
										<p>23,900원</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12">
							<hr>
							<p class="text-center">배송비 무료</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-5 col-lg-4 sun">
				<div class="bg-white row pd radius" id="nav_reserve">
					<div class="mr-auto">
						<dl>
							<dd>총 삼품금액</dd>
							<dd>총 배송비</dd>
							<dd>총 할인금액</dd>
							<br>
							<dt>결제금액</dt>
						</dl>
					</div>
					<div>
						<dl>
							<dd>146,400원</dd>
							<dd>+ 0원</dd>
							<dd>- 67,700원</dd>
							<br>
							<dt>83,700원</dt>
						</dl>
					</div>
				</div>
				<br />
				<div class="text-center">
					<a href="./mypage_order.my"
						class="btn btn-warning btn-lg btn-block text-white" role="button"
						aria-pressed="true">구매하기</a>
				</div>
			</div>
		</div>
	</div>
	<script src="https://kit.fontawesome.com/b74b42490f.js"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
</html>