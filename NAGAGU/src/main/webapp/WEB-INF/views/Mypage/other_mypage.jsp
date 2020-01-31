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
		loginmemberVO = (MemberVO)request.getAttribute("memberDetailbyEmail");	
		LOGIN_MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
	}
	
	//사진 올린 멤버 디테일 받아오기 위해
	MemberVO memberVO= (MemberVO)request.getAttribute("memberDetail");
	//사진 올린 멤버가 올린 다른 사진리스트 받아오기 위해
	ArrayList<PicsVO> memberPicsList = (ArrayList<PicsVO>) request.getAttribute("memberPicsList");
	
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
	.img-wrap {
		height: 100px;
	}
	.card-group {
		width: 30%;
		font-size: 0.7rem;
	}
	.far {
		font-size: 1rem;
	}
	.card-header, .card-body, .card-footer {
		padding: 1px;
	}
}

@media ( min-width : 576px) {
	.img-wrap {
		height: 110px;
	}
	.card-group {
		width: 40%;
	}
	.far {
		font-size: 2rem;
	}
	.card-header, .card-body, .card-footer {
		padding: 3px;
	}
}

@media ( min-width : 768px) {
	.img-wrap {
		height: 150px;
	}
	.card-group {
		font-size: 1.2rem;
	}
	.card-body {
		font-size: 4rem !important;
	}
	.card-header, .card-body, .card-footer {
		padding: 5px;
	}
}

@media ( min-width : 992px) {
	.img-wrap {
		height: 190px;
	}
	.card-group {
		width: 60%;
	}
	.far {
		font-size: 4rem;
	}
	.card-header, .card-body, .card-footer {
		padding-top: 15px;
		padding-bottom: 15px;
	}
}

@media ( min-width : 1200px) {
	.img-wrap {
		height: 230px;
	}
	.far {
		font-size: 5rem !important;
	}
}
/* card-size end */
img {
	width: 100%;
	max-height: 300px;
	height: 100%;
	padding-bottom: 20px;
}

a, .card a:link, .card a:visited {
	color: white;
	text-decoration: none;
}

.title {
	border-bottom: 1px solid black;
	border-top: 1px solid black;
	border-color: rgba(0, 0, 0, 0.1)
}

.main {
	border-right: 1px solid grey;
	border-left: 1px solid grey;
	border-bottom: 1px solid grey;
	border-color: rgba(0, 0, 0, 0.2);
	width: 75%;
	height: auto;
}

.sidebar {
	width: 25%;
	height: 25vh;
}

.sidebar {
	position: -webkit-sticky;
	position: sticky;
	top: 0;
}

.container-mypage {
	margin: 50px 0;
	min-height: 850px;
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

</style>
	<body class="order-body">
		<div class="container container-mypage">
			<div class="wrapper row justify-content-between">
				<div class="main p-0 pb-5">
					<div class="row justify-content-between title mx-0 pt-2">
						<div class="col-4">
							<h2>사진 27</h2>
						</div>
						<div class="col-2 text-right">
							<a href="other_mypage_more.my">more</a>
						</div> 
					</div>
					<div class="row justify-content-between ">
					
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
	
					<div class="row justify-content-between title mx-0 pt-2 my-3">
						<div class="col-4">
							<h2>LIKE 100</h2>
						</div>
						<div class="col-2 text-right">
							<a href="">more</a>
						</div>
					</div>
					<div class="row justify-content-between img-wrap ">
						<div class="col-4 img-wrap">
							<a href=""><img
								src="https://images.unsplash.com/photo-1537182534312-f945134cce34?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"
								alt=""></a>
						</div>
						<div class="col-4 img-wrap">
							<a href=""><img
								src="https://images.unsplash.com/photo-1537182534312-f945134cce34?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"
								alt=""></a>
						</div>
						<div class="col-4 img-wrap">
							<a href=""><img
								src="https://images.unsplash.com/photo-1537182534312-f945134cce34?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"
								alt=""></a>
						</div>
						<div class="col-4 img-wrap">
							<a href=""><img
								src="https://images.unsplash.com/photo-1537182534312-f945134cce34?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"
								alt=""></a>
						</div>
						<div class="col-4 img-wrap">
							<a href=""><img
								src="https://images.unsplash.com/photo-1537182534312-f945134cce34?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"
								alt=""></a>
						</div>
						<div class="col-4 img-wrap">
							<a href=""><img
								src="https://images.unsplash.com/photo-1537182534312-f945134cce34?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"
								alt=""></a>
						</div>
						
					</div>
	
	
				</div>
				<div class="sidebar">
					<div class="row justify-content-center mb-2">
						<div class="card-group text-center ">
							<div class="card text-white bg-secondary" style="width:;">
								<a href="#" class="href">
									<div class="card-header">MY</div>
									<div class="card-body">
										<i class="far fa-user-circle"></i>
									</div>
									<div class="card-footer bg-transparent ">Follow</div>
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