<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<title>견적문의 폼</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
	<!-- 
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/Store/estimateform.css">
		-->

<!-- GOOGLE FONT -->

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
		}
		
		.store_estimateform {
			font-size: 1.1em;
			margin: 0 180px 0 0;
		}
		
		input[id="checkbox"] {
			position: relative;
			top: 1.5px;
		}
		
		img {
			max-width: 100%;
		}
		
		.title {
			font-weight:bold;
		}		
		
		.row {
			padding-bottom:3px;
		}


	</style>
</head>

<body class="order-body">
	<!-- content start -->
	<div class="container">
		<br />
		<br />
		<br />
		<div class="row justify-content-center pb-3">
			<img
				src="${pageContext.request.contextPath}/resources/images/Store/es_request.jpg"
				alt="" class="img-responsive img-rounded" width="400" height="300">
		</div>
		<br/><br/>
		<form name="store_estimateform" class="store_estimateform"
			action="./store_estimateform_input.es" method="post"
			enctype="multipart/form-data">
			<div class="row text-center">
				<div class="col-md-4 d-flex justify-content-end title">파일 첨부하기</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input multiple="multiple" type="file" name="ESTIMATE_FILE"
						size="70">
				</div>
			</div>
			<div class="row">
				<div class="col-md-4  justify-content-end"></div>
				<div class="col-md-8 justify-content-start">
					<div class="selectedimgs" style="width: 70%;">
						<div class="row p-0 m-0">
							<div class="col-3 p-0 m-0">
								<img
									src="${pageContext.request.contextPath}/resources/images/Store/table.jpg"
									width="100" height="100">
							</div>
							<div class="col-3 p-0 m-0">
								<img
									src="${pageContext.request.contextPath}/resources/images/Store/table.jpg"
									width="100" height="100">
							</div>
							<div class="col-3 p-0 m-0">
								<img
									src="${pageContext.request.contextPath}/resources/images/Store/table.jpg"
									width="100" height="100">
							</div>
							<div class="col-3 p-0 m-0">
								<img
									src="${pageContext.request.contextPath}/resources/images/Store/table.jpg"
									width="100" height="100">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row text-center pt-1 pb-1 ">
				<div class="col-md-4 d-flex justify-content-end title">제품 종류</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="text" name="ESTIMATE_CATEGORY" size="65"
						placeholder="ex)침대, 서랍장, 의자.. ">
				</div>
			</div>
			<div class="row text-center">
				<div class="col-md-4 d-flex justify-content-end title">소재1</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="text" name="ESTIMATE_SOURCE" size="65"
						placeholder="ex)편백나무 원목(상판)">
				</div>
			</div>
			<div class="row text-center pt-1 pb-1">
				<div class="col-md-4 d-flex justify-content-end title">소재2</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="text" name="ESTIMATE_SOURCE" size="65"
						placeholder="ex)소나무 원목(하부)">
				</div>
			</div>
			<div class="row text-center">
				<div class="col-md-4 d-flex justify-content-end title">색상(염색)</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="text" name="ESTIMATE_COLOR" size="65"
						placeholder="ex)투명, 블루..">
				</div>
			</div>
			<div class="row text-center pt-1 pb-1">
				<div class="col-md-4 d-flex justify-content-end title">코팅</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="checkbox" id="checkbox" name="ESTIMATE_COAT"
						onclick="oneCheckbox(this)"> 원함 &nbsp;&nbsp; <input
						type="checkbox" id="checkbox" name="ESTIMATE_COAT"
						onclick="oneCheckbox(this)"> 원하지 않음
				</div>
			</div>
			<div class="row text-center">
				<div class="col-md-4 d-flex justify-content-end title">규격</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="text" name="ESTIMATE_SIZE" size="65"
						placeholder="ex)가로100*세로150*높이200 ">
				</div>
			</div>
			<div class="row text-center pt-1 pb-1">
				<div class="col-md-4 d-flex justify-content-end title">기타</div>
				<div class="col-md-8 d-flex justify-content-start">
					<textarea name="ESTIMATE_CONTENT" placeholder="기타 설명" cols="69"
						rows="15"></textarea>
				</div>
			</div>

			<div class="row justify-content-center pt-5 pl-5 ml-5">
				<button class="btn btn-outline-dark btn-md">신청하기</button>
			</div>
	
			
		</form>
		<br/><br/>
	</div>
	<!-- content 끝 -->
	<script src="<c:url value="/resources/js/Store/estimateform.js"/>"></script>
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