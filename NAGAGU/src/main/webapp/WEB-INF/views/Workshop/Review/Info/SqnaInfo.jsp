<%@page import="com.spring.store.Product_qnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	Product_qnaVO qnaVO = (Product_qnaVO)request.getAttribute("qnaVO");
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
						<img src="<=memberVO.getWORKSHOP_PICTURE()%>" style="width: 200px; height: 200px;">
					</td>
				</tr>
				<tr>
					<th scope="row">공방명</th>
					<td><=memberVO.getWORKSHOP_NAME()%></td>
				</tr>
				<tr>
					<th scope="row">대표자</th>
					<td><=memberVO.getWORKSHOP_CEO_NAME()%></td>
				</tr>
				<tr>
					<th scope="row">사업자번호</th>
					<td><=memberVO.getWORKSHOP_LICENSE()%></td>
				</tr>
				<tr>
					<th scope="row">핸드폰</th>
					<td><=memberVO.getWORKSHOP_PHONE()%></td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td><=memberVO.getWORKSHOP_EMAIL()%></td>
				</tr>
				<tr>
					<th scope="row">우편번호</th>
					<td><=memberVO.getWORKSHOP_ZIP()%></td>
				</tr>
				<tr>
					<th scope="row">주소</th>
					<td><=memberVO.getWORKSHOP_ADDRESS1()%></td>
				</tr>
				<tr>
					<th scope="row">상세주소</th>
					<td><=memberVO.getWORKSHOP_ADDRESS2()%></td>
				</tr>
				<tr>
					<th scope="row">가입날짜</th>
					<td><=memberVO.getWORKSHOP_DATE()%></td>
				</tr>
				<tr>
					<th scope="row">소개글</th>
					<td><=memberVO.getWORKSHOP_INTRO()%></td>
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