<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@page import="com.spring.community.FollowVO"%>
<%@page import="com.spring.community.PicsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.member.MemberVO"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	
	//로그인 정보 확인(멤버)
	int LOGIN_MEMBER_NUM = 0;
	MemberVO loginmemberVO = null;
	if(session.getAttribute("MEMBER_NUM")!=null){
		//loginmemberVO = (MemberVO)request.getAttribute("memberDetail");	
		LOGIN_MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
	}
	//사진 올린 멤버 디테일 받아오기 위해
	MemberVO memberVO= (MemberVO)request.getAttribute("memberDetail");
	
	ArrayList<MemberVO> followMembers = (ArrayList<MemberVO>)request.getAttribute("followMembers");
	ArrayList<MemberVO> followedMembers = (ArrayList<MemberVO>)request.getAttribute("followedMembers");
%>

<style>
	/* card size */
	@media ( max-width : 576px) {
		.sidebar{
			position: absolute ;
			top: 180px !important;
			left: 40%; 
		}
		.nickNameTap{
			display: none !important;  
		}
		.card-group { 
			font-size: 1rem; 
		} 
		.card-header, .card-body, .card-footer {
			padding: 3px !important; 
		}
		.card-group img{
			width: 50%;
			height: auto; 
			border-radius:100%;		 
		} 
		.followmain{
			margin-top: 150px;
			width: 100% !important;
		}
	}
	
	@media ( max-width : 768px) {
		.sidebar{
			position: absolute ;
			top: 130px ;
			left: 40%; 
		}
		.nickNameTap{
			display: none !important;  
		}
		.card-group {
			font-size: 1rem; 
		} 
		.card-header, .card-body, .card-footer {
			padding: 3px !important; 
		}
		.card-group img{
			width: 50%;
			height: auto; 
			border-radius:100%;		 
		} 
		.followmain{
			margin-top: 150px;
			width: 100% !important;
		}
	}
	
	@media ( min-width : 768px) {
		.sidebar {
			position: -webkit-sticky;
			position: sticky;
			top: 0;
		}
		.card-group {
			font-size: 1rem; 
		} 
		.card-header, .card-body, .card-footer {
			padding: 3px !important;
		}
		.card-group img{
			width: 50%;
			height: auto; 
			border-radius:100%;		 
		}
	}
	
	@media ( min-width : 992px) {
		.card-group {
			width: 180px !important;
			font-size: 1.2rem;
		}
		.card-header, .card-body, .card-footer {
			padding: 10px !important; 
		}
		.card-group img{
			width: 60%;
			height: auto; 
			border-radius:100%;		 
		}
	}
	
	@media ( min-width : 1200px) {
		.card-group{
			width: 200px !important;  
			font-size: 1.5rem;
		}
		.card-group img{
			width: 70%;
			height: auto; 
			border-radius:100%;		 
		}
	}
	/* card-size end */
	.followmain img {
		width: 100%;
		max-height: 300px;
		height: auto; 
		padding: 20px 0 !important;  
	}
	
	a, .card a:link, .card a:visited {
		color: white;
		text-decoration: none !important;
	}
	.nickNameTap a, .title a{
		color: black;
	}
	.followmain {
		width: 75%;
		height: 850px; 
	}
	.sidebar {
		width: 25%;
		height: 25vh;
	}
	
	.img_wrap img{
		border-radius: 100%;
	}
	.img_wrap{
		font-size:1.5rem; 
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
	.like-wrap, .pics-wrap{
		border-top: 1px solid black;
		border-color: rgba(0, 0, 0, 0.1) 
	}
</style>

<div class="container" style="margin-top: 30px; margin-bottom: 30px;">
	<div class="wrapper row justify-content-between">
		<div class="col-10 nickNameTap">
			<div>
				<h6>
					<a href="memberLikePics.cm?MEMBER_NUM=<%=memberVO.getMEMBER_NUM()%>"><%=memberVO.getMEMBER_NICK()%> 님의 페이지</a>
				</h6>
			</div>
		</div>
		<div class="followmain p-0">
			<div class="pics-wrap">
				<div class="row justify-content-around title mx-0 pt-2 ">
					<div class="col-4 text-center">
						<h2>Following List</h2>
					</div>
					<div class="col-4 text-center">
						<h2>Followed List</h2>
					</div>
				</div>
				
				<div class="row justify-content-center title pt-2 img_wrap">
					<div class="col-6 text-center">
						<c:forEach var="list" items="${followMembers}" varStatus="status">
							<div>
								<a href="memberLikePics.cm?MEMBER_NUM=${list.MEMBER_NUM}">
									<img src="${list.MEMBER_PICTURE}"
									style="width: 50px; height: auto;">&nbsp;&nbsp;&nbsp;${list.MEMBER_NICK}
								</a>
							</div> 
						</c:forEach> 
					</div>
					<div class="col-6 text-center">
						<c:forEach var="list" items="${followedMembers}"
							varStatus="status">
							<div>
								<a href="memberLikePics.cm?MEMBER_NUM=${list.MEMBER_NUM}">
									<img src="${list.MEMBER_PICTURE}"
									style="width: 50px; height: auto;">&nbsp;&nbsp;&nbsp;${list.MEMBER_NICK}
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="sidebar">
			<div class="row justify-content-center mb-2">
				<div class="card-group text-center">
					<div class="card text-white bg-secondary" style="width: 10rem;">
						<div class="card-header"><%=memberVO.getMEMBER_NICK()%></div>
						<div class="card-body">
							<img src=<%=memberVO.getMEMBER_PICTURE()%>>
						</div>
						<div class="card-footer bg-transparent ">Follow List</div> 
					</div>
				</div>
			</div>
		</div>
	</div>
</div>