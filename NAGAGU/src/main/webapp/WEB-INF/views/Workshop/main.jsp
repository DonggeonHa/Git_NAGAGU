<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("WORKSHOP_NUM")==null){
		
		response.sendRedirect("/index.ma");
	}
	
	int WORKSHOP_NUM = (int)session.getAttribute("WORKSHOP_NUM");
%>
<style>
	img {
	   max-width: 100%;
	   height: auto;
	}
	
 	/*별점주기*/
	.star-rating { 
		width:52px; 
	}
	.star-rating,.star-rating span { 
		display:inline-block; height:10px; overflow:hidden; background:url('${pageContext.request.contextPath}/resources/images/star_2.png') no-repeat; 
	}
	.star-rating span{ 
		background-position:left bottom; line-height:0; vertical-align:top; 
	}   		 
	
	
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
    	border-bottom: 1px solid #cacaca;
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
	#th-s {
		padding: 2px;
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
							<td>결제완료&nbsp;&nbsp;<span id="store_num">${order_state0}</span></td>
							<td>배송대기&nbsp;&nbsp;<span id="store_num">${order_state1}</span></td>
							<td>배송중&nbsp;&nbsp;<span id="store_num">${order_state2}</span></td>
							<td>배송완료&nbsp;&nbsp;<span id="store_num">${order_state3}</span></td>
							<td>구매확정&nbsp;&nbsp;<span id="store_num">${order_state4}</span></td>
							<td>환불요청&nbsp;&nbsp;<span id="store_num">${order_state5}</span></td>
							<td>환불대기&nbsp;&nbsp;<span id="store_num">${order_state6}</span></td>
							<td>환불완료&nbsp;&nbsp;<span id="store_num">${order_state7}</span></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-between col-12" style="padding-top: 0; padding-bottom: 0;">
			<div class="col-6 justify-content-start p-2 box" style="background-color: white; padding-left: 20px;"> 
				<div class="title"><span>상품 후기</span><a id="qna" href="workshop_review_Store.ws"><span style="font-size: 12px;">더보기</span></a></div>
				<div id="ReviewtableSection" style="padding: 13px 13px 0px; font-size: 12px;">
				</div>	
			</div>
			<div class="col-6 justify-content-end box" style="background-color: white;"> 
				<canvas id="chart-area2"></canvas>
			</div>
		</div>
		<div class="d-flex justify-content-between col-12">
			<div class="col-6 justify-content-start p-2 box" style="background-color: white; padding-left: 20px;"> 
				<div class="title"><span>강의 문의 내역</span><a id="qna" href="workshop_review_qnaAcademy.ws"><span style="font-size: 12px;">더보기</span></a></div>
				<table id="ClassQnaTable">
					<thead class="dashboardQna">
					<tr>
						<th id="th-s">번호</th>
						<th id="th-s">카테고리</th>
						<th id="th-s">강의명</th>
						<th id="th-s">작성자</th>
						<th id="th-s">문의내용</th>
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

.name {
	font-weight: bold;
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
				'${class_count_member0}',
				'${class_count_member1}',
				'${class_count_member2}',
				'${class_count_member3}',
				'${class_count_member4}',
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
			'1st Class'+ '-\n '+'${class_name0}',
			'2st Class'+ '-\n '+'${class_name1}',
			'3st Class'+ '-\n '+'${class_name2}',
			'4St Class'+ '-\n '+'${class_name3}',
			'5st Class'+ '-\n '+'${class_name4}'
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
					'${product_sales0}',
					'${product_sales1}',
					'${product_sales2}',
					'${product_sales3}',
					'${product_sales4}',
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
				'1st Product'+ '-\n '+'${product_title0}'+ '-\n '+'${product_category0}',
				'2st Product'+ '-\n '+'${product_title1}'+ '-\n '+'${product_category1}',
				'3st Product'+ '-\n '+'${product_title2}'+ '-\n '+'${product_category2}',
				'4St Product'+ '-\n '+'${product_title3}'+ '-\n '+'${product_category3}',
				'5st Product'+ '-\n '+'${product_title4}'+ '-\n '+'${product_category4}'
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
	getReviewList();
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
			if(qnaList.length<5){
				leng = qnaList.length;
			}else{
				leng = 5;				
			}
			
			if(qnaList.length!=0) {
				for(var j=0; j<leng; j++){
					console.log(qnaList[0].CLASS_CATEGORY)
					
					output += '<tr class="text-center">';
					output += '<td>' + number + '</td>';
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

function getReviewList() {
	$('#remo').empty();
	$('#ReviewtableSection').empty();	//table 내부 내용을 제거(초기화)
	$.ajax({
		url:'/NAGAGU/getDashBoardReviewList.my',
		type:'POST',
		dataType : "json", // 서버에서 보내줄 데이터 타입
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		success:function(reviewList) {
			
			if(reviewList.length > 0) {
				for(var i=0; i<reviewList.length; i++) {	//reviewCount도 상관 없음
					var output='';
					var REVIEW_NUM = reviewList[i].REVIEW_NUM;
					var MEMBER_PICTURE = reviewList[i].MEMBER_PICTURE;
					var MEMBER_NICK = reviewList[i].MEMBER_NICK;
					var REVIEW_DATE = new Date(reviewList[i].REVIEW_DATE);
					var date = date_format(REVIEW_DATE);
					var REVIEW_GRADE = reviewList[i].REVIEW_GRADE;
					var rate = 20*reviewList[i].REVIEW_GRADE;
					var REVIEW_FILE = reviewList[i].REVIEW_FILE;
					var REVIEW_CONTENT = reviewList[i].REVIEW_CONTENT;
					
					output += '<div class="row justify-content-center">';
					output += '<div class="col-1 justify-content-end"><img src="'+ MEMBER_PICTURE +'" alt="" class="rounded-circle"></div>';
						output += '<div class="col-11">';
							output += '<div class="row pb-1">';
								output += '<div class="col-2 justify-content-end name">'+ MEMBER_NICK +'</div>';
								output += '<div class="col-8 justify-content-center"></div>';
								output += '<div class="col-2 justify-content-center smallfont">'+ date +'</div>';
							output += '</div>';
							output += '<div class="row pb-2">';
								output += '<div class="col-12" style="font-size:0.7em; font-weight:bold;">'+REVIEW_GRADE+' &nbsp;';
									output += '<span class="star-rating">';
										output += '<span style ="width:'+rate+'%"></span>';
									output += '</span>';
								output += '</div>';
							output += '</div>';
							output += '<div class="row pb-2">';
								output += '<div class="col-11 pr-0">' + REVIEW_CONTENT + '</div>';
							output += '</div>';
						output += '</div>'; // <div class="col-11">
					output += '</div>'; // <div class="row justify-content-center">
					$('#ReviewtableSection').append(output);				
				}					
			} else {
				var output = '<div class="justify-content-center pt-5 pb-1" style="text-align:center;">등록된 댓글이 없습니다.</div>';
				$('#ReviewtableSection').append(output);	//이상한데...!?!?!?
			}
          },
          error:function() {
             alert("getReviewList ajax통신 실패!!!");
          }
   });
}
</script>
	<!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/dashboard-premium/1-4-5/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/dashboard-premium/1-4-5/css/fontastic.css">