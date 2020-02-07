<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<style type="text/css">
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
}

.container-mypage {
	margin-top: 100px;
	margin-bottom: 100px;
}

.container-mypage a, .container-mypage  a:link, .container-mypage  a:hover
	{
	text-decoration: none;
	color: white !important;
}

.card-hover:hover {
	transition: 1s;
	transform: scale(1.2);
	z-index: 1;
	box-shadow: 10px 15px 7px 0px #333333;
}

.card {
	background-color: #1b1b27 !important;
	margin: 15px 15px 15px 15px;
	color: white;
}

.my {
	background-color: #ef900e !important;
}

@media screen and (min-width: 600px) {
	.card {
		width: 10rem !important;
	}
}

@media screen and (max-width: 600px) {
	.card {
		width: 7rem;
		font-size: 0.5rem;
		margin: 5px 5px 5px 5px;
	}
}
</style>
</head>

<body class="order-body">
	<div class="container container-mypage" role="main">
		<div class="row justify-content-center ">
			<div class="card-group text-center d-inline-flex">
				<div class="card card-hover">
					<a href="mypage_like.my" class="href">
						<div class="card-header">Like</div>
						<div class="card-body">
							<i class="fab fa-gratipay fa-4x"></i>
						</div>
					</a>
				</div>

				<div class="card card-hover">
					<a href="mypage_pic.my" class="href">
						<div class="card-header">COMMUNITY</div>
						<div class="card-body">
							<i class="fas fa-images fa-4x"></i>
						</div>
					</a>
				</div>

				<div class=" card card-hover">
					<a href="mypage_edit.my" class="href">
						<div class="card-header">EDIT</div>
						<div class="card-body">
							<i class="fas fa-user-edit fa-4x"></i>
						</div>
					</a>
				</div>
			</div>
		</div>

		<div class="row justify-content-center">
			<div class="card-group text-center d-inline-flex">
				<div class="card card-hover">
					<a href="mypage_class.my" class="href">
						<div class="card-header">CLASS</div>
						<div class="card-body">
							<i class="fas fa-school fa-4x"></i>
						</div>
					</a>
				</div>

				<div class="card my">
					<div class="card-header">MY</div>
					<div class="card-body">
						<i class="far fa-user-circle fa-4x"></i>
					</div>
				</div>
				<div class="card card-hover">
					<a href="order_list.my" class="href">
						<div class="card-header">ORDER</div>
						<div class="card-body">
							<i class="fas fa-truck-pickup fa-4x"></i>
						</div>
					</a>
				</div>
			</div>
		</div>

		<div class="row justify-content-center">
			<div class="card-group text-center d-inline-flex">
				<div class="card card-hover ">
					<a href="mypage_reply.my" class="href">
						<div class="card-header">REPLY</div>
						<div class="card-body">
							<i class="fab fa-replyd fa-4x"></i>
						</div>
					</a>
				</div>
				<div class="card card-hover ">
					<a href="mypage_review.my" class="href">
						<div class="card-header">REVIEW</div>
						<div class="card-body">
							<i class="fas fa-keyboard fa-4x"></i>
						</div>
					</a>
				</div>
				<div class="card card-hover ">
					<a href="mypage_estimate.my" class="href">
						<div class="card-header">견적</div>
						<div class="card-body">
							<i class="fas fa-keyboard fa-4x"></i>
						</div>
					</a>
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
	<!-- fontawesome kit -->
	<script src="https://kit.fontawesome.com/97dbc99ea1.js"
		crossorigin="anonymous"></script>

</body>
</html>