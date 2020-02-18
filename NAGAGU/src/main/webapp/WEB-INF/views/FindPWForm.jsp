<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.member.*" %>
<%
	MemberVO memberVO = (MemberVO)request.getAttribute("memberVO");
%>
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
	
	#pass1, #pass2, #pass3 {
		font-family: '유토이미지고딕R', 'BBTreeGR', BBTreeGR;
	}
	
	#pass2Msg{
		margin-top: -20px;
	    font-size: 12px;
	    color: red;
	    margin-bottom: 18px;
	}
</style>
<script>

$(document).ready(function(e){
	/* e.preventdefault(); */
});

function pw_btn() {
	
	var pass1 = $("#pass1").val();
	var email = $("#member_email").val();
	
	if(pass1==null || pass2==null || pass3==null){
		alert("빈 칸 없이 입력해주세요.");
		
		return false;
	}
	console.log(pass1);
	console.log(email);
	
	jQuery.ajax({
	    url : './checkPW.su',
	    type : "post",
	    dataType : "json",
	    data : {"pass1" : pass1, "member_email" : email},
	    contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	    success : function(retVal) {
	       if (retVal.res == "chk_pw_success") {
	    	   chage_pw();
	       } else { // 실패했다면
	          alert("임시 비밀번호를 다시 한번 확인해주세요.");
	       }
	    },
	    error : function() {
	       alert("ajax통신 실패!!!");
	    }
	 });
}


$('#pass1').blur(function() {
	var password1 = $('#pass1').val();
	var oMsg = $('#pass1Msg');
	var pw1 = $('#pass1');
	
	if(password1 == "") {
		showErrorMsg(oMsg, "필수 정보입니다.");
        
		return false;
	} else if(!pwJ.test(password1)) {
		showErrorMsg(oMsg, "8자 이상 영문+숫자+하나 이상의 특수문자를 사용하세요.");
		pw1.focus();
		
		return false;
	} else {
		oMsg.hide();
		sub_pw1 = true;
		
        return true;
	}
});


$(document).ready(function(){
	// 비밀번호 정규식(특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식)
	var pwJ = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	var sub_pw2 = false;
	var sub_pw1 = false;
	
	function showErrorMsg(obj, msg) {
        obj.attr("class", "error_next_box");
        obj.html(msg);
        obj.show();
    }
	
	$('#pass2').blur(function() {
	    var pass1 = $("#pass2").val();
	    var pass2 = $("#pass3").val();
	    var oMsg = $("#pass2Msg");
	    
	    if (pass1=="") {
	        showErrorMsg(oMsg, "필수 정보입니다.");
	        
	        return false;
	    } else {
	    	oMsg.hide();
	    }
	    
	    if (pass1 != pass2) {
	        showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.");
	        
	        return false;
	    } else {
	        oMsg.hide();
	        sub_pw2 = true;
	        
	        return true;
	    }
	    
	    return true;
	});

	$('#pass2').keyup(function (){
		var pass1 = $("#pass2").val();
	    var pass2 = $("#pass3").val();
	    var oMsg = $("#pass2Msg");
	    
		if(pass1 != pass2){
			 showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.");
			 sub_pw1 = false;
			 
	         return false;
		}
	});
	
});

function chage_pw() {
	/* if(sub_pw2==true && sub_pw1==true){
		document.pw_form.submit();
	} **/
	document.pw_form.submit();
	
}
</script>
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
		<form id="pw_form" name="pw_form" action="FindPw.ma" method="post" onsubmit="false">
	    <table class="pw_table">
	        <tr>
	        	<td class="text2"><span>임시 비밀번호</span></td>
	        </tr>
	        <tr>
	            <td>
	            	<input type="hidden" id="member_email" name="MEMBER_EMAIL" value="<%=memberVO.getMEMBER_EMAIL() %>">
	                <input type="password" id="pass1" name="MEMBER_PASS1" class="find_idpw_textbox"><br>
	            </td>
	        </tr>
	        <tr>
	        	<td class="text2"><span>새로운 비밀번호</span></td>
	        </tr>
	        <tr>
	        	<td>
	        		<input type="password" STYLE="ime-mode: disabled" name="MEMBER_PASS2" placeholder="8자 이상 영문,숫자,특수문자 사용" id="pass2" class="find_idpw_textbox"><br>
	            </td>
	       	</tr>
	       	<tr class="msg" style="display: hidden;">
	       		<td>
	       		<div class="error_next_box" id="pass2Msg" style="display: hidden;" aria-live="assertive"></div>
	       		</td>
	       	</tr>
	       	<tr>
	        	<td class="text2"><span>새로운 비밀번호 확인</span></td>
	        </tr>
	        <tr>
	        	<td>
	        		<input type="password"  STYLE="ime-mode: disabled" id="pass3" class="find_idpw_textbox"><br>
	            </td>
	       	</tr>
	       	<tr class="msg" style="display: hidden;">
	       		<td>
	       		<div class="error_next_box" id="pass2Msg" style="display: hidden;" aria-live="assertive"></div>
	       		</td>
	       	</tr>
	       	<tr>
	       		<td><input type="button" onclick="pw_btn();" class="pw_button" value="비밀번호 변경"></td>
	       	</tr>
	    </table>
    </form>
	</div>
</div>
</body>
</html>