<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	if(session.getAttribute("ADMIN_NUM") == null) {
		out.println("<script>");
		out.println("alert('당신은 어드민이 아닙니다.')");
		out.println("location.href='./index.ma'");
		out.println("</script>");
	}
%>

<!-- 본문 -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<h1>간단한 사이드바</h1>
	</div>
</div>
<!-- /본문 -->
