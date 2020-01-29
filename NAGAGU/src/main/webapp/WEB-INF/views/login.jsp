<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>로그인 페이지</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <style>
        body {
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
        }
        
        form {
            display: block;
        }
        
        div {
            display: block;
            box-sizing: border-box;
        }
        
        legend {
            visibility: hidden;
            position: absolute;
            left: -9999px;
            top: -9999px;
            width: 0;
            height: 0;
            line-height: 0em;
        }
        
        fieldset {
            display: block;
            margin: 0;
            padding: 0;
            border: none;
        }
        
        .cbody {
            max-width: 1530px;
            position: relaitve;
            margin: 0 auto;
        }
        
        .login_area {
            max-width: 460px;
            margin: 0 auto;
            padding: 30px 15px 105px;
        }
        
        .login_tab {
            width: 460px;
        }
        
        .login_tab h3 {
            margin: 0 0 15px 0;
            font-size: 17px;
            font-weight: 700;
        }
        
        .login_area fieldset .login_input {
            width: 310px;
            padding-right: 30px;
            padding-bottom: 1px;
            float: left;
        }
        
        .login_area fieldset label {
            overflow: hidden;
            margin: 0 0 2px 1px;
        }
        
        .login_area fieldset input {
            width: 305px;
            height: 44px;
            line-height: 40px;
            margin-bottom: 0;
            padding: 1px 1px 1px 1px;
            box-sizing: border-box;
            font-family: 'Nanum Gothic', sans-serif;
            vertical-align: middle;
            font-size: 12px;
            border: 1px solid #d5d5d5;
        }
        
        .login_tab fieldset .btn_login {
            float: left;
            top: 0;
            right: 1px;
            width: 110px;
            height: 96px;
            padding: 33px 0;
            text-decoration: none;
            text-align: center;
            font-size: 15px;
            line-height: 20px;
            box-sizing: border-box;
            color: #ffffff;
            background: orange;
            border: 1px solid orange;
            transition: color 0.2s ease-in-out, background 0.2s ease-in-out, border 0.2s ease-in-out;
        }
        
        .login_tab fieldset .btn_login:hover {
            background: rgb(255, 190, 70);
        }
        
        .login_btn_line {
            margin: 0 auto;
            font-size: 12px;
            text-align: center;
            line-height: 14px;
            padding-top: 20px;
            padding-bottom: 20px;
            border-top: 1px solid #e4e4e4;
        }
        
        .login_btn_line a {
            color: #8e8e8e;
            text-decoration: none;
        }
        
        .bar {
            display: inline-block;
            width: 1px;
            height: 13px;
            text-indent: -999em;
            background: #e4e4e5;
        }
        
        .login_sns img {
            float: right;
            padding-right: 3px;
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

</head>

<body class="order-body">

    <div class="container">
        <div class="cbody justify-content-center">
            <div class="login_area justify-content-center">
                <form id="login_form" method="post">
                    <div class="login_tab">
                        <h3>회원 로그인</h3>
                        <fieldset>
                            <legend>회원 로그인</legend>
                            <div class="login_input">
                                <label class="id placeholder" title="아이디">
                                    <input id="member_id" name="member_id" placeholder="아이디" type="text" fw-filter="isFill">
                                </label>
                                <label class="password placeholder" title="비밀번호">
                                    <input id="member_pass" name="member_pass" placeholder="비밀번호" type="password" autocomplete="off" fw-filter="isFill&isMin[4]&isMax[16]">
                                </label>
                            </div>
                            <a href="" class="btn_login">
                                <span>로그인</span>
                            </a>
                        </fieldset>
                    </div>
                    <div class="login_btn_line justify-content-center">
                        <a href=""><span>회원가입</span></a>
                        <span class="bar" aria-hidden="true">|</span>
                        <a href=""><span>아이디 찾기</span></a>
                        <span class="bar" aria-hidden="true">|</span>
                        <a href=""><span>비밀번호 찾기</span></a>
                    </div>
                    <div class="login_sns">
                        <img id="login_kakao" src="https://testkj.s3.ap-northeast-2.amazonaws.com/images/login_kakao.png">
                        <img id="login_naver" src="https://testkj.s3.ap-northeast-2.amazonaws.com/images/login_naver.PNG">
                    </div>
                </form>
            </div>
        </div>
    </div>



    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>

</html>