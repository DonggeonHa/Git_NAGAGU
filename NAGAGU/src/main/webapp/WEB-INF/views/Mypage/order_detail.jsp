<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/order_detail_.css">
		<style type="text/css">
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
		</style>
	</head>
	
	<body class="order-body">
		<div class="container container-mypage bg-light">
			<div class="row justify-content-center pb-3">
				<div class="card-group text-center d-inline-flex">
					<div class="card my" style="width: 10rem;">
						<a href="mypage.my">
							<div class="card-header">MY</div>
							<div class="card-body"><i class="far fa-user-circle fa-4x"></i></div>
							<div class="card-footer bg-transparent">Follow</div>
						</a>
					</div>
	
					<div class="card ">
						<div class="card-header">ORDER</div>
						<div class="card-body"><i class="fas fa-truck-pickup fa-4x"></i></div>
						<div class="card-footer bg-transparent ">주문 글</div>
					</div>
				</div>
			</div>
	
			<h4>
				<b>주문상세정보</b>
			</h4>
			<div>
				<div style="padding: 0 0 1% 0;">
					<b>주문번호 : 13077406 | 주문일자 : 2020.01.10</b>
				</div>
			</div>
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
							<dd>입금대기 | 일반택배배송
						</dl>
					</td>
					<td>
						<dl>
							<dt>&nbsp;</dt>
							<dd class="text-center">
								<a href="#" class="btn btn-outline-dark" role="button" aria-pressed="true">주문취소</a>
							</dd>
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
							<dd>입금대기 | 일반택배배송
						</dl>
					</td>
					<td>
						<dl>
							<dt>&nbsp;</dt>
							<dd class="text-center">
								<a href="#" class="btn btn-outline-dark" role="button"
									aria-pressed="true">주문취소</a>
							</dd>
							<dd>&nbsp;</dd>
						</dl>
					</td>
				</tr>
			</table>
	
	
			<div>
				<b>가상계좌정보</b>
				<hr>
			</div>
			<div class="row">
				<table class="table table-borderless">
					<tr>
						<th class="color" scope="row">은행명</th>
						<td>하나은행</td>
					</tr>
					<tr>
						<th scope="row">예금주</th>
						<td>주식회사 DIYDIY</td>
					</tr>
					<tr>
						<th scope="row">계좌번호</th>
						<td>15791598523237</td>
					</tr>
					<tr>
						<th scope="row">입금금액</th>
						<td>83,700원</td>
					</tr>
					<tr>
						<th scope="row">기한</th>
						<td>2020.01.15까지</td>
					</tr>
				</table>
			</div>
	
			<div>
				<b>결제 정보</b>
				<hr>
			</div>
			<div class="row">
				<div class="col-5">
					<table class="table table-borderless">
						<tr>
							<th scope="row">상품금액</th>
							<td>146,400원</td>
						</tr>
						<tr>
							<th scope="row">할인금액</th>
							<td>(-) 627,000원</td>
						</tr>
						<tr>
							<th scope="row">선불배송비</th>
							<td>(+) 0원</td>
						</tr>
						<tr>
							<th scope="row">조립비</th>
							<td>(+) 0원</td>
						</tr>
						<tr>
							<th scope="row">결제금액</th>
							<td>83,700원</td>
						</tr>
						<tr>
							<th scope="row">결제방법</th>
							<td>가상계좌 입금</td>
						</tr>
					</table>
				</div>
				<div class="col-7">
					<table class="table table-borderless">
						<tr>
							<th scope="row">주문자</th>
							<td>하동건 (닉네임:하동건빵 / 회원번호:6145268)</td>
						</tr>
						<tr>
							<th scope="row">연락처</th>
							<td>010 5144 9279</td>
						</tr>
						<tr>
							<th scope="row">이메일</th>
							<td>liverpool93@kakao.com</td>
						</tr>
						<tr>
							<th scope="row"></th>
							<td></td>
						</tr>
						<tr>
							<th scope="row"></th>
							<td></td>
						</tr>
						<tr>
							<th scope="row"></th>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
	
			<div>
				<b>배송지 정보</b>
				<hr>
			</div>
			<div class="row">
				<div class="col-12">
					<table class="table table-borderless">
						<tr>
							<th scope="row">수령인</th>
							<td>하동건</td>
						</tr>
						<tr>
							<th scope="row">연락처</th>
							<td>010 5144 9279</td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td>(16234) 경기 수원시 장안구 당당당99번길 11-11 (당당동) 빌라 101호</td>
						</tr>
						<tr>
							<th scope="row">배송메모</th>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	
		<script src="https://kit.fontawesome.com/97dbc99ea1.js"	crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/b74b42490f.js"	crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>