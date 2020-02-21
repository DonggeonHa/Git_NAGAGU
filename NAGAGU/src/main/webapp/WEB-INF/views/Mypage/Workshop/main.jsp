<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("WORKSHOP_NUM")==null){
		
		response.sendRedirect("/index.ma");
	}
	
	int WORKSHOP_NUM = (int)session.getAttribute("WORKSHOP_NUM");
%>
<style>
	#page-content-wrapper {
		padding: 0 !important;
	}
	.box{
		box-shadow: 5px 5px 5px rgba(85, 85, 85, 0.2);
	}
	
	.dashboardQna{
		background-color: white !important;
    	color: #5e5e5e !important;
    	border-top: 2px solid #cacaca;
    	border-bottom: 2px solid #cacaca;
	}
	
	.title{
		padding: 13px;
    	font-weight: bold;
	}
	
	#qna{
		color: #797979;
	}
	
	.justify-content-between {
	    padding-bottom: 15px;
	    padding-top: 15px;
	}
	
	.title-1{
		padding: 10px;
	    font-size: 14px;
	    border-bottom: 1px solid #cacaca;
  	  font-weight: bold;
	}
	#store_num{
		color: red;
		font-weight: bold;
	}
</style>

<!-- 작업 구역. -->
<div id="page-content-wrapper" style="">
	<div class="container-fluid" style="background-color: #EAEAEA; min-height: calc(100vh);">
		<div class="d-flex justify-content-between col-12" style="padding-top: 10px;">
			<div class="col-12 justify-content-start p-2 box" style="background-color: white; padding-left: 20px;">
				<div class="title-1">오늘의 상품 관리</div>
				<div style="padding: 10px;">
					<table style="width: 50%; font-size: 12px;">
						<tr>
							<td>입금대기&nbsp;&nbsp;<span id="store_num">1</span></td>
							<td>입금완료&nbsp;&nbsp;<span id="store_num">2</span></td>
							<td>배송준비&nbsp;&nbsp;<span id="store_num">3</span></td>
							<td>배송중&nbsp;&nbsp;<span id="store_num">4</span></td>
							<td>배송완료&nbsp;&nbsp;<span id="store_num">5</span></td>
							<td>구매확정&nbsp;&nbsp;<span id="store_num">6</span></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-between col-12" style="padding-top: 0; padding-bottom: 0;">
			<div class="col-6 justify-content-start p-2 box" style="background-color: white; padding-left: 20px;"> 
				<div class="title"><span>상품 문의 내역</span><a id="qna" href="workshop_review_qnaAcademy.ws"><span style="font-size: 12px;">더보기</span></a></div>
				<table id="ClassQnaTable">
					<thead class="dashboardQna">
					<tr>
						<th>번호</th>
						<th>카테고리</th>
						<th>작성자</th>
						<th>상품명</th>
						<th>문의내용</th>
					</tr>
					</thead>
					<tbody id="ClassQnaList">
					</tbody>
				</table>
				<div id="list_none"></div>
			</div>
			<div class="col-6 justify-content-end p-2 box" style="background-color: white;"> 
				<canvas id="chart-area2"></canvas>
			</div>
		</div>
		<div class="d-flex justify-content-between col-12">
			<div class="col-6 justify-content-start p-2 box" style="background-color: white; padding-left: 20px;"> 
				<div class="title"><span>강의 문의 내역</span><a id="qna" href="workshop_review_qnaAcademy.ws"><span style="font-size: 12px;">더보기</span></a></div>
				<table id="ClassQnaTable">
					<thead class="dashboardQna">
					<tr>
						<th>번호</th>
						<th>카테고리</th>
						<th>강의명</th>
						<th>작성자</th>
						<th>문의내용</th>
					</tr>
					</thead>
					<tbody id="ClassQnaList">
					</tbody>
				</table>
				<div id="list_none"></div>
			</div>
			<div class="col-6 justify-content-end p-2 box" style="background-color: white;"> 
				<canvas id="chart-area1"></canvas>
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

#ClassQnaTable{
	width: 100%;
    text-align: center;
    height: 75%;
    font-size: 13px;
}
</style>
<script>
var randomScalingFactor = function() {
	return Math.round(Math.random() * 100);
};

