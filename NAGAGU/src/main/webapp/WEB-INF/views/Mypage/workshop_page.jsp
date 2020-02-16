<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.spring.workshop.WorkShopMemberVO"%>
<%@ page import="com.spring.community.PicsVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.spring.member.MemberVO"%>
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
	WorkShopMemberVO wsMemberVO= (WorkShopMemberVO)request.getAttribute("wsMemberDetail");
	System.out.println("멤버이름="+wsMemberVO.getWORKSHOP_NAME()); 
	//사진 올린 멤버가 올린 다른 사진리스트 받아오기 위해
	//ArrayList<PicsVO> memberPicsList = (ArrayList<PicsVO>) request.getAttribute("memberPicsList");
	//ArrayList<PicsVO> memberLikePics = (ArrayList<PicsVO>) request.getAttribute("memberLikePics");
	ArrayList<WorkShopMemberVO> classList = (ArrayList<WorkShopMemberVO>) request.getAttribute("classList");
	//System.out.println(memberLikePics.get(0).getPICS_FILE_1());
	System.out.println("니가누른  멤버는="+wsMemberVO.getWORKSHOP_NUM());
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
		.workshopmain{
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
		.workshopmain{
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
	.workshopmain img {
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
	.workshopmain {
		width: 75%;
		height: 850px; 
	}
	
	.sidebar {
		width: 25%;
		height: 25vh;
	}
	

	
	.like-wrap, .pics-wrap{
		border-top: 1px solid black;
		border-color: rgba(0, 0, 0, 0.1) 
	}

</style>

<div class="container">
	<div class="wrapper row justify-content-between">
		<div class="col-10 nickNameTap">
			<div>
				<h6>
					<a href="#"><%=wsMemberVO.getWORKSHOP_NAME()%> 님의 페이지</a>
				</h6>
			</div> 
		</div>
		<div class="workshopmain p-0">
		<div class="pics-wrap">
		<div class="row justify-content-between title mx-0 pt-2 ">
				<div class="col-4">
					<h2>강의</h2>
				</div>
				<div class="col-2 text-right">
					<a href="memberLikePics.cm?uploadOrLike=upload&MEMBER_NUM=<%=wsMemberVO.getWORKSHOP_NUM()%>">more</a>
				</div> 
			</div>
			<div class="row justify-content-start img-wrap">   
				<c:forEach var="list" items="${classList}" varStatus="status">
				    <div class="col-4 img-wrap">
					    <a href="${pageContext.request.contextPath}/classdetail.ac?CLASS_NUMBER=${list.CLASS_NUMBER}">
						<img src="/communityupload/image/${list.CLASS_IMAGE}"></a>
						<div>${list.CLASS_NAME}</div>
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
					<c:set var="objectMember" value="<%=wsMemberVO.getWORKSHOP_NUM()%>"/>
					<c:choose>
						<c:when test="${loginMember == objectMember}">
							<a href="mypage.my?MEMBER_NUM=<%=wsMemberVO.getWORKSHOP_NUM()%>">
						</c:when>
						<c:otherwise> 
							<a href="#"></a>
						</c:otherwise>
					</c:choose>
						<div class="card-header"><%=wsMemberVO.getWORKSHOP_NAME()%></div>
						<div class="card-body"> 
							<img src=<%=wsMemberVO.getWORKSHOP_PICTURE()%>>
						</div>
						<a href="#">
							<div class="card-footer bg-transparent "><%=wsMemberVO.getWORKSHOP_INTRO()%></div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>