<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
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
	<!-- fontawesome kit -->
	<script src="https://kit.fontawesome.com/97dbc99ea1.js"
		crossorigin="anonymous"></script>
	<!-- <link rel="stylesheet" href="mypage_class.css"> -->
	
		<title>Mypage</title>
	</head>
	<style>
	.tab-pane a, .tab-pane a:link, .tab-pane a:hover {
		text-decoration: none;
		color: black;
	}
	.nav-item a {
		color: black;
	}
	.tab-content .tab-pane.active {
		display: flex;
	}
	
	.nav-item a:hover, .nav-item .nav-link.active {
		background-color: #1b1b27 !important;
		color: white !important;
	}		
	/* kt */
	a, .card a:link, .card a:visited {
		color: white;
		text-decoration: none;
	}	
	.card {
		color: white;
	}
	
	.container-mypage {
		margin-top: 50px;
		margin-bottom: 100px;
		min-height: 730px; 
	}
	
	img {
		width: 100%;
	}
	
	.tab-content img {
		height: auto;
	}
	
	.card {
		background-color: #1b1b27 !important;
		margin: 15px 15px 15px 15px;
		width: 10rem;
	}
	
	.my {
		background-color: #ef900e !important;
	}
	
	.reply-content {
		width: 100%;
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
	<div class="container container-mypage" role="main">
		<!-- top card start -->
		<div class="row justify-content-center">
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
					<div class="card-header">REVIEW</div>
					<div class="card-body">
						<i class="fas fa-keyboard fa-4x"></i>
					</div>
					<div class="card-footer bg-transparent ">가구후기</div>
				</div>
			</div>
		</div>
		<!-- top card end -->

		<section class="row">
			<!-- nav tab start -->
			<ul class="nav nav-tabs mb-2" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link active" id="store-review-tab"
					data-toggle="tab" href="#store-review" role="tab"
					aria-controls="contact" aria-selected="false"><b>수제가구 후기</b></a></li>
			</ul>
			<!-- nav tab end -->
			<!-- tab-pane start-->

			<!-- 수제가구 후기 start-->
			<div class="tab-pane fade show row active" id="store-review"
				role="tabpanel" aria-labelledby="home-tab">
				<div class="col-4 mb-2">
					<img
						src="https://images.unsplash.com/photo-1552584010-ca8bbbd5bd18?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjYxOTE2fQ"
						alt="">
				</div>
				<div class="col-8 mb-2">
					<a href="#"><h1>수제 가구 후기...</h1> <text name="" id="" cols="80"
							rows="8">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Numquam labore minus consequatur quis maxime.
						Aliquam cupiditate saepe natus modi harum, ipsum suscipit dicta
						consectetur eos, consequatur rerum accusantium reprehenderit
						fugiat. </text></a>
				</div>
			</div>
			<!-- 수제가구 후기 end-->

		</section>
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