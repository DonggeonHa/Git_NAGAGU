<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
//날짜 포맷 형식
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<style type="text/css">
	.container-mypage{
		margin-top: 50px ;
		margin-bottom: 50px ;				 
	}			
	.container-mypage a,.container-mypage  a:link,.container-mypage  a:hover {
		text-decoration: none;
		color: white !important;
	} 
	.card-hover:hover {
		transition: 0.5s;
		z-index: 1;
		background-color: #ef900e;
	}
	.card {
		background-color: #1b1b27 ;
		margin: 15px 15px 15px 15px;
		color: white;
	}
	.card-wrap{
		justify-content: center;
	}
	@media screen and (max-width: 600px) {
		.card {
			width: 2.5rem;
			font-size: 0.1rem;
			margin: 2px 2px 2px 2px;
		}
		.card-header, .card-body, .card-footer {
			padding: 1px !important; 
		}
		.card-wrap{
			justify-content: start;
			padding-left: 20px; 
		} 
	}
	@media screen and (min-width: 600px) {
		.card {
			width: 4rem;
			font-size: 0.3rem;
			margin: 2px 2px 2px 2px;
		}
		.card-header, .card-body, .card-footer {
			padding: 4px !important; 
		}
	}
	@media screen and (min-width: 992px) {
		.card {
			width: 6rem;
			font-size: 0.6rem;
			margin: 2px 2px 2px 2px;
		}
		.card-header, .card-body, .card-footer {
			padding: 10px !important; 
		}
	}
	@media ( min-width : 1200px) {
		.card {
			width: 9rem !important;  
			font-size: 0.7rem;
		}
		.card-header, .card-body, .card-footer {
			padding: 18px !important;  
		}
	} 
	/* --------------------------------------------- */
	.tab-pane .col-4 {
		padding-bottom: 50px;
	}
	.nav-item a {
		color: black;
	}
	img {
	width: 100%;
	height: auto;
	}
	/* --------------------------------- */
	.tab-content img {
		height: auto;
	}
	.tab-content{
		min-height:38vh;
	}
	.tab-content img{
		max-height:250px;
	}
	.container_myclass{
		font-weight: 700;
	}
	.tab-content a, .tab-content a:link, .tab-content a:hover {
		text-decoration: none !important;
		color: black !important;
	}
	.category{
		border-bottom: 1px solid rgba(239,144,14,0.3);
		color: rgb(0, 0, 0, 0.5) !important;
	}
	.category *{
        align-self: center;
        text-align: center;
        color: rgb(0, 0, 0, 0.6);  
    }
    .values *{
		margin-top: 10px;
		text-align: center;
	}
	.values {
		border-bottom: 1px solid grey;
		border-color: rgba(0, 0, 0, 0.2);
	}
	.order_tab{
		margin-top: 10px;
		margin-left: 0px;
		margin-bottom: 10px; 
		padding-right: 40px; 
	}
	.each-row, .each-row div{
		padding-left: 0px;
	} 
	.each-row img {
		width: 100px;
		height: 100px;
	}
	.reply-content{
		margin-top: 30px;
	}
	.chongprice {
		margin-top: 0;
	}
</style> 

