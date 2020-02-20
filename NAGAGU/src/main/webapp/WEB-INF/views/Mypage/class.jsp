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
		transition: 1s;
		transform: scale(1.2);
		z-index: 1;
		box-shadow: 10px 15px 7px 0px #333333;
	}
	
	.card {
		background-color: #1b1b27 !important;
		margin: 15px 15px 15px 15px;
		color: white;
	}
	.my {
		background-color: #ef900e !important;
	}
	.card-wrap{
		justify-content: center;
		padding-left:50px; 
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
			width: 8rem !important;  
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
	.tab-content .tab-pane.active {
		display: flex;
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
	.reply-content {
		width: 100%;
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
	.each-row img {
		width: 150px; 
		height: 130px;
	}
</style> 

<div class="container-mypage " role="main">
	<div class="row card-wrap  text-center">
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

		<div class="card my">
			<div class="card-header">MY</div>
			<div class="card-body">
				<i class="far fa-user-circle fa-4x"></i>
			</div>
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
				<div class="card-header">견적</div>
				<div class="card-body">
					<i class="fas fa-keyboard fa-4x"></i>
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
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab"
				aria-controls="profile" aria-selected="false">지난 강의</a></li>
		</ul>
	</div>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active row" id=""
			role="tabpanel" aria-labelledby="toclass">
			<!-- 댓글 뿌려지는 장소 -->
			<div class="row mx-0 my-2 reply-content replyOutput">
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
	        	for(var j=0; j<retVal.classList.length; j++){
	        		console.log(retVal)
	        		//구매날짜
	        		var buy_date = new Date(retVal.classList[j].CLASS_DATE);
	        		var b_date = date_format(buy_date); 
	      			
	      				output += '<div class="col-12 row justify-content-between order_tab">'
		        		output += '<div><b>주문번호 '+retVal.classList[j].MY_CLASS_DATE+' | 주문 날짜 '+b_date+'</b></div>'
			        	output += '<div><a href="'+url+'">상세보기</a></div></div>'
		      			console.log(retVal.classList)
		      			
	        		var imgsrc = retVal.classList[j].CLASS_IMAGE
	        		var content = retVal.classList[j].CLASS_INTRODUCTION_1
	        		var title = retVal.classList[j].CLASS_NAME
	        		var url = './classdetail.ac?CLASS_NUMBER='
	        		//강의날짜
	        		var class_date = new Date(retVal.classList[j].CLASS_DATE);
	        		var c_date = date_format(class_date); 
		    		
		    		//본문
	        		output += '<div class="col-12 d-flex each-row" id="'+retVal.classList[j].CLASS_NUMBER+'">'
   					output += '<div class="col-2 text-center"><a href="'+url+retVal.classList[j].CLASS_NUMBER+'">'
		    		output += '<img src="/productupload/image/'+imgsrc+'"></a></div>'
		    		output += '<div class="col-10">'
	    				output += '<div class="row category">'
	    					output += '<div class="col-2">강의</div>'
    						output += '<div class="col-2">구분</div>'
	    					output += '<div class="col-1">공방명</div>'
    						output += '<div class="col-2">카테고리</div>'
   							output += '<div class="col-1">수량</div>'
							output += '<div class="col-2">강의날짜</div>' 
							output += '<div class="col-2 text-right">금액</div>'   
                           output += '</div>'
                         	output += '<div class="row values">' 
		    					output += '<a href="'+url+retVal.classList[j].CLASS_NUMBER+'">'
		    					output += '<div class="col-2"><b>'+retVal.classList[j].CLASS_NAME+'</b>'
			    					 output += '<p>'+retVal.classList[j].CLASS_ABRIEF+'</p></a></div>'
			    				output += '<div class="col-2">'+retVal.classList[j].CLASS_DIVISION+'</div>'
			    				output += '<div class="col-1">'+retVal.classList[j].WORKSHOP_NAME	+'</div>'
			    				output += '<div class="col-2">'+retVal.classList[j].CLASS_CATEGORY+'</div>'
			    				output += '<div class="price col-1">'+retVal.classList[j].MY_CLASS_TICKET+'</div>'
			    				output += '<div class="col-2">협의</div>'
			    				output += '<div class="price_wrap text-right col-2">'
			    				output += '<div class="chongprice text-right">총가격</div><span>'+retVal.classList[j].MY_CLASS_AMOUNT+'</span></b>'   
			    			output += '</div>'
	    				output += '</div></div></div>'
		        	}
		        	output += '<div class="end col-12"></div></div>'
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
	$('.card-wrap').children().eq(3).find('div.card-body').css('color','#ef900e')
})
</script>