<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.workshop.*" %>
<%
	List<WorkShopMemberVO> wmemberList = (ArrayList<WorkShopMemberVO>)request.getAttribute("wmemberList");

	int listcount = ((Integer)request.getAttribute("listcount")).intValue(); // 글 개수
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int startrow = ((Integer)request.getAttribute("startrow")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
	
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
			
			.main ul li {
				display: none;
			}
			
			.tableCSS thead {
				font-size: 1.1rem;
			}
			
			.tableCSS tbody {
				font-size: 0.9rem;
			}
			
			thead {
				background-color : #1B1B27 !important;
				color : white !important;
			}
			
			tbody td a {
				color : #1B1B27;
			}
			
			tbody td a:hover {
				color :  rgba(239, 144, 14);
			}
			
			tr.pageing:hover {
				background-color: transparent !important;
			}
			
			.page-link {
				color: rgba(239, 144, 14);
			}
			
			.page-item.disabled .page-link {
				color: #1B1B27 !important;
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
							<a href="./index.ad">
								<img src="${pageContext.request.contextPath}/resources/images/Main/NAGAGU2.png">
							</a>
						</li>
						<li class="main text-white">
							회원관리
							<ul>
								<li>일반회원관리</li>
								<li><a href="./WMemberList.ad">공방회원관리</a></li>
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
					<h1 class="text-center">공방회원관리</h1>
					<br><br>
					
					<div class="input-group justify-content-end mb-3" style="width: 300px !important;">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-default"><i class="fas fa-search"></i></span>
						</div>
						<input type="text" class="form-control" aria-describedby="inputGroup-sizing-default" placeholder="공방명을 입력하세요" id="keyword">
					</div>
					<br><br>
					<table class="table table-hover tableCSS" id="user-table"></table>
					
					<nav aria-label="Page navigation example">
						<ul class="pagination pagination-lg justify-content-center">
							<%
								if(nowpage <= 1) { 
							%>
									<li class="page-item disabled">
										<a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a>
									</li>
							<%	
								} else { 
							%>
									<li class="page-item">
										<a class="page-link" href="./WMemberList.ad?page=<%=nowpage-1%>">이전 </a>
									</li>
							<% 
								} 
							%>
							
							<%
								for(int a = startpage; a <= endpage; a++) {
									if(a == nowpage) { 
							%>
										<li class="page-item disabled">
											<a class="page-link" href="#" tabindex="-1" aria-disabled="true"><%=a%></a>
										</li> <!-- 현재 보고있는 페이지에는 링크를 걸지 않겠다. -->
							<% 	
									} else { 
							%>
										<li class="page-item">
											<a class="page-link" href="./WMemberList.ad?page=<%=a%>"><%=a%></a>
										</li>
							<% 	
									}
								}
							%>	
							
							<%
								if(nowpage >= maxpage) { 
							%> 
									<li class="page-item disabled">
										<a class="page-link" href="#" tabindex="-1" aria-disabled="true">다음</a>
									</li> <!-- 현재 보는 페이지가 마지막 페이지 이면 -->
							<%
								} else { 
							%>
									<li class="page-item">
										<a class="page-link" href="./WMemberList.ad?page=<%=nowpage+1%>">다음</a>
									</li>
							<%
								} 
							%>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /본문 -->
		</div>
		
		<!-- jQuery & Bootstrap -->
		<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		<!-- Font Awesome -->
		<script src="https://kit.fontawesome.com/74760b5c81.js" crossorigin="anonymous"></script>
		<script>
			/* 사이드 바 스크립트 */
			$(function(){
	            $(".sidebar-nav").mouseenter(function(){ // 마우스 들어갈때
	                $(".main").find("li").stop().slideDown(300,function(){ // li가 나타남
	                    $(this).mouseover(function(){
	                        $(this).css("font-weight","800");
	                        
	                    });
	                });
	            });
	            $(".sidebar-nav").mouseleave(function(){ // 마우스 나갈때
	                $(".main").find("li").stop().slideUp(300,function(){ // li가 사라짐
	                    $(this).mouseleave(function(){
	                        $(this).css("font-weight","500");
	                    });
	                });
	            });
	        });
			
			$(document).ready(function() {
				// table 내부 내용 모두 제거(초기화)
				$('#user-table').empty();
				var MEMBER_NUM = "MEMBER_NUM=" + <%=%>;
				$.ajax({
					url: '/NAGAGU/MemberList.ad',
					type: 'POST',
					data : MEMBER_NUM,
					dataType : "json", //서버에서 보내줄 데이터 타입
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success:function(data) {
						var title = '';
						title += '<thead class="text-center">';
						title += '<tr>';
						title += '<th scope="col">번호</th>';
						title += '<th scope="col">이메일</th>';
						title += '<th scope="col">이름</th>';
						title += '<th scope="col">닉네임</th>';
						title += '<th scope="col">핸드폰</th>';
						title += '<th scope="col">주소</th>';
						title += '<th scope="col">상세주소</th>';
						title += '<th scope="col">상태</th>';
						title += '</tr>';
						title += '</thead>';
						$('#user-table').append(title);
					}
				});
			})
			
			$(document).ready(function() {
				$("#keyword").keyup(function() {
					var k = $(this).val();
					$("#user-table > tbody > tr").hide();
					var temp = $("#user-table > tbody > tr > td:nth-child(10n+3):contains('" + k + "')");
					
					$(temp).parent().show();					
				})
			})
		</script>
	</body>
</html>