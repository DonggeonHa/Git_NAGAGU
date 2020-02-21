<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%
	String sender_mail = (String)session.getAttribute("WORKSHOP_EMAIL");
	String receive_mail = (String)request.getAttribute("receive_mail");
	String receive_nick = (String)request.getAttribute("receive_nick");
	String receive_pic = (String)request.getAttribute("receive_pic");
	String redirection = (String)request.getAttribute("redirection");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보내기</title>
<style>
    body {
        min-width:420px;
        padding:0;
        margin:0;
    }

    div {
        display:block;
        padding:0;
        margin:0;
    }

    ul {
        list-style:none;
    }

    a {
        text-decoration: none;
    }
    
    a:hover {
        text-decoration: none;
    }

    .pop_wrapper {
        width:100%;

    }

    .pop_header {
        background-color: #1B1B27;
        border-bottom: 2px solid #ef900e;
        line-height: 26px;
        height:48px;
        padding:7px 25px 10px;
    }

    .pop_body {
        max-width: 960px;
        min-width:320px;
    	padding:0;
    	margin:0 auto;
    }

    .content_top {
        padding:20px 30px 30px 30px;
        border-bottom:1px solid #c3c3c3;
    }

    .top_form {
        font-size:14px;
        line-height:28px;
    }

    .top_form #note_title {
        width:300px;
        height:22px;
    }

    .content_body {
        margin-top:20px;
        padding:20px;
    }

    #note_content {
        width:100%;
        height:320px;
        min-height: 320px;
    }
    
    .pop_title {
        float:left;
        color:#ffffff;
    }

    .pop_title .pop_title_txt {
        font-size:18px;
    }

    .pop_title .pop_title_txt .icon {
        margin-right:8px;
    }
    
    .pop_footer {
        width:100%;
        position:fixed;
        bottom:0;
        background-color: #1B1B27;
        border-top: 1px solid #ef900e;
        line-height: 32px;
        height:38px;
    }

    .pop_footer #btn_submit {
        float:left;
        width:56px;
        height:28px;
        line-height:28px;
        color:white;
	    background: #ef900e;
        border:1px solid #ef900e;
        border-radius: 4px;
        padding: 0 8px;  
        margin:5px;
        font-size: 12px;
        cursor:pointer;
        transition:background 0.2s;
    }

    .pop_footer #btn_submit:hover  {background: #f3cb9e;}

    .pop_footer #btn_return {
        float:left;
        width:34px;
        height:28px;
        color:white;
	    background: #ef900e;
        border:1px solid #ef900e;
        border-radius: 4px;
        padding: 3px 10px;  
        margin:5px;
        font-size: 12px;
        cursor:pointer;
        transition:background 0.2s;
    }

    .pop_footer #btn_return:hover  {background: #f3cb9e;}

    .pop_footer #btn_close {
        float:right;
        position:relative;
        color:white;
        height:24px;
        margin:7px;
        transition:color 0.2s;
        line-height:24px;
        z-index:2;
    }

    .pop_footer #btn_close:hover {
        color:grey;
        cursor:pointer;
    }
    
    .pop_footer #alert_msg {
    	display:none;
        position:relative;
    	width:100%;
    	text-align:center;
    	color:red;
    }
    
</style>
<script src="https://kit.fontawesome.com/b74b42490f.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
	<div class="pop_wrapper">
        <div class="pop_header">
            <div class="pop_title">
                <h1 class="pop_title_txt"><span class="fas fa-envelope-open-text icon"></span>쪽지함</h1>
            </div>
        </div>
        <form method="post" action="notewrite.nt" id="note_form">
        <input type="hidden" name="receiver_mail" value=<%=receive_mail %>>
        <input type="hidden" name="receiver_nick" value=<%=receive_nick %>>
        <div class="pop_body">
            <div class="content_top">
                <table class="top_form">
                    <tr>
                        <th>받는 사람</th>
                        <td><img src="<%=receive_pic%>" width="30" height="30">&nbsp;<%=receive_nick %></td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td>
                            <input type="text" id="note_title" name="note_title">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content_body">
                <textarea id="note_content" name="note_content"></textarea>
            </div>
        </div>
        <div class="pop_footer">
            <div id="btn_submit" class="btn_submit">보내기</div>
            <%
            	if (redirection != null) { 
            %>
            <div id="btn_return" class="btn_return" onclick="history.go(-1)">취소</div>
            <%
            	}
            %>
            <div id="alert_msg"></div>
            <div id="btn_close"><i class="fas fa-times"></i>&nbsp;닫기</div>
        </div>
        </form>
    </div>

    <script>
    	var obj = $("#alert_msg");
        $("#btn_close").click(function() {
            window.close();
        });
        
        $("#btn_submit").click(function() {

        	if ($("#note_title").val()=="") {
        		showErrMsg("제목을 입력해주세요");
        		return false;
        	}
        	
        	if ($("#note_content").val()=="") {
        		showErrMsg("쪽지 내용을 입력해주세요");
        		return false;
        	}
        	
        	obj.hide();
        	sendNote();
        });
        
        function sendNote() {
        	var params = $("#note_form").serialize();
        	
        	$.ajax({
        		url:"/NAGAGU/notewrite.nt",
        		data:params,
        		type:"POST",
        		success:function(e){
        			alert("쪽지를 보냈습니다");
        			window.close();
        		},
        		error: function(e) {
        			console.log(e);
        		}
        	});
        }
        
        function showErrMsg(msg) {
            obj.html(msg);
            obj.show();
        }
        
    </script>
</body>
</html>