<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Map<String, Object> retVal = (Map<String, Object>)request.getAttribute("retVal");
	int countBasket = (int)retVal.get("countBasket");
	System.out.println(countBasket);
	ArrayList<Map<String, Object>> basketList = (ArrayList<Map<String,Object>>)retVal.get("getbasketList");
	System.out.println(basketList.size());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<style>
.main img{
  max-width: 100px;
} 
.main {
  width: 75%;
  height: auto;
}
.sidebar {
  width: 25%;
  height: 25vh;
}

.sidebar {
  position: -webkit-sticky;
  position: sticky ;
  top: 0;
}
@font-face {
	font-family: 'KOMACON';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
body {
	font-family: '만화진흥원체', 'KOMACON', KOMACON !important;
	font-size: 15px;
}
.main, .sidebar{  
	margin-top:30px !important;
	min-height: 65vh; 
} 
.each-row{
	margin-bottom: 15px;
	border-bottom: 1px solid black;
	border-color: rgba(0,0,0,0.2);
}
.each-row a,.each-row a:link,.each-row a:hover{
  text-decoration: none !important;
  color: black !important;
} 
</style>
<body>
<div class="container">
	<div class="wrapper row justify-content-between">
		<div class="main">
			<div class="d-flex">
				<p>
					<input type="checkbox" id="check_all">&nbsp;전체선택
				</p>
			</div>
			<div class="row img-wrap main-output">
				<div class="col-12">배송업체</div>
				<hr>
				<div class="col-1">
					<input type="checkbox" checked>
				</div>
				<div class="col-11 row">
					<div class="col-2">
						<img src="">
					</div>
					<div class="col-10">
						<div class="d-flex justify-content-between">
							<div>title</div>
							<div>
								<i class="fas fa-times"></i>
							</div>
						</div>
						<font size="1">무료배송|일반택배</font>
						<div class="d-flex justify-content-between">
							<div>brief</div>
							<div>
								수량 <select>
									<option selected>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
								</select> 23000
							</div>
						</div>
					</div>
					<div class="col-12 d-flex justify-content-between">
						<div>
							옵션 <select>
								<option selected>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
							</select>
						</div>
						<div>총가격 55555</div>
					</div>
				</div>
			</div>
		</div>
		<!-- main end -->


		<!-- sidebar start -->
		<div class="sidebar" id="sidebar">
			<div class="row justify-content-around text-center sidebarOutput">
				<div class="col-6">상품금액</div>
				<div class="col-6 sumPrice"></div>
				<div class="col-6">배송비</div>
				<div class="col-6 shipPrice">+</div>
				<div class="col-6">결제금액</div>
				<div class="col-6 toPayPrice"></div>
				<div class="">
					<a href="" class="btn btn-warning text-white">구매하기</a>
				</div>
			</div>
			<!-- side bar end -->
		</div>
		<!-- wrapper end -->
	</div>
	</div><!-- container end -->
	<script src="https://kit.fontawesome.com/b74b42490f.js"
			crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
			integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
			integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
			integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
			crossorigin="anonymous"></script>
		<script>
$(document).ready(function(){
	
	//사진 가져오기 함수 정의
	function getBasket(event){
		var loginNum = '<%=session.getAttribute("MEMBER_NUM")%>'; 
		var category = 'count'
		if(loginNum == 0){
			return
		}
		$.ajax({
			  url: "/NAGAGU/getMyBasket.my",
              type: "POST",
              contentType:
  				'application/x-www-form-urlencoded; charset=utf-8',
              success: function (retVal) {
        		if(retVal.res=="OK"){
        			console.log(retVal.getbasketList)
        			console.log(retVal.countBasket)
        			var output="";
        			var sumOfPrice = 0;       
        			var shipPrice = 0;
        			var url = './productdetail.pro?PRODUCT_NUM='
		        	for(var j=0; j<retVal.getbasketList.length; j++){
			    		output += '<div class="col-1"><input class="checkbox" type="checkbox"></div>' 
			    		output += '<div class="col-11 row each-row" id="'+retVal.getbasketList[j].PRODUCT_NUM+'"><div class="col-2"><a href="'+url+retVal.getbasketList[j].PRODUCT_NUM+'"><img src="/productupload/image/'+retVal.getbasketList[j].PRODUCT_IMAGE+'"></div></a>'
			    		output += '<div class="col-10"><div class="d-flex justify-content-between"><a href="'+url+retVal.getbasketList[j].PRODUCT_NUM+'"><div>'+retVal.getbasketList[j].PRODUCT_TITLE+'</div></a>'
			    		output += '<div><i class="fas fa-times"></i></div></div><font size="1">무료배송|일반택배</font>'
			    		output += '<div class="d-flex justify-content-between"><div>'+retVal.getbasketList[j].PRODUCT_BRIEF+'</div>'
			    		output += '<div class="price" value="수량">수량&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select class="amount"><option selected>1</option><option>2</option><option>3</option></select>'
			    		output += '<div>가격 :'+retVal.getbasketList[j].PRODUCT_PRICE+'</div></div></div></div><div class="col-12 d-flex justify-content-between"><div>'
			    		//output += '<span>옵션 :'+retVal.getbasketList[j].BASKET_OPTION+'</span>&nbsp;&nbsp;'
		    			output += '<div>사이즈 :'+retVal.getbasketList[j].BASKET_SIZE+'</div>'
	    				output += '<div>컬러 :'+retVal.getbasketList[j].BASKET_COLOR+'</div>'
	    				output += '<div>배송업체 :'+retVal.getbasketList[j].PRODUCT_SHIP_COMPANY+'</div>'
			    		output += '</div><div style="align-self: flex-end;">총<span class="totalprice">'+retVal.getbasketList[j].PRODUCT_PRICE+'</span></div></div></div>'
			    		//총 가격
			    		sumOfPrice += retVal.getbasketList[j].PRODUCT_PRICE
			    		//배송비
			    		shipPrice += retVal.getbasketList[j].PRODUCT_SHIP_PRICE
		        	} 
		        	
		        	$('.main-output').html(output)
					$('.sumPrice').text(sumOfPrice)
		        	$('.shipPrice').append(shipPrice)
		        	$('.toPayPrice').text(sumOfPrice+shipPrice)
				}else{
					alert("update fail"); 
				}  
			 },
			error:function(){
				alert("ajax통신 실패!!");
			}
		}) 
	} 
	//전체선택
	$(document).on('click','#check_all',function(){
		alert('hi')
		var chk = $(this).is(":checked");//.attr('checked');
        if(chk){
        	$(".checkbox").prop('checked', true);
        }else{
        	$(".checkbox").prop('checked', false);
        }
	});
	//수량 변경시 가격 변경
	$(document).on('change','.amount',function(){
		changePrice(this)
	}) 
		
		
	function changePrice(a){
		//수량 선택
		var changeValue =  $(a).val() 
		//가격
		var price =  $(a).next().text().substr(4)
		//선택 수량 x 가격
		var changePrice= changeValue*price
		console.log(changeValue)
		console.log(price)
		console.log(changePrice)
		$(a).parent().parent().parent().next().find('.totalprice').text(changePrice)
		
		var sumPrice = 0;
		for(var i=0; i<$('.totalprice').length; i++){  
			var each = $('.totalprice')[i];
			var getPrice = $(each).text()
			getPrice *= 1;
			sumPrice += getPrice 
		}
		$('.sumPrice').text(sumPrice)
		var shipPrice = $('.shipPrice').text().substr(1)
		shipPrice *= 1;
		$('.toPayPrice').text(sumPrice+shipPrice)
	}
	//누르면 장바구니에서 삭제
	$(document).on('click','.fa-times',function(){
		var num = $(this).parent().parent().parent().parent().attr('id')
		$.ajax({
			  url: "/NAGAGU/deleteBasket.my",
              type: "POST",
              data: { 'BASKET_PRODUCT' : num},
              contentType:
  				'application/x-www-form-urlencoded; charset=utf-8',
              success: function (retVal) {
        		if(retVal.res=="OK"){
					alert('삭제성공')
					getBasket()
					changePrice()
				}else{
					alert("update fail");
				}  
			 },
			error:function(){
				alert("ajax통신 실패!!");
			}
		})
	}) 
	alert('get??')
	//처음 로드하고 사진 가져오기 호출
	getBasket();
})
</script>
</body>
</html>
