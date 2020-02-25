<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.chart.*" %>
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
			  		Member Chart
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
						Noitce Chart
					</div>
					<div class="card-body">
						<canvas id="community" width="100%" height="50"></canvas>
					</div>
					<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="card mb-3 h-100">
					<div class="card-header">
						<i class="fas fa-chart-pie"></i>
						Popular Class Chart
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
	#canvas, community {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
</style>
<script>
//회원관리 차트 시작

var barChartData = {
		labels: ['${selectDate0}', '${selectDate1}', '${selectDate2}', '${selectDate3}', '${selectDate4}', '${selectDate5}', '${selectDate6}'],
		datasets: [{
			type: 'line',
			label: 'Total Member',//7일치 총 회원수(일반,공방 합침)
			borderColor: window.chartColors.line,
			borderWidth: 2,
			fill: false,
			data: [
				'${totalCount0}',
				'${totalCount1}',
				'${totalCount2}',
				'${totalCount3}',
				'${totalCount4}',
				'${totalCount5}',
				'${totalCount6}'
			]
		}, {
			label: 'Member',	//7일치 일반 회원
			backgroundColor: window.chartColors.member,
			stack: 'Stack 0',
			data: [
				'${memberCount0}',
				'${memberCount1}',
				'${memberCount2}',
				'${memberCount3}',
				'${memberCount4}',
				'${memberCount5}',
				'${memberCount6}'
			]
		}, {
			label: 'Workshop Member',
			backgroundColor: window.chartColors.workshopMember,
			stack: 'Stack 0',
			data: [
				'${WSCount0}',
				'${WSCount1}',
				'${WSCount2}',
				'${WSCount3}',
				'${WSCount4}',
				'${WSCount5}',
				'${WSCount6}',
			]
		}, {
			label: 'Delete Member',
			backgroundColor: window.chartColors.delete_workshopMember,
			stack: 'Stack 1',
			data: [
				'${deleteMember0}',
				'${deleteMember1}',
				'${deleteMember2}',
				'${deleteMember3}',
				'${deleteMember4}',
				'${deleteMember5}',
				'${deleteMember6}'
			]
		}, {
			label: 'Delete Workshop Member',
			backgroundColor: window.chartColors.delete_member,
			stack: 'Stack 1',
			data: [
				'${deleteWSMember0}',
				'${deleteWSMember1}',
				'${deleteWSMember2}',
				'${deleteWSMember3}',
				'${deleteWSMember4}',
				'${deleteWSMember5}',
				'${deleteWSMember6}'
			]
		}]

	};
	window.onload = function() {
		var ctx1 = document.getElementById('community').getContext('2d');
		window.myLine = new Chart(ctx1, config2);
		
		var ctx2 = document.getElementById('chart-area').getContext('2d');
		window.myPie = new Chart(ctx2, config3);
		
		var ctx3 = document.getElementById('canvas').getContext('2d');
		window.myBar = new Chart(ctx3, {
			type: 'bar',
			data: barChartData,
			options: {
				title: {
					display: true,
					text: 'Total Member'
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

//게시글 수 차트 시작
var config2 = {
			type: 'line',
			data: {
				labels: ['${selectDate0}', '${selectDate1}', '${selectDate2}', '${selectDate3}', '${selectDate4}', '${selectDate5}', '${selectDate6}'],
				datasets: [{
					label: 'Community Notice Count',
					data: [
						'${count0}',
						'${count1}',
						'${count2}',
						'${count3}',
						'${count4}',
						'${count5}',
						'${count6}',
					],
					backgroundColor: window.chartColors.yellow,
					borderColor: window.chartColors.yellow,
					fill: false,
					pointHitRadius: 40,
				}]
			},
			options: {
				responsive: true,
				legend: {
					position: 'bottom',
				},
				hover: {
					mode: 'index'
				},
				scales: {
					x: {
						display: true,
						scaleLabel: {
							display: true,
							labelString: 'Month'
						}
					},
					yAxes: [{
						ticks: {
							beginAtZero: true,
							fontSize : 14,
						}
					}]
				},
				title: {
					display: true,
					text: 'Community Notice'
				}
			}
		};
//끝

//인기 클래스 차트 시작
	var config3 = {
			type: 'pie',
			data: {
				datasets: [{
					data: [
						'${cmemberCount0}',
						'${cmemberCount1}',
						'${cmemberCount2}',
						'${cmemberCount3}',
						'${cmemberCount4}',
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
					'1st Place'+ '-\n '+'${className0}',
					'2st Place'+ '-\n '+'${className1}',
					'3st Place'+ '-\n '+'${className2}',
					'4St Place'+ '-\n '+'${className3}',
					'5st Place'+ '-\n '+'${className4}'
				]
			},
			options: {
				responsive: true
			}
		};

//pie 끝
</script>
