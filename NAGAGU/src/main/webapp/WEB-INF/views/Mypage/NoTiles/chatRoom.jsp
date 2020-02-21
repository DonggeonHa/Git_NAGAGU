<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.spring.chat.MessageVO" %>
<%@ page import = "com.spring.chat.ChatRoomVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<% 
	String mem_mail = (String)session.getAttribute("MEMBER_EMAIL");
	String mem_nick = (String)request.getAttribute("MEMBER_NICK");
	String mem_pic = (String)request.getAttribute("MEMBER_PICTURE");
	int chatroom_num = (int)request.getAttribute("CHATROOM_NUM");
	System.out.println("chat.jsp & " + chatroom_num);
	ArrayList<MessageVO> msgList = (ArrayList<MessageVO>)request.getAttribute("MSGLIST");
	ChatRoomVO chatvo = (ChatRoomVO)request.getAttribute("chatvo");
	
%>

<style>
	* {
		box-sizing:border-box;
	}
	
	div {
		display:block;
		margin:0;
		padding:0;
	}
	
	body {
		font-size:12px;
		color:#72777a;
		letter-spacing:.2px;
		margin:0;
		padding:0;
	}
	
	#main-container{
		width:400px;
		height:700px;
		display: inline-block;
	}
	
	#chat-container {
		width:400px;
		height:700px;
		max-height:1024px;
	}
	
	#output{
		max-height:1024px;
		display: inline-block;
		width:100%;
		height:100%;
		overflow: hidden;
		vertical-align: bottom;
		min-height: 400px;
		overflow: scroll;
		overflow-x:hidden;
		overflow-y:auto;
		background: #f2f3f5;
	}
	
	.input_area {
		line-height:1.5;
		position:relative;
		border:1px solid #eeeeee;
	}
	
	#input {
		width:100%;
		padding:0.4rem 0.75rem;
		font-size:0.9rem;
		line-height:1.5;
		color:#495057;
		background:white;
		border:1px solid #ced4da;
		border-radius:10em;
	}
	
	#btn_submit {
		display:inline-block;
		font-weight:400;
		text-align:center;
		vertical-align:middle;
		user-select:none;
		border:1px solid transparent;
		font-size:0.9rem;
		line-height:1.5;
		border-radius:50%;
		width:2.1rem;
		height:2.1rem;
		right:1px;
		top:1px;
		padding:0 !important;
		position:absolute;
		overflow:visible;
		color:white;
		background:#2196f3;
		border-color:#2196f3;
	}
	
	.msg_header {
		height:30px;
	}
	
	.profile_img {
		width:30px;
		height:30px;
		display:inline-block;
	}
	
	.profile_nick {
		display:inline-block;
		font-size:14px;
		font-weight:600;
		margin:0 5px;
		bottom:0;
	}
	
	.mem_pic {
		width:30px;
		height:30px;
		display:inline-block;
	}
	
	p {
		margin:0;
		padding:0;
	}
	
	.chat-box {
		width:100%;
		margin:5px;
	}
	
	.my-chat-box {
		width:29
		0px;
		text-align:right;
		margin:5px;
	}
	
	.chat{
			font-size:14px;
			color:black;
			margin: 5px 10px;
			min-height: 20px;
			padding: 8px;
			min-width: 50px;
			text-align: left;
	        height:auto;
	        width:auto;
	        word-break : break-all;
	        background: #ffffff;
	        border-radius: 10px 10px 10px 10px;
		}
	
	
	.my-chat{
		background: #F7E600;
		border-radius: 10px 10px 10px 10px;
	}
	
	.chat-info {
		font-size:0.75rem;
		margin: 0 15px;
	}
</style>

<div class="container d-flex justify-content-center">
	<div id="main-container">
		<div id="chat-container">
			<div id="output"></div>
		</div>
		<div class="input_area">
			<input type="text" id="input" placeholder="input message..." size="55">
			<button id="btn_submit"><i class="far fa-paper-plane"></i></button>
		</div>
	</div>
</div>
	
	
<script type="text/javascript">

