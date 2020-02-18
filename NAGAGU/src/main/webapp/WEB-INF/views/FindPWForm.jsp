<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	td.text2 {
		color: #424242;
	}
	.pw_table {
		height: 320px;
    	width: 570px;
    	margin: 0 auto;
    	padding: 5px;
	}
	#pass1, #pass2, #pass3{
		width: 100%;
	    border-radius: 4px;
	    transition: border 0.2s, background 0.2s;
	    display: block;
	    padding: 0 15px;
	    line-height: 45px;
	    border: 1px solid #dbdbdb;
	    background-color: #ffffff;
	    color: #424242;
	}
	
	.pw_button {
		transition: border 0.2s, background 0.2s;
	    display: block;
	    padding: 0 15px;
	    line-height: 40px;
	    border: 1px solid #3a4b58;
	    background-color: #3a4b58;
	    width: 100%;
	    color: white;
	}
	
	.pw_button:hover{
    	background-color: #1B1B27; 
	}
	.pw_button {
		line-height: 45px;
		font-size: 16px;
		margin-top: 15px;
		font-weight: bold;
	}
</style>
</head>
<body>
<div class="container">
	<div class="find_content" style="text-align: center;">
            <br />
            <p style="margin: 108px 0 50px 14px; font-size: 24px;">
                비밀번호 변경
            </p>
        </div>
	<div style="margin: 0 auto;">
		<form id="pw_form" name="pw_form" action="FindPw.ma" method="post">
	    <table class="pw_table">
	        <tr>
	        	<td class="text2"><span>임시 비밀번호</span></td>
	        </tr>
	        <tr>
	            <td>
	                <input type="text" id="pass1" name="MEMBER_PASS1" class="find_idpw_textbox"><br>
	            </td>
	        </tr>
	        <tr>
	        	<td class="text2"><span>새로운 비밀번호</span></td>
	        </tr>
	        <tr>
	        	<td>
	        		<input type="text"  STYLE="ime-mode: disabled" name="MEMBER_PASS2" placeholder="8자 이상 영문,숫자,특수문자 사용" id="pass2" class="find_idpw_textbox"><br>
	            </td>
	       	</tr>
	       	<tr>
	        	<td class="text2"><span>새로운 비밀번호 확인</span></td>
	        </tr>
	        <tr>
	        	<td>
	        		<input type="text"  STYLE="ime-mode: disabled" name="MEMBER_EMAIL" id="pass3" class="find_idpw_textbox"><br>
	            </td>
	       	</tr>
	       	<tr>
	       		<td><input type="button" onclick="find_pw_btn();" class="pw_button" value="비밀번호 변경"></td>
	       	</tr>
	    </table>
    </form>
	</div>
</div>
</body>
</html>