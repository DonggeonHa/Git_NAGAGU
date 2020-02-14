<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.text.DecimalFormat" %>
<%
	String WORKSHOP_NAME = (String)session.getAttribute("WORKSHOP_NAME");
	ArrayList<HashMap <String, Object>> woList = (ArrayList<HashMap <String, Object>>)request.getAttribute("woList");

	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
	int rnum = ((Integer) request.getAttribute("rnum")).intValue();
	int offerCount = ((Integer) request.getAttribute("offerCount")).intValue();
	
	String MEMBER_EMAIL = (String)session.getAttribute("MEMBER_EMAIL");

	SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd");
	DecimalFormat dfmp = new DecimalFormat("#,###원");
	System.out.println(woList.size());
%>
<style>
	#work_store th, td {
		text-align:center;
	}
</style>
<div id="page-content-wrapper" style="padding-top: 5%;">
	<div class="container-fluid">
        <div class="pb-5">
            <h1>견적 제안 관리</h1>
        </div>
        <div class="d-flex justify-content-between pb-2">
	        <div class="justify-content-start">
	            <button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">전체표시</button>
	            <button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">선택 삭제</button>                         
	            <span class="listnum_txt pt-2">전체 제안내역</span>
	            <span class="listnum_num pt-2"><%=offerCount %>건</span>
	        </div>
	        <div class="justify-content-end">
	        	<div class="d-flex justify-content-end">
		            <!-- Example split danger button -->
		            <div class="dropdown">
		                <button class="btn dropbtn btn-sm dropdown-toggle btn-search-mode" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                   	 선택
		                </button>
		                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		                    <a class="dropdown-item" href="#">식별제목</a>
		                    <a class="dropdown-item" href="#">작성자</a>
		                    <a class="dropdown-item" href="#">상태</a>
		                </div>
		            </div>
		
		            <!-- search -->
		            <nav class="navbar-light bg-light">
		              <form class="form-inline" >
		                <input class="form-control mr-sm-2" type="search" aria-label="Search" style="height:90%">
		                <button class="btn btn_search btn-sm my-2 my-sm-0" type="submit">검색</button>
		              </form>
		            </nav>
	            </div>
	        </div>
        </div>
	    <table class="table" id="work_store">
	        <thead>
	            <tr>
	                <th scope="col" class="th1" ><input id="all_select" type="checkbox"></th>      
	                <th scope="col" class="th2">번호</th>            
	                <th scope="col" class="th3">작성자</th>
	                <th scope="col" class="th4">게시물 제목</th>
	                <th scope="col" class="th6">카테고리</th>
	                <th scope="col" class="th7">제안가격</th>
	                <th scope="col" class="th5">제안날짜</th>
	                <th scope="col" class="th8">상태</th>
	                <th scope="col" class="th9">관리</th>
	                <th scope="col" class="th10">문의</th>
	            </tr>
	        </thead>
	        <tbody>
	        <%
	        	for (int i=0; i<woList.size(); i++) {
	        		HashMap<String, Object> wo = woList.get(i);
	        %>
	            <tr>
	                <td scope="col" ><input type="checkbox"></td>      
	                <th scope="col" ><%=rnum %></th>
	                <td scope="col" ><%=wo.get("ESTIMATE_NICK") %></td>
	                <td scope="col" ><%=wo.get("ESTIMATE_TITLE") %></td>
	                <td scope="col" >
	                <% 
	                String category = (String)wo.get("ESTIMATE_CATEGORY");
	                
	                if (category == "table") { %>책상 
	                <% } else if (category == "chair") {%>의자 
	                <% } else if (category == "bookshelf") {%>책장
	                <% } else if (category == "bed") {%>침대
	                <% } else if (category == "drawer") {%>서랍장
	                <% } else if (category == "sidetable") {%>협탁
	                <% } else if (category == "dressing_table") {%>화장대
	                <% } else {%>기타
	                <% } %>
	                </td>
	                <td scope="col" ><%=dfmp.format(wo.get("OFFER_PRICE")) %></td>
	                <td scope="col" ><%=df.format(wo.get("OFFER_DATE")) %></td>
	                <td scope="col" ><%=wo.get("ESTIMATE_STATE") %></td>
	                <td scope="col">
	                    <button class="btn_detail" onclick="location.href='estimate_detail.es?ESTIMATE_NUM=<%=wo.get("ESTIMATE_NUM")%>'">보기</button>
	                    <button class="btn_modify" value=<%=wo.get("OFFER_NUM") %>>수정</button>
	                    <button class="btn_delete" value=<%=wo.get("OFFER_NUM") %>>삭제</button>
	                </td>
	                <td scope="col">
	                    <button class="btn_note" onclick="window.open('/NAGAGU/noteForm.nt?receive_mail=<%=wo.get("ESTIMATE_MEMBER") %>', '쪽지 보내기', 'width=600 height=700')">쪽지</button>
	                </td>
	            </tr>
	           <% } %>
	         </tbody>
	    </table>
	    <div class="table_bottom">
	        <div class="page_nav">
	            <strong class="current_page">1</strong> 
	            <a href="">2</a>
	            <a href="">3</a>
	            <a href="">4</a>
	            <a href="">5</a>  
	            <a href="">→</a>
	        </div>
	    </div>
    </div>
</div>

<script>
	$(document).ready(function() {
		var all_check = false;

		$("#all_select").click(function() {
			if (all_check == false) {
				$("input[type=checkbox]").prop("checked", true);
				all_check = true;
			} else {
				$("input[type=checkbox]").prop("checked", false);
				all_check = false;
			}

		});

		$("#modform4").click(function() {
			var data = $("mod3").val();
			alert(data);
		});

		function modifyform(num) {
			var id = $('#exam').val();
			var data = $("mod3").val();
			alert(data);
		}

	});
</script>