var output = $('#output');

	$(function(){
		$('#input').keydown(function(key){
			if(key.keyCode == 13){
				$('#input').focus();
				if ($('#input').val() == "") {
					return false;
				}
				send();
			}
		});
		
		$('#btn_submit').click(function(){
			if ($('#input').val() == "") {
				return false;
			}
			send();
			$('#input').focus();
		});
		
	})
	
	var chatarea = $("#output");
	
	w = new WebSocket("ws://localhost:8000/NAGAGU/broadcasting.do");
	w.onopen = function() {
		alertify.alert("채팅방에 입장했습니다.");
	}
	
	w.onmessage = function(e) {
		var msgOrg = e.data;
		
		var msgArr = msgOrg.split(",");
		var mailLength = msgArr[0].length+1;
		
		var msg = msgOrg.substring(mailLength);
		
		var receive_header = msgArr[1];
		var cutLength = msgArr[0].length + msgArr[1].length + 2;
		var receive_content = msgOrg.substring(cutLength);
		
		var date = new Date();
		var dateInfo = null;
		
		var hour = date.getHours();
		var minutes = date.getMinutes();
		
		if (minutes < 10) {
			minutes = '0' + minutes;
		}
		
		if (hour > 12) {
			var pmhour = hour - 12;
			dateInfo = "PM " + pmhour + ":" + minutes;
		}
		else {
			dateInfo = "AM " + hour + ":" +minutes;
		}

		if (msgArr[0] == "<%=mem_mail%>") {
			msgEnd = "<div class='my-chat-box'>" + receive_header + "<div class='chat my-chat'>" + receive_content + "</div><div class='chat-info'>" + dateInfo + "</div></div><br>";
		}
		else {
			msgEnd = "<div class='chat-box'>" + receive_header + "<div class='chat'>" + receive_content + "</div><div class='chat-info'>"+ dateInfo +"</div></div>";
		}
		var chat = "<div class='chat-box'>" + receive_header + "<div class='chat'>" + receive_content + "</div><div class='chat-info'>"+ dateInfo +"</div></div>";
		
		output.append(msgEnd);
		output.scrollTop(output[0].scrollHeight);
	}
	
	w.onclose = function(e) {
		alert(e.data);
	}
	
	w.onerror = function(e) {
		alert(e.data);
	}
	
	function send() {
		var date = new Date();
		var dateInfo = null;
		
		var hour = date.getHours();
		
		if (hour > 12) {
			var pmhour = hour - 12;
			dateInfo = "PM " + pmhour + ":" + date.getMinutes();
		}
		else {
			dateInfo = "AM " + hour + ":" + date.getMinutes();
		}
		
		
		
		var input = document.getElementById("input").value;
		
		var msg_header = "<div class='msg_header'><div class='profile_img'><img src=<%=mem_pic%> class='mem_pic'></div><div class='profile_nick'><%=mem_nick%></div></div>"; 
		/* 프로필 이미지와 닉네임이 들어갈 헤더 */
		var msg_content = "<p>" + input + "</p>"; /* 메시지 내용 */
		var sendMsg = "<%=mem_mail%>" + "," + msg_header + "," + msg_content; 
		/* 누구의 메시지인지 구분해줄 메일주소와 헤더, 내용을 더해 전송 */

		w.send(sendMsg);
		
		document.getElementById("input").value = "";
		
		/* 데이터베이스에 저장하기위해 ajax로 전송할 데이터 객체 생성 */
		
		var obj = new Object();
		obj.MSG_CHATROOM_NUM = <%=chatroom_num%>;
		obj.MSG_CONTENT = sendMsg;
		obj.MSG_DATE = dateInfo;
		
		var jsonData = JSON.stringify(obj); /* json으로 변환 */
		
		$.ajax ({
			url:"/NAGAGU/sendChat.ch",
			type:"POST",
			data:jsonData,
			contentType:'application/json; charset=UTF-8',
			success: function(data) {
				console.log(data.res);
			},
			error: function(data) {
				console.log(data.res);
			}
		});
	}
	
	$(document).ready(function(){
		
		/* 예전 채팅 기록 불러오기 */
		<%
			for (int i=0; i<msgList.size(); i++) {
		%>
				var msgEnd;
				
		<%
				MessageVO ml = (MessageVO)msgList.get(i);
				String content = ml.getMSG_CONTENT();
				String date = ml.getMSG_DATE();
		%>
				var dateInfo = "<%=date%>";
				
				var msgOrg = "<%=content%>";
				var msgArr = msgOrg.split(",");
				
				var receive_header = msgArr[1];
				var cutLength = msgArr[0].length + msgArr[1].length + 2;
				var receive_content = msgOrg.substring(cutLength);
				
				if (msgArr[0] == "<%=mem_mail%>") {
					msgEnd = "<div class='my-chat-box'>" + receive_header + "<div class='chat my-chat'>" + receive_content + "</div><div class='chat-info'>" + dateInfo + "</div></div><br>";
				}
				else {
					msgEnd = "<div class='chat-box'>" + receive_header + "<div class='chat'>" + receive_content + "</div><div class='chat-info'>"+ dateInfo +"</div></div>";
				}
				$("#output").append(msgEnd);
		<%
			}
		%>
		
		output.scrollTop(output[0].scrollHeight);
	});
</script>