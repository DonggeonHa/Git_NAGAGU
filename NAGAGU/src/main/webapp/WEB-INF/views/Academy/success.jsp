<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import = "com.spring.academy.*"%>
<%@ page import = "com.spring.member.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%
	ClassVO cl = (ClassVO)request.getAttribute("ClassVO");
	String amount2 = (String)request.getAttribute("amount3");
	System.out.println("amount 값 : " + amount2);
	
	//날짜 포맷 형식
	Date nowTime = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.css">
		
<style>
	.Precautions dl dd {
		font-size: 1rem;
	}
	
	#subject {
		font-size: 1.5rem;
	}
	
	.class-detail-container {
		padding: 0 15% 0 15% !important;
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
	
	div.col-2 img {
		width: 100%;
		height: 100%;
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
	
	.mbody {
		padding: 2rem !important;
	}
	
	.mheader {
		padding: 2rem !important;
	}
	
	.group {
		margin-top : 30px;
	}
</style>
<div class="container class-detail-container category_ac mt-5" >
	<div class="text-center">
		<font size="24;">공방 티켓 구매완료</font> <br>
		<p>구매가 완료되었습니다. 클래스명과 시간, 장소를 확인해주세요.</p>
	</div>
	<div>
		<table class="table">
			<colgroup>
				<col style="width:25%">
				<col style="width:75%">
			</colgroup>
		    <tr>
		      <th class="text-center">공방명</th>
		      <td><%=cl.getWORKSHOP_NAME()%></td>
		    </tr>
		    <tr>
		      <th class="text-center"">사용기간</th>
		      <td><%=cl.getCLASS_DATE_CONFIGURATION_1()%> ~ <%=cl.getCLASS_DATE_CONFIGURATION_2()%></td>
		    </tr>
		    <tr>
		      <th class="text-center">공방 장소</th>
		      <td><%=cl.getCLASS_ADDRESS()%>&nbsp;&nbsp;<%=cl.getCLASS_DETAIL_ADDRESS()%></td>
		    </tr>
		    <tr>
		      <th class="text-center">공방 지역</th>
		      <td><%=cl.getCLASS_AREA()%></td>
		    </tr>
		    <tr>
		      <th class="text-center">구매일자</th>
		      <td><%=sdf.format(nowTime)%></td>
		    </tr>
		    <tr>
		      <th class="text-center">결제금액</th>
		      <td><%=amount2%></td>
		    </tr>
		</table>
		<div class="col-12 row" style="padding-bottom:5%;">
			<div class="col-6">
				<a href="./index.ma" class="btn btn-outline-dark btn-lg w-100" role="button" aria-pressed="true">메인으로</a>
			</div>
			<div class="col-6">
				<a href="./mypage_class.my" class="btn btn-outline-warning btn-lg w-100" role="button" aria-pressed="true">구매현황으로</a>
			</div>
		</div>
	</div>		
</div>