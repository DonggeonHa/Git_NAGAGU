<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "com.spring.note.NoteVO" %>

<%
	ArrayList<NoteVO> sendList = (ArrayList<NoteVO>)request.getAttribute("sendList");
	int countSend = ((Integer)request.getAttribute("countSend")).intValue();
	int countSendNotRead = ((Integer)request.getAttribute("countSendNotRead")).intValue();
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
	String mem_mail = (String)session.getAttribute("mem_mail");
	String redirection = "sendList.nt";
	
	SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>받은 쪽지함</title>
    <script src="https://kit.fontawesome.com/b74b42490f.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>

<style>
    body {
        min-width:320px;
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
    	padding:0;
    	margin:0;
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

    .pop_tabs {
        height:36px;
        font-size:1.1rem;
        font-weight:700;
        line-height:24px;
        text-align:center;
        border-bottom:1px solid #1B1B27;
        background:#fafafa;
    }

    .pop_tabs .tab_list {
        background:#fafafa;
        border:1px solid #e6e6e6;
        border-bottom-width:0;
    }

    .pop_tabs .tab_item {
        width:144px;
        height:36px;
        float:left;
    }

    .pop_tabs .selected {
        font-size:1.1rem;
        height:35px;
        position:relative;
        border:1px solid #343434;
        border-bottom-width: 0;
        background:white;
    }

    .pop_tabs .tab_link {
        display:block;
        padding:5px 4px;
        color:#000;
        transition:background 0.2s, transform 0.1s, border 0.2s;
    }

    .pop_tabs .tab_link:hover {
        transform:scale(1.05);
        background:#d4d4d4;
        text-decoration:none;
        border:1px solid #343434;
        border-bottom: 1px solid white;
        z-index:1;
    }

    .pop_tabs .div_bar {
        float:left;
        width:1px;
        height:16px;
        background:#e6e6e6;
        margin:9px 0 0 -1px;
    }

    .pop_tabs .selected .div_bar {
        display:none;
    }

    .content_top {
        font-size:0.8rem;
        padding:5px 3px 0 3px	;
        margin-bottom:9px;
        height:25px;
    }

    .top_list_opt {
        float:left;
    }

    .top_list_opt .btn_note {
        margin-right:2px;
    }

    .btn_note {
        font-weight:700;
        line-height:16px;
        padding:4px 8px 0;
        overflow:visible;
        height:24px;
        display:inline-block;
        text-decoration: none;
        border:1px solid #b3b3b3;
        color:#333;
        cursor:pointer;
    }

    .top_list_info {
        float:right;
        color:#666;
        line-height:24px;
    }

    .top_list_info .note_new {
        color:#ef900e;
    }

    .content_list {
        height:450px;
    }

    .note_list {
        width:100%;
        table-layout: fixed;
        border-collapse: collapse;
        border-spacing:0;
        line-height:1.4;
    }

    .note_list col.check {
        width:33px;
    }

    .note_list col.sender {
        width:125px;
    }

    .note_list col.date {
        width:96px;
    }

    .note_list col.receive {
        width:80px;
    }

    .note_list thead {
        text-align:center;
        font-size:0.8rem;
        line-height:1rem;
    }

    .note_list thead th {
        background:#fafafa;
        border-top:1px solid #b3b3b3;
        padding:5px 0;
    }

    .note_list td {
        border-top:1px solid #b3b3b3;
        text-align:center;
    }
    
    .note_list a {
    	font-weight:600;
    	color:#808080;
    }
    
    .note_list a:hover {
    	font-weight:600;
    	color:#808080;
    }
    
    .note_list tbody {
    	border-bottom:1px solid #b3b3b3;
    }
    
    .note_list .note_chk {
    	margin-top:5px;
    }
    
    .note_list .note_date {
    	font-size:0.75rem;
    }

    .note_list .no_result {
        color:#666;
        font-size:0.8rem;
        line-height:1rem;
        text-align:center;
        padding:0;
        margin-bottom:25px;
    }

    .note_list .no_note_area {
        padding:90px 0 88px;
    }
    
    .unread {
    	color:#ef900e;
    }
    
    .read {
    	color:#333;
    }
    
    .readChk {
    	width:20px;
    	height:20px;
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

    .pop_footer #btn_close {
        float:right;
        color:white;
        height:20px;
        margin:10px;
        transition:color 0.2s;
    }
    
    .pop_footer #btn_close:hover {
        color:grey;
    }
    
