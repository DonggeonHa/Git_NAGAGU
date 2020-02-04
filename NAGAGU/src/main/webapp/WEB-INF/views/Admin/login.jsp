<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>로그인</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="./resources/css/signup.css">
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
			
		@font-face {
				font-family: 'BBTreeGR';
				src: 
					url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGR.woff') 
					format('woff');
				font-weight: normal;
				font-style: normal;
		}
			
		.order-body {
			font-family: '만화진흥원체', 'KOMACON', KOMACON;
			font-size: 15px;
		}
		
		.input_email_local {
			width: 235px;
		}
		
		#email_chk_btn, #nick_chk_btn{
			width: 34%;
			margin-left: 5px;
    		border-radius: 4px;
    		height: 42px;
    		background: orange;
		    color: white;
		    border: 0px;
		}
		
		input#member_nick {
			width: 235px;
		}
		
		#btn_google {
			width: 49px;
		    height: 49px;
		    border-radius: 10px;
		}
		
		#pass1, #pass2{
			font-family: '유토이미지고딕R', 'BBTreeGR', BBTreeGR;
		}
    </style>
    
    
</head>

<body class="order-body">
    <div class="cbody">
        <div class="signup_form">
            <h1 class="signup_title text-center">로그인</h1>
            
            <form name="signup_form" action="Alogin.ad" method="post">
                <div class="signup_form_id">
                    <div class="signup_form_label">아이디</div>
                    <div class="signup_form_input">
						<div class="input_email_local">
						    <input type="text" class="form_input" id="ADMIN_ID" name="MEMBER_EMAIL" placeholder="아이디" size="1" required>
						</div>
                    </div>
                    <div class="error_next_box" id="emailMsg" style="display: hidden;" aria-live="assertive"></div>
                </div>
                <div class="signup_form_pass1 form_group">
                    <div class="signup_form_label">비밀번호</div>
                    <div class="signup_form_input">
                        <input type="password" id="pass1" name="MEMBER_PASS" class="form_input" placeholder="비밀번호" required>
                    </div>
                    <div class="error_next_box" id="pass1Msg" style="display: hidden;" aria-live="assertive"></div>
                </div>
                <div class="error_next_box" id="termMsg" style="display: hidden;" aria-live="assertive"></div>
                <button id="btn_submit" class="signup_form_submit" type="submit">로그인</button>
            </form>
        </div>
    </div>
</body>

</html>