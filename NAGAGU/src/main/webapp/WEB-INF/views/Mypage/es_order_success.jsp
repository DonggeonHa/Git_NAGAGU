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
	.Precautions dl dd {
		font-size: 1rem;
	}
	
	#subject {
		font-size: 1.5rem;
	}
	.hr-class {
		width: 100%;
		color: #f6f6f6;
		margin-top: 100px;
		margin-bottom: 100px;
	}
	
	.order-body {
		font-family: '만화진흥원체', 'KOMACON', KOMACON;
		font-size: 15px;
	}
	
	.sticky {
		padding-top: 2%;
		z-index:2;
		position: -webkit-sticky;
		position: sticky;
		background-color: #FFFFFF;
		top: 0;
	}
	
	.sticky2 {
		z-index:2;
		position: -webkit-sticky;
		position: sticky;
		background-color: #FFFFFF;
		top: 20px;
	}
	
	.nav-item .nav-link {
		color: #9d9d9d;
	}
	
	.comments_table {
		font-size: 1rem;
	}
	
	@media ( max-width : 700px) {
		.comments_table {
			font-size: 0.7rem;
		}
	}
	input#minus, input#plus {
		border-radius: 70px;
		width: 30px;
		margin: 0 10px;
		background-color: #1b1b27;
		color: white;
		border: none;
	}
	
	/* Reservation 부분 =====================================================   */
	
	/* Modal 부분 ===========================================================   */
	.reservation-container {
		margin-top: 100px;
		margin-bottom: 100px;
	}
	
	.solid {
		border: 2px solid #8C92A0;
	}
	
	#class_title {
		margin-top: 4%;
		font-size: 2em;
		font-weight: bolder;
	}
	
	#detail {
		margin-bottom: 3%;
	}
	
	#progress_time {
		font-weight: bolder;
		font-size: large;
		margin-bottom: 10px;
	}
	
	#calendar {
		color: green;
	}
	
	.center {
		text-align: center !important;
	}
	
	.nav-link.active {
		background-color: #EAEAEA !important;
	}
	
	.mbody {
		padding: 2rem !important;
	}
	
	.mheader {
		padding: 2rem !important;
	}
	
	.group {
		margin-top : 30px;
	}
	.main-output img{
		width : 100%;
		height: auto;
	}
	.main-output {
		font-weight: 700;
		margin-top: 15px;
	}
	.each-row {
		margin-bottom: 15px;
	}
	.each-row img {
		width: 150px;
		height: 150px;
	}
	.each-row a, .each-row a:link, .each-row a:hover {
		text-decoration: none !important;
		color: black !important;
	}
    .category *{
        align-self: center;
        text-align: center;
        color: rgb(0, 0, 0, 0.6);  
    }
	 .basic_price, .shipPrice, .chongprice {
		margin-bottom: 0;
		margin-top: 10px;
	}
	.category{
		padding-bottom: 10px;
		padding-top: 10px;
		background-color: rgba(239,144,14,0.3);
	}.category *{
		align-items: baseline;
		text-align: center;
	}
	.values *{
		text-align: center;
		line-height:42px;
		height:42px;
	}
	.amount,.basic_price{
		margin-top: 0;
	}
	.totalShipPrice,.totalPayPrice,.totalPrice{
		padding-right:25px !important;
	}
	.font_change{
		font-size:1.2rem !important; 
	}
    .price_wrap div{
    	margin-top: 0px;
    }
	
</style>

<div class="container class-detail-container">
	<div class="text-center">
		<font size="24;">구매완료</font> <br>
		<p>구매가 완료되었습니다</p>
	</div>
	<div>
		<table class="table main-output">
			<div class="col-12 row each-row">
	    		<div class="col-1"></div>
				<div class="col-10">
					<div class="row category">
					    <div class="col-3">상품명</div>
				    	<div class="col-3">제작 공방</div>
					    <div class="col-3">가구 종류</div>
		    			<div class="col-3">금액</div>
		            </div>
		            <div class="row values">
			  			<div class="col-3">
			  				<a href="estimate_detail?ESTIMATE_NUM=<%= eovo.getES_ORDER_ESTIMATE() %>">
			  			    	<b><%= eovo.getES_ORDER_TITLE() %></b>
			  			    </a>
		  			    </div>
		  				<div class="col-3"><%= eovo.getES_ORDER_WORKSHOP() %></div>
		  				<div class="col-3"><%= eovo.getES_ORDER_CATEGORY() %></div>
		  				<div class="price_wrap text-right col-3" style="font-size:1.2rem;">
		  					<%= eovo.getES_ORDER_PRICE() %> 원
						</div>
					</div>
				</div>
	    		<div class="col-1"></div>
			</div>
		</table>
		<table class="table sub_output font_change">
			<colgroup>
				<col style="width:40%">
				<col style="width:40%"> 
			</colgroup>
	       	<tr><th class="text-left">주소</th><td width="200px;" ><%= eovo.getES_ORDER_ADDRESS() %></td></tr>
        	<tr><th class="text-left">연락처</th><td><%= eovo.getES_ORDER_PHONE() %></td></tr>
        	<tr><th class="text-left">구매일자</th><td><%= sdf.format(eovo.getES_ORDER_DATE()) %></td></tr>
			<tr><th class="text-left">결제수단</th><td><%= eovo.getES_ORDER_PAYMENT() %></td></tr>
			<tr><th class="text-left">결제금액</th><td><%= eovo.getES_ORDER_PRICE() %> 원</td></tr>
			<tr><th class="text-left">메모</th><td><%= eovo.getES_ORDER_MEMO() %></td></tr>
		</table>
		<div class="col-12 row" style="padding-bottom:5%;">
			<div class="col-6">
				<a href="./index.ma" class="btn btn-outline-dark btn-lg w-100" role="button" aria-pressed="true">메인으로</a>
			</div>
			<div class="col-6">
				<a href="mypage_estimate.my" class="btn btn-outline-dark btn-lg w-100" role="button" aria-pressed="true">주문목록</a>
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
