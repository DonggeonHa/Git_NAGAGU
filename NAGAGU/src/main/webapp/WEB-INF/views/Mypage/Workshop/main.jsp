<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("WORKSHOP_NUM")==null){
		
		response.sendRedirect("/index.ma");
	}
%>

<!-- 작업 구역 -->
<div id="page-content-wrapper" style="padding-top: 2%;">
	<div class="container-fluid">
    	공방관리센터 메인페이지 다시
    </div>
</div>