<div class="container-mypage container" role="main">
	<div class="d-flex card-wrap  text-center">
		<div class="card card-hover">
			<a href="mypage_like.my" class="href">
				<div class="card-header">Like</div>
				<div class="card-body">
					<i class="fab fa-gratipay fa-4x"></i>
				</div>
			</a>
		</div>

		<div class="card card-hover">
			<a href="mypage_pic.my" class="href">
				<div class="card-header">COMMUNITY</div>
				<div class="card-body">
					<i class="fas fa-images fa-4x"></i>
				</div>
			</a>
		</div>

		<div class=" card card-hover">
			<a href="mypage_edit.my" class="href">
				<div class="card-header">EDIT</div>
				<div class="card-body">
					<i class="fas fa-user-edit fa-4x"></i>
				</div>
			</a>
		</div>
		<div class="card card-hover">
			<a href="mypage_class.my" class="href">
				<div class="card-header">CLASS</div>
				<div class="card-body">
					<i class="fas fa-school fa-4x"></i>
				</div>
			</a>
		</div>
		<div class="card card-hover">
			<a href="order_list.my" class="href">
				<div class="card-header">ORDER</div>
				<div class="card-body">
					<i class="fas fa-truck-pickup fa-4x"></i>
				</div>
			</a>
		</div>
		<div class="card card-hover ">
			<a href="mypage_reply.my" class="href">
				<div class="card-header">REPLY</div>
				<div class="card-body">
					<i class="fab fa-replyd fa-4x"></i>
				</div>
			</a>
		</div>
		<div class="card card-hover ">
			<a href="mypage_review.my" class="href">
				<div class="card-header">REVIEW</div>
				<div class="card-body">
					<i class="fas fa-keyboard fa-4x"></i>
				</div>
			</a>
		</div>
		<div class="card card-hover ">
			<a href="mypage_estimate.my" class="href">
				<div class="card-header">CUSTOM</div>
				<div class="card-body">
					<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
						<symbol id="custom" viewBox="0 0 70 60">
					    	<path class="icon__path" d="M30,14.5A1.5,1.5,0,1,1,31.5,16,1.5,1.5,0,0,1,30,14.5ZM40.5,16A1.5,1.5,0,1,0,39,14.5,1.5,1.5,0,0,0,40.5,16Zm-5.639,8A9.334,9.334,0,0,0,39.5,22.863L38.5,21.137A7.439,7.439,0,0,1,34.861,22H33v2h1.861ZM18,30v3.293a7.226,7.226,0,0,1,.7-.2c2.283-.43,4.954-.931,7.115-1.331l1.288-.243c.152-.028.3-.054.436-.074a3.522,3.522,0,0,1,.357-.077l.3-.054c.2-.035.377-.067.539-.1L29,31.171v-.038a4.983,4.983,0,0,1-.86-1.552l-1.473-4.417A13,13,0,0,1,26,21.053V20a4,4,0,0,1,0-8,9.928,9.928,0,0,1,1.115-4.524A3.5,3.5,0,0,1,30,2h7.9A7.236,7.236,0,0,1,44.89,7.435,10.024,10.024,0,0,1,46,12a4,4,0,0,1,0,8v1.053a13,13,0,0,1-.667,4.111L43.86,29.581A4.983,4.983,0,0,1,43,31.133v.037L53.294,33.1A7,7,0,0,1,59,39.98V58a4,4,0,0,1-4,4H49a1.074,1.074,0,0,1-.212-.022L34.168,58.8,23.279,61.96A1.017,1.017,0,0,1,23,62H12a1,1,0,0,1-1-1V56H9a1,1,0,0,1-1-1V46a1,1,0,0,1,1-1h2V30H6a1,1,0,0,1-1-1V23a1,1,0,0,1,1-1H16a1.006,1.006,0,0,1,.555.168L19.3,24H23a1,1,0,0,1,1,1v4a1,1,0,0,1-1,1ZM46,18a2,2,0,0,0,0-4ZM26,14.005A2,2,0,1,0,26,18ZM16,56H13v4h3Zm14.067,1.908-4.279-.93L18.929,56H18v4h4.858ZM57,47.847l-4.844-.807-4.61,2.3L57,49.936Zm-10-3.97.779,3.115.221-.11V44h2v1.882l1.553-.777a1.017,1.017,0,0,1,.612-.091L57,45.82V39.98a5,5,0,0,0-4.074-4.918L47,33.953ZM43,33.2V43h2V33.579ZM37.766,4l1.8,3h3.059A5.238,5.238,0,0,0,37.9,4Zm-5,0,1.8,3h2.668l-1.8-3ZM28.5,5.5A1.5,1.5,0,0,0,30,7h2.234l-1.8-3H30A1.5,1.5,0,0,0,28.5,5.5ZM28,12.846l1.654,5.223a1.512,1.512,0,0,0,2.158.521,3.493,3.493,0,0,1,1.455-.554l1.784-5.352,1.9.632L35.387,18H38.24a3.5,3.5,0,0,1,1.948.59l.176.118a1.512,1.512,0,0,0,2.071-.385L44,12.859V12a8.024,8.024,0,0,0-.592-3H30a3.477,3.477,0,0,1-1.3-.255A7.937,7.937,0,0,0,28,12Zm2.037,16.1A3,3,0,0,0,32.883,31h6.234a3,3,0,0,0,2.846-2.052l1.473-4.417A11,11,0,0,0,44,21.053V19.571a3.512,3.512,0,0,1-4.746.8l-.177-.118A1.506,1.506,0,0,0,38.24,20H33.76a1.5,1.5,0,0,0-.838.254A3.512,3.512,0,0,1,28,19.2v1.854a11,11,0,0,0,.564,3.478ZM31,39.5V43h4V41.193l-1.444-3.61Zm1.478-3.608L31,34.414V37ZM36,38.308l1.071-2.679.005,0a.979.979,0,0,1,.217-.338l2.333-2.333a5.06,5.06,0,0,1-.509.04H32.883a5.037,5.037,0,0,1-.509-.04l2.333,2.333a.979.979,0,0,1,.217.338l.005,0ZM37,43h4V39.5l-2.556-1.917L37,41.193Zm4-6V34.414l-1.478,1.478ZM27,43h2V33.2c-.139.027-.283.054-.45.084l-.309.056c-.119.019-.227.046-.334.07-.2.032-.314.054-.433.076L27,33.579Zm-.946,4.909.211.106,6.475.4,13.007-.411.2-.1L45.219,45H26.781Zm-.5,1.986L19.764,47H10v7h9a.969.969,0,0,1,.142.01l7,1L49.107,60H55a2,2,0,0,0,2-2V51.939L25.938,50A1.029,1.029,0,0,1,25.553,49.9ZM16,45V30H13V45Zm2-9.589V45h2a1,1,0,0,1,.447.1L22,45.882V44h2v2.882l.221.111L25,43.877V33.953c-1.92.357-4.048.756-5.925,1.109A5.119,5.119,0,0,0,18,35.411ZM22,28V26H19a1.006,1.006,0,0,1-.555-.168L15.7,24H7v4H22Z"/>    	
					    </symbol>
					</svg> 
			     	<svg class="item__icon" style="width:80px; height: 55px; fill:white;"><use xlink:href="#custom"/></svg>
				</div>
			</a>
		</div>
	</div>
