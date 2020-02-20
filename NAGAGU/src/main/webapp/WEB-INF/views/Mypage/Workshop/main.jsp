<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("WORKSHOP_NUM")==null){
		
		response.sendRedirect("/index.ma");
	}
%>
<style>
	#page-content-wrapper {
		padding: 0 !important;
	}
</style>

<!-- 작업 구역 -->
<div id="page-content-wrapper" style="">
	<div class="container-fluid" style="background-color: #EAEAEA; min-height: calc(100vh);">
		<div class="d-flex justify-content-between col-12">
			<div class="col-6 justify-content-start p-2" style="border: 1px solid black; background-color: white;"> 
				asfkjsadoljsdflksafdjfdkjljskflslklksfnlnmsdlfnlklkjsdlksdjf 1번째
			</div>
			<div class="col-6 justify-content-end p-2" style="border: 1px solid black; background-color: white;"> 
				asfkjsadoljsdflksafdjfdkjljskflslklksfnlnmsdlfnlklkjsdlksdjf 2번쨰
			</div>
		</div>
		<div class="d-flex justify-content-between col-12">
			<div class="col-6 justify-content-start p-2" style="border: 1px solid black; background-color: white;"> 
				asfkjsadoljsdflksafdjfdkjljskflslklksfnlnmsdlfnlklkjsdlksdjf 3번째
			</div>
			<div class="col-6 justify-content-end p-2" style="border: 1px solid black; background-color: white;"> 
				asfkjsadoljsdflksafdjfdkjljskflslklksfnlnmsdlfnlklkjsdlksdjf 4번째
			</div>
		</div>
    </div>
</div>
<!-- chart.js api -->
<script src="${pageContext.request.contextPath}/resources/js/Admin/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Admin/utils.js"></script>
<style>
canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
.dashboard-counts {
    color: #333;
    background: #f8f9fa;
}
.section-padding {
    padding: 3rem 0;
}
.container-fluid-1 {
    width: 100%;
    margin-right: auto;
    margin-left: auto;
}
.dashboard-counts .count-title i {
    font-size: 1.5em;
    color: #1b1b27;
}
.dashboard-counts strong {
    font-size: 0.9em;
    font-weight: 500;
    color: #555;
    display: block;
}
.dashboard-counts .count-title span {
    font-size: 0.8em;
    color: #aaa;
    display: block;
}
.dashboard-counts .count-number {
    font-size: 3.2em;
    font-weight: 300;
}
.statistics .income .icon {
    font-size: 3.5em;
}
</style>
<script>
</script>
<!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/dashboard-premium/1-4-5/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/dashboard-premium/1-4-5/css/fontastic.css">