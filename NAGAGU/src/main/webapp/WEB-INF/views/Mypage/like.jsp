<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<!-- fontawesome kit -->
		<script src="https://kit.fontawesome.com/97dbc99ea1.js"	crossorigin="anonymous"></script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Mypage/mypage_like_.css">
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
				.container-mypage{
					margin-top: 50px ;
					margin-bottom: 100px ;
					min-height: 750px;
				}				
				img {
					width: 100%;
					height: auto;
				}
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
				
				.nav-item a {
					color: black;
				}
				
				.tab-content .tab-pane.active {
					display: flex;
				}
				
				li>.active {
					background-color: #1b1b27 !important;
					color: white !important;
				}
				.tab-pane .col-4{
					padding-bottom: 50px;
				}
								
		</style>
	</head>
	
	<body class="order-body">
		<div class="container container-mypage" role="main">
	
			<div class="row justify-content-center ">
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
						<a href="mypage_like.my" class="href">
							<div class="card-header">Like</div>
							<div class="card-body">
								<i class="fab fa-gratipay fa-4x"></i>
							</div>
							<div class="card-footer bg-transparent ">좋아요 글</div>
						</a>
					</div>
				</div>
			</div>
	
	
			<div class="row">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-selected="true">PIC</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">STORE</a></li>
					<li class="nav-item"><a class="nav-link" id="contact-tab"
						data-toggle="tab" href="#contact" role="tab"
						aria-controls="contact" aria-selected="false">CLASS</a></li>
				</ul>
	
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active row" id="home"
						role="tabpanel" aria-labelledby="home-tab">
						<div class="col-4">
							<img
								src="https://images.unsplash.com/photo-1552584010-ca8bbbd5bd18?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ"
								alt="">
						</div>
						<div class="col-4">
							<img
								src="https://images.unsplash.com/photo-1552584010-ca8bbbd5bd18?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ"
								alt="">
						</div>
						<div class="col-4">
							<img
								src="https://images.unsplash.com/photo-1552584010-ca8bbbd5bd18?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ"
								alt="">
						</div>
						<div class="col-4">
							<img
								src="https://images.unsplash.com/photo-1552584010-ca8bbbd5bd18?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ"
								alt="">
						</div>
						<div class="col-4">
							<img
								src="https://images.unsplash.com/photo-1552584010-ca8bbbd5bd18?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ"
								alt="">
						</div>
	
					</div>
					<div class="tab-pane fade row" id="profile" role="tabpanel"
						aria-labelledby="profile-tab">
						<div class="col-4">
							<img
								src="https://images.unsplash.com/photo-1552584010-ca8bbbd5bd18?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ"
								alt="">
						</div>
						<div class="col-4">
							<img
								src="https://images.unsplash.com/photo-1552584010-ca8bbbd5bd18?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ"
								alt="">
						</div>
						<div class="col-4">
							<img
								src="https://images.unsplash.com/photo-1552584010-ca8bbbd5bd18?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ"
								alt="">
						</div>
						
					</div>
					<div class="tab-pane fade row" id="contact" role="tabpanel"
						aria-labelledby="contact-tab">
						<div class="col-4">
							<img
								src="https://images.unsplash.com/photo-1552584010-ca8bbbd5bd18?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ"
								alt="">
						</div>
						<div class="col-4">
							<img
								src="https://images.unsplash.com/photo-1552584010-ca8bbbd5bd18?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ"
								alt="">
						</div>
						<div class="col-4">
							<img
								src="https://images.unsplash.com/photo-1552584010-ca8bbbd5bd18?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ"
								alt="">
						</div>
					</div>
				</div>
			</div>
	
		</div>
	
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
			integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
			integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
			integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
			crossorigin="anonymous"></script>
	</body>
</html>