<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Store/estimatelist.css">
		<!-- GOOGLE FONT -->
		<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua&display=swap&subset=korean" rel="stylesheet">
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
			
			dl.text-center {
				color: orange;
			}
			
			a.btn-outline-dark:hover {
				color: white !important;
			}
		</style>
	</head>
	<body class="order-body">
		<div class="text-center" style="padding: 3% 0 3% 0;">
			<h1>견적 문의시 이용가이드</h1>
		</div>
		<!-- content start -->
		<div class="container">
			<div>
				<nav>
					<div class="nav d-flex justify-content-between shadow p-3 mb5 bg-white rounded" id="nav-tab" role="tablist">
				    	<a class="nav-item nav-link active" id="nav-waiting-tab" data-toggle="tab" href="#nav-waiting" role="tab" aria-controls="nav-home" aria-selected="true">
				    		<dl class="text-center">
				    			<dd></dd>
				    			<dt><h5>견적신청</h5></dt>
				    			<dd></dd>
				    		</dl>
				    	</a>
						<div class="text-center align-self-center">
							<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
						</div>
				    	<a class="nav-item nav-link" id="nav-finish-tab" data-toggle="tab" href="#nav-finish" role="tab" aria-controls="nav-profile" aria-selected="false">
				    		<dl class="text-center">
				    			<dd></dd>
				    			<dt><h5>공방입찰</h5></dt>
				    			<dd></dd>
				    		</dl>
				    	</a>
				    	<div class="text-center align-self-center">
							<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
						</div>
				    	<a class="nav-item nav-link" id="nav-ready-tab" data-toggle="tab" href="#nav-ready" role="tab" aria-controls="nav-contact" aria-selected="false">
				    		<dl class="text-center">
				    			<dd></dd>
				    			<dt><h5>입찰확인</h5></dt>
				    			<dd></dd>
				    		</dl>
				    	</a>
				    	<div class="text-center align-self-center">
							<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
						</div>
						<a class="nav-item nav-link" id="nav-shipping-tab" data-toggle="tab" href="#nav-shipping" role="tab" aria-controls="nav-contact" aria-selected="false">
							<dl class="text-center">
				    			<dd></dd>
				    			<dt><h5>낙찰</h5></dt>
				    			<dd></dd>
				    		</dl>
						</a>
						<div class="text-center align-self-center">
							<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
						</div>
						<a class="nav-item nav-link" id="nav-completed-tab" data-toggle="tab" href="#nav-completed" role="tab" aria-controls="nav-contact" aria-selected="false">
							<dl class="text-center">
				    			<dd></dd>
				    			<dt><h5>낙찰확정</h5></dt>
				    			<dd></dd>
				    		</dl>
						</a>
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active shadow p-3 mb5 bg-white rounded" id="nav-waiting" role="tabpanel" aria-labelledby="nav-waiting-tab" style="padding-top: 30%;">
						<hr>
						<div>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. Numquam consequatur alias sunt ad maxime provident est aut ea commodi 
							laboriosam assumenda hic blanditiis, voluptas nobis omnis quam. Corporis asperiores, id at consequatur possimus ipsum magni deserunt 
							autem sunt, alias labore consectetur iusto quo explicabo quidem omnis distinctio eius vitae optio, totam nobis delectus. Laborum laboriosam 
							expedita deleniti ad quod nostrum sed esse quo corporis veritatis facilis debitis mollitia obcaecati assumenda animi aut, provident commodi cum, 
							architecto possimus dicta explicabo asperiores vitae. Voluptates, consequatur, excepturi! Laboriosam qui at, pariatur distinctio consequuntur 
							tenetur eligendi molestiae, dolorum voluptatem. Eum totam nobis error quae.
						</div>
						<hr>
					</div>
					<div class="tab-pane fade shadow p-3 mb5 bg-white rounded" id="nav-finish" role="tabpanel" aria-labelledby="nav-finish-tab">
						<hr>
						<div>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit.mnis distinctio eius vitae optio, totam nobis delectus. Laborum laboriosam 
							expedita deleniti ad quod nostrum sed esse quo corporis veritatis facilis debitis mollitia obcaecati assumenda animi aut, provident commodi cum, 
							architecto possimus dicta explicabo asperiores vitae. Voluptates, consequatur, excepturi! Laboriosam qui at, pariatur distinctio consequuntur 
							tenetur eligendi molestiae, dolorum voluptatem. Eum totam nobis error quae.
						</div>
						<hr>
					</div>
					<div class="tab-pane fade shadow p-3 mb5 bg-white rounded" id="nav-ready" role="tabpanel" aria-labelledby="nav-ready-tab">
						<hr>
						<div>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. Numquam consequatur alias sunt ad maxime provident est aut ea commodi 
							laboriosam assumenda hic blanditiis, voluptas nobis omnis quam. Corporis asperiores, id at consequatur possimus ipsum magni deserunt 
							autem sunt, alias labore consectetur iusto quo explicabo quidem omnis distinctio eius vitae optio, totam nobis delectus. Laborum laboriosam 
							expedita deleniti ad quod nostrum sed esse quo corporis veritatis facilis debitis mollitia obcaecati assumenda animi aut, provident commodi cum, 
							architecto possimus dicta explicabo asperiores vitae. Voluptates, 
						</div>
						<hr>
					</div>
					<div class="tab-pane fade shadow p-3 mb5 bg-white rounded" id="nav-shipping" role="tabpanel" aria-labelledby="nav-shipping-tab">
						<hr>
						<div>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. Numquam consequatur alias sunt ad maxime provident est aut ea commodi 
							laboriosam assumenda hic blanditiis, voluptas nobis omnis quam. Corporis asperiores, id at consequatur possimus ipsum magni deserunt 
							autem sunt, alias labore consectetur iusto quo explicabo quidem omnis  
						</div>
						<hr>
					</div>
					<div class="tab-pane fade shadow p-3 mb5 bg-white rounded" id="nav-completed" role="tabpanel" aria-labelledby="nav-completed-tab">
						<hr>
						<div>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. Numquam consequatur alias sunt ad maxime provident est aut ea commodi 
							laboriosam assumenda hic blanditiis, voluptas nobis omnis quam. Corporis asperiores, id at consequatur possimus ipsum magni deserunt 
							autem sunt, alias labore consectetur iusto quo explicabo quidem omnis distinctio eius vitae optio, totam nobis delectus. Laborum laboriosam 
							expedita deleniti ad quod nostrum sed esse quo corporis veritatis facilis 
						</div>
						<hr>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<br /> <br /> <br />
	
			<div class="row justify-content-end">
				<a class="btn btn-outline-dark mb-2" onClick="location.href='./store_estimateform.es'" style="cursor: pointer;">글쓰기</a>
			</div>
	
			<div class="row justify-content-center">
	
				<div class="table-responsive ">
					<table class="table table-hover ">
	
						<tr>
							<th width="55" style="text-align: center;">번호</th>
							<th width="60" style="text-align: center;">신청인</th>
							<th width="370" style="text-align: center;">제목</th>
							<th width="80" style="text-align: center;">카테고리</th>
							<th width="60" style="text-align: center;">평균가</th>
							<th width="55" style="text-align: center;">업체수</th>
							<th width="60" style="text-align: center;">신청 시간</th>
							<th width="60" style="text-align: center;">진행상황</th>
						</tr>
	
						<tr onClick="location.href='./estimatedetail.es'"
							style="cursor: pointer;">
							<td>15</td>
	
							<td>오늘은***</td>
							<td class="es_title">견적 신청합니다</td>
							<td>테이블</td>
							<td>320,000</td>
							<td>4</td>
							<td>2019.12.30 15:30</td>
							<td>입찰진행</td>
						</tr>
						<tr onClick="location.href='./estimatedetail.es'"
							style="cursor: pointer;">
							<td>14</td>
	
							<td>오늘은***</td>
							<td class="es_title">견적 신청합니다</td>
							<td>테이블</td>
							<td>320,000</td>
							<td>4</td>
							<td>2019.12.30 15:30</td>
							<td>입찰진행</td>
						</tr>
						<tr onClick="location.href='./estimatedetail.es'"
							style="cursor: pointer;">
							<td>13</td>
	
							<td>오늘은***</td>
							<td class="es_title">견적 신청합니다</td>
							<td>테이블</td>
							<td>320,000</td>
							<td>4</td>
							<td>2019.12.30 15:30</td>
							<td>입찰진행</td>
						</tr>
						<tr onClick="location.href='./estimatedetail.es'"
							style="cursor: pointer;">
							<td>12</td>
	
							<td>오늘은***</td>
							<td class="es_title">견적 신청합니다</td>
							<td>테이블</td>
							<td>320,000</td>
							<td>4</td>
							<td>2019.12.30 15:30</td>
							<td>입찰진행</td>
						</tr>
						<tr onClick="location.href='./estimatedetail.es'"
							style="cursor: pointer;">
							<td>11</td>
	
							<td>오늘은***</td>
							<td class="es_title">견적 신청합니다</td>
							<td>테이블</td>
							<td>320,000</td>
							<td>4</td>
							<td>2019.12.30 15:30</td>
							<td>입찰진행</td>
						</tr>
						<tr onClick="location.href='./estimatedetail.es'"
							style="cursor: pointer;">
							<td>10</td>
	
							<td>오늘은***</td>
							<td class="es_title">견적 신청합니다</td>
							<td>테이블</td>
							<td>320,000</td>
							<td>4</td>
							<td>2019.12.30 15:30</td>
							<td>입찰진행</td>
						</tr>
						<tr>
							<td>9</td>
	
							<td>모레는***</td>
							<td class="es_title">견적좀요!</td>
							<td>스툴</td>
							<td>128,000</td>
							<td>7</td>
							<td>2019.12.29 20:30</td>
							<td>거래성사</td>
						</tr>
						<tr>
							<td>8</td>
	
							<td>모레는***</td>
							<td class="es_title">견적좀요!</td>
							<td>스툴</td>
							<td>128,000</td>
							<td>7</td>
							<td>2019.12.29 20:30</td>
							<td>거래성사</td>
						</tr>
						<tr>
							<td>8</td>
	
							<td>오늘은***</td>
							<td class="es_title">견적 신청합니다</td>
							<td>테이블</td>
							<td>320,000</td>
							<td>4</td>
							<td>2019.12.30 15:30</td>
							<td>입찰진행</td>
						</tr>
						<tr>
							<td>7</td>
	
							<td>모레는***</td>
							<td class="es_title">견적좀요!</td>
							<td>스툴</td>
							<td>128,000</td>
							<td>7</td>
							<td>2019.12.29 20:30</td>
							<td>거래성사</td>
						</tr>
						<tr>
							<td>6</td>
	
							<td>모레는***</td>
							<td class="es_title">견적좀요!</td>
							<td>스툴</td>
							<td>128,000</td>
							<td>7</td>
							<td>2019.12.29 20:30</td>
							<td>거래성사</td>
						</tr>
						<tr>
							<td>5</td>
	
							<td>모레는***</td>
							<td class="es_title">견적좀요!</td>
							<td>스툴</td>
							<td>128,000</td>
							<td>7</td>
							<td>2019.12.29 20:30</td>
							<td>거래성사</td>
						</tr>
						<tr>
							<td>4</td>
	
							<td>모레는***</td>
							<td class="es_title">견적좀요!</td>
							<td>스툴</td>
							<td>128,000</td>
							<td>7</td>
							<td>2019.12.29 20:30</td>
							<td>거래성사</td>
						</tr>
						<tr>
							<td>3</td>
	
							<td>모레는***</td>
							<td class="es_title">견적좀요!</td>
							<td>스툴</td>
							<td>128,000</td>
							<td>7</td>
							<td>2019.12.29 20:30</td>
							<td>거래성사</td>
						</tr>
						<tr>
							<td>2</td>
	
							<td>모레는***</td>
							<td class="es_title">견적좀요!</td>
							<td>스툴</td>
							<td>128,000</td>
							<td>7</td>
							<td>2019.12.29 20:30</td>
							<td>거래성사</td>
						</tr>
						<tr>
							<td>1</td>
	
							<td>모레는***</td>
							<td class="es_title">견적좀요!</td>
							<td>스툴</td>
							<td>128,000</td>
							<td>7</td>
							<td>2019.12.29 20:30</td>
							<td>거래성사</td>
						</tr>
	
					</table>
				</div>
				<br /> <br />
			</div>
			<!-- 글찾기 -->
	
	
			<div class="search" align="center">
				<select name="color" size="1">
					<option value="">선택</option>
					<option value="">-----------------</option>
					<option value="">제목</option>
					<option value="">본문</option>
					<option value="">별명</option>
					<option value="">제목+본문</option>
				</select> <input type="text" size="12" name="search"> <input
					type="button" name="search" value="검색" onClick="location.href='#'"
					style="cursor: pointer;">
			</div>
			<br />
			<!-- 버튼 -->
	
	
			<div class="pages" align="center">
				<a href="#"><span class="page">1</span></a> &nbsp;&nbsp;&nbsp; <a
					href="#"><span class="page">2</span></a> &nbsp;&nbsp;&nbsp; <a
					href="#"><span class="page">3</span></a> &nbsp;&nbsp;&nbsp; <a
					href="#"><span class="page">4</span></a> &nbsp;&nbsp;&nbsp; <a
					href="#"><span class="page">5</span></a> &nbsp;&nbsp;&nbsp;
			</div>
	
			<br />
		</div>
		<!-- content 끝 -->
	
		<br />
		<br />
		<br />
		<br />
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>