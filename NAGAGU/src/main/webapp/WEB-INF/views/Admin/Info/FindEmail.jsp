<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.member.MemberVO" %>
<%
	MemberVO memberVO = (MemberVO)request.getAttribute("memberVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#daumHead h1 {
    padding: 30px 0 52px;
    font-size: 38px;
    font-weight: bold;
    line-height: 40px;
    letter-spacing: -1px;
    text-align: center;
    margin: 0 auto;
}
#daumServiceLogo {
    display: block;
    width: 225px;
    height: 44px;
    margin-left: 182px;
    background: url(https://t1.daumcdn.net/id/member/2014/img_logo_find_140905.gif) no-repeat 0 0;
}
.ir_wa {
    display: block;
    position: relative;
    width: 100%;
    height: 100%;
    overflow: hidden;
    z-index: -1;
}
.find_result {
    padding: 35px 0;
}
.find_result_desc {
    margin: 7px 0 0;
    font-size: 16px;
    line-height: 22px;
    text-align: center;
    color: #333;
}
.find_result+.find_footer {
    margin-top: 36px;
}
.find_footer {
    margin-top: 20px;
    padding-top: 7px;
    border-top: 1px solid #d7d7d7;
}
.find_footer_desc {
    font-size: 11px;
    color: #999;
    line-height: 18px;
    text-align: center;
}
.find_footer_desc a {
    text-decoration: underline;
    color: #999;
    font-weight: bold;
}
.btn_enter{
	font-size: 13px;
    width: 100px;
    height: 37px;
    border-radius: 3px;
    border: 1px solid white;
    /* background-color: #8FB0CA; */
    background-color: #3a4b58;
    color: white;
    outline: 0;
}
</style>
</head>
<body>
<div id="daumHead">
        <h1>
            <a href="#" id="daumServiceLogo"><span class="ir_wa">아이디찾기</span></a>
        </h1>
</div>
<div id="js_result_suc"> 
	<div class="find_result">
		<!--<i class="find_success_img"></i>-->
	    <p class="find_result_desc">고객님의 아이디는 <span style="font-weight: bold;"><%=memberVO.getMEMBER_EMAIL() %></span>입니다.</p>
	</div>
	<div class="find_footer">
		<p class="find_footer_desc"><i></i>비밀번호가 기억나지 않는 경우에는 <a href="./FindMember.ma">비밀번호 찾기</a>를 이용해 주세요.</p>
	   	<div style="text-align: center; margin-top: 22px;"><input class="btn_enter" type="button" value="확인"></div>
	</div>
</div>
<div id="js_result_fail" style="display:none;">	
	<div class="find_result">
		<!--<i class="find_error_img"></i>-->
		<p class="find_result_desc">입력하신 정보로 등록된 회원이 없습니다.<br><em>정보를 다시 확인</em>하시고 시도해주세요.</p>
	</div>
	<div class="find_footer">
		<p class="find_footer_desc"><i></i>본인 인증시 제공되는 정보는 인증 이외의 용도로 이용 또는 저장하지 않습니다.</p>
		<p class="find_footer_desc"><i></i>인증문자/이메일이 발송되지 않을 경우 ‘NAGAGU’연락처가 스팸으로 분류되어 있는지 확인 바랍니다.</p>
	    <a id="btnFailConfrim" class="find_footer_btn" style="cursor:pointer"><span>확인</span></a>
	</div>
</div>
</body>
</html>