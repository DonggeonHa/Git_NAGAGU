<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
	<head>
	    <!-- boot -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Academy/academy.css">
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
	<body class="order-body">
		<div class="container justify-content-center solid reservation-container">
				<div class="row justify-content-center">
				<div class="col-8 text-center" id="class_title">[우드 버닝] 원데이 클래스
					오전반</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-9" id="horizon">
					<hr width="100%" color="#8C92A0" size="3">
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-8" id="class_detailed">스툴로 제작되는 원목 소가구 이며 아래
					선반이 들어가는 형태로 사이드 테이블이나 화분 받침대로도 사용가능한 심플한 디자인.</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-8" id="detail">
					<div id="progress_time">진행시간</div>
					<div style="margin-top: 10px; font-size: small;">3시간</div>
					<div id="progress_time">
						예약 날짜 / 시
						<span style="color: red"><i class="far fa-calendar-alt blue" id="calendar"></i></span>
					</div>
					<div style="margin-top: 10px; font-size: small;">2019.12.27.(금)
						오전 09:00 ~ 오후 12:00</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-4" style="width:65%;" id="detail">
					<div class="row" id="progress_time" style="padding: 0 0 0 20px;">
						참여 인원 
					</div>
					<div class="row" style="margin-top: 10px; font-size: small; padding: 0 0 0 22px;">
						<span id="date_price">35,000원</span>
					</div>		
				</div>		
				<div class="col-4" id="progress_time" style="padding: 40px 80px 5px 10px;">
					<div class="row justify-content-end">
						<form>
							<input type="button" id="minus" value="-" style="float: left;" onClick="javascript:this.form.amount.value--;">
							<input type="text" name="amount" id="amount" value="1" style="float: left; width: 50px; text-align: right;">
							<input type="button" id="plus" value="+" onClick="javascript:this.form.amount.value++;">
						</form>
					</div>
					<div class="row mt-2 result-class justify-content-end">
						<span id="result" style="text-align: end; font-size: small;">35,000원</span>
					</div>
				</div>	
			</div>
			
			<div class="row justify-content-center">
				<div class="col-8" id="info">
					<div style="font-size: large; font-weight: bolder;">예약자 정보</div>
					<div>
						<div class="row mt-3">
							<div class="col-3">예약자</div>
							<div class="col">
								<input type="text" placeholder="성함">
							</div>
						</div>
						<div class="row">
							<div class="col-3">연락처</div>
							<div class="col">
								<input type="text" placeholder="연락처">
							</div>
						</div>
						<div class="row">
							<div class="col-3">이메일</div>
							<div class="col">
								<input type="text" placeholder="이메일">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-8" id="seller">
					<div style="font-size: large; font-weight: bolder;">판매자 정보</div>
					<div>
						<table>
							<tr>
								<td>상호</td>
								<td class="table_text">비트캠프 공방</td>
							</tr>
							<tr>
								<td>대표자명</td>
								<td class="table_text">댕댕댕</td>
							</tr>
							<tr>
								<td>소재지</td>
								<td class="table_text">서울특별시 송파구 새말로6길 16 지하 1층(서울특별시 송파구
									문정동 77-9 지하 1층) 8호선 장지역 1번출구 - 일반통행길 (브리앙뜨아파트쪽) 블라블라 건물 - 메가커피
									건물 - 블라블라 건물 위치.</td>
							</tr>
							<tr>
								<td>사업자번호</td>
								<td class="table_text">012-34-56789</td>
							</tr>
							<tr>
								<td>연락처</td>
								<td class="table_text">010-1111-1111</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="row justify-content-center mt-5 mb-5">
				<button type="button" id="btn" class="btn btn-outline-dark mr-4">예약 신청하기</button>
				<button type="button" id="btn" class="btn btn-outline-dark">뒤로</button>
			</div>
		</div>
	
		<!-- js -->
	    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	</body>
</html>