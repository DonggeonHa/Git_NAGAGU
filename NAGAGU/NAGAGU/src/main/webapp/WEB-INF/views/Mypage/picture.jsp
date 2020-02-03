<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/mypage_pic_.css"> --%>
		
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
					margin-top: 50px;
				}
				.container-pic{
					margin-bottom: 100px;
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
				
				.grid {
					display: grid;
					background: black;
					min-height: 400px;
					grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
					grid-auto-rows: 20px;
					grid-gap: 5px;
				}
				
				.item {
					overflow: hidden;
					position: relative;
				}
				
				.item>img {
					width: 100%;
					position: absolute;
					left: 50%;
					top: 50%;
					transform: translate(-50%, -50%);
				}
				.nav-item a {
					color: black;
				}
				.tab-content .tab-pane.active {
					display: flex;
				}
				
				.nav-item .nav-link.active {
					background-color: rgba(0, 0, 0, 0.05) !important;
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
						<div class="card-header">COMMUNITY</div>
						<div class="card-body">
							<i class="fas fa-images fa-4x"></i>	
						</div>					
					<div class="card-footer bg-transparent ">사진</div>					
				</div>
			</div>				
		</div>
		</div>
		<div class="container container-pic">
			<div class="row mb-2">
				<div class="col-4"></div>
				<div class="col-8 d-flex justify-content-end">
					<button type="button" class="btn btn-outline-secondary">새 글 쓰기</button>
				</div>
			</div>
			<div class="grid">
				<div class="item">
					<img src="https://images.unsplash.com/photo-1552633832-4f5a1b110980?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ">
				</div>
				<div class="item">
					<img src="https://images.unsplash.com/photo-1552584010-ca8bbbd5bd18?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ">
				</div>
				<div class="item">
					<img src="https://images.unsplash.com/photo-1552633832-4f5a1b110980?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ">
				</div>
				<div class="item">
					<img src="https://images.unsplash.com/photo-1552633832-4f5a1b110980?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ">
				</div>
				<div class="item">
					<img src="https://images.unsplash.com/photo-1552633832-4f5a1b110980?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ">
				</div>
				<div class="item">
					<img src="https://images.unsplash.com/photo-1552584010-ca8bbbd5bd18?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ">
				</div>
				<div class="item">
					<img src="https://images.unsplash.com/photo-1552644867-3c98a63f38eb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ">
				</div>
				<div class="item">
					<img src="https://images.unsplash.com/photo-1552633832-4f5a1b110980?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ">
				</div>
				<div class="item">
					<img src="https://images.unsplash.com/photo-1552633832-4f5a1b110980?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ">
				</div>
				<div class="item">
					<img src="https://images.unsplash.com/photo-1552644867-3c98a63f38eb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ">
				</div>
				<div class="item">
					<img src="https://images.unsplash.com/photo-1552633832-4f5a1b110980?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ">
				</div>
				<div class="item">
					<img src="https://images.unsplash.com/photo-1552633832-4f5a1b110980?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ">
				</div>
				<div class="item">
					<img src="https://images.unsplash.com/photo-1552584010-ca8bbbd5bd18?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ">
				</div>
				<div class="item">
					<img src="https://images.unsplash.com/photo-1552584010-ca8bbbd5bd18?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ">
				</div>
			</div>
		</div>
		<!-- Optional JavaScript -->
		<script src="<c:url value="/resources/js/Mypage/mypage_pic.js"/>"></script>
		<!-- fontawesome kit -->
		<script src="https://kit.fontawesome.com/97dbc99ea1.js"	crossorigin="anonymous"></script>
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>