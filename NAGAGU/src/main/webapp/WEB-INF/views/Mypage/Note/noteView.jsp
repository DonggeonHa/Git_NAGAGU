<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "com.spring.note.NoteVO" %>

<%
	NoteVO notevo = (NoteVO)request.getAttribute("notevo");
	int note_num = notevo.getNOTE_NUM();
	int nowpage = Integer.parseInt(request.getParameter("page"));
	String redirection = request.getParameter("redirection");

	System.out.println(nowpage);
	System.out.println(redirection);
	
	SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd  HH:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
    <script src="https://kit.fontawesome.com/b74b42490f.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>

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

    .top_list_return {
        float:right;
        color:#666;
        line-height:24px;
    }

    .content_body {
        min-height:450px;
    }
    
    .note_view {
        width:100%;
        table-layout: fixed;
        border-collapse: collapse;
        border-spacing:0;
        line-height:1.4;
    }

	.note_view .note_info a {
    	font-weight:600;
    	color:#808080;
	}

	.note_view .note_info a:hover {
    	font-weight:600;
    	color:#808080;
	}
	
    .note_view thead {
        font-size:0.8rem;
        line-height:1rem;
    }
    
    .note_view thead th {
        background:#fafafa;
        border-top:1px solid #b3b3b3;
        padding:5px;
    }
    
    .note_view td {
        border-top:1px solid #b3b3b3;
        padding:5px;
    }
    
    .note_view tbody {
    	border-bottom:1px solid #b3b3b3;
    }
    
    .note_view .note_sender {
    	float:left;
    }
    
    .note_view .note_date {
    	float:right;
    	font-size:0.85rem;
    }
    
    .note_view .note_content {
    	min-height:370px;
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
                        <a href="receiveList.nt" id="receiveTab" class="tab_link">받은 쪽지함</a>
                    </li>
                    <li class="tab_item">
                        <span class="div_bar"></span>
                        <a href="sendList.nt" id="sendTab" class="tab_link">보낸 쪽지함</a>
                    </li>
                    <li class="tab_item">
                        <span class="div_bar"></span>
                        <a href="boxedList.nt" id="boxedTab" class="tab_link">쪽지 보관함</a>
                    </li>
                </ul>
            </div>
            <div class="pop_content">
                <div class="content_top">
                    <div class="top_list_opt">
                        <button type="button" class="btn_note" id="btn_boxing" onclick="location.href='noteBoxing.nt?note_num=<%= note_num %>&redirection=<%=redirection%>&page=<%=nowpage%>'">
                            보관
                        </button>
                        <button type="button" class="btn_note" id="btn_delete" onclick="location.href='noteDelete.nt?note_num=<%= note_num %>&redirection=<%=redirection%>&page=<%=nowpage%>'">
                            삭제
                        </button>
                    </div>
                    <div class="top_list_return">
                    	<button type="button" class="btn_note" id="btn_list" onclick="location.href='<%=redirection%>?page=<%=nowpage%>'">
               	목록
               			</button>
                    </div>
                </div>
                <div class="content_body">
                    <table class="note_view">
                        <thead>
                            <tr>
                                <th class="note_title"><%=notevo.getNOTE_TITLE() %></th>
                            </tr>
                        </thead>
                        <tbody>
                        	<tr>
                        		<td class="note_info">
                        			<div class="note_sender"><a href="noteForm.nt?receiver_mail=<%=notevo.getNOTE_SENDER_MAIL()%>&redirection='noteView.nt'"><%=notevo.getNOTE_SENDER_NICK() %></a></div>
                        			<div class="note_date"><%=format.format(notevo.getNOTE_DATE()) %></div>
                        		</td>
                        	</tr>
                            <tr>
                           		<td class="note_content">
                           			<div class="note_content">
                           				<%=notevo.getNOTE_CONTENT() %>
                           			</div>
                           		</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                
            </div>
        </div>
        <div class="pop_footer">
            <a href="" id="btn_close"><i class="fas fa-times"></i>&nbsp;닫기</a>
        </div>
    </div>
   	<script>
   		$("#btn_close").click(function() {
   			window.close();
   		});
   	</script>

	<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>