<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	    <title>로그인</title>
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	    <script src="http://code.jquery.com/jquery-3.4.1.js" type="text/javascript"></script>
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
			
			.box {
			    position:absolute;
			    top:40%; left:50%;
			    transform: translate(-50%, -50%);
		    }
		    
		    /* input타입 비밀번호일 때만 폰트 바꿈 */
			#exampleInputPassword {
				font-family: '유토이미지고딕R', 'BBTreeGR', BBTreeGR;
			}
	    </style>
	</head>

	<body class="order-body">
		<div class="box">
		    <div style="width: 450px;" class="">
				<h2 class="text-center">로그인</h2>
				<form action="./Alogin.ad" method="post">
					<div class="form-group">
						<label for="exampleInputId">아이디</label>
						<input type="text" class="form-control" id="exampleInputId" aria-describedby="IdHelp" name="ADMIN_ID">
						<small id="IdHelp" class="form-text text-muted">관리자 로그인입니다. 일반사용자는 뒤로가기를 눌러주세요.</small>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword">비밀번호</label>
						<input type="password" class="form-control" id="exampleInputPassword" name="ADMIN_PASS">
					</div>
					<button type="submit" class="btn btn-warning btn-lg btn-block text-white">로그인</button>
				</form>
		     </div>
		 </div>
	</body>
</html>