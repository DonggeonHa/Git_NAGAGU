<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "com.spring.member.MemberVO" %>
<%
	MemberVO memberVO = (MemberVO)request.getAttribute("member");
	String MEMBER_EMAIL = (String)session.getAttribute("MEMBER_EMAIL");
	String MEMBER_NICK  = (String)session.getAttribute("MEMBER_NICK");
	String MEMBER_NAME = (String)session.getAttribute("MEMBER_NAME");
	String MEMBER_PICTURE = (String)session.getAttribute("MEMBER_PICTURE");
%>

<!-- 우편번호 찾기 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

		
<style type="text/css">

	/* kt */
	a, .card a:link, .card a:visited {
		color: white;
		text-decoration: none;
	}
	
	.card {
		background-color: #1b1b27; 
		margin: 15px 15px 15px 15px;
		width: 10rem;
		color: white;
	}
	.container-mypage {
		margin-top: 50px;
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
			
		}
		
		.btn_address_zip {
			
		}
	}
	
	@media ( max-width : 768px) {
		.edit_member_form_div {
			width: 360px;
		}
	}
	
	@media (max-width : 375px) {
		.address_zip_div {
			
		}
		
		.btn_address_zip {
			
		}
	}
	/*회원정보 수정 content부분*/
	.edit_member_form_wrap {
		margin: 0 auto;
		width: 40%;
		min-width: 400px !important;
		margin-top: 100px;
	    margin-bottom: 136px;
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
		font-size: 16px;
		font-weight: 500;
		line-height: 21px;
		word-break: keep-all;
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
	
	.image-upload .image-edit input+label, .image-upload .image-edit input+label {
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
	
	.image-upload .image-edit input+label:hover, .image-upload .image-edit input+label:hover {
		background: #f1f1f1;
		border-color: #d6d6d6;
	}
	
	.image-upload .image-edit input+label:after, .image-upload .image-edit input+label:after {
		content: "\f083";
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
		border: 6px solid white;
		/* box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1); */
	}
	
	
	.image-upload .preview>div, .image-upload .preview>div {
		width: 100%;
		height: 100%;
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
	}
	
	#imagePreview {
		background-image: url('<%=MEMBER_PICTURE%>');
		border-radius: 100px;
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
  		height: 35px;
  		background: #3A4B58;
	    color: white;
	    border: 0px;
	}
	
	#address_btn {
		width: 70px;
		margin-left: 5px;
  		border-radius: 4px;
  		height: 35px;
  		background: #3A4B58;
	    color: white;
	    border: 0;
	}
	/* ---------------------------- */
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
		background-color: #1b1b27 ;
		margin: 15px 15px 15px 15px;
		color: white;
	}
	.card-wrap{
		justify-content: center;
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
			width: 9rem !important;  
			font-size: 0.7rem;
		}
		.card-header, .card-body, .card-footer {
			padding: 18px !important;  
		}
	} 
</style>

<div class="container-mypage container" role="main">
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
				<div class="card-header">CUSTOM</div>
				<div class="card-body">
					<i class="fas fa-keyboard fa-4x"></i>
				</div>
			</a>
		</div>
	</div>
</div>
	
