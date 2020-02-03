<%@page import="com.spring.community.PicsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8"> 
<meta name="viewport"content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"	crossorigin="anonymous">
<!-- fontawesome kit -->
<script src="https://kit.fontawesome.com/97dbc99ea1.js"	crossorigin="anonymous"></script>
<title>Mypage</title>
</head>
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
	.main{
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
	.main{
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
.main img {
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
.main {
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
	<body class="order-body">
		<div class="container container-mypage">
			<div class="wrapper row justify-content-between">
				<div class="col-10 nickNameTap">
					<div>
						<h6>
							<a href="#"><%=memberVO.getMEMBER_NICK()%> 님의 페이지</a>
						</h6>
					</div>
				</div>
				<div class="main p-0">
				<div class="pics-wrap">
				<div class="row justify-content-between title mx-0 pt-2 ">
						<div class="col-4">
							<h2>사진 27</h2>
						</div>
						<div class="col-2 text-right">
							<a href="memberLikePics.cm?uploadOrLike=upload&MEMBER_NUM=<%=memberVO.getMEMBER_NUM()%>">more</a>
						</div> 
					</div>
					<div class="row justify-content-start img-wrap">  
						<c:forEach var="pics" items="${memberPicsList}" varStatus="status">
						    <div class="col-4 img-wrap">
							    <a href="${pageContext.request.contextPath}/community_detail.cm?PICS_NUM=${pics.PICS_NUM}&MEMBER_NUM=${pics.PICS_MEMBER}">
								<img src="/communityupload/image/${pics.PICS_FILE_1}"></a>
							</div>   
						</c:forEach> 
<%-- 					<%
						for (int i = 0; i < memberPicsList.size(); i++) {
							PicsVO memberPicsVO = memberPicsList.get(i);
							System.out.println(memberPicsVO.getPICS_FILE_1());
					%>
					<div class="col-6">
						<a href="${pageContext.request.contextPath}/community_detail.cm?PICS_NUM=<%=memberPicsVO.getPICS_NUM()%>&MEMBER_NUM=<%=memberVO.getMEMBER_NUM()%>">
							<img src="/communityupload/image/<%=memberPicsVO.getPICS_FILE_1()%>" class="img-responsive img-thumbnail"/>
						</a>
					</div>
					<%
						}
					%> --%>
			    	</div>
			    	</div>
			    	<div class="like-wrap">
					<div class="row justify-content-between title mx-0 pt-2">
						<div class="col-4">
							<h2>LIKE 100</h2>
						</div>
						<div class="col-2 text-right">
							<a href="memberLikePics.cm?uploadOrLike=like&MEMBER_NUM=<%=memberVO.getMEMBER_NUM()%>">more</a>
						</div>
					</div>
					<div class="row justify-content-start img-wrap ">
						<c:forEach var="pics" items="${memberLikePics}" varStatus="status">
						    <div class="col-4 img-wrap">
							    <a href="${pageContext.request.contextPath}/community_detail.cm?PICS_NUM=${pics.PICS_NUM}&MEMBER_NUM=${pics.PICS_MEMBER}">
								<img src="/communityupload/image/${pics.PICS_FILE_1}"></a>
							</div>   
						</c:forEach> 
					</div>
					</div>
	
	
				</div>
			<div class="sidebar">
				<div class="row justify-content-center mb-2">
					<div class="card-group text-center">
						<div class="card text-white bg-secondary" style="width: 10rem;">
							<a href="#" class="href">
								<div class="card-header"><%=memberVO.getMEMBER_NICK()%></div>
								<div class="card-body">
									<img src=<%=memberVO.getMEMBER_PICTURE()%>>
								</div>
							</a>
							<a href="followList.cm?MEMBER_NUM=<%=memberVO.getMEMBER_NUM()%>"><div class="card-footer bg-transparent ">Follow</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	
	
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>