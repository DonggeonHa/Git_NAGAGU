<%@page import="com.spring.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String MEMBER_EMAIL = (String)session.getAttribute("MEMBER_EMAIL");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		<style>
			.bg {
				border-bottom: 4px solid #ef900e;
				background-color: #1B1B27;
			}
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
			.dropdown-menu .dropdown-item a{
	            text-decoration: none;
	            color: black; 
	         }
			.header_util>ul>li {
				float: left;
				display: inline-block;
				vertical-align: top;
				line-height: 25px;
				padding: 8px 9px 0 10px;
				font-size: 13px;
				position: relative;
				z-index: 72;
			}
			
			.header_util>ul>li>a {
				color: #ffffff;
				text-decoration: none;
			}
			
			.header_util>ul>li>div>img {
				color: #ffffff;
				text-decoration: none;
			}
			
			.header_util>ul>li a:hover {
				opacity: 0.7;
			}
			
			.header_util>ul>li>div img:hover {
				opacity: 0.7;
			}
			
			.test {
				font-size: 17px;
			}
			
			.icons-btn {
				display: inline-block;
				text-align: center;
			}
			
			.icons-btn span {
				display: block;
				height: 40px;
				width: 40px;
				line-height: 40px;
			}
			
			@media ( max-width : 991.98px) {
				.icons-btn span {
					width: 24px;
				}
			}
			
			.icon-close2:before {
				content: "\e5cd";
			}
			
			.search-wrap {
				position: absolute;
				height: 50%;
				top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				background: #fff;
				z-index: 999;
				opacity: 0;
				visibility: hidden;
				-webkit-transition: .5s all ease;
				-o-transition: .5s all ease;
				transition: .5s all ease;
			}
			
			.search-wrap.active {
				opacity: 1;
				visibility: visible;
			}
			
			.search-wrap .form-control {
				position: absolute;
				top: 80%;
				width: 100%;
				-webkit-transform: translateY(-50%);
				-ms-transform: translateY(-50%);
				transform: translateY(-50%);
				border: none;
				z-index: 3;
				font-size: 40px;
			}
			
			@media ( max-width : 991.98px) {
				.search-wrap .form-control {
					font-size: 20px;
				}
			}
			
			.search-wrap .search-close {
				z-index: 4;
				position: absolute;
				right: 20px;
				top: 100%;
				-webkit-transform: translateY(-50%);
				-ms-transform: translateY(-50%);
				transform: translateY(-50%);
			}
			
			.search-wrap .search-close span {
				font-size: 30px;
			}
			
			/*마이페이지 버튼 css*/
			.btn_mypage:hover {
			    color: #ffffff !important;
			}
			#logout{
			    text-decoration: none;
			}
			
			/* 로그인 모달 css */
			.mtitle {
				margin-left: 140px;
				text-align: center;
				margin-top: 20px;
			}
			
			.mcontent {
				margin: 0 auto;
				max-width: 450px;
			}
			.input_css {
				width: 360px;
	         	height: 50px;
	         	border-radius: 4px 4px 0 0;
	         	border: 1px solid #dedede;
	         	padding: 10px;
	         	margin-top: 3px;
	         	font-size: 0.9em;
	         	color: #3a3a3a;
			}
			.btn_login {
				width: 360px;
	         	height: 50px;
	         	margin: 20px 0;
    			padding: 13px 15px;
    			font-size: 18px;
    			line-height: 1.41;
    			background: #dedede;
    			border: 0px solid;
			}
			
			.sign-in-icon {
		   		width: 48px;
		    	height: 48px;
		    	border-radius: 25px;
		    	background-position: left -80px top -80px;
		   	}
		   	
		   	.sign-in-kakao-icon {
		   		width: 52px;
		    	height: 52px;
		    	margin-right: 15px;
		    	border-radius: 25px;
		   	}
		   	    
		   	.fail_message {
		   		margin-bottom: -10px;
    			font-size: 10px;
    			color: red;
    			display: none;
		   	}   
		   	 
		   	@media ( max-width : 375px) {
				.modal-title {
					margin-left: 95px;
				}
				.input_css {
					width: 300px;
					margin: 0 auto;
				}
				.btn_login {
					width: 100%;
				}
			}
			/* input타입 비밀번호일 때만 폰트 바꿈 */
			#MEMBER_PASS {
				font-family: '유토이미지고딕R', 'BBTreeGR', BBTreeGR;
			}
		</style>
		<script>
			jQuery(document).ready(function($) {
				var searchShow = function() {
					// alert();
					var searchWrap = $('.search-wrap');
					$('.js-search-open').on('click', function(e) {
						e.preventDefault();
						searchWrap.addClass('active');
						setTimeout(function() {
							searchWrap.find('.form-control').focus();
						}, 300);
					});
					$('.js-search-close').on('click', function(e) {
						e.preventDefault();
						searchWrap.removeClass('active');
					})
				};
				searchShow();
			});
			
			//ajax사용할 때 로그인실패시, 이메일 미인증
			//ajax사용안할 때 로그인성공시
			function onclick_btn_login() {

				jQuery.ajax({
					url: '/NAGAGU/login.su',
					type: "post",
					dataType: "json",
					data: {
						MEMBER_EMAIL: $("#MEMBER_EMAIL").val(),
						MEMBER_PASS: $("#MEMBER_PASS").val()
					},
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					
					success: function(retVal) {
						if(retVal.res == "login_success"){
							location.href = './index.ma';
							
						} else if(retVal.res == "loginFail_unconfirm"){
							$('.fail_message').text('이메일 인증을 해주세요.');
							$('.fail_message').css('display', 'block');
						} else if(retVal.res == "login_IdPw_fail"){
							$('.fail_message').text('아이디/비밀번호가 틀렸습니다.');
							$('.fail_message').css('display', 'block');
						}
					},
					error : function() {
						alert("ajax통신 실패!!!");
		    	    }
				});
			}
		</script>
	</head>
	
	<body class="order-body">
		<div class="bg" >
			<div class="container">
				<div class="row">
					<nav class="navbar navbar-expand-lg navbar-dark w-100">
						<!-- Navbar content -->
						<a class="navbar-brand" href="./index.ma">
							<img src="${pageContext.request.contextPath}/resources/images/Main/NAGAGU2.png">
						</a>
						<button class="navbar-toggler" type="button" data-toggle="collapse"
							data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
						</button>
						<div class="search-wrap">
							<a href="#" class="search-close js-search-close"> 
								<i class="fas fa-times"></i>
							</a>
							<form action="./search.my" method="post">
								<input type="text" class="form-control" placeholder="Search keyword and hit enter..." height="600px">
							</form>
						</div>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<div class="row w-50" style="padding-left: 5%;">
								<div class="test">
									<ul class="navbar-nav mr-auto">
										<li class="nav-item">
											<a class="nav-link" href="./community.cm">COMMUNITY
											<span class="sr-only">(current)</span>
										</a></li>
										<li class="nav-item">
											<a class="nav-link" href="./classlist.ac">ACADEMY</a>
										</li>
										<li class="nav-item dropdown">
											<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
											data-toggle="dropdown" aria-haspopup="true"	aria-expanded="false"> STORE </a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdown">
												<a class="dropdown-item" href="./productcategory.pro">수제가구</a> 
												<a class="dropdown-item" href="./estimate.pro">견적문의</a>
												<!-- <div class="dropdown-divider"></div> -->
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="header_util">
							<ul>
								<li>
									<a href="#"	class="icons-btn d-inline-block js-search-open"> 
										<i class="fas fa-search" style="width: 20px; height: 25px;"></i>
									</a>
								</li>
								<li>
									<%
									if(MEMBER_EMAIL == null){
										
									%>
										<img src="${pageContext.request.contextPath}/resources/images/Main/top_icon_mypage.png" alt=""
											data-toggle="modal" data-target="#exampleModalCenter" aria-haspopup="true" aria-expanded="false" />
									<%
									} else{
									%>
									<div class="dropdown">
										<img src="${pageContext.request.contextPath}/resources/images/Main/top_icon_mypage.png" alt=""
											id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" />
										<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
											<a href="./logout.ma" id="logout"><button class="dropdown-item btn btn-primary" type="button">로그아웃</button></a>
											<!-- <button class="dropdown-item" type="button"><a href="./signup.ma">회원가입</a></button> -->
											<button class="dropdown-item" type="button"><a href="./order_detail.my">주문조회</a></button>
											<button class="dropdown-item" type="button"><a href="./mypage_edit.my">내정보수정</a></button>
											<button class="dropdown-item" type="button"><a href="./mypage_like.my">좋아요</a></button>
											<button class="dropdown-item" type="button"><a href="./chatRoom.ch?ES_ORDER_NUM=1">채팅</a></button>
											<button class="dropdown-item" type="button" onclick="window.open('receiveList.nt', 'new', 'scrollbars=yes, resizable=yes, width=600, height=700, left=0, top=0');">쪽지</button>											<button class="dropdown-item" type="button"><a href="./workshop.no">공방관리</a></button>
										</div>
									</div>
									<%} %>
								</li>
								<li>
								<%if(MEMBER_EMAIL == null){ %>
									<img src="${pageContext.request.contextPath}/resources/images/Main/top_icon_cart.png" 
									alt="" data-toggle="modal" data-target="#exampleModalCenter"/>
								<%}else{ %>
									<a href="./mypage_basket.my">
										<img src="${pageContext.request.contextPath}/resources/images/Main/top_icon_cart.png" alt="" />
									</a>
								<%} %>
								</li>
								<li>
								<%if(MEMBER_EMAIL == null){ %>
									<a data-toggle="modal" data-target="#exampleModalCenter" class="btn_mypage">MYPAGE</a>
								<%}else{ %>
									<a href="./mypage.my">MYPAGE</a>
								</li>
								<%} %>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>
		
		<!-- 로그인 모달 -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content mcontent">
		      <div class="modal-header">
		        <h5 class="modal-title mtitle" id="exampleModalCenterTitle">로그인을 해주세요.</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" style="margin: 0 auto; margin-top: 5px;">
		        <form method="post" action="/login.su" class="login_form">
		        	<div class="row"><input type="text" name="MEMBER_EMAIL" id="MEMBER_EMAIL" class="input_css" placeholder="이메일" required="required"></div>
		        	<div class="row"><input type="password" name="MEMBER_PASS" id="MEMBER_PASS" class="input_css" placeholder="비밀번호" required="required"></div>
               		<div class="row"><p class="fail_message"></p></div>
               		<div class="row"><button type="button" id="btn_login" class="btn_login" onclick="onclick_btn_login()">로그인</button></div>
		        </form>
		       	<div class="row justify-content-center" style="margin-top: 20px; margin: 0 auto;">
	             	<a href="./signup.ma" style="text-decoration: none; margin-right: 10px; color: black;" class="sign-in-form-action-entry">회원가입</a>
	             	<a href="" style="text-decoration: none; color: black;" class="sign-in-form-action-entry">비밀번호 찾기</a>
	            </div>
	            <div class="row justify-content-center" style="margin-top:30px; font-size: 11.5px; color: #757575;">
	             	SNS계정으로 간편 로그인
	            </div>
	            <div class="row justify-content-center" style="margin-top: 10px; margin-bottom: 19px;">
	             	<a href="" style="text-decoration: none;">
	             		<img src="${pageContext.request.contextPath}/resources/images/Main/Google_Plus.png" class="sign-in-icon" style="margin-right: 15px;">
	             	</a>
	             	<a href="${kakao_url}" style="text-decoration: none;">	
	             		<img src="${pageContext.request.contextPath}/resources/images/Main/signup_kakaoIcon.png" class="sign-in-kakao-icon">
	             	</a>
	             	<a href="${naver_url}" style="text-decoration: none;">
	             		<img src="${pageContext.request.contextPath}/resources/images/Main/Naver.png" class="sign-in-icon">
	             	</a>
             	</div>
		      </div>
		    </div>
		  </div>
		</div>
		
		<script src="https://kit.fontawesome.com/b74b42490f.js" crossorigin="anonymous"></script>
		<script src="<c:url value="/resources/js/header.js"/>"></script>
	</body>
</html>