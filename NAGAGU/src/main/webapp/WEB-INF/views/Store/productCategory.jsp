<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
<%-- <link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/Store/productcategory.css"> --%>
<!-- fontello -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/fontello/css/fontello.css">
</head>
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
.main-content{
   padding: 100px;
}
.main-content a,.main-content a:link,.main-content a:hover{
  text-decoration: none !important;
  color: black;
}
img {
   max-width: 100%;
   height: auto;
}
.col-md-4 {
   border: 1px solid lightgray;
}

.fur_contents {
   width:70%; 
   margin:0 auto;
} 
.imoji{
   font-family: "fontello" ;
   font-size: 5rem ; 
   color: black ;
}
.caption{
   font-size:2rem ; 
}

div.col-md-4.wrap:hover {
	box-shadow: 0 1rem 3rem rgba(0,0,0,.175) !important;
}
.imoji img{
	width:70px; 
}
</style>

<body class="order-body">
	<!-- content start -->
	<div class="container main-content category_st">
		<div class="fur_contents text-center">
			<div class="row content">
				<div class="col-md-4 wrap">
					<a href="./productlist.pro?PRODUCT_CATEGORY=all">
						<div class="imoji">&#xe808;</div>
						<div class="caption">전체</div>
					</a>
				</div>
				<div class="col-md-4 wrap">
					<a href="./productlist.pro?PRODUCT_CATEGORY=table">
						<div class="imoji">&#xe805;</div>
						<div class="caption">책상</div>
					</a>
				</div>
				<div class="col-md-4 wrap">
					<a href="./productlist.pro?PRODUCT_CATEGORY=chair">
						<div class="imoji">&#xe807;</div>
						<div class="caption">의자</div>
					</a>
				</div>
			</div>
			<div class="row content">
				<div class="col-md-4 wrap">
					<a href="./productlist.pro?PRODUCT_CATEGORY=bookshelf">
						<div class="imoji"><img src="https://cdn1.iconfinder.com/data/icons/furniture-line-modern-classy/512/bookshelf-512.png" ></div>
						<div class="caption">책장</div>
					</a>
				</div>
				<div class="col-md-4 wrap">
					<a href="./productlist.pro?PRODUCT_CATEGORY=bed">
						<div class="imoji">&#xe800;</div>
						<div class="caption">침대</div>
					</a>
				</div>
				<div class="col-md-4 wrap">
					<a href="./productlist.pro?PRODUCT_CATEGORY=drawer">
						<div class="imoji">&#xe806;</div>
						<div class="caption">서랍장</div>
					</a>
				</div>
			</div>
			<div class="row content">
				<div class="col-md-4 wrap">
					<a href="./productlist.pro?PRODUCT_CATEGORY=sidetable">
						<div class="imoji">&#xe801;</div>
						<div class="caption">협탁</div>
					</a>
				</div>
				<div class="col-md-4 wrap">
					<a href="./productlist.pro?PRODUCT_CATEGORY=dressing_table">
						<div class="imoji">&#xe804;</div>
						<div class="caption">화장대</div>
					</a>
				</div>
				<div class="col-md-4 wrap">
					<a href="./productlist.pro?PRODUCT_CATEGORY=others">
						<div class="imoji">&#xe803;</div>
						<div class="caption">기타</div>
					</a>
				</div>
			</div>
		</div>
	</div>


	<!-- content 끝 -->

   <!-- Optional JavaScript -->
   <script src="<c:url value="/resources/js/Store/productcategory.js"/>"></script>
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