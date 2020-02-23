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
		transition: 0.5s;
		z-index: 1;
		background-color: #ef900e;
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
					<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
						<symbol id="custom" viewBox="0 0 70 60">
					    	<path class="icon__path" d="M30,14.5A1.5,1.5,0,1,1,31.5,16,1.5,1.5,0,0,1,30,14.5ZM40.5,16A1.5,1.5,0,1,0,39,14.5,1.5,1.5,0,0,0,40.5,16Zm-5.639,8A9.334,9.334,0,0,0,39.5,22.863L38.5,21.137A7.439,7.439,0,0,1,34.861,22H33v2h1.861ZM18,30v3.293a7.226,7.226,0,0,1,.7-.2c2.283-.43,4.954-.931,7.115-1.331l1.288-.243c.152-.028.3-.054.436-.074a3.522,3.522,0,0,1,.357-.077l.3-.054c.2-.035.377-.067.539-.1L29,31.171v-.038a4.983,4.983,0,0,1-.86-1.552l-1.473-4.417A13,13,0,0,1,26,21.053V20a4,4,0,0,1,0-8,9.928,9.928,0,0,1,1.115-4.524A3.5,3.5,0,0,1,30,2h7.9A7.236,7.236,0,0,1,44.89,7.435,10.024,10.024,0,0,1,46,12a4,4,0,0,1,0,8v1.053a13,13,0,0,1-.667,4.111L43.86,29.581A4.983,4.983,0,0,1,43,31.133v.037L53.294,33.1A7,7,0,0,1,59,39.98V58a4,4,0,0,1-4,4H49a1.074,1.074,0,0,1-.212-.022L34.168,58.8,23.279,61.96A1.017,1.017,0,0,1,23,62H12a1,1,0,0,1-1-1V56H9a1,1,0,0,1-1-1V46a1,1,0,0,1,1-1h2V30H6a1,1,0,0,1-1-1V23a1,1,0,0,1,1-1H16a1.006,1.006,0,0,1,.555.168L19.3,24H23a1,1,0,0,1,1,1v4a1,1,0,0,1-1,1ZM46,18a2,2,0,0,0,0-4ZM26,14.005A2,2,0,1,0,26,18ZM16,56H13v4h3Zm14.067,1.908-4.279-.93L18.929,56H18v4h4.858ZM57,47.847l-4.844-.807-4.61,2.3L57,49.936Zm-10-3.97.779,3.115.221-.11V44h2v1.882l1.553-.777a1.017,1.017,0,0,1,.612-.091L57,45.82V39.98a5,5,0,0,0-4.074-4.918L47,33.953ZM43,33.2V43h2V33.579ZM37.766,4l1.8,3h3.059A5.238,5.238,0,0,0,37.9,4Zm-5,0,1.8,3h2.668l-1.8-3ZM28.5,5.5A1.5,1.5,0,0,0,30,7h2.234l-1.8-3H30A1.5,1.5,0,0,0,28.5,5.5ZM28,12.846l1.654,5.223a1.512,1.512,0,0,0,2.158.521,3.493,3.493,0,0,1,1.455-.554l1.784-5.352,1.9.632L35.387,18H38.24a3.5,3.5,0,0,1,1.948.59l.176.118a1.512,1.512,0,0,0,2.071-.385L44,12.859V12a8.024,8.024,0,0,0-.592-3H30a3.477,3.477,0,0,1-1.3-.255A7.937,7.937,0,0,0,28,12Zm2.037,16.1A3,3,0,0,0,32.883,31h6.234a3,3,0,0,0,2.846-2.052l1.473-4.417A11,11,0,0,0,44,21.053V19.571a3.512,3.512,0,0,1-4.746.8l-.177-.118A1.506,1.506,0,0,0,38.24,20H33.76a1.5,1.5,0,0,0-.838.254A3.512,3.512,0,0,1,28,19.2v1.854a11,11,0,0,0,.564,3.478ZM31,39.5V43h4V41.193l-1.444-3.61Zm1.478-3.608L31,34.414V37ZM36,38.308l1.071-2.679.005,0a.979.979,0,0,1,.217-.338l2.333-2.333a5.06,5.06,0,0,1-.509.04H32.883a5.037,5.037,0,0,1-.509-.04l2.333,2.333a.979.979,0,0,1,.217.338l.005,0ZM37,43h4V39.5l-2.556-1.917L37,41.193Zm4-6V34.414l-1.478,1.478ZM27,43h2V33.2c-.139.027-.283.054-.45.084l-.309.056c-.119.019-.227.046-.334.07-.2.032-.314.054-.433.076L27,33.579Zm-.946,4.909.211.106,6.475.4,13.007-.411.2-.1L45.219,45H26.781Zm-.5,1.986L19.764,47H10v7h9a.969.969,0,0,1,.142.01l7,1L49.107,60H55a2,2,0,0,0,2-2V51.939L25.938,50A1.029,1.029,0,0,1,25.553,49.9ZM16,45V30H13V45Zm2-9.589V45h2a1,1,0,0,1,.447.1L22,45.882V44h2v2.882l.221.111L25,43.877V33.953c-1.92.357-4.048.756-5.925,1.109A5.119,5.119,0,0,0,18,35.411ZM22,28V26H19a1.006,1.006,0,0,1-.555-.168L15.7,24H7v4H22Z"/>    	
					    </symbol>
					</svg> 
			     	<svg class="item__icon" style="width:80px; height: 55px; fill:white;"><use xlink:href="#custom"/></svg>
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
		    	  alert("최소 2자 이상 입력하세요.");
		    	  return false;
		      }
	
	     if (!checkLength.test(str2)) {
	   	  alert("입력한 정보를 다시 확인하고 누르세요.")
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
				alert("별명을 다시 확인하세요.");
			} else if(nicknamecheckBtn =="Y" && nick != nick_chk) {
				alert("중복체크 버튼을 다시 한번 눌러주세요.");
			} else if(phone_chk == false){
				alert("전화번호를 다시 확인하고 입력해주세요.");
			} else if(zip_code==0){
				alert("주소를 입력해주세요.");
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