</style>
</head>
<body>
    <div class="pop_wrapper">
        <div class="pop_header">
            <div class="pop_title">
                <h1 class="pop_title_txt"><span class="fas fa-envelope-open-text icon"></span>쪽지함</h1>
            </div>
        </div>
        <div class="pop_body">
            <div class="pop_tabs">
                <ul class="tab_list">
                    <li class="tab_item">
                        <span class="div_bar"></span>
                        <a href="receiveList.nt" class="tab_link">받은 쪽지함</a>
                    </li>
                    <li class="tab_item selected">
                        <span class="div_bar"></span>
                        <a href="sendList.nt" class="tab_link">보낸 쪽지함</a>
                    </li>
                    <li class="tab_item">
                        <span class="div_bar"></span>
                        <a href="boxedList.nt" class="tab_link">쪽지 보관함</a>
                    </li>
                </ul>
            </div>
            <div class="pop_content">
                <div class="content_top">
                    <div class="top_list_opt">
                        <button type="button" class="btn_note" id="btn_delete">
                            선택 삭제
                        </button>
                    </div>
                    <div class="top_list_info">
                    <%
                    	if (countSendNotRead>0) {
                    %>
                        <strong class="note_new">
                            수신 미확인
                            <span class="note_num" id="count_new"> <%=countSendNotRead %> 개&nbsp; </span>
                        </strong>
                    <%
                    	}
                    %>
                        <strong class="note_total">
                            전체
                            <span class="note_num" id="count_total"> <%=countSend %>개 </span>
                        </strong>
                    </div>
                </div>
                <div class="content_list">
                    <table class="note_list">
                        <colgroup>
                            <col class="check">
                            <col class="receiver">
                            <col class="title">
                            <col class="date">
                            <col class="receive">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col" class="check"><input type="checkbox" id="all_select" class="note_chk"></th>
                                <th scope="col" class="receiver">받는사람</th>
                                <th scope="col" class="title">제목</th>
                                <th scope="col" class="date">보낸날짜</th>
                                <th scope="col" class="receive">수신확인</th>
                            </tr>
                        </thead>
                        <tbody>
                        <form id="selectForm" method="post">
                        <input type="hidden" name="page" value=<%=nowpage %>>
                        <input type="hidden" name="redirect" value=<%=redirection %>>
                        	<%
                        	if (countSend == 0) {
                        	%>
                        		<tr>
                        			<td class="no_result" colspan=5>
                        				<div class="no_note_area">보낸 쪽지가 없습니다</div>
                        			</td>
                        		<tr>
                        	<%
                        	} else {
                        		for (int i=0; i<sendList.size(); i++) {
                            		NoteVO nl = (NoteVO)sendList.get(i);
                            		int read = nl.getNOTE_READCOUNT();
                        	%>
                        		<tr>
                        			<td><input type="checkbox" class="note_chk" name="chk" value=<%=nl.getNOTE_NUM() %>></td>
                        			<td><a href="noteForm.nt?receive_mail=<%=nl.getNOTE_RECEIVER_MAIL()%>&redirection=<%=redirection%>"><%=nl.getNOTE_RECEIVER_NICK() %></a></td>
                        			<td><a href="noteView.nt?note_num=<%=nl.getNOTE_NUM()%>&page=<%=nowpage%>&redirection=<%=redirection%>"><%=nl.getNOTE_TITLE() %></a></td>
                        			<td class="note_date"><%=format.format(nl.getNOTE_DATE()) %></td>
                        	<%
                        			if (read == 0) {
                        	%>
                        			<td><i class="fas fa-envelope unread readChk"></i></td>
                        	<%
                        			} else {
                        	%>
                        			<td><i class="fas fa-envelope-open read readChk"></i></td>
                        	<%
                        			}
                        		}
                        	}
                        	%>
                        </form>    
                        </tbody>
                    </table>
                </div>
                <div class="row justify-content-center">
					<div class="pagination">
					<%
						if(nowpage>3) {
					%>
					  <a href="note/receiveList.nt?page=<%=nowpage-3 %>">&laquo;</a>
					<%
						}
					
						for (int i=startpage; i<=endpage; i++) {
							if (i==nowpage) {
					%>	
					  	<p class="nowpage"><%= i %>
					<%
							} else {
					%>
						<a href="note/receiveList.nt?page<%=i %>"><%=i %></a>
					<% 
							} 
						}
						
						if (nowpage < maxpage) {
					%>
					  <a href="note/receiveList.nt?page=<%=nowpage+3 %>">&raquo;</a>
					<%
						}
					%>
					</div>
				</div>
            </div>
        </div>
        <div class="pop_footer">
            <a href="" id="btn_close"><i class="fas fa-times"></i>&nbsp;닫기</a>
        </div>
    </div>
    
    <script>
	    function setSelect() {
	        if ($("#all_select").is(":checked")) {
	               $("input[type=checkbox]").prop("checked", true);
	        } else {
	                $("input[type=checkbox]").prop("checked", false);
	        }
		}
	    
	    function checkSelect() {
	        
	        if ($("input[name='chk']:checked").length == $("input[name='chk']").length) {
	            $("#all_select").prop("checked",true);
	        }
	        else {
	            $("#all_select").prop("checked",false);
	        }
	        
	        return true;
	   	}
	    
	    $("#btn_boxing").click(function(){
	    	if ($("input[name='chk']:checked").length==0) {
	    		return false;
	    	}
	    	$("#selectForm").attr("action", "noteBoxing.nt");
	    	$("#selectForm").submit();
	    });

	    $("#btn_delete").click(function(){
	    	$("#selectForm").attr("action", "noteDelete.nt");
	    	$("#selectForm").submit();
	    });
	        
	    $(document).ready(function(){
	        $("#all_select").prop("checked",false);
	        setSelect();
	            
	        $("#all_select").click(function() {
	             setSelect();
	        });
	        
	        $("input[name='chk']").click(function() {
	             checkSelect();
	        });
	    });
   		
   		$("#btn_close").click(function() {
   			window.close();
   		});
    </script>
    
    <script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>