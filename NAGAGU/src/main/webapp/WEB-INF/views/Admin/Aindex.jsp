<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	if(session.getAttribute("ADMIN_NUM") == null) {
		out.println("<script>");
		out.println("alert('관리자가 아닌 회원은 들어올 수 없습니다.')");
		out.println("location.href='./index.ma'");
		out.println("</script>");
	}
%>
<!-- 본문 -->
<div id="page-content-wrapper" style="padding-top: 2%;">
	<div class="container-fluid">
		<!-- Area Chart Example-->
		<div class="card mb-3 h-100">
			<div class="card-header">
				<i class="fas fa-chart-area"></i>
			  		회원 관리
			</div>
			<div class="card-body">
				<canvas id="canvas" width="100%" height="30"></canvas>
			</div>
			<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
		</div>

		<div class="row">
			<div class="col-lg-8">
				<div class="card mb-3 h-100">
					<div class="card-header">
						<i class="fas fa-chart-bar"></i>
						Bar Chart Example
					</div>
					<div class="card-body">
						<canvas id="myBarChart" width="100%" height="50"></canvas>
					</div>
					<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="card mb-3 h-100">
					<div class="card-header">
						<i class="fas fa-chart-pie"></i>
						Pie Chart Example
					</div>
					<div class="card-body">
						<canvas id="chart-area" width="100%" height="100"></canvas>
					</div>
					<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /본문 -->
<!-- chart.js api -->
<script src="${pageContext.request.contextPath}/resources/js/Admin/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Admin/utils.js"></script>
<style>
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
</style>
<script>
//회원관리 차트 시작
var barChartData = {
		labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
		datasets: [{
			type: 'line',
			label: 'Dataset 1',
			borderColor: window.chartColors.blue,
			borderWidth: 2,
			fill: false,
			data: [
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor()
			]
		}, {
			label: 'Dataset 1',
			backgroundColor: window.chartColors.red,
			stack: 'Stack 0',
			data: [
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor()
			]
		}, {
			label: 'Dataset 2',
			backgroundColor: window.chartColors.blue,
			stack: 'Stack 0',
			data: [
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor()
			]
		}, {
			label: 'Dataset 3',
			backgroundColor: window.chartColors.green,
			stack: 'Stack 1',
			data: [
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor()
			]
		}, {
			label: 'Dataset 4',
			backgroundColor: window.chartColors.grey,
			stack: 'Stack 1',
			data: [
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor()
			]
		}]

	};
	window.onload = function() {
		
		var ctx = document.getElementById('chart-area').getContext('2d');
		window.myPie = new Chart(ctx, config);
		
		var ctx = document.getElementById('canvas').getContext('2d');
		window.myBar = new Chart(ctx, {
			type: 'bar',
			data: barChartData,
			options: {
				title: {
					display: true,
					text: 'Chart.js Bar Chart - Stacked'
				},
				tooltips: {
					mode: 'index',
					intersect: false
				},
				responsive: true,
				scales: {
					x: {
						stacked: true,
					},
					y: {
						stacked: true
					}
				}
			}
		});
	};
//끝

//인기 클래스 차트 시작
	var config = {
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
				responsive: true
			}
		};

//pie 끝
</script>