<div class="edit_member_form_wrap">
	<h1 class="edit_member_form_title mt-5">회원정보 수정</h1>
	<hr>
	<form name="edit_member_form" id="edit_member_form" action="edit_member_form.my" method="post" enctype="multipart/form-data">
		<table class="table table-borderless">
			<colgroup>
				<col style="width:20%">
				<col style="width:60%">
				<col style="width:30%">
			</colgroup>
		    <tr style="vertical-align:middle">
				<td>이메일</td>
				<td>
					<%=MEMBER_EMAIL%>
				</td>
				<td></td>
		    </tr>
		    <tr style="vertical-align:middle">
				<td style="vertical-align:middle">별명</td>
				<td style="vertical-align:middle">
				<%
					if(MEMBER_NICK == null) {
				%>
						<div class="d-flex justify-content-between">
							<input type="text" id="MEMBER_NICK" name="MEMBER_NICK" placeholder="별명" value="" class="form-control">
							<button type="button" id="nick_chk_btn" onclick="nickname_chk()" value="N">중복체크</button>
						</div>
				<%
					} else { 
				%>
						<div class="d-flex justify-content-between">
							<input type="text" id="MEMBER_NICK" name="MEMBER_NICK" placeholder="별명" value="<%=MEMBER_NICK%>" class="form-control">
							<button type="button" id="nick_chk_btn" onclick="nickname_chk()" value="N">중복체크</button>
						</div>
				<%
					} 
				%>
					<input type="hidden" id="nick_chk" name="member_chk" value="<%=MEMBER_NICK%>">
					<div class="col-12 error_next_box" id="nickMsg" style="display: hidden;" aria-live="assertive"></div>
				</td>
				<td></td>
		    </tr>
		    <tr>
				<td id="li_name" style="vertical-align:middle">이름</td>
				<td style="vertical-align:middle">
					<%
						if(MEMBER_NAME == null) {
					%>
							<input type="text" id="MEMBER_NAME" name="MEMBER_NAME" value="" placeholder="이름" class="form-control">
					<%
						} else { 
					%>
							<input type="text" id="MEMBER_NAME" name="MEMBER_NAME" value="<%=MEMBER_NAME %>" placeholder="이름" class="form-control">
					<%
						} 
					%>
				</td>
				<td></td>
		    </tr>
		    <tr>
				<td style="vertical-align:middle">핸드폰</td>
				<td style="vertical-align:middle">
					<%
						if(memberVO.getMEMBER_PHONE() == null) {
					%>
							<input type="text" id="MEMBER_PHONE" name="MEMBER_PHONE" placeholder="하이픈 제거 후 입력" class="form-control">
					<%
						} else { 
					%>
							<input type="text" id="MEMBER_PHONE" name="MEMBER_PHONE" value="<%=memberVO.getMEMBER_PHONE()%>" placeholder="하이픈 제거 후 입력" class="form-control">
					<%
						} 
					%>
					<div class="col-12 error_next_box" id="phoneMsg" style="display: hidden;" aria-live="assertive"></div>
				</td>
				<td></td>
		    </tr>
		    <tr style="vertical-align:top">
				<td id="li_profile">프로필 사진</td>
				<td>
					<div class="image-upload">
						<div class="image-edit">
							<input type="file" name="img" id="imageUpload" class="imageUpload" data-preview="imagePreview" accept=".png, .jpg, .jpeg" /> 
							<label for="imageUpload"></label>
						</div>
						<div class="preview">
							<div id="imagePreview"></div>
						</div>
					</div>
				</td>
				<td></td>
		    </tr>
		    <tr style="vertical-align:top">
				<td>우편번호</td>
				<td>
					<%
						if(memberVO.getADDRESS_ZIP() == 0) {
					%>
							<div class="d-flex justify-content-start align-items-center">
								<div class="address_zip_div">
									<input type="text"  id="ADDRESS_ZIP" name="ADDRESS_ZIP" readonly="readonly" value="" class="zipcode">
								</div>
								<div class="btn_address_zip">
									<button type="button" id="address_btn" class="zipcode_button" onclick="openZipSearch()">주소검색</button>
								</div>
							</div>
							<div class="edit_member_form_input">
								<input type="text" id="ADDRESS_ADDRESS1" name="ADDRESS_ADDRESS1" value="" placeholder="기본주소" class="form_input" readonly>
							</div>
							<div class="edit_member_form_input">
								<input type="text" id="ADDRESS_ADDRESS2" name="ADDRESS_ADDRESS2" value="" placeholder="상세주소" class="form_input">
							</div>
					<%
						} else { 
					%>
							<div class="d-flex justify-content-start align-items-center">
								<div class="address_zip_div">
									<input type="text"  id="ADDRESS_ZIP" name="ADDRESS_ZIP" readonly="readonly" value="<%=memberVO.getADDRESS_ZIP() %>" class="zipcode">
								</div>
								<div class="btn_address_zip">
									<button type="button" id="address_btn" class="zipcode_button" onclick="openZipSearch()">주소검색</button>
								</div>
							</div>
							<div class="edit_member_form_input">
								<input type="text" id="ADDRESS_ADDRESS1" name="ADDRESS_ADDRESS1" value="<%=memberVO.getADDRESS_ADDRESS1()%>" placeholder=" 기본주소" class="form_input" readonly>
							</div>
							<div class="edit_member_form_input">
								<input type="text" id="ADDRESS_ADDRESS2" name="ADDRESS_ADDRESS2" value="<%=memberVO.getADDRESS_ADDRESS2()%>" placeholder=" 상세주소" class="form_input">
							</div>
					<%
						} 
					%>
				</td>
				<td></td>
		    </tr>
		</table>
		<hr>
		<div class="row justify-content-center" style="margin-bottom: 100px;">
			<button id="btn_submit" class="btn btn-outline-dark" type="button">수정</button>
			<button id="btn_cancel" class="btn btn-outline-dark" type="button" onclick="cancel();">취소</button>
		</div>
	</form>
</div>

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
	    var checkLength = /^[가-힣A-Za-z0-9]{2,12}$/;
			var str2 = $("#MEMBER_NICK").val();
		      if(str2==""){
		    	  alertify.alert("최소 2자 이상 입력하세요.");
		    	  return false;
		      }
	
	     if (!checkLength.test(str2)) {
	   	  alertify.alert("입력한 정보를 다시 확인하고 누르세요.")
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
		         
		         alertify.alert("사용가능한 별명입니다.");
		      } else { // 실패했다면
		      	$("#nick_chk_btn").attr("value", "N");
		         alertify.alert("중복된 별명입니다.");
		      }
		   },
		   error : function() {
		      alert("ajax통신 (별명) 실패!!!");
		   }
		
		});	
	}


	var nick_submit = false;
	var phone_chk = false;
	var nicknamecheckBtn = $("#nick_chk_btn").val();
	$(document).ready(function() {
		var nick = $("#MEMBER_NICK").val();
		var nick_chk = $("#nick_chk").val();
		var phone = $("#MEMBER_PHONE").val();
		
		if(nick==nick_chk) {
			nick_submit = true;
			nicknamecheckBtn = "Y";
			
		}
		if(phone == phone) {
			phone_chk = true;
			
		}
		
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
            	$('#li_name').css('margin-top','58px');
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
			var nick = $("#MEMBER_NICK").val();
			var nick_chk = $("#nick_chk").val();
			var zip_code = $('.zipcode').val();
			var address1 = $('[name=ADDRESS_ADDRESS1]').val();
			var address2 = $('[name=ADDRESS_ADDRESS2]').val();
			
			if(nicknamecheckBtn == "N" || nick_submit == false){
				alertify.alert("별명을 다시 확인하세요.");
			} else if(nicknamecheckBtn =="Y" && nick != nick_chk) {
				alertify.alert("중복체크 버튼을 다시 한번 눌러주세요.");
			} else if(phone_chk == false){
				alertify.alert("전화번호를 다시 확인하고 입력해주세요.");
			} else if(zip_code==0){
				alertify.alert("주소를 입력해주세요.");
			} else {
				document.edit_member_form.submit();
			}
		}); 
		 
		$('.card-wrap').children().eq(2).css('background-color','#ef900e') 
	});
	
	function cancel() {
		location.href = './mypage.my';
	}
</script>