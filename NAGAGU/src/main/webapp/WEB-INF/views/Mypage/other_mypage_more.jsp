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
		<script src="https://kit.fontawesome.com/97dbc99ea1.js" crossorigin="anonymous"></script>
		<!-- jquery -->
		<script
		src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous">
		</script>
		<!-- GOOGLE FONT -->
		<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua&display=swap&subset=korean" rel="stylesheet">
		
		<link rel="stylesheet" href="other_mypage_more.css">
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
				height: 850px;
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
			.pagenation-wrap{
				position: relative;
				top:65%;
			}
		</style>
	</head>

	<body class="order-body">
		<div class="container container-mypage">
		  <div class="wrapper row justify-content-between">
		    <div class="main p-0 pb-5">
		      <div class="row justify-content-between title mx-0 pt-2">
		        <div class="col-4">
		          <h2>사진 27</h2>
		        </div>          
		      </div>
		      <div class="row justify-content-between img-wrap p-3">
		        <div class="col-4 pb-5">
		          <a href=""><img src="https://images.unsplash.com/photo-1537182534312-f945134cce34?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"></a>
		        </div>
		        <div class="col-4 pb-5">
		          <a href=""><img src="https://images.unsplash.com/photo-1537182534312-f945134cce34?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"></a>
		        </div>
		        <div class="col-4 pb-5">
		          <a href=""><img src="https://images.unsplash.com/photo-1537182534312-f945134cce34?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"></a>
		        </div>
		        <div class="col-4 pb-5">
		          <a href=""><img src="https://images.unsplash.com/photo-1537182534312-f945134cce34?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"></a>
		        </div>
		        <div class="col-4 pb-5">
		          <a href=""><img src="https://images.unsplash.com/photo-1537182534312-f945134cce34?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"></a>
		        </div>
		        <div class="col-4 pb-5">
		          <a href=""><img src="https://images.unsplash.com/photo-1537182534312-f945134cce34?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"></a>
		        </div>
		        <div class="col-4 pb-5">
		          <a href=""><img src="https://images.unsplash.com/photo-1537182534312-f945134cce34?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"></a>
		        </div>
		        <div class="col-4 pb-5">
		          <a href=""><img src="https://images.unsplash.com/photo-1537182534312-f945134cce34?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"></a>
		        </div>
		        <div class="col-4 pb-5">
		          <a href=""><img src="https://images.unsplash.com/photo-1537182534312-f945134cce34?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"></a>
		        </div>
		      </div>
		
		
		      <!-- pagenation -->
		      <div class="row justify-content-center pagenation-wrap">
		        <nav aria-label="...">
		          <ul class="pagination">
		            <li class="page-item disabled">
		              <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
		            </li>
		            <li class="page-item"><a class="page-link" href="#">1</a></li>
		            <li class="page-item active" aria-current="page">
		              <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
		            </li>
		            <li class="page-item"><a class="page-link" href="#">3</a></li>
		            <li class="page-item">
		              <a class="page-link" href="#">Next</a>
		            </li>
		          </ul>
		        </nav>
		      </div>
		
		    </div><!-- main end -->
		
		
		
		    <div class="sidebar">
		      <div class="row justify-content-center mb-2">         
		        <div class="card-group text-center">
		          <div class="card text-white bg-secondary" style="width: 10rem;">
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
		  </div><!-- wrapper end -->
		</div><!-- container end -->
	
	
	  <!-- Optional JavaScript -->
	  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>