<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
	System.out.println("사진 멤버이름="+memberVO.getMEMBER_NAME()); 
	//사진 올린 멤버가 올린 다른 사진리스트 받아오기 위해
	ArrayList<PicsVO> memberPicsList = (ArrayList<PicsVO>) request.getAttribute("memberPicsList");
	ArrayList<PicsVO> memberLikePics = (ArrayList<PicsVO>) request.getAttribute("memberLikePics");
	//System.out.println(memberLikePics.get(0).getPICS_FILE_1());
	System.out.println("니가누른 사진 멤버는="+memberVO.getMEMBER_NUM());
	System.out.println("로그인 멤버는="+LOGIN_MEMBER_NUM);
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
		.othermain{
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
		.othermain{
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
	.othermain img {
		width: 100%;
		max-height: 250px;
		height: auto; 
		margin: 20px 0 !important;  
	}
	
	a, .card a:link, .card a:visited {
		color: white;
		text-decoration: none !important;
	}
	.nickNameTap a, .title a{
		color: black;
	}
	.othermain {
		width: 75%;
		height: 850px; 
	}
	
	.sidebar {
		width: 25%;
		height: 25vh;
	}
	
	.container-mypage{
		margin: 50px 0;
	}
	
	.like-wrap, .pics-wrap{
		border-top: 1px solid black;
		border-color: rgba(0, 0, 0, 0.1) 
	}
	.img-wrap img{
		border-radius:10px; 
	}
</style>

<div class="container container-mypage">
	<div class="wrapper row justify-content-between">
		<div class="col-10 nickNameTap">
			<div>
				<h6>
					<a href="#"><%=memberVO.getMEMBER_NICK()%> 님의 페이지</a>
				</h6>
			</div>
		</div>
		<div class="othermain p-0">
			<div class="pics-wrap">
				<div class="row justify-content-between title mx-0 pt-2 ">
					<div class="col-4">
						<h2>사진</h2>
					</div>
					<div class="col-2 text-right">
						<a href="memberLikePics.cm?uploadOrLike=upload&MEMBER_NUM=<%=memberVO.getMEMBER_NUM()%>">more</a>
					</div> 
				</div>
				<div class="row justify-content-start img-wrap">  
					<c:forEach var="pics" items="${memberPicsList}" varStatus="status">
					    <div class="col-4 img-wrap">
						    <a href="${pageContext.request.contextPath}/community_detail.cm?PICS_NUM=${pics.PICS_NUM}&MEMBER_NUM=${pics.PICS_MEMBER}">
							<img src="/communityupload/image/${pics.PICS_MAIN_IMAGE}"></a>
						</div>   
					</c:forEach> 
		    	</div>
		    </div>
	    	<div class="like-wrap">
				<div class="row justify-content-between title mx-0 pt-2">
					<div class="col-4">
						<h2>LIKE</h2> 
					</div>
					<div class="col-2 text-right">
						<a href="memberLikePics.cm?uploadOrLike=like&MEMBER_NUM=<%=memberVO.getMEMBER_NUM()%>">more</a>
					</div>
				</div>
				<div class="row justify-content-start img-wrap ">
					<c:forEach var="pics" items="${memberLikePics}" varStatus="status">
					    <div class="col-4 img-wrap">
						    <a href="${pageContext.request.contextPath}/community_detail.cm?PICS_NUM=${pics.PICS_NUM}&MEMBER_NUM=${pics.PICS_MEMBER}">
							<img src="/communityupload/image/${pics.PICS_MAIN_IMAGE}"></a>
						</div>   
					</c:forEach> 
				</div>
			</div>
		</div>
		<div class="sidebar">
			<div class="row justify-content-center mb-2">
				<div class="card-group text-center">
					<div class="card text-white bg-secondary" style="width: 10rem;">
					<c:set var="loginMember" value="<%=LOGIN_MEMBER_NUM%>"/>
					<c:set var="objectMember" value="<%=memberVO.getMEMBER_NUM()%>"/>
					<c:choose>
						<c:when test="${loginMember == objectMember}">
							<a href="mypage.my?MEMBER_NUM=<%=memberVO.getMEMBER_NUM()%>">
						</c:when>
					</c:choose>
						<div class="card-header"><%=memberVO.getMEMBER_NICK()%></div>
						<div class="card-body"> 
							<img src=<%=memberVO.getMEMBER_PICTURE()%>>
						</div>
						<a href="followList.cm?MEMBER_NUM=<%=memberVO.getMEMBER_NUM()%>">
							<div class="card-footer bg-transparent ">Follow List</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>