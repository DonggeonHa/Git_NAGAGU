<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/images/Main">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@font-face { font-family: 'KOMACON'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff') format('woff'); font-weight: normal; font-style: normal; }
		
     .sign-in-body{
         text-align: center;
         display: block;
         margin: 0 auto;
         font-size: 16px;
         color: #999;
         font-family: '만화진흥원체', 'KOMACON', KOMACON;
     }
     input, textarea {
         width: 360px;
         height: 20px;
         border-radius: 4px 4px 0 0;
         border: 1px solid #dedede;
         padding: 10px;
         margin-top: 3px;
         font-size: 0.9em;
         color: #3a3a3a;
     }
         input:focus, textarea:focus{
             border: 1px solid #97d6eb;
         }
     #submit{
         width: 385px;
         height: 48px;
         text-align: center;
         border: none;
         margin-top: 20px;
         cursor: pointer;
     }
     #submit:hover{
         color: #fff;
         background-color: #216282;
         opacity: 0.9;
     }
     #cancel {
         width: 127px; height: 48px;
         text-align: center;
         border: none;
         margin-top: 20px;
         cursor: pointer;
     }
     #cancel:hover{
         color: #fff;
         background-color: #216282;
         opacity: 0.9;
     }

    .sign-in-modal {
         position: fixed;
         left: 0;
         top: 0;
         width: 100%;
         height: 100%;
         background-color: rgba(0, 0, 0, 0.5);
         opacity: 0;
         visibility: hidden;
         transform: scale(1.1);
         transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s;
         z-index: 2;
     }
     .modal-content {
         position: absolute;
         padding: 30px;
         text-align: center;
         top: 40%;
         left: 50%;
         transform: translate(-50%, -50%);
         background-color: white;
         padding: 1rem 1.5rem;
         width: 100%;
         max-width:420px;
         height: 400px;
         border-radius: 0.5rem;
     }
     .close-button {
         float: right;
         width: 1.5rem;
         line-height: 1.5rem;
         text-align: center;
         cursor: pointer;
         border-radius: 0.25rem;
         background-color: lightgray;
     }
     .close-button:hover {
         background-color: darkgray;
     }
     .show-modal {
         opacity: 1;
         visibility: visible;
         transform: scale(1.0);
         transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
     }
   	
   	.sign-in-form-action-entry {
   		color: black;
   		display: inline-block;
    	padding: 3px 5px;
   		margin: -3px 10px;
   		font-size: 16px;
   	}
   	
   	.sign-in-icon {
   		width: 48px;
    	height: 48px;
    	border-radius: 25px;
    	background-position: left -80px top -80px;
   	}
   	
   	.sign-in-kakao-icon {
   		width: 52px;
    	height: 52px;
    	margin-right: 15px;
   	}
</style>
</head>
<body class="sign-in-body">
     <h1>레어어 팝업창 띄우기</h1>
     <!-- 버튼 -->
     <button class="trigger">이메일 보내기</button>
    
     <!-- 팝업 될 레이어 -->
     <div class="sign-in-modal">
         <div class="modal-content">
             <span class="close-button">&times;</span>
             <h3 class="title">로그인을 해주세요.</h3>
             <br>
             <form action="#post.php" method="POST">
               <input type="user_id" name="user_id" placeholder="아이디" required="required">
               <input type="password" name="password" placeholder="비밀번호" required="required">
               <br>
               <input type="button" id="submit" value="로그인">
             </form>
             <div class="row" style="margin-top: 20px">
             	<a href="" style="text-decoration: none;" class="sign-in-form-action-entry">회원가입</a>
             	<a href="" style="text-decoration: none;" class="sign-in-form-action-entry">비밀번호 찾기</a>
             </div>
             <div class="row" style="margin-top:30px; font-size: 13px">
             	SNS계정으로 간편 로그인/회원가입
             </div>
             <div class="row" style="margin-top: 10px">
             	<a href="" style="text-decoration: none;">
             		<img src="${pageContext.request.contextPath}/resources/images/Main/Google_Plus.png" class="sign-in-icon" style="margin-right: 15px;">
             		<img src="${pageContext.request.contextPath}/resources/images/Main/kakao_icon.png" class="sign-in-kakao-icon">
             		<img src="${pageContext.request.contextPath}/resources/images/Main/Naver.png" class="sign-in-icon">
             	</a>
             </div>
         </div>
     </div>
	
    <script type="text/javascript">
         var modal = document.querySelector(".sign-in-modal");
         var trigger = document.querySelector(".trigger");
         var closeButton = document.querySelector(".close-button");
         var cancelButton = document.querySelector("#cancel");

        //console.log(modal);

        function toggleModal() {
             modal.classList.toggle("show-modal");
         }

        function windowOnClick(event) {
             if (event.target === modal) {
                 toggleModal();
             }
         }
        

        trigger.addEventListener("click", toggleModal);
         closeButton.addEventListener("click", toggleModal);
         cancelButton.addEventListener("click", toggleModal);
         window.addEventListener("click", windowOnClick);
         
         $(function() {

			$(document).click(function() {
				
				$('.sign-in-modal').removeClass('show-modal');
					
				});
								
			});
     </script>

</body>
</html>