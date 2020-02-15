<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import="com.spring.member.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	Date nowTime = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String num = request.getParameter("order_amount");
	
%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/order_detail_.css">
<style type="text/css">
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
	.brief,.basic_price{
		margin-top:20px;
	}
	
</style>

<div class="container container-mypage bg-light">
	<div class="row justify-content-center pb-3">
	</div>

	<h4>
		<b>주문상세정보</b>
	</h4>
	<div>
		<div style="padding: 0 0 1% 0;">
			<b>주문번호 : <span class="date_num"></span>| 구매일시 :<span class="date"></span></b>
		</div>
	</div>

	<div>
		<table class="table main-output">
		</table>
		<table class="table sub_output">
			<colgroup>
				<col style="width:50%">
				<col style="width:50%">
			</colgroup>
		</table>
		<div class="col-12 row" style="padding-bottom:5%;">
			<div class="col-6">
				<a href="./index.ma" class="btn btn-outline-dark btn-lg w-100" role="button" aria-pressed="true">메인으로</a>
			</div>
			<div class="col-6">
				<a href="./order_vbank.my" class="btn btn-outline-warning btn-lg w-100" role="button" aria-pressed="true">구매현황으로</a>
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

		//사진 가져오기 함수 정의
		function getBasket(event){ 
			var num = <%=num%>
			console.log(num)
			var category = 'count'
			$.ajax({
				  url: "/NAGAGU/getPaidDetail.my",
	              type: "POST",
				  data: {'ORDER_AMOUNT':num},
	              contentType:
	  				'application/x-www-form-urlencoded; charset=utf-8',
	              success: function (retVal) {
	        		if(retVal.res=="OK"){
	        			console.log(retVal.myPaidOrder)
	        			var output="";
	        			var url = './productdetail.pro?PRODUCT_NUM='
        				var paidPrice=0;
			        	for(var j=0; j<retVal.myPaidOrder.length; j++){
				    		output += '<div class="col-1"></div>'
				    		output += '<div class="col-11 row each-row" id="'+retVal.myPaidOrder[j].PRODUCT_NUM+'" bNum='+retVal.myPaidOrder[j].BASKET_NUM+'><div class="col-2"><a href="'+url+retVal.myPaidOrder[j].PRODUCT_NUM+'">'
				    		output += '<img src="/productupload/image/'+retVal.myPaidOrder[j].PRODUCT_IMAGE+'"></a></div>'
				    		output += '<div class="col-10"><div class="d-flex justify-content-between"><a href="'+url+retVal.myPaidOrder[j].PRODUCT_NUM+'"><div>'+retVal.myPaidOrder[j].PRODUCT_TITLE+'</div></a>'
				    		output += '<div></div></div><font size="1">일반택배</font>'
				    		output += '<div class="d-flex justify-content-between brief"><div>'+retVal.myPaidOrder[j].PRODUCT_BRIEF+'</div>'
				    		output += '<div class="price text-right" value="'+retVal.myPaidOrder[j].BASKET_AMOUNT+'">수량'+retVal.myPaidOrder[j].BASKET_AMOUNT+''
				    		output += '<div class="basic_price" value='+retVal.myPaidOrder[j].PRODUCT_PRICE+'>가격 :<span>'+retVal.myPaidOrder[j].PRODUCT_PRICE+'</span></div></div></div></div><div class="col-12 d-flex justify-content-between"><div>'
			    			output += '<div>사이즈 :'+retVal.myPaidOrder[j].BASKET_SIZE+'</div>'
		    				output += '<div>컬러 :'+retVal.myPaidOrder[j].BASKET_COLOR+'</div>'
		    				output += '<div>배송업체 :'+retVal.myPaidOrder[j].PRODUCT_SHIP_COMPANY+'</div>'
				    		output += '</div><div style="align-self: flex-end;"><div class="shipPrice">+배송비 :<span>'+retVal.myPaidOrder[j].PRODUCT_SHIP_PRICE+'</span></div>'
				    		output += '<span class="chongprice"></span></div></div></div><hr>'
				    		//결제금액
			    			paidPrice += retVal.myPaidOrder[j].PRODUCT_PRICE + retVal.myPaidOrder[j].PRODUCT_SHIP_PRICE;
			        	}  
	        			var d_date = new Date(retVal.myPaidOrder[0].ORDER_DATE); 
		        		var date = date_format(d_date);
		        		 
	        			var sub_output='';
	        				sub_output += '<tr><th class="text-left">구매자</th><td>'+retVal.myPaidOrder[0].ORDER_PERSON+'</td></tr>' 
	        				sub_output += '<tr><th class="text-left">주소</th><td>'+retVal.myPaidOrder[0].ORDER_ADDRESS+'</td></tr>'
        					sub_output += '<tr><th class="text-left">연락처</th><td>'+retVal.myPaidOrder[0].ORDER_PHONE+'</td></tr>'
        					sub_output += '<tr><th class="text-left">구매일자</th><td>'+date+'</td></tr>'
							sub_output += '<tr><th class="text-left">결제수단</th><td>'+retVal.myPaidOrder[0].ORDER_METHOD+'</td></tr>' 
							sub_output += '<tr><th class="text-left">결제금액</th><td>'+paidPrice+'</td></tr>'
							sub_output += '<tr><th class="text-left">메모</th><td>'+retVal.myPaidOrder[0].ORDER_MEMO+'</td></tr>'
	      
			        	$('.main-output').html(output)
			        	$('.sub_output').append(sub_output) 
			        	$('.date').text(date)
			        	$('.date_num').text(retVal.myPaidOrder[0].ORDER_AMOUNT)
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
		getBasket()
	});
</script>