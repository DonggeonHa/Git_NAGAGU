<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String MEMBER_EMAIL = (String)session.getAttribute("MEMBER_EMAIL");
	String MEMBER_NICK  = (String)session.getAttribute("MEMBER_NICK");
	String MEMBER_NAME = (String)session.getAttribute("MEMBER_NAME");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<!-- 우편번호 찾기 -->
   		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   		<!-- fontawesome kit -->
		<script src="https://kit.fontawesome.com/97dbc99ea1.js"	crossorigin="anonymous"></script>
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="http://code.jquery.com/jquery-3.4.1.js" type="text/javascript"></script>
		<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js " integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo " crossorigin="anonymous "></script>
		<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js " integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6 " crossorigin="anonymous "></script>
		
		<style type="text/css">
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
			}
			/* kt */
			a, .card a:link, .card a:visited {
				color: white;
				text-decoration: none;
			}
			
			.card {
				background-color: #1b1b27 !important;
				margin: 15px 15px 15px 15px;
				width: 10rem;
				color: white;
			}
			
			.my {
				background-color: #ef900e !important;
			}
			
			.container-mypage {
				margin-top: 50px;
				margin-bottom: 50px;
			}
			
			.container-mypage>.row {
				min-width: 376px;
			}
			
			@media ( min-width : 768px) {
				html, body {
					font-size: 15px;
				}
			}
			
			@media ( min-width : 768px) {
				.container {
					margin-right: auto;
					margin-left: auto;
					box-sizing: border-box;
					width: calc(100% - 80px);
					max-width: 100%;
					box-sizing: border-box;
					min-height: 1px
				}
				
			}
			
			@media ( min-width : 1024px) {
				.container {
					margin-right: auto;
					margin-left: auto;
					width: calc(100% - 120px);
					max-width: 100%;
					box-sizing: border-box;
					min-height: 1px
				}
			}
			
			@media ( min-width : 1256px) {
				.container {
					margin-right: auto;
					margin-left: auto;
					width: 1136px;
					max-width: 100%;
					box-sizing: border-box;
					min-height: 1px
				}
				
				
			}
			
			@media ( min-width : 768px) {
				.edit_member_form_div {
					width: 360px;
				}
				.address_zip_div {
					margin: 0px -217px;
				}
				
				.btn_address_zip {
					margin-left: -219px;
				}
			}
			
			@media ( max-width : 768px) {
				.edit_member_form_div {
					width: 360px;
				}
			}
			
			@media (max-width : 375px) {
				.address_zip_div {
					margin: 0px -69px !important;
				}
				
				.btn_address_zip {
					margin-left: -70px !important;
				}
			}
			/*회원정보 수정 content부분*/
			.edit_member_form_wrap {
				margin: 0 auto;
				width: 40%;
				min-width: 400px !important;
			}
			
			.error_next_box {
				display: block;
				margin: 9px 0 -2px;
				font-size: 12px;
				line-height: 14px;
				color: red;
			}
			
			.edit_member_form_div {
				margin: 0 auto;
				padding: 20px 0;
			}
			
			.edit_member_form_title {
				font-size: 1.5rem;
				margin-top: 0;
				margin-bottom: 0.5rem;
				font-weight: 500;
				line-height: 1.2;
				color: black;
			}
			
			.edit_member_form_div {
				width: 100%;
				margin: 0 0 30px;
			}
			
			.edit_member_form_label {
				display: block;
				margin: 0 0 45px;
			}
			
			.edit_member_form_input {
				height: 42px;
				margin: 10px 0 0;
				display: flex;
				flex: 1 0 auto;
			}
			
			
			.form_input {
				width: 100%;
				border-radius: 4px;
				transition: border 0.2s, background 0.2s;
				display: block;
				padding: 0 15px;
				line-height: 40px;
				border: 1px solid #dbdbdb;
				background-color: #ffffff;
				color: #424242;
			}
			
			.edit_member_form_label {
				font-size: 16px;
				font-weight: 500;
				line-height: 21px;
				word-break: keep-all;
			}
			
			#MEMBER_PASS, #MEMBER_PASS2 {
				font-family: '유토이미지고딕R', 'BBTreeGR', BBTreeGR;
			}
			
			/*프로필 관련 시작*/
			/*************************/
			.image-upload, .image-upload {
				display: inline-block;
				position: relative;
				max-width: 205px;
			}
			
			.image-upload .image-edit, .image-upload .image-edit {
				position: absolute;
				z-index: 1;
			}
			
			.image-upload .image-edit {
				right: 12px;
    			top: 10px;
			}
			
			.image-upload .image-edit input, .image-upload .image-edit input {
				display: none;
			}
			
			.image-upload .image-edit input+label, .image-upload .image-edit input+label
				{
				display: inline-block;
				width: 34px;
				height: 34px;
				margin-bottom: 0;
				border-radius: 100%;
				background: #ffffff;
				border: 1px solid transparent;
				/* box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.12); */
				cursor: pointer;
				font-weight: normal;
				transition: all 0.2s ease-in-out;
			}
			
			.image-upload .image-edit input+label:hover, .image-upload .image-edit input+label:hover
				{
				background: #f1f1f1;
				border-color: #d6d6d6;
			}
			
			.image-upload .image-edit input+label:after, .image-upload .image-edit input+label:after
				{
				content: "\f040";
				font-family: "FontAwesome";
				color: #757575;
				position: absolute;
				top: 10px;
				left: 0;
				right: 0;
				text-align: center;
				margin: auto;
			}
			
			.image-upload .preview, .image-upload .preview {
				width: 192px;
				height: 192px;
				position: relative;
				border: 6px solid #f8f8f8;
				box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
			}
			
			.image-upload .preview {
				border-radius: 100%;
			}
			
			.image-upload .preview>div, .image-upload .preview>div {
				width: 100%;
				height: 100%;
				background-size: cover;
				background-repeat: no-repeat;
				background-position: center;
			}
			
			#imagePreview {
				background-image: url('https://scontent-sjc3-1.cdninstagram.com/v/t51.2885-15/e35/c272.0.698.698a/s249x249/65862499_2469053246488963_3888124473490095417_n.jpg?_nc_ht=scontent-sjc3-1.cdninstagram.com&_nc_cat=107&_nc_ohc=jwdvsD8lWhQAX8ayLpe&oh=dc710905c03ef378cf99f1d55a225e93&oe=5ED122C9&ig_cache_key=MjA4NjA5OTk0NzAxMDE3ODE4OA%3D%3D.2');
			}
	
			.image-upload .image-edit input+label:after, .image-upload .image-edit input+label:after {
				top: 7px;
			}
			/*프로필 편집 끝*/
			.edit_member_form_wrap > hr {
				border-top: 4px solid rgb(27, 27, 39);
			}
			#edit_member_form > hr {
				border-top: 4px solid rgb(27, 27, 39);
				margin: -37px 0 25px 0;
			}
			
			/*form css부분*/
			
			.get_email {
				margin-top: 17px;
    			font-size: 17px;
    			margin-bottom: 30px;
			}
			
			.edit_form {
    			margin-bottom: 27px;
			}
			
			.edit_form>input, #ADDRESS_ZIP, .edit_form>.col>input {
				border-radius: 4px;
			    transition: border 0.2s, background 0.2s;
			    display: block;
			    padding: 0 15px;
			    line-height: 40px;
			    border: 1px solid #dbdbdb;
			    background-color: #ffffff;
			    color: #424242;
			    width: 215px;
			}
			
			#ADDRESS_ZIP {
				width: 120px;
			}
			
			#btn_submit, #btn_cancel {
				margin-top: 10px;
				margin-right: 10px;
    			width: 100px;
			}
			
			
			#nick_chk_btn{
				width: 34%;
				margin-left: 5px;
	    		border-radius: 4px;
	    		height: 42px;
	    		background: orange;
			    color: white;
			    border: 0px;
			}
		</style>
		<script>
		/* 프로필  */
		   $(function () {
		        // Hide URL/FileReader API requirement message in capable browsers:
		        if (
		            window.createObjectURL ||
		            window.URL ||
		            window.webkitURL ||
		            window.FileReader
		        ) {
		            $('.browser').hide()
		            $('.preview').children().show()
		        }

		        function isDataURL(s) {
		            return !!s.match(isDataURL.regex);
		        }
		        isDataURL.regex = /^\s*data:([a-z]+\/[a-z]+(;[a-z\-]+\=[a-z\-]+)?)?(;base64)?,[a-z0-9\!\$\&\'\,\(\)\*\+\,\;\=\-\.\_\~\:\@\/\?\%\s]*\s*$/i;

		        function readURL(input) {

		            if (input.files && input.files[0]) {
		                var reader = new FileReader();
		                var preview = $(input).data('preview');
		                var _invalid = $(input).parent().parent().find('.invalid-file')

		                reader.onload = function(e) {

		                    if( isDataURL(e.target.result) )    {
		                        _invalid.hide()
		                        $('#' + preview).css('background-image', 'url('+e.target.result +')');
		                        $('#' + preview).hide();
		                        $('#' + preview).fadeIn(650);
		                    } else {
		                        $('#' + preview).hide()
		                        _invalid.html('<div class="alert alert-false"><strong>Error!</strong> Invalid image file.</div>')
		                        _invalid.show()
		                    }
		                }
		                reader.readAsDataURL(input.files[0]);
		            }
		        }

		        $('.imageUpload').bind('change', function(e) {
		            e.preventDefault()

		            readURL(this)
		        });
		    })
		    
		    // 우편번호 주소검색
			function openZipSearch() {
			   new daum.Postcode({
			      oncomplete: function(data) {
			         $('[name=ADDRESS_ZIP]').val(data.zonecode); // 우편번호 (5자리)
			         $('[name=ADDRESS_ADDRESS1]').val(data.address);   // 기본주소
			         $('[name=ADDRESS_ADDRESS2]').val(data.buildingName);   // 상세주소
			         $('[name=ADDRESS_ADDRESS2]').focus();
			         console.log(data);
			      }
			   }).open();
			}
		
			
			function nickname_chk(){
				
	    		var str2 = $("#MEMBER_NICK").val();
	    	      if(str2==""){
	    	    	  alert("최소 2자 이상 입력하세요.");
	    	    	  return false;
	    	      }
	    	      
	    	      jQuery.ajax({
	    	         url : '/NAGAGU/nicknameChk.su',
	    	         type : "post",
	    	         dataType : "json",
	    	         data : {
	    	        	 MEMBER_NICK : $("#MEMBER_NICK").val()
	    	         },
	    	         contentType : 'application/x-www-form-urlencoded; charset=utf-8',

	    	         success : function(retVal) {
	    	            if (retVal.res == "OK") {
	    	               $("#nick_chk_btn").attr("value", "Y");
	    	               $("#nick_chk").attr("value", str2);
	    	               
	    	               alert("사용가능한 별명입니다.");
	    	            } else { // 실패했다면
	    	            	$("#nick_chk_btn").attr("value", "N");
	    	               alert("중복된 별명입니다.");
	    	            }
	    	         },
	    	         error : function() {
	    	            alert("ajax통신 (별명) 실패!!!");
	    	         }

	    	      });	
	    	}
		</script>
	</head>
	
	<body class="order-body">
		<!-- top card start -->
			<div class="row justify-content-center mb-5" style="margin-top: 100px;">
				<div class="card-group text-center d-inline-flex">
					<div class="card my">
						<a href="mypage.my" class="href">
							<div class="card-header">MY</div>
							<div class="card-body">
								<i class="far fa-user-circle fa-4x"></i>
							</div>
						</a>
						<div class="card-footer">Follow</div>
					</div>
	
					<div class="card card-hover">
						<a href="mypage_edit.my" class="href">
							<div class="card-header">CLASS</div>
							<div class="card-body">
								<i class="fas fa-school fa-4x"></i>
							</div>
							<div class="card-footer bg-transparent ">강의</div>
						</a>
					</div>
				</div>
			</div>
			
		
		<div class="edit_member_form_wrap">
			<h1 class="edit_member_form_title mt-5">회원정보 수정</h1>
			<hr>
			<form name="edit_member_form" id="edit_member_form" action="edit_member_form.my" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col-3" id="profilefield">
					<ul style="margin-top: 40px;">
						<li><div class="edit_member_form_label">이메일</div></li>
						<li><div class="edit_member_form_label">별명</div></li>
						<!-- <li><div class="edit_member_form_label">비밀번호</div></li>
						<li><div class="edit_member_form_label">비밀번호 확인</div></li> -->
						<li><div class="edit_member_form_label">이름</div></li>
						<li><div class="edit_member_form_label">휴대전화</div></li>
						<li><div class="edit_member_form_label" id="li_profile">프로필 사진</div></li>
						<li><div class="edit_member_form_label" style="margin-top: 213px;">우편번호</div></li>
					</ul>
				</div>
				<div class="col-8 edit_member_form_div">
						<div class="edit_form">
							<div class="get_email">
							<%=MEMBER_EMAIL %>
							</div>
						</div>
						<div class="row edit_form">
							<div class="col">
								<input type="text" id="MEMBER_NICK" name="MEMBER_NICK" placeholder="별명" value="<%=MEMBER_NICK %>">
								<input type="hidden" id="nick_chk" name="member_chk" >
							</div>
							<div class="col">
								<button type="button" id="nick_chk_btn" onclick="nickname_chk()" value="N">중복체크</button>
							</div>
							<div class="col-12 error_next_box" id="nickMsg" style="display: hidden;" aria-live="assertive"></div>
						</div>
						
						<!-- <div class="edit_form">
							<input type="password" id="MEMBER_PASS" name="MEMBER_PASS">
						</div>
						<div class="edit_form">
							<input type="password" id="MEMBER_PASS2" name="MEMBER_PASS2">
						</div> -->
						<div class="edit_form">
							<input type="text" id="MEMBER_NAME" name="MEMBER_NAME" value="<%=MEMBER_NAME %>" placeholder="이름">
						</div>
						<div class="edit_form">
							<input type="text" id="MEMBER_PHONE" name="MEMBER_PHONE" placeholder="하이픈 제거 후 입력">
							<div class="col-12 error_next_box" id="phoneMsg" style="display: hidden;" aria-live="assertive"></div>
						</div>
						<div class="image-upload">
							<div class="image-edit">
								<input type="file" name="img2" id="imageUpload"
									class="imageUpload" data-preview="imagePreview"
									accept=".png, .jpg, .jpeg" /> <label for="imageUpload"></label>
							</div>
							<div class="preview">
								<div id="imagePreview"></div>
							</div>
						</div>
						<div class="edit_form" style="margin-top: 30px;">
							<div class="row justify-content-around m-0 align-items-center">
								<div class="address_zip_div" style="margin: 0 -329px;">
									<input type="text"  id="ADDRESS_ZIP" name="ADDRESS_ZIP" readonly="readonly" class="zipcode">
								</div>
								<div class="btn_address_zip" style="margin-left: -316px;">
									<button type="button" class="btn btn-outline-dark mx-2" 
									class="zipcode_button" onclick="openZipSearch()">주소검색</button>
								</div>
							</div>
							<div class="edit_member_form_input">
								<input type="text" id="ADDRESS_ADDRESS1" name="ADDRESS_ADDRESS1" placeholder=" 기본주소" class="form_input" readonly>
							</div>
							<div class="edit_member_form_input">
								<input type="text" id="ADDRESS_ADDRESS2" name="ADDRESS_ADDRESS2" placeholder=" 상세주소" class="form_input">
							</div>
							
						</div>
				</div>
			</div>
			<hr>
			<div class="row justify-content-center" style="margin-bottom: 100px;">
				<button id="btn_submit" class="btn btn-outline-dark" type="button">수정</button>
				<button id="btn_cancel" class="btn btn-outline-dark" type="button" onclick="cancel()">취소</button>
			</div>
			</form>
		</div>
		<script>
		var nick_submit = false;
		var phone_chk = false;
		
		function showErrorMsg(obj, msg) {
	        obj.attr("class", "col-12 error_next_box");
	        obj.html(msg);
	        obj.show();
        }
		
		function setFocusToInputObject(obj) {
			nick_submit = false;
            obj.focus();
        }
		
		$("#MEMBER_NICK").blur(function(){
			checkNick();
        });
		
		function checkNick() {
            var nick = $("#MEMBER_NICK").val();
            var oMsg = $("#nickMsg");
            var oInput = $("#MEMBER_NICK");
            var checkLength = /^[가-힣A-Za-z0-9]{2,12}$/;
            
            if (nick=="") {
                showErrorMsg(oMsg, '필수 정보입니다.');
                oInput.focus();
                return false;
            } else {
                oMsg.hide();
                nick_submit = true;
            }
            if (!checkLength.test(nick)) {
                showErrorMsg(oMsg, "별명은 최소 2자, 최대 12자 까지 입력가능 합니다.[특수문자 불가]");
                setFocusToInputObject(oInput);
                return false;
            } else {
           		oMsg.hide();
            	return true;
            }
            nick_submit = false;
            return false;
        }
		
		
		
		$("#MEMBER_PHONE").blur(function(){
			checkPhone();
        });
		
		function checkPhone() {
			
			var phone = $("#MEMBER_PHONE").val();
			var oMsg = $("#phoneMsg");
            var oInput = $("#MEMBER_PHONE");
            var checkLength = /^[0-9]{11}$/;
            
            if (phone==""){
            	oMsg.hide();
            	phone_chk = true;
            	
            	return true;
            }
            if (!checkLength.test(phone)) {
            	showErrorMsg(oMsg, "숫자만 입력가능[특수문자 불가]");
            	$('#li_profile').css('margin-top','69px');
            	oInput.focus();
            	phone_chk = false;
            	
            	return false;
            } else{
            	oMsg.hide();
            	phone_chk = true;
            	
            	return true;
            }
		}
		
		$('#btn_submit').click(function(){
			var nicknamecheckBtn = $("#nick_chk_btn").val();
			var nick = $("#MEMBER_NICK").val();
			var nick_chk = $("#nick_chk").val();
			
			if(nicknamecheckBtn == "N" || nick_submit == false){
				alert("입력한 정보를 다시 한번 확인해주세요.");
			} else if(nicknamecheckBtn =="Y" && nick != nick_chk) {
				alert("중복체크 버튼을 다시 한번 눌러주세요.");
			} else if(phone_chk == false){
				alert("전화번호를 다시 확인하고 입력해주세요.");
			} else {
				document.edit_member_form.submit();
			}
			
		});
		
		function cancel() {
			location.href = './mypage.my';
		}
			
		</script>
	</body>
</html>