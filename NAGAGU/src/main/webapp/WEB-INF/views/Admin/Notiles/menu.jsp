<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.workshop.*" %>
<%

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- Bootstrap -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<style>
			/* 사이드바 래퍼 스타일 */
			#page-wrapper {
			  padding-left: 250px;
			}
			
			#sidebar-wrapper {
			  position: fixed;
			  width: 250px;
			  height: 100%;
			  margin-left: -250px;
			  background: #1B1B27;
			  overflow-x: hidden;
			  overflow-y: auto;
			  border-right: 4px solid #ef900e;
			}
			
			#page-content-wrapper {
			  width: 100%;
			  padding: 20px;
			}
			/* 사이드바 스타일 */
			
			.sidebar-nav {
			  width: 250px;
			  margin: 0;
			  padding: 0;
			  list-style: none;
			}
			
			.sidebar-nav li {
			  text-indent: 1.5em;
			  line-height: 2.8em;
			  margin-left: 20px;
			}
			
			.sidebar-nav li a {
			  display: block;
			  text-decoration: none;
			  color: #999;
			}
			
			.sidebar-nav li a:hover {
			  color: #fff;
			  background: rgba(255, 255, 255, 0.2);
			}
			
			.sidebar-nav > .sidebar-brand {
			  font-size: 1.3em;
			  line-height: 3em;
			}
		
			.main ul {
				list-style: none;
				padding-left: 0px;
				font-size: 0.9em;
				color: #999;
			}
		</style>
	</head>
	<body>
		<div id="page-wrapper">
			<!-- 사이드바 -->
			<div id="sidebar-wrapper">
				<nav>
					<ul class="sidebar-nav">
						<li class="sidebar-brand" style="margin: 15px 0;">
							<a href="./index.ma">
								<img src="${pageContext.request.contextPath}/resources/images/Main/NAGAGU2.png">
							</a>
						</li>
						<li class="main text-white">
							회원관리
							<ul>
								<li>전체회원 관리</li>
								<li>공방회원승인</li>
							</ul>
						</li>
						<li class="main text-white">
							커뮤니티관리
							<ul>
								<li>블랙리스트 관리</li>
								<li>기다려봐</li>
							</ul>
						</li>
						<li class="main text-white">
							아카데미관리
							<ul>
								<li>강의관리</li>
								<li>기다려봐</li>
							</ul>
						</li>
						<li class="main text-white">
							상품관리
							<ul>
								<li>블랙리스트 관리</li>
								<li>기다려봐</li>
							</ul>
						</li>
						<li class="main text-white">
							견적관리
							<ul>
								<li>블랙리스트 관리</li>
								<li>기다려봐</li>
							</ul>
						</li>
						<li class="main text-white">
							댓글관리
						</li>
					</ul>
				</nav>
			</div>
			<!-- /사이드바 -->
			
			<!-- 본문 -->
			<div id="page-content-wrapper">
				<div class="container-fluid">
					<h1>간단한 사이드바</h1>
					
				</div>
			</div>
			<!-- /본문 -->
		</div>
		
		<!-- jQuery & Bootstrap -->
		<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		<script>
			/* 사이드 바 스크립트 */
			$(function(){
	            $("nav").children("ul").mouseenter(function(){ // 마우스 들어갈때
	                $(".main").find("li").slideDown(300,function(){ // li가 나타남
	                    $(this).mouseover(function(){
	                        $(this).css("font-weight","900");
	                    });
	                    $(this).mouseleave(function(){
	                        $(this).css("font-weight","500");
	                    });
	                });
	            });
	            $("nav").children("ul").mouseleave(function(){ // 마우스 나갈때
	                $(".main").find("li").slideUp(300,function(){ // li가 사라짐
	                    $(this).stop(false,false).slideUp(300); 
	                    // 사라지고 난뒤 애니매이션이 남아있을수도 있기때문에
	                    //stop을 사용하여 남은 애니매이션 종료하기.
	                });
	            });
	        });
		</script>
	</body>
</html>