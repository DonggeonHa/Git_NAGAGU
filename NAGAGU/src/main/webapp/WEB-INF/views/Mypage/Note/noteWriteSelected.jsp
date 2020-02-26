<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.spring.member.MemberVO" %>
<%
	ArrayList<MemberVO> rl = (ArrayList<MemberVO>)request.getAttribute("receiverList");
	String redirection = (String)request.getAttribute("redirection");
	String receiverList = "";
	String receiverPics = "";
	
	for (int a=0; a<rl.size(); a++) {
		MemberVO vo = rl.get(a);
		
		receiverList += vo.getMEMBER_NICK();
		receiverPics += vo.getMEMBER_PICTURE();
		
		if (a < rl.size()-1){
			receiverList += ',';
			receiverPics += ',';
		}
	}
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
    	width:100%;
        font-size:14px;
        line-height:28px;
    }

    .top_form #note_title {
        width:100%;
        height:28px;
        line-height:28px;
        font-size:18px;
        margin-top:10px;
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
        line-height: 20px;
        height:38px;
    }

    .pop_footer #btn_submit {
        float:left;
        width:36px;
        height:20px;
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

    .pop_footer #btn_submit:hover  {background: #f3cb9e;}

    .pop_footer #btn_submit {
        float:left;
        width:50px;
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
    
	.mem_pic {
		width:30px;
		height:30px;
		display:inline-block;
	    border:1px solid #E6E9ED;
	    border-radius:50%;
	}
	
	.btn_receiver {
		border:1px solid #ef900e;
		border-radius:6px;
		background:#ef900e;
		color:white;
		transition:background 0.2s, color 0.2s;
	}
	
	.btn_receiver:hover {
		border:1px solid #ef900e;
		border-radius:6px;
		background:white;
		color:#ef900e;
		transition:background 0.2s, color 0.2s;
	}
	
	.modal-content {
		padding:8px;
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
        <form method="post" id="note_form">
        <div class="pop_body">
            <div class="content_top">
                <table class="top_form">
                	<tr>
                        <th>받는 사람</th>
                        <td>
                        	<div id="receiver-list" class="receiverList">
                        	</div>
                        </td>
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
    </div>
    
    <div class="modal fade bd-example-modal" id="listModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal modal-dialog-centered" role="document">
    		<div class="modal-content">
    		<table class="receiverList">
    			<colgroup>
    				<col width="20%">
    				<col width="65%">
    				<col width="15%">
    			</colgroup>
    			<tbody>
    			<%
    				for (int a=0; a<rl.size(); a++) {
    					MemberVO memvo = rl.get(a);
    			%>
    				<tr id="receiver_<%=a %>">
    			    <input type="hidden" id="mail_<%=a%>" name="receiver_mail" value=<%=memvo.getMEMBER_EMAIL() %>>
    			    <input type="hidden" id="nick_<%=a%>" name="receiver_nick" value=<%=memvo.getMEMBER_NICK() %>>
    					<td class="justify-content-center"><img src=<%=memvo.getMEMBER_PICTURE() %> class="mem_pic justify-content-center"></td>
    					<td><%=memvo.getMEMBER_NICK() %></td>
    					<td><button type="button" class="btn btn_exclude btn_search btn-outline-danger btn-sm" value=<%=a %>>제외</button></td>
    				</tr>	
    			<%
    				}
    			%>
    			</tbody>
    		</table>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
        		</button>
			</div>
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
        		url:"/NAGAGU/selectedWrite.nt",
        		data:params,
        		type:"POST",
        		success:function(e){
        			alertify.success("쪽지 보내기", "쪽지를 보냈습니다");
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
        
        $(document).ready(function() {
        	var receiverCount = <%= rl.size()%>;
        	var rl = '<%=receiverList%>';
        	var rp = '<%=receiverPics%>';
        	
        	var receiverList = rl.split(',');
        	var receiverPics = rp.split(',');
        	
        	function getReceivers() {
            	console.log(receiverList);
            	console.log(receiverPics);
            	var output = '';
            		
            	output += '<div class="row"><div class="col-8"><img src="' + receiverPics[0] + '" class="mem_pic">&nbsp;<b>' + receiverList[0] + '</b> 외 ' + receiverList.length + '명</div>';
                output += '<div class="col-4" style="text-align:right;"><button type="button" class="btn_receiver" data-toggle="modal" data-target="#listModal" aria-haspopup="true" aria-expanded="false">리스트</button></div></div>';
                
                $('#receiver-list').html(output);
        	}
        	
            $(document).delegate('.btn_exclude', 'click', function() {
            	var idx = $(this).attr('value');
            	
            	$('#receiver_'+ idx).remove();
            	receiverList.splice(idx, 1);
            	receiverPics.splice(idx, 1);
            	
            	--receiverCount;
            	
            	if (receiverCount == 0) {
            		alertify.alert('쪽지 보내기', '쪽지를 보낼 회원이 없습니다.', function() {
                        window.close();
            		});
            	}
            	
            	getReceivers();
            });

        	getReceivers();
        });
        
        
    </script>
</body>
</html>