var config1 = {
	type: 'doughnut',
	data: {
		datasets: [{
			data: [
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
			],
			backgroundColor: [
				window.chartColors.member,
				window.chartColors.line,
				window.chartColors.workshopMember,
				window.chartColors.green,
				window.chartColors.blue,
			],
			label: 'Dataset 1'
		}],
		labels: [
			'Red',
			'Orange',
			'Yellow',
			'Green',
			'Blue'
		]
	},
	options: {
		responsive: true,
		legend: {
			position: 'top',
		},
		title: {
			display: true,
			text: 'Class Top5'
		},
		animation: {
			animateScale: true,
			animateRotate: true
		}
	}
};

var config2 = {
		type: 'pie',
		data: {
			datasets: [{
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
				],
				backgroundColor: [
					window.chartColors.red,
					window.chartColors.orange,
					window.chartColors.yellow,
					window.chartColors.green,
					window.chartColors.blue,
				],
				label: 'Dataset 1'
			}],
			labels: [
				'Red',
				'Orange',
				'Yellow',
				'Green',
				'Blue'
			]
		},
		options: {
			responsive: true,
			title: {
				display: true,
				text: 'Store Top5'
			}
		}
	};

window.onload = function() {
	var ctx1 = document.getElementById('chart-area1').getContext('2d');
	window.myDoughnut = new Chart(ctx1, config1);
	
	var ctx2 = document.getElementById('chart-area2').getContext('2d');
	window.myPie = new Chart(ctx2, config2);
};




$(document).ready(function() {
	ClassQnaList();
});

function ClassQnaList() {
	$('#ClassQnaList').empty();
	
	var number = 1;
	$.ajax({
		url: '/NAGAGU/dashboardQnaList.my',
		type: 'POST',
		dataType: 'json',
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(qnaList) {
			console.log(qnaList);
			var output = ' ';	
			
			if(qnaList.length!=0) {
				for(var j=0; j<5; j++){
					
					output += '<tr class="text-center">';
					output += '<td>' + qnaList[j].CLASS_NAME + '</td>';
					var CLASS_CATEGORY = qnaList[j].CLASS_CATEGORY;
		      		switch(CLASS_CATEGORY){
			      	    case 'table' : 
			      	    	CLASS_CATEGORY = '책상'
			      	        break;
			      	    case 'chair' : 
			      	    	CLASS_CATEGORY = '의자' 
			      	        break;  
			      	    case 'bookshelf' : 
			      	    	CLASS_CATEGORY = '책장'
			      	        break;
			      	    case 'bed' : 
			      	    	CLASS_CATEGORY = '침대' 
			      	        break;  
			      	    case 'drawer' : 
			      	    	CLASS_CATEGORY = '서랍장'
			      	        break;
			      	    case 'sidetable' : 
			      	    	CLASS_CATEGORY = '협탁' 
			      	        break;  
			      	    case 'dressing_table' : 
			      	    	CLASS_CATEGORY = '화장대'
			      	        break;
			      	    case 'others' : 
			      	    	CLASS_CATEGORY = '기타' 
			      	        break;
		      	    }
		      		output += '<td>' + CLASS_CATEGORY + '</td>';
					if(qnaList[j].CLASS_NAME.length >= 10) {
						CLASS_NAME = qnaList[j].CLASS_NAME.substr(0,10)+"...";
						output += '<td>' + CLASS_NAME + '</td>';
					}else{
						output += '<td>' + qnaList[j].CLASS_NAME + '</td>';
					}
					output += '<td>' + qnaList[j].MEMBER_NICK + '</td>';
					
					if(qnaList[j].QNA_CONTENT.length >= 10) {
						QNA_CONTENT = qnaList[j].QNA_CONTENT.substr(0,10)+"...";
						
						output += '<td>' + QNA_CONTENT + '</td>';
					}else {
						output += '<td>' + qnaList[j].QNA_CONTENT + '</td>';
					}
					output += '</tr>';
					number += 1;
					
 				}
				$('#ClassQnaList').append(output);
			} else {
				output += '문의가 없습니다.';
				$('#list_none').append(output);
			}
		},
		error: function() {
			alert("Qna List를 띄울 수 없습니다.");
		}
	});
}	

</script>
	<!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/dashboard-premium/1-4-5/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/dashboard-premium/1-4-5/css/fontastic.css">