<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<style>
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
		<div class="container bg-light" style="padding: 5% 15% 15% 15%;">
			<div class="text-center">
				<img class="" src="${pageContext.request.contextPath}/resources/images/Mypage/orderSuccess.jpg"><br>				
			</div>
			<div class="text-center">
				<br>
				<p><font size="4">아래의 표를 참조해서 입금해주세요.</font></p>
				<div style="padding: 0 15% 0 15%;">
					<table class="table">
						<tr>
							<th scope="row">은행명</th>
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
					<div class="text-center">
						<a href="#" class="btn btn-outline-dark btn-lg" role="button" aria-pressed="true">주문현황보기</a>
						<a href="./index.ma" class="btn btn-outline-dark btn-lg" role="button" aria-pressed="true">메인페이지로</a>
					</div>
				</div>
			</div>
		</div> 
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>