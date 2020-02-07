<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
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
  top: 10;
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
	margin-top:30px;
	min-height: 65vh; 
} 
.main-output{
margin-top:15px; }
.each-row{
	margin-bottom: 15px;
	border-bottom: 1px solid black;
	border-color: rgba(0,0,0,0.2);
}
.each-row a,.each-row a:link,.each-row a:hover{
  text-decoration: none !important;
  color: black !important;
} 
.sidebarOutput{
	font-size:1.5rem;
	min-height: 25vh;
}
</style>
<body>
<div class="container">
	<div class="wrapper row justify-content-between">
		<div class="main">
			<div class="d-flex">
				<input type="checkbox" id="check_all" style="align-self:center;">
				<span></span>
			</div>
			<div class="row img-wrap main-output">
				<div class="col-12">배송업체</div>
				<hr>
				<div class="col-1">
					<input type="checkbox" checked >
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
				<div class="col-6 totalPrice"></div>
				<div class="col-6">+배송비</div>
				<div class="col-6 totalShipPrice">+</div>
				<div class="col-6">결제금액</div>
				<div class="col-6 totalPayPrice"></div>
				<div class="">
					<a href="#" class="btn btn-warning text-white">구매하기</a>
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
        			var countOutput= '전체선택 '+retVal.countBasket+'개';
        			var url = './productdetail.pro?PRODUCT_NUM='
		        	for(var j=0; j<retVal.getbasketList.length; j++){
			    		output += '<div class="col-1"><input class="checkbox" type="checkbox" value='+retVal.getbasketList[j].BASKET_NUM+'></div>' 
			    		output += '<div class="col-11 row each-row" id="'+retVal.getbasketList[j].PRODUCT_NUM+'"><div class="col-2"><a href="'+url+retVal.getbasketList[j].PRODUCT_NUM+'">'
			    		output += '<img src="/productupload/image/'+retVal.getbasketList[j].PRODUCT_IMAGE+'"></a></div>'
			    		output += '<div class="col-10"><div class="d-flex justify-content-between"><a href="'+url+retVal.getbasketList[j].PRODUCT_NUM+'"><div>'+retVal.getbasketList[j].PRODUCT_TITLE+'</div></a>'
			    		output += '<div><i class="fas fa-times"></i></div></div><font size="1">무료배송|일반택배</font>'
			    		output += '<div class="d-flex justify-content-between"><div>'+retVal.getbasketList[j].PRODUCT_BRIEF+'</div>'
			    		output += '<div class="price" value="수량">수량&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select class="amount"><option>1</option><option>2</option><option>3</option></select>'
			    		output += '<div class="basic_price" value='+retVal.getbasketList[j].PRODUCT_PRICE+'>가격 :'+retVal.getbasketList[j].PRODUCT_PRICE+'</div></div></div></div><div class="col-12 d-flex justify-content-between"><div>'
		    			output += '<div>사이즈 :'+retVal.getbasketList[j].BASKET_SIZE+'</div>'
	    				output += '<div>컬러 :'+retVal.getbasketList[j].BASKET_COLOR+'</div>'
	    				output += '<div>배송업체 :'+retVal.getbasketList[j].PRODUCT_SHIP_COMPANY+'</div>'
			    		output += '</div><div style="align-self: flex-end;"><div class="shipPrice">+배송비 :'+retVal.getbasketList[j].PRODUCT_SHIP_PRICE+'</div>'
			    		output += '<span class="chongprice"></span></div></div></div>'
		        	}  
        			$('#check_all').next().text(countOutput).css('margin-left','15px')
		        	$('.main-output').html(output) 
		        	changePrice()
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
		var chk = $(this).is(":checked");//.attr('checked');
        if(chk){
        	$(".checkbox").prop('checked', true);
        }else{
        	$(".checkbox").prop('checked', false);
        }
	});
	//수량 변경시 가격 변경(update)
	$(document).on('change','.amount',function(){
		var num = $('.amount').parent().parent().parent().parent().attr('id')
		var amount = $(this).val()
		var category = 'updateAmount'
 		$.ajax({
			  url: "/NAGAGU/updateBasket.my",
              type: "POST",
              data: { 'BASKET_PRODUCT' : num, 'BASKET_AMOUNT' : amount, 'category' : category},
              contentType:
  				'application/x-www-form-urlencoded; charset=utf-8',
              success: function (retVal) {
        		if(retVal.res=="OK"){
					alert('수량 변경성공')
				}else{
					alert("update fail");
				}  
			 },
			error:function(){
				alert("ajax통신 실패!!");
			}
		})
		changePrice(this);
	}) 
	
	function changePrice(a){
		if(a!=null){
			alert('change')
			//수량 선택
			var changeValue =  $(a).val() 
			//가격
			var price =  $(a).next().attr('value')
			//선택 수량 x 가격
			var changePrice= changeValue*price
			console.log(changePrice)
			$(a).next().text('가격: '+changePrice)
		} 
		//가격+배송비 구해서 총가격에 뿌리기
		$('.amount').each(function (index,item){
			var price = $(item).next().text().substr(4)*1
			var ship = $('.shipPrice');
			ship = $(ship)[index].textContent.substr(6)*1
			var target = $('.chongprice')[index]
			$(target).text('총가격 '+(price+ship))
		}) 
		//오른쪽 상품금액 + 배송비 + 결제금액 구해서 뿌리기
		var totalPrice=0;
		var totalShipPrice=0;
		var totalPayPrice=0;
		$('.amount').each(function (index,item){
			totalPrice += $(item).next().text().substr(4)*1
			var ship = $('.shipPrice');
			totalShipPrice += $(ship)[index].textContent.substr(6)*1
		})
		$('.totalPrice').text(totalPrice)
		$('.totalShipPrice').text(totalShipPrice)
		$('.totalPayPrice').text(totalPrice+totalShipPrice)
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
	//셀렉트 한 값만 넘기기
 	$(document).on('click','.btn',function(){ 
		alert('hi')
		var url = '/NAGAGU/mypage_order.my'
		
		var arrChecked = new Array();
		$('.checkbox').each(function (index,item){
			var chk = $(item).is(":checked")
			var num = $(item).attr('value')
			if(chk){
				arrChecked.push(num)
			}
			console.log('chkc'+chk);
/* 			ship = $(ship)[index].textContent.substr(6)*1
			var target = $('.chongprice')[index]
			$(target).text('총가격 '+(price+ship)) */
		}) 
		
		console.log('arr'+arrChecked);
		var Data = { "arr": arrChecked }; 
		$.ajax({ 
			type: "post", 
			url: "/NAGAGU/mypage_order.my",
			dataType: "json", 
			data: Data, 
			success: function (data) { 
				alert('abc')
			},
			error:function(){
				alert("ajax통신 실패!!");
			} 
		});


	}); 
/* 	$(document).on('click','.checkbox',function(){
		var num = $('.amount').parent().parent().parent().parent().attr('id')
		var amount = $(this).val()
		var category = 'updateCheck'
 		$.ajax({
			  url: "/NAGAGU/updateBasket.my",
              type: "POST",
              data: { 'BASKET_PRODUCT' : num, 'BASKET_AMOUNT' : amount, 'category' : category},
              contentType:
  				'application/x-www-form-urlencoded; charset=utf-8',
              success: function (retVal) {
        		if(retVal.res=="OK"){
					alert('체크 변경성공')
				}else{
					alert("update fail");
				}  
			 },
			error:function(){
				alert("ajax통신 실패!!");
			}
		})
	}); */
	
	
	//처음 로드하고 사진 가져오기 호출
	getBasket();
})
</script>
</body>
</html>