</div>

<div class="container container_myclass">
	<div class="row" style="margin-left: 0px;">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active" id="toclass"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
				aria-selected="true">예약 강의</a></li>
		</ul>
	</div>
	<div class="tab-content" id="myTabContent">
		<!-- 댓글 뿌려지는 장소 -->
		<div class="flex reply-content replyOutput">
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
	//상품 후기  가져오기 함수 정의
	function getClasses(event){
		var loginNum = '<%=session.getAttribute("MEMBER_NUM")%>'; 
		var category = 'toClass'
		if(loginNum == 0){
			return
		}
		$.ajax({
			url: "/NAGAGU/loginMemberClass.cm",
            type: "POST",
            data: { 'category' : category},
            contentType:
				'application/x-www-form-urlencoded; charset=utf-8',
            success: function (retVal) {
      		if(retVal.res=="OK"){
   				var output="";
   				if(retVal.classList.length==0){
       				alertify.error('강의가 없습니다')
       				return
       			}
   				output += '<div class="col-12 tab-pane fade show active shadow pb-2 pt-1 mb-2 bg-white rounded" id="nav-waiting" role="tabpanel" aria-labelledby="nav-waiting-tab">'
	        	for(var j=0; j<retVal.classList.length; j++){
	        		console.log(retVal)
	        		//구매날짜
	        		var buy_date = new Date(retVal.classList[j].CLASS_DATE);
	        		var b_date = date_format(buy_date); 
	        		var url = './classdetail.ac?CLASS_NUMBER='
	        				
	        		
	      				output += '<div class="row justify-content-between order_tab">'
	      				output += '<div><i style="font-size:0.7rem;">'+b_date+'</i>'
		        		output += '<div><b>주문번호 '+retVal.classList[j].MY_CLASS_DATE+'</b></div></div>' 
			        	output += '<div><a href="'+url+retVal.classList[j].CLASS_NUMBER+'">상세보기</a></div></div>'
		      			console.log(retVal.classList) 
		      			
	        		var imgsrc = retVal.classList[j].CLASS_IMAGE
	        		var content = retVal.classList[j].CLASS_INTRODUCTION_1
	        		var title = retVal.classList[j].CLASS_NAME
	        		
	        		//강의날짜
	        		var class_date = new Date(retVal.classList[j].CLASS_DATE);
	        		var c_date = date_format(class_date); 
		    		
		    		//본문
	        		output += '<div class="col-12 d-flex each-row" id="'+retVal.classList[j].CLASS_NUMBER+'">'
   					output += '<div class="col-2"><a href="'+url+retVal.classList[j].CLASS_NUMBER+'">'
		    		output += '<img src="/productupload/image/'+imgsrc+'"></a></div>'
		    		output += '<div class="col-10">'
	    				output += '<div class="row category">'
	    					output += '<div class="col-2">강의</div>' 
    						output += '<div class="col-2">구분</div>'
	    					output += '<div class="col-2">공방명</div>'
    						output += '<div class="col-2">카테고리</div>'
   							output += '<div class="col-1">수량</div>'
							output += '<div class="col-1">강의날짜</div>' 
							output += '<div class="col-2 text-right">금액</div>'   
                           output += '</div>'
                         	output += '<div class="row values">' 
		    					output += '<a href="'+url+retVal.classList[j].CLASS_NUMBER+'">'
		    					output += '<div class="col-2"><b>'+retVal.classList[j].CLASS_NAME+'</b>'
			    					 output += '<p>'+retVal.classList[j].CLASS_ABRIEF+'</p></a></div>'
			    				output += '<div class="col-2">'+retVal.classList[j].CLASS_DIVISION+'</div>'
			    				output += '<div class="col-2">'+retVal.classList[j].WORKSHOP_NAME	+'</div>'
			    				output += '<div class="col-2">'+retVal.classList[j].CLASS_CATEGORY+'</div>'
			    				output += '<div class="price col-1">'+retVal.classList[j].MY_CLASS_TICKET+'</div>'
			    				output += '<div class="col-1">협의</div>'
			    				output += '<div class="price_wrap text-right col-2">'
			    				output += '<div class="chongprice text-right">총가격</div><span>'+retVal.classList[j].MY_CLASS_AMOUNT+'</span></b>'   
			    			output += '</div>'
	    				output += '</div></div></div>'
		        	}
		        	output += '<div class="end col-12"></div></div></div>'
		        	$('.replyOutput').append(output)
				}else{
					alert("update fail");
				}  
			 },
			error:function(){
				alert("ajax통신 실패!!");
			}
		})
	} 
	//처음 로드하고 사진 가져오기 호출
	getClasses();
	$('.card-wrap').children().eq(3).css('background-color','#ef900e') 
})
</script>