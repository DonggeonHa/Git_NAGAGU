<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.spring.store.Product_qnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	HashMap<String, Object> qnaVO = (HashMap<String, Object>)request.getAttribute("qnaVOmap");
	String PRODUCT_TITLE = (String)qnaVO.get("PRODUCT_TITLE");
	String MEMBER_NICK = (String)qnaVO.get("MEMBER_NICK");
	String MEMBER_PICTURE = (String)qnaVO.get("MEMBER_PICTURE");
	String QNA_PROUDCT = (String)qnaVO.get("QNA_PROUDCT");
	String QNA_DATE = sdf.format((Date)qnaVO.get("QNA_DATE"));
	String QNA_CONTENT = (String)qnaVO.get("QNA_CONTENT");
	System.out.println("QNA_PROUDCT");
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<style>
			img {
			   width: 50px;
			   height: 50px;
			}
		</style>
	</head>
	<body>
		<div>
			<table class="table table-striped">
				<colgroup>
					<col style="width:30%">
					<col style="width:70%">
				</colgroup>
				<tr>
					<th scope="row">상품 후기 상세</th>
					<td></td>
				</tr>
				<tr>
					<th scope="row">상품명</th>
					<td><%=PRODUCT_TITLE %></td>
				</tr>
				<tr>
					<th scope="row">닉네임</th>
					<td><%=MEMBER_NICK %></td>
				</tr>
				<tr>
					<th scope="row">작성 날짜</th>
					<td><%=QNA_DATE %></td>
				</tr>
				<tr style="height:50px;">
					<th scope="row">문의 내용</th>
					<td><%=QNA_CONTENT %></td>
				</tr>
				<tr>
					<th scope="row">답변</th>
					<td><%=QNA_CONTENT %></td>
				</tr>
				<!-- 
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
				</tr> -->
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