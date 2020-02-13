<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.member.MemberVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	MemberVO memberVO = (MemberVO)request.getAttribute("MemberVO");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<style></style>
	</head>
	<body>
		<div>
			<table class="table table-striped">
				<colgroup>
					<col style="width:30%">
					<col style="width:70%">
				</colgroup>
				<tr>
					<th scope="row">프로필사진</th>
					<td>
						<img src="<%=memberVO.getMEMBER_PICTURE()%>" style="width: 200px; height: 200px;">
					</td>
				</tr>
				<tr>
					<th scope="row">이름</th>
					<td><%=memberVO.getMEMBER_NAME()%></td>
				</tr>
				<tr>
					<th scope="row">닉네임</th>
					<td><%=memberVO.getMEMBER_NICK()%></td>
				</tr>
				<tr>
					<th scope="row">핸드폰</th>
					<td>
						<%
							if(memberVO.getMEMBER_PHONE() == null) {
						%>
								<font color="gray">아직 입력되지 않았습니다.</font>
						<%
							} else {
						%>
								<%=memberVO.getMEMBER_PHONE()%>
						<%
							}
						%>
					</td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td><%=memberVO.getMEMBER_EMAIL()%></td>
				</tr>
				<tr>
					<th scope="row">주소</th>
					<td>
						<%
							if(memberVO.getADDRESS_ADDRESS1() == null) {
						%>
								<font color="gray">아직 입력되지 않았습니다.</font>
						<%
							} else {
						%>
								<%=memberVO.getADDRESS_ADDRESS1()%>
						<%
							}
						%>
					</td>
				</tr>
				<tr>
					<th scope="row">상세주소</th>
					<td>
						<%
							if(memberVO.getADDRESS_ADDRESS2() == null) {
						%>
								<font color="gray">아직 입력되지 않았습니다.</font>
						<%
							} else {
						%>
								<%=memberVO.getADDRESS_ADDRESS2()%>
						<%
							}
						%>
					</td>
				</tr>
				<tr>
					<th scope="row">가입날짜</th>
					<td><%=memberVO.getMEMBER_DATE()%></td>
				</tr>
			</table>	
			<div class="d-flex justify-content-center">
				<button type="button" class="btn btn-outline-dark btn-lg" onclick="window.close();">닫기</button>
			</div>
		</div>					
		
		<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>