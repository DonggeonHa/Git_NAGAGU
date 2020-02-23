<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import = "com.spring.member.*" %>
<%@ page import = "com.spring.estimate.EstimateOrderVO"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%
	Date nowTime = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	EstimateOrderVO eovo = (EstimateOrderVO)request.getAttribute("eovo");
%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.css">
		
<style>	
	
	.receipt-detail-container {
		width:30%;
        min-width:350px;
	}
    
    .font_change {
        font-size:0.95rem;
        line-height: 0.95rem;
    }
	
</style>

<div class="container receipt-detail-container">
	<div class="text-center">
		<font size="24;">구매완료</font> <br>
		<p>구매가 완료되었습니다</p>
	</div>
	<div>
		<table class="table receipt_output font_change">
			<colgroup>
				<col style="width:25%">
				<col style="width:75%"> 
			</colgroup>
	       	<tr>
	       		<th class="text-left">주문상품</th>
	       		<td class="text-right" width="200px;" >
			  		<a href="estimate_detail?ESTIMATE_NUM=<%= eovo.getES_ORDER_ESTIMATE() %>">
			  			<%= eovo.getES_ORDER_TITLE() %>
			  		</a>
			  	</td>
			</tr>
        	<tr><th class="text-left">제작공방</th><td class="text-right"><%= eovo.getES_ORDER_WORKSHOP() %></td></tr>
	       	<tr><th class="text-left">받는분</th><td class="text-right" width="200px;" ><%= eovo.getES_ORDER_RECEIVER() %></td></tr>
	       	<tr><th class="text-left">주소</th><td class="text-right" width="200px;" ><%= eovo.getES_ORDER_ADDRESS() %></td></tr>
        	<tr><th class="text-left">연락처</th><td class="text-right"><%= eovo.getES_ORDER_PHONE() %></td></tr>
        	<tr><th class="text-left">구매일자</th><td class="text-right"><%= sdf.format(eovo.getES_ORDER_DATE()) %></td></tr>
			<tr><th class="text-left">결제수단</th><td class="text-right"><%= eovo.getES_ORDER_PAYMENT() %></td></tr>
			<tr><th class="text-left">결제금액</th><td class="text-right"><%= eovo.getES_ORDER_PRICE() %> 원</td></tr>
			<tr><th class="text-left">메모</th><td class="text-right"><%= eovo.getES_ORDER_MEMO() %></td></tr>
		</table>
		<div class="col-12 row" style="padding-bottom:5%;">
			<div class="col-6">
				<a href="./index.ma" class="btn btn-outline-dark btn-lg w-100" role="button" aria-pressed="true">메인으로</a>
			</div>
			<div class="col-6">
				<a href="mypage_estimate.my" class="btn btn-outline-warning btn-lg w-100" role="button" aria-pressed="true">주문목록</a>
			</div>
		</div>
	</div>		
</div>

<script>
	$(document).ready(function(){

		/*날짜 형식 변경*/
		function date_format(format) {
		    var year = format.getFullYear();
		    var month = format.getMonth() + 1;
		    if(month<10) {
		       month = '0' + month;
		    }
		    var date = format.getDate();
		    if(date<10) {
		       date = '0' + date;
		    }
		   return year + "-" + month + "-" + date + " " ;
		}
		
	});
</script>
