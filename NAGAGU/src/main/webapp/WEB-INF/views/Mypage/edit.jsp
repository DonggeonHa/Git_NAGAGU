<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/mypage_edit_.css"> --%>
		<!-- Bootstrap CSS -->
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
				/* kt */
				a, .card a:link, .card a:visited {
					color: white;
					text-decoration: none;
				}
				
				.card {
					background-color: #1b1b27 !important;
					margin: 15px 15px 15px 15px;
					width: 10rem;
					color: white;	
				}
				.my {
					background-color: #ef900e !important;
				}
				.container-mypage{
					margin-top: 50px;
					margin-bottom: 50px;
				}
				.container-mypage> .row{
					min-width: 376px;
				}				
				@media ( min-width : 768px) {
					html, body {
						font-size: 15px;
					}
				}				
				@media ( min-width : 768px) {
					.container {
						margin-right: auto;
						margin-left: auto;
						box-sizing: border-box;
						width: calc(100% - 80px);
						max-width: 100%;
						box-sizing: border-box;
						min-height: 1px
					}
				}
				
				@media ( min-width : 1024px) {
					.container {
						margin-right: auto;
						margin-left: auto;
						width: calc(100% - 120px);
						max-width: 100%;
						box-sizing: border-box;
						min-height: 1px
					}
				}
				
				@media ( min-width : 1256px) {
					.container {
						margin-right: auto;
						margin-left: auto;
						width: 1136px;
						max-width: 100%;
						box-sizing: border-box;
						min-height: 1px
					}
				}
				
				@media ( min-width : 768px) {
					.signup_form {
						width: 360px;
					}
				}				
				@media ( max-width : 768px) {
					.signup_form {
						width: 360px;
					}
				}
				
				.signup_form_wrap {
					margin: 0 auto;
					width: 50%;
					min-width: 400px !important;
					background-color: #f0f0f0;
				}
				
				.error_next_box {
					display: block;
					margin: 9px 0 -2px;
					font-size: 12px;
					line-height: 14px;
					color: red;
				}
				
				.signup_form {
					margin: 0 auto;
					padding: 20px 0;
					
				}
				
				.signup_form h1 {
					font-size: 1.5rem;
					margin-top: 0;
					margin-bottom: 0.5rem;
					font-weight: 500;
					line-height: 1.2;
				}
				
				.form_group {
					margin: 0 0 30px;
				}
				
				.signup_sns {
					margin: 30px 0;
					padding-bottom: 30px;
					border-bottom: 1px solid #d3d3d3;
				}
				
				.signup_sns_title {
					font-size: 12px;
					text-align: center;
					margin: 15px 0;
					color: #757575;
				}
				
				.signup_sns_list {
					display: flex;
					justify-content: center;
					list-style: none;
					padding: 0;
				}
				
				.signup_sns_list_item {
					margin: 0 5px;
				}
				
				.signup_form .signup_form_email {
					width: 100%;
					margin: 0 0 30px;
				}
				
				.input_email {
					width: 100%;
				}
				
				.signup_form_label {
					display: block;
					margin: 0 0 12px;
					font-size: 15px;
					font-weight: 700;
					color: #292929;
					line-height: 21px;
					word-break: keep-all;
				}
				
				.signup_form_input {
					height: 42px;
					margin: 10px 0 0;
					display: flex;
					flex: 1 0 auto;
				}
				
				.input_email_local {
					width: 170px;
					position: relative;
					flex: 1 1 0px;
					float: left;
				}
				
				.form_input {
					width: 100%;
					border-radius: 4px;
					transition: border 0.2s, background 0.2s;
					display: block;
					padding: 0 15px;
					line-height: 40px;
					border: 1px solid #dbdbdb;
					background-color: #ffffff;
					color: #424242;
				}
				
				.input_email_seperator {
					position: relative;
					width: 20px;
					flex: 0 0 20px;
					float: left;
					text-align: center;
					font-size: 15px;
					letter-spacing: -0.4px;
					line-height: 40px;
				}
				
				.input_email_domain {
					position: relative;
					width: 170px;
					flex: 1 1 0px;
					float: left;
				}
				
				.input_email_domain select {
					width: 100%;
					font-size: 15px;
					border-radius: 4px;
					height: 42px;
				}
				
				.email2_hide_btn {
					position: absolute;
					overflow: hidden;
					right: 5px;
					z-index: 2;
					display: none;
					text-align: center;
					width: 20px;
					height: 20px;
					margin: 11px 5px 11px 5px;
					padding: 0;
					color: #aaa;
					transition: color 0.2s;
				}
				
				.email2_hide_btn:hover {
					color: #666666;
					cursor: pointer;
				}
				
				.signup_form_term {
					border: 1px solid #c3c3c3;
					border-radius: 4px;
					padding: 10px 10px 10px 10px;
				}
				
				.signup_form_term_body {
					margin: 10px 0 0;
				}
				
				.signup_form_label {
					font-size: 15px;
					font-weight: 700;
					line-height: 21px;
					word-break: keep-all;
				}
				
				.form_check {
					flex: 1 1 auto;
				}
				
				.term_all {
					border-bottom: 1px solid #c3c3c3;
					padding-bottom: 18px;
					margin-bottom: 16px;
				}
				
				.signup_form_submit {
					background: lightgrey;
					color: #ffffff;
					width: 100%;
					padding: 26px 0;
					font-size: 18px;
					text-align: center;
					border: none;
					border-radius: 4px;
					font-weight: 700;
					transition: background 0.2s;
				}
				
				.signup_form_submit:hover {
					background: #fbb000;
				}			
								
		</style>
	</head>
	
	<body class="order-body">
		<!-- SECTION: content -->
		<div class="container container-mypage text-center" role="main">
			<div class="card-group text-center d-inline-flex">
				<div class="card my">
					<a href="mypage.my" class="href">
						<div class="card-header">MY</div>
						<div class="card-body">
							<i class="far fa-user-circle fa-4x"></i>
						</div>
					</a>
					<div class="card-footer bg-transparent ">Follow</div>
				</div>
	
				<div class="card card-hover">					
						<div class="card-header">EDIT</div>
						<div class="card-body">
							<i class="fas fa-user-edit fa-4x"></i>
						</div>
						<div class="card-footer bg-transparent ">정보 수정</div>					
				</div>
			</div>
		</div>
	
		<div class="signup_form_wrap">
			<div class="signup_form">
				<h1 class="signup_title">회원정보 수정</h1>
				<hr>
				<form class="singup_form" anction="./loginform.html">
					<div class="signup_form_email">
						<div class="signup_form_label">이메일</div>
						<div class="signup_form_input">
							<div class="input_email form_group">
								<div class="input_email_local">
									<input class="form_input" id="email1" name="email1"
										placeholder="이메일" size="1">
								</div>
								<div class="input_email_seperator">@</div>
								<div class="input_email_domain">
									<select id="selector" class="form_input">
										<option disabled>선택해주세요</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="nate.com">nate.com</option>
										<option value="_manual">직접입력</option>
									</select> <span id="btn_hide" class="email2_hide_btn"> <i
										class="far fa-times-circle"></i>
									</span> <input id="email2" name="email2" class="form_input"
										type="hidden">
								</div>
							</div>
						</div>
						<div class="error_next_box" id="emailMsg" style="display: hidden;"
							aria-live="assertive"></div>
					</div>
					<div class="signup_form_pass1 form_group">
						<div class="signup_form_label">비밀번호</div>
						<div class="signup_form_input">
							<input type="password" id="pass1" name="member_pass"
								class="form_input" placeholder="8자 이상 영문, 숫자, 특수문자를 사용하세요.">
						</div>
						<div class="error_next_box" id="pass1Msg" style="display: hidden;"
							aria-live="assertive"></div>
					</div>
					<div class="signup_form_pass2 form_group">
						<div class="signup_form_label">비밀번호 확인</div>
						<div class="signup_form_input">
							<input type="password" id="pass2" name="member_pass_check"
								class="form_input">
						</div>
						<div class="error_next_box" id="pass2Msg" style="display: hidden;"
							aria-live="assertive"></div>
					</div>
					<div class="signup_form_nickname form_group">
						<div class="signup_form_label">별명</div>
						<div class="signup_form_input">
							<input type="text" id="nickname" name="member_nickname"
								class="form_input">
						</div>
						<div class="error_next_box" id="nickMsg" style="display: hidden;"
							aria-live="assertive"></div>
					</div>
					<div class="signup_form_nickname form_group">
						<div class="signup_form_label">주소</div>
						<div class="row justify-content-around m-0 align-items-center">
							<span class="mr-2">우편번호</span> <span class="signup_form_input">
								<input type="text" id="nickname" name="member_nickname"
								class="form_input" style="width: 8rem;">
							</span> <span>
								<button type="button" class="btn btn-outline-dark mx-2">주소검색</button>
							</span>
						</div>
						<div class="signup_form_input">
							<input type="text" id="nickname" name="member_nickname"
								class="form_input">
						</div>
						<div class="signup_form_input">
							<input type="text" id="nickname" name="member_nickname"
								class="form_input">
						</div>
						<div class="error_next_box" id="nickMsg" style="display: hidden;"
							aria-live="assertive"></div>
					</div>
					<div class="error_next_box" id="termMsg" style="display: hidden;"
						aria-live="assertive"></div>
					<button id="btn_submit" class="signup_form_submit" type="submit">수정</button>
				</form>
			</div>
		</div>
		
		<!-- Optional JavaScript -->
		<script src="<c:url value="/resources/js/Mypage/edit.js"/>"></script>
		<!-- fontawesome kit -->
		<script src="https://kit.fontawesome.com/97dbc99ea1.js"	crossorigin="anonymous"></script>
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js "	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n " crossorigin="anonymous "></script>
		<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js " integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo " crossorigin="anonymous "></script>
		<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js " integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6 " crossorigin="anonymous "></script>
	</body>
</html>