<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no,width=device-width, initial-scale=1.0" />

<title>Insert title here</title>


<style type="text/css">
/* 초기화 */
* {margin:0px; padding:0px;}
ul,ol,li {list-style:none;}
a {text-decoration:none; outline:0;}
img {vertical-align:top;}

/* 아이디/비밀번호 찾기 */
.find_content{
    margin: auto;
    text-align: center;
}

.find_idpw_table td{
    padding: 0px 10px 12px 10px;
}

.find_idpw_table{
    text-align: center;
    margin: auto;
    width: 300px;
    border: 1px solid #aaaaaa;
    border-collapse: collapse;
    height: 250px;
}

.find_idpw_textbox{
    margin: 15px 5px -5px 5px;
    padding-left: 5px;
    width: 285px;
    height: 30px;
    border: 1px solid #aaaaaa;
}
.find_idpw_text1{
    vertical-align: bottom;
    margin: 15px 2px 0px 2px;
    /* background-color: #EEEEEE; */
    /* 분홍 계열 */
    background-color: #EEEEEE;
    /* 하늘 계열 */
    /* background-color: rgb(237, 245, 250); */
    height: 30px;
    font-size: 13px;
}
.text2{ /*본인인증 웅앵 부분*/
    margin : 20px 10px 0px 5px;
    font-size: 12px;
    color: #999999;
}

.find_idpw_button{
    font-size: 13px;
    width: 290px;
    height: 45px;
    border-radius: 3px;
    border: 1px solid white; 
    /* 파란 계열 */
    /* background-color: #8FB0CA;  */
    /* 분홍 계열 */
    background-color: #3a4b58; 
    color: white; 
    outline: 0;
}

.find_idpw_button:hover{
    background-color: #1B1B27; 
}

.find_login_join_table{
    text-align: center;
    margin: auto;
    width: 300px;
    padding: 10px 0px 0px 0px;
    font-size: 13px;
}

.two_form {
	margin: 0 auto;
	justify-content: center;
}
</style>
</head>
<body>
<nav id="nav_bar"></nav>

    <div class="login_bg" id="login_box"></div>

    <section id="container">
     <br /><br />
        <br>
        <div id="main">
    <!-- <section class="content"> -->
        <div class="find_content">
            <br />
            <p style="margin: 18px 0 16px 14px; font-size: 24px;">
                이메일/비밀번호 찾기
            </p>
        </div>
        <br>
        <br>
        <br />
   <div class="two_form" style="display: flex;">
   <form id="find_id_form" action="FindMemberId.ma" method="post">
    <table class="find_idpw_table">
        <tr>
            <td class="find_idpw_text1">이메일 찾기</td>
        </tr>
        <tr>
            <td>
                <input type="text" placeholder="이름" name="MEMBER_NAME" id="find_id_name" class="find_idpw_textbox"><br>
                <input type="text" name="MEMBER_PHONE" STYLE="ime-mode: disabled" placeholder="휴대폰(-)제거 후 입력" id="find_id_email" class="find_idpw_textbox"><br>
                <p class="text2"> 가입시 입력한 이름과 휴대폰 번호 입력.</p><br>
                <input type="button" onclick="find_id_btn();" class="find_idpw_button" value="이메일 주소로 아이디 전송">
            </td>
        </tr>
    </table>
    </form>
     <div style="width: 115px;"></div>
    <br>
   <form id="find_pw_form" name="find_pw_form" action="FindMemberPw.ma" method="post">
    <table class="find_idpw_table">
        <tr>
            <td class="find_idpw_text1">비밀번호 찾기</td>
        </tr>
        <tr>
            <td>
                <input type="text"  placeholder="이름" id="find_pw_name" name="MEMBER_NAME" class="find_idpw_textbox"><br>
                <input type="text"  STYLE="ime-mode: disabled" name="MEMBER_EMAIL" placeholder="가입한 이메일 주소" id="find_pw_email" class="find_idpw_textbox"><br>
                <p class="text2"> 입력한 이메일 확인 후, 주어진 링크를 클릭하면 &nbsp;비밀번호 변경 창이 나옵니다.</p><br>
                <input type="button" onclick="find_pw_btn();" class="find_idpw_button" value="비밀번호 변경 메일 전송">
            </td>
        </tr>
    </table>
    </form>
   </div>
    <br /><br /><br /><br /><br /><br /><br />
</div>
    </section>
<script type="text/javascript">
function find_pw_btn(){
	document.find_pw_form.submit();
}
</script>
</body>
</html>