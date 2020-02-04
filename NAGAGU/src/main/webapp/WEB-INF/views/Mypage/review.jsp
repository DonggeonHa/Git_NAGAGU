<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
.container-mypage{
	margin-top: 50px ;
	margin-bottom: 50px ;				 
}			
.container-mypage a,.container-mypage  a:link,.container-mypage  a:hover {
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
.card-wrap{
	justify-content: center;
	padding-left:50px; 
}
@media screen and (max-width: 600px) {
	.card {
		width: 2.5rem;
		font-size: 0.1rem;
		margin: 2px 2px 2px 2px;
	}
	.card-header, .card-body, .card-footer {
		padding: 1px !important; 
	}
	.card-wrap{
		justify-content: start;
		padding-left: 20px; 
	} 
}
@media screen and (min-width: 600px) {
	.card {
		width: 4rem;
		font-size: 0.3rem;
		margin: 2px 2px 2px 2px;
	}
	.card-header, .card-body, .card-footer {
		padding: 4px !important; 
	}
}
@media screen and (min-width: 992px) {
	.card {
		width: 6rem;
		font-size: 0.6rem;
		margin: 2px 2px 2px 2px;
	}
	.card-header, .card-body, .card-footer {
		padding: 10px !important; 
	}
}
@media ( min-width : 1200px) {
	.card {
		width: 8rem !important;  
		font-size: 0.7rem;
	}
	.card-header, .card-body, .card-footer {
		padding: 18px !important;  
	}
} 
/* --------------------------------------------- */
.tab-pane .col-4 {
	padding-bottom: 50px;
}
li>.active {
	background-color: #1b1b27 !important;
	color: white !important;
}
.tab-content .tab-pane.active {
	display: flex;
}
.nav-item a {
	color: black;
}
img {
width: 100%;
height: auto;
}
/* --------------------------------- */
.tab-content img {
	height: auto;
}
.reply-content {
	width: 100%;
}
.tab-content{
	min-height:38vh;
}
.tab-content img{
	max-height:250px;
}
</style>
</head>
	<body class="order-body">	 
		<div class="container-mypage " role="main">
			<div class="row card-wrap  text-center">
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

	<div class="container">
		<div class="row" style="margin-left: 0px;">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link active" id="picTab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true">상품 후기</a></li>
				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="#profile" role="tab"
					aria-controls="profile" aria-selected="false">강의 후기</a></li>
			</ul>
		</div>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active row" id=""
				role="tabpanel" aria-labelledby="picTab">
				<!-- 댓글 뿌려지는 장소 -->
				<div class="row mx-0 my-2 reply-content replyOutput">
				</div>
			</div>
		</div>
	</div>


	<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"	crossorigin="anonymous"></script>
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"	crossorigin="anonymous"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"	crossorigin="anonymous"></script>
<!-- fontawesome kit -->
<script src="https://kit.fontawesome.com/97dbc99ea1.js" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		//상품 후기  가져오기 함수 정의
		function getPics(event){
			var loginNum = '<%=session.getAttribute("MEMBER_NUM")%>'; 
			alert('로그인넘버='+loginNum)
			var category = 'review_store'
			if(loginNum == 0){
				return
			}
			$.ajax({
				  url: "/NAGAGU/loginMemberReply.cm",
	              type: "POST",
	              data: { 'category' : category},
	              contentType:
	  				'application/x-www-form-urlencoded; charset=utf-8',
	              success: function (retVal) {
	        		if(retVal.res=="OK"){
	        			var output="";
	        			console.log(retVal.PicsNum)
			        	for(var j=0; j<retVal.PicsNum.length; j++){
			        		var imgsrc = retVal.PicsNum[j].REVIEW_FILE
			        		var date = retVal.PicsNum[j].REVIEW_DATE
			        		var content = retVal.PicsNum[j].REVIEW_CONTENT
			        		var title = retVal.PicsNum[j].PRODUCT_TITLE
			        		console.log(imgsrc)
				    		output += '<div class="col-4"><img src="/productupload/image/'+imgsrc+'"></div>'
				    		output += '<div class="col-8"><div class="row justify-content-between"><div class="name">['+title+']</div>'
				    		output += '<div class="smallfont">'+date+'</div></div><div class="row">'
				    		output += '<div class="comm_content">'+content+'</div></div></div>'
			        	}
			        	$('.replyOutput').html(output)
					}else{
						alert("update fail");
					}  
				 },
				error:function(){
					alert("ajax통신 실패!!");
				}
			})
		} 
		//누르면 사진댓글 가져오기
		$(document).on('click','#picTab',function(){
			getPics()
		}) 
		
		//누르면 상품댓글 가져오기
		$(document).on('click','#storeTab',function(){
			alert('hid')
			var loginNum = '<%=session.getAttribute("MEMBER_NUM")%>'; 
			var category = 'review_store'
			if(loginNum == 0){
				return
			}
			$.ajax({
				  url: "/NAGAGU/loginMemberReply.cm",
	              type: "POST",
	              data: { 'category' : category},
	              contentType:
	  				'application/x-www-form-urlencoded; charset=utf-8',
	              success: function (retVal) {
	        		if(retVal.res=="OK"){
	        			var output="";
	        			console.log(retVal.PicsNum)
			        	for(var j=0; j<retVal.PicsNum.length; j++){
			        		var imgsrc = retVal.PicsNum[j].PRODUCT_IMAGE
			        		var date = retVal.PicsNum[j].REVIEW_DATE
			        		var content = retVal.PicsNum[j].REVIEW_CONTENT
			        		var title = retVal.PicsNum[j].PRODUCT_TITLE
			        		console.log(imgsrc)
				    		output += '<div class="col-1"><img src="/productupload/image/'+imgsrc+'"></div>'
				    		output += '<div class="col-11"><div class="row justify-content-between"><div class="name">'+title+'</div>'
				    		output += '<div class="smallfont">'+date+'</div></div><div class="row">'
				    		output += '<div class="comm_content">→'+content+'</div></div></div>'
			        	}
			        	$('.replyOutput').html(output)
					}else{
						alert("update fail");
					}  
				 },
				error:function(){
					alert("ajax통신 실패!!");
				}
			})
		}) 
		//처음 로드하고 사진 가져오기 호출
		getPics();
	})
</script></body>
</html>