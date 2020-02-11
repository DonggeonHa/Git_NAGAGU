<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<title>NAGAGU</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<script src="https://kit.fontawesome.com/97dbc99ea1.js" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		
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
			section.scene {
				
				height: 100vh;
				overflow: hidden;
				background-attachment: fixed;
				background-size: cover;
				font-weight: 10;
				color: black;
			}
			
			.scene.one {
				background-image:
					url("${pageContext.request.contextPath}/resources/images/Main/scene3.jpg");
			}
			
			.scene.two {
				background-image:
					url("https://images.unsplash.com/photo-1520032484190-e5ef81d87978?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1955&q=80"); 
			}
			
			.scene.three {
				background-image:
					url("${pageContext.request.contextPath}/resources/images/Main/scene1.jpg");
			}
			.scene.one header, .scene.three header{
				color: rgba(255, 255, 255, 0.85);
			}
			header h1{
				margin-bottom: 30px;
			}
			.scene header {
				color: rgba(0, 0, 0, 0.85);
				max-width: 50%; 
				position: relative; 
				left: 50%;
				top: 20%;
				transform: translateX(-50%) translateY(-50%);
				font-size: 1.5rem;
				text-align: center;				
			}			
			img {
				width: 100%;
				height: 100%;
			}
			
			.img-wrap img:hover { 
				transition: 0.5s; 
				opacity: 0.7;
				background-color: rgba(0,0,0,1);				
			}
			.img-wrap {
				top: 40%;
				position: relative; 
			}
			.img-wrap img{
				opacity: 0;
				height: 30vh;
			}
			.img-wrap .img-tag{
				background-color: rgba(0,0,0,0.5);			
			}			
			.img-wrap .caption {
				font-size: 2rem;
				/* background-color: rgba(0, 0, 0, 0.3); */
				top: 50%;
				left: 50%; 
				transform: translateX(-50%) translateY(-50%);
				font-size: 3rem !important;
				font-weight: 200;		
				color: rgba(255,255,255,0.65);		
				position: absolute;
				width: 100%;
			}			
			.scene.one .btn-wrap {
				position: absolute;  
				top:55%;
				left:35%;							
			}
			.scene.two .btn-wrap {
				position: absolute;  
				top:145%;
				left:47%;							
			}
		</style>
		
	</head>
	<body class="order-body">
		<div class="wrap">
			<div class="main">
				<section class="scene one">
					<header>
						<h1 class="">나가구</h1> 
						나가구는 개인들과 수제 가구를 만드는 공방 사장님들이 자유롭게 어울릴 수 있는 공간입니다. <br/>
						세상에 하나 뿐인 나만의 가구를 주문하고 다양한 가구를 구경해보세요. <br/>
						직접 만들어 보고 싶다면 클래스에 등록해보세요.<br/>
					</header>
					<div class="btn-wrap">
						<button type="button" class="btn btn-outline-primary">둘러보기</button>
						<button type="button" class="btn btn-outline-primary">가입하기</button>
					</div>
	 
				</section>
				<section class="scene two">
					<header>
						<h1>견적내보기</h1>
						나의 상황에 꼭 맞는 가구를 '견적내보기' 메뉴에 올려보세요.<br/> 최고의 전문가들이 모여 상담해주고 견적을 내줍니다.  
					</header>
					<div class="btn-wrap">
						<button type="button" class="btn btn-outline-primary">견적내러가기</button>
						
					</div>
				</section>
				<section class="scene three">
					<header>
						<h1>나가구 이용하기</h1>  
						Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam
						suscipit sint ab beatae nihi
					</header>
					<div class="d-flex  img-wrap text-center">
						<div class="col-4 px-0 wow fadeInRight img-tag"> 
							<a href="#"> 
								<img>
								<!-- <img src="https://images.unsplash.com/photo-1531206715517-5c0ba140b2b8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" alt=""> --> 	
								<div class="caption caption-cm">COMMUNITY</div>
							</a>
							
						</div>
						<div class="col-4 px-0 wow bounceInUp img-tag">
							<a href="#">
								<img>
								<!-- <img src="https://images.unsplash.com/photo-1487015307662-6ce6210680f1?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt=""> -->
								<div class="caption caption-st">STORE</div>
							</a>							 
						</div>
						<div class="col-4 px-0 wow fadeInLeft img-tag">  
							<a href="#">
								<img>
								<!-- <img src="https://images.unsplash.com/photo-1554178286-db408c69256a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" alt=""> -->
								<div class="caption caption-cl">CLASS</div>
							</a>							
						</div>	
					</div>
				</section>
			</div>
		</div>
	</body>
</html>