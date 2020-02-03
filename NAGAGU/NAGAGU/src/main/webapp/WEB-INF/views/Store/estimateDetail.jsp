<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    
<!DOCTYPE html>
<html>
	<head>
	<title>견적문의 상세</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

	
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
		}
		

		.es_requestform {
			font-size: 1.1em;
			margin: 0 180px 0 0;
		}
		
		img {
			max-width:100%;
		}

		.title {
			font-weight:bold;
		}
		
		.row {
			padding-bottom:3px;
		}		
		
		@media screen and (max-width:375px) {
			table {
				font-size:0.7rem;
			}
		}
		
		.offer_textarea {
			width:60%;

		}
		
		.pagination {
		  display: inline-block;
		  margin-bottom:30px;
		}
		
		.pagination a {
		  color: black;
		  float: left;
		  padding: 8px 16px;
		  text-decoration: none;
		}
		
		.pagination a:hover {
		  background-color: #ef902e;
		  color:black;
		
		}			

		.page-tap a {
		   text-decoration: none;
		   color: black;
		}	
		.page-tap a:hover{
			color: #ef900e !important;
			transform: scale(1.2);
			text-decoration: none;
		}

	</style>

	</head>
	
	
	<body class="order-body">
		<!-- content start -->
		<div class="container">
			<br />
			<br />
			<br />
			<div class="row justify-content-between title">
				<div class="col-10 page-tap">
					<h6><a href="./">STORE 견적 문의</a> > 상세보기 </h6>
				</div>
			</div>			
			<div class="row justify-content-center pb-3">
				<img
					src="${pageContext.request.contextPath}/resources/images/Store/es_request.jpg"
					alt="" class="img-responsive img-rounded" width="400" height="300">
			</div>
			<br/><br/>
			<form name="es_requestform" class="es_requestform">
				<div class="row text-center">
					<div class="col-md-4 d-flex justify-content-end title">첨부파일 다운</div>
					<div class="col-md-8 d-flex justify-content-start">스케치1.jpg</div>
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
							value="테이블" readonly>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-4 d-flex justify-content-end title">소재1</div>
					<div class="col-md-8 d-flex justify-content-start">
						<input type="text" name="ESTIMATE_SOURCE" size="65"
							value="편백나무 원목(상판)" readonly>
					</div>
				</div>
				<div class="row text-center pt-1 pb-1">
					<div class="col-md-4 d-flex justify-content-end title">소재2</div>
					<div class="col-md-8 d-flex justify-content-start">
						<input type="text" name="ESTIMATE_SOURCE" size="65"
							value="소나무 원목(하부)" readonly>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-4 d-flex justify-content-end title">색상(염색)</div>
					<div class="col-md-8 d-flex justify-content-start">
						<input type="text" name="ESTIMATE_COLOR" size="65"
							value="투명, 블루.." readonly>
					</div>
				</div>
				<div class="row text-center pt-1 pb-1">
					<div class="col-md-4 d-flex justify-content-end title">코팅</div>
					<div class="col-md-8 d-flex justify-content-start">
						<input type="text" size="65" value="원하지 않음" readonly>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-4 d-flex justify-content-end title">규격</div>
					<div class="col-md-8 d-flex justify-content-start">
						<input type="text" name="ESTIMATE_SIZE" size="65"
							value="가로100*세로150*높이200 " readonly>
					</div>
				</div>
				<div class="row text-center pt-1 pb-1">
					<div class="col-md-4 d-flex justify-content-end title">기타</div>
					<div class="col-md-8 d-flex justify-content-start">
						<textarea name="ESTIMATE_CONTENT" placeholder="상판은 편백나무 원목으로, 하부는 소나무 원목으로 테이블 만들어주세요" cols="69" rows="15" readonly ></textarea>
					</div>
				</div>
	
				<div class="row justify-content-center pt-5 pl-5 ml-5">
					<button class="btn btn-dark btn-md">입찰하기</button>&nbsp;&nbsp;&nbsp;
					<button class="btn btn-dark btn-md">목록보기</button>
				</div>
				
			</form>
			<br/><br/>
		
			<div class="row justify-content-center">
				<div class="row justify-content-center offer_textarea">
					
					<div class="col-10 justify-content-end">
						<textarea name="" placeholder="전반적인 일정, 재료, 제안 가격 등 상세하게 적어주시면 의뢰인에게 도움이 됩니다 :) " cols="78" rows="2"></textarea>&nbsp;&nbsp;
					</div>
					<div class="col-2 justify-content-start">
						&nbsp;&nbsp;<button class="btn btn-outline-dark btn-sm " onClick="location.href='#'" style="cursor: pointer;">등록</button>
					</div>
				</div>
			</div>
		
	
		<br/><br/>
		<!-- 테이블 -->
		<div class="table-responsive">
			<table class="table " style="width:80%; margin:0 auto;">
				<tr align="center">
					<th width="10%">번호</th>
					<th width="10%">공방</th>
					<th width="30%">내용</th>
					<th width="15%">제시 가격</th>
					<th width="10%">채팅</th>				
					<th width="15%">낙찰하기</th>
				</tr>
				<tr align="center" onClick="location.href='./estimatedetail.es'" style="cursor:pointer;">
					<td>3</td>
					<td>하루</td>
					<td class="">견적 신청합니다</td>
					<td>400,000</td>
					<td><button class="btn btn-outline-dark btn-sm">연결</button></td>
					<td><button class="btn btn-outline-dark btn-sm">낙찰하기</button></td>				
				</tr>
				<tr align="center" onClick="location.href='./estimatedetail.es'" style="cursor:pointer;">
					<td>2</td>
					<td>공방</td>
					<td class="">견적 신청합니다</td>
					<td>400,000</td>
					<td><button class="btn btn-outline-dark btn-sm">연결</button></td>
					<td><button class="btn btn-outline-dark btn-sm">낙찰하기</button></td>
				</tr>						
				<tr align="center">
					<td>1</td>
					<td>제조</td>
					<td class="">견적좀요!</td>
					<td>400,000</td>
					<td><button class="btn btn-outline-dark btn-sm">연결</button></td>
					<td><button class="btn btn-outline-dark btn-sm">낙찰하기</button></td>
					
				</tr>
			</table>
		
		</div>
	
		<br/><br/><br/>
	
		<!-- 댓글 페이지네이션 -->
		<div class="row justify-content-center">
			<div class="pagination">
			  <a href="#">&laquo;</a>
			  <a href="#">1</a>
			  <a href="#">2</a>
			  <a href="#">3</a>
			  <a href="#">4</a>
			  <a href="#">5</a>
			  <a href="#">6</a>
			  <a href="#">&raquo;</a>
			</div>
		</div>

		</div>
	
	
	
	<!-- content 끝 -->			
<br/><br/><br/><br/>

		
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

	
	</body>
</html>