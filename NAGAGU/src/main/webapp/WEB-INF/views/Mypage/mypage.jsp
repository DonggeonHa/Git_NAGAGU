<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
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
				<a href="./mypage_class.my" class="href">
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