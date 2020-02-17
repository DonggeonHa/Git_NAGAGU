<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import = "com.spring.member.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%
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
		border-bottom: 1px solid black;
		border-color: rgba(0, 0, 0, 0.2);
	}
	.each-row img {
		width: 100px;
		height: 100px;
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
		margin-top: 10px;
		text-align: center;
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
	
</style>

<div class="container class-detail-container">
	<div class="text-center">
		<font size="24;">구매완료</font> <br>
		<p>구매가 완료되었습니다</p>
	</div>
	<div>
		<table class="table main-output">
			
		</table>
		<table class="table sub_output font_change">
			<colgroup>
				<col style="width:40%">
				<col style="width:40%"> 
			</colgroup>
		</table>
		<div class="col-12 row" style="padding-bottom:5%;">
			<div class="col-6">
				<a href="./index.ma" class="btn btn-outline-dark btn-lg w-100" role="button" aria-pressed="true">메인으로</a>
			</div>
			<div class="col-6">
				<a href="./order_list.my" class="btn btn-outline-dark btn-lg w-100" role="button" aria-pressed="true">구매현황으로</a>
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
			var category = 'count'
			$.ajax({
				  url: "/NAGAGU/getMyPaidOrder.my",
	              type: "POST",
	              contentType:
	  				'application/x-www-form-urlencoded; charset=utf-8',
	              success: function (retVal) {
	        		if(retVal.res=="OK"){
	        			console.log(retVal.getCount)
	        			console.log(retVal.myPaidOrder)
	        			var output="";
	        			var url = './productdetail.pro?PRODUCT_NUM='
        				var paidPrice=0;
	        			console.log('count'+retVal.getCount[0].COUNT)  
			        	for(var j=0; j<retVal.getCount[0].COUNT; j++){
			        		var price = retVal.myPaidOrder[j].PRODUCT_PRICE.toLocaleString();
			        		var ship = retVal.myPaidOrder[j].PRODUCT_SHIP_PRICE.toLocaleString();
			        		var chong = retVal.myPaidOrder[j].PRODUCT_PRICE+retVal.myPaidOrder[j].PRODUCT_SHIP_PRICE;
			        			paidPrice += retVal.myPaidOrder[j].PRODUCT_PRICE+retVal.myPaidOrder[j].PRODUCT_SHIP_PRICE;
			        		
				    		output += '<div class="col-12 row each-row" id="'+retVal.myPaidOrder[j].PRODUCT_NUM+'" bNum='+retVal.myPaidOrder[j].BASKET_NUM+'>'
	    					output += '<div class="col-2"><a href="'+url+retVal.myPaidOrder[j].PRODUCT_NUM+'">'
				    		output += '<img src="/productupload/image/'+retVal.myPaidOrder[j].PRODUCT_IMAGE+'"></a></div>'
				    		output += '<div class="col-10">'
			    				output += '<div class="row category">'
			    					output += '<div class="col-2">상품명</div>'
		    						output += '<div class="col-2">배송</div>'
			    					output += '<div class="col-2">사이즈</div>'
		    						output += '<div class="col-2">컬러</div>'
	    							output += '<div class="col-2">수량</div>'
    								output += '<div class="col-2 text-right">금액</div>'   
                                output += '</div>'
                              	output += '<div class="row values">' 
  			    					output += '<a href="'+url+retVal.myPaidOrder[j].PRODUCT_NUM+'">'
  			    					output += '<div class="col-2"><b>'+retVal.myPaidOrder[j].PRODUCT_TITLE+'</b></p>'
  				    					 output += '<p>'+retVal.myPaidOrder[j].PRODUCT_BRIEF+'</a></div>'
  				    				output += '<div class="col-2">'+retVal.myPaidOrder[j].PRODUCT_SHIP_COMPANY+'</div>'
  				    				output += '<div class="col-2">'+retVal.myPaidOrder[j].BASKET_SIZE+'</div>'
  				    				output += '<div class="col-2">'+retVal.myPaidOrder[j].BASKET_COLOR+'</div>'
  				    				output += '<div class="price col-2" value="'+retVal.myPaidOrder[j].BASKET_AMOUNT+'">수량'+retVal.myPaidOrder[j].BASKET_AMOUNT+'</div>'
  				    				output += '<div class="price_wrap text-right col-2">'
						    			output += '<div class="basic_price text-right" value='+retVal.myPaidOrder[j].PRODUCT_PRICE+'>가격</div><span>'+price+'원</span>'
						    			output += '<div class="shipPrice text-right" value='+retVal.myPaidOrder[j].PRODUCT_SHIP_PRICE+'>+배송비</div><span>'+ship+'원</span>'
					    				output += '<div class="chongprice text-right"></div>총가격<span>'+chong.toLocaleString()+'원</span></b>' 
					    			output += '</div>'
			    				output += '</div></div></div>' 
			        	}  
	        			var d_date = new Date(retVal.myPaidOrder[0].ORDER_DATE); 
		        		var date = date_format(d_date);
		        		 
	        			var sub_output='';
	        				sub_output += '<tr><th class="text-left">주소</th><td width="200px;" >'+retVal.myPaidOrder[0].ORDER_ADDRESS+'</td></tr>'
        					sub_output += '<tr><th class="text-left">연락처</th><td>'+retVal.myPaidOrder[0].ORDER_PHONE+'</td></tr>'
        					sub_output += '<tr><th class="text-left">구매일자</th><td>'+date+'</td></tr>'
							sub_output += '<tr><th class="text-left">결제수단</th><td>'+retVal.myPaidOrder[0].ORDER_METHOD+'</td></tr>' 
							sub_output += '<tr><th class="text-left">결제금액</th><td>'+paidPrice.toLocaleString()+'원</td></tr>'
							sub_output += '<tr><th class="text-left">메모</th><td>'+retVal.myPaidOrder[0].ORDER_MEMO+'</td></tr>'
	      
			        	$('.main-output').html(output)
			        	$('.sub_output').append(sub_output) 
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
