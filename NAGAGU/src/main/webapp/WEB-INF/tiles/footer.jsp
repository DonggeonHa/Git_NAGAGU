<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
		<!-- include libraries(jQuery, bootstrap) -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		<!-- include summernote css/js -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
		<!-- Tempus Dominus v5.0.1 -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
		<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
		
		<style>
		#footer2 {
			border-top: 4px solid #ef900e;
			height: 200px;
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
		
		li a {
			color: #d3d3d3;
		}
		</style>
	</head>
	
	<body class="order-body">
		<div id="footer2">
		    <div class="copyright">
		        <ul class="sns">
			        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/sns1.png"></a></li>
			        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/sns2.png"></a></li>
			        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/sns3.png"></a></li>
			        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/sns4.png"></a></li>
		        </ul>
		        <ul>
			        <li>상호명 : NAGAGU</li>
			        <li class="line">/</li>
			        <li>대표 : 비트캠프</li>
			        <li class="line">/</li>
			        <li>전화 : 02-0000-0000</li>
			        <li class="line">/</li>
			        <li>사업자등록번호 : 516-13538-13535</li>
			        <li class="line">/</li>
			        <li>E-mail : email@mail.com</li>
			        <li class="line">/</li>
			        <li><a href="mypage_support.my">고객센터</a></li>
			        <li class="copy">Copyright &copy; Design Bitcamp All rights reserved.</li>
		        </ul>
		    </div>
		</div>
		
	</body-footer>
</html>