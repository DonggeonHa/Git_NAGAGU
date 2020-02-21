<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.spring.store.Product_qnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	HashMap<String, Object> reviewVO = (HashMap<String, Object>)request.getAttribute("reviewVOmap");
	String PRODUCT_TITLE = (String)reviewVO.get("PRODUCT_TITLE");
	String MEMBER_NICK = (String)reviewVO.get("MEMBER_NICK");
	String MEMBER_PICTURE = (String)reviewVO.get("MEMBER_PICTURE");
	String REVIEW_PROUDCT = (String)reviewVO.get("REVIEW_PROUDCT");
	String REVIEW_DATE = sdf.format((Date)reviewVO.get("REVIEW_DATE"));
	String REVIEW_CONTENT = (String)reviewVO.get("REVIEW_CONTENT");
	String REVIEW_FILE = (String)reviewVO.get("REVIEW_FILE");
	
	String imagesExist = "N";
	String[] imgArr;
	int size = 0;
	if(!REVIEW_FILE.equals("#")) {
		imgArr = REVIEW_FILE.split(",");
		size = imgArr.length;
		imagesExist = "Y";
	}
	//이미지 출력 시간 없어서 미룸.............
	
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
					<td><%=REVIEW_DATE %></td>
				</tr>
				<tr style="height:50px;">
					<th scope="row">후기 내용</th>
					<td><%=REVIEW_CONTENT %></td>
				</tr>
<%-- 				<tr>
					<th scope="row">후기 이미지</th>
					<td></td>
				</tr>
				<tr>
				<%
				if(imagesExist.equals("N")) {
				%>	
					<td>
				<% 
					for(int i=0;i<size; i++) {
				%>		
					REVIEW_FILE
				<%
					}
				%>
					</td>
				<%	
				} else {
				%>
					<td>업로드한 이미지가 없습니다.</td>
				<%
				}
				%>
				</tr> --%>
				
			</table>
			<div class="d-flex justify-content-center">
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="window.close();">닫기</button>
			</div>	
		</div>					
		
		<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>