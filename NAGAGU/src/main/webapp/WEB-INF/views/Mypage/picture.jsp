<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
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
.picOutput{
	padding-left: 0px !important;
}
/* ------------------------------------------------------------------공통적용 */
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
.container-pic {
	margin-bottom: 100px;
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
					<a href="mypage_review_product.my" class="href">
						<div class="card-header">상품 REVIEW</div>
						<div class="card-body">
							<i class="fas fa-keyboard fa-4x"></i>
						</div>
					</a>
				</div>
				<div class="card card-hover ">
					<a href="mypage_review_class.my" class="href">
						<div class="card-header">클래스 REVIEW</div>
						<div class="card-body">
							<i class="fas fa-keyboard fa-4x"></i>
						</div>
					</a>
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
			</div>
		</div>

<!-- fontawesome kit -->
<script src="https://kit.fontawesome.com/97dbc99ea1.js"	crossorigin="anonymous"></script>
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	//사진 가져오기 함수 정의
	function getPics(event){
		var loginNum = '<%=session.getAttribute("MEMBER_NUM")%>'; 
		alert('로그인넘버='+loginNum)
		if(loginNum == 0){
			return
		}
		$.ajax({
			  url: "/NAGAGU/loginMemberLikePics.cm",
              type: "POST",
              data: { 'loginNum' : loginNum},
              contentType:
  				'application/x-www-form-urlencoded; charset=utf-8',
              success: function (retVal) {
        		if(retVal.res=="OK"){
        			var output="";
		        	for(var j=0; j<retVal.PicsNum.length; j++){
		        		var imgsrc = retVal.PicsNum[j].pics_FILE_1
		        		console.log(imgsrc)
			    		output += '<div class="item"><img src="/communityupload/image/'+imgsrc+'"></div>'
		        	}
		        	$('.grid').html(output)
				}else{ 
					alert("update fail");
				}  
			 },
			error:function(){
				alert("ajax통신 실패!!");
			}
		})
	} 
	//처음 로드하고 사진 가져오기 호출
	getPics();
})

$(document).ready(function() {
	$(window).resize(function() {
		var Wid = $(window).width();

		if (Wid < 700) {
			$('.card-header').addClass("p-1");
			$('.card-body').addClass("p-1");
			$('.card-footer').addClass("p-1");
		} else {
			$('.card-header').removeClass("p-1");
			$('.card-body').removeClass("p-1");
			$('.card-footer').removeClass("p-1");
		}
	})
});
function SetGridItemHeight() {
	var grid = document.getElementsByClassName('grid')[0];
	var rowHeight = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-auto-rows'));
	var rowGap = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-row-gap'));

	var item = grid.getElementsByClassName('item');
	for (let i = 0; i < item.length; ++i) {
		item[i].style.gridRowEnd = 'span '+ Math.floor((item[i].children[0].offsetHeight) / 25);
	}
}

window.addEventListener("load", SetGridItemHeight);
window.addEventListener("resize", SetGridItemHeight);

</script>
</body>
</html>