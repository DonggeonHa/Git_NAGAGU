<%@page import="com.spring.order.BasketVO"%>
<%@page import="com.spring.order.ProductOrderVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
ArrayList<Map<String, Object>> orderList = (ArrayList<Map<String, Object>>) request.getAttribute("orderList");
System.out.println(orderList.size());
String[] array = new String[orderList.size()];
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./resources/css/Mypage/order.css">
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>		
<style type="text/css">
@font-face { font-family: 'KOMACON'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff') format('woff'); font-weight: normal; font-style: normal; }
.basket-size {
	width: 100px;
	height: 100px;
}

.nav-link.active {
	background-color: #EAEAEA !important;
}

.radius {
	border-radius: 10px;
}
.order-body {
   font-family: '만화진흥원체', 'KOMACON', KOMACON;
   font-size: 15px;
}

.order-container {
	margin-top: 100px;
	margin-bottom: 100px;
}

.nav-link.active {
	background-color: #EAEAEA !important;
}
</style>
</head>
	<body class="order-body">
		<div class="container order-container">
			<form id="orderForm">
			<div class="second-container">
				<div>
				<h3>주문/결제</h3>
				<br/><br/>

				<h5 style="padding-bottom: 2%;">주문상품</h5>
				</div>
				<div class="mb-5">
					<table class="table table-hover">
						<%
							for(int i=0; i<orderList.size(); i++){
								Map<String, Object>	list = orderList.get(i);
							
						%>
						<tr>
							<td align="center">
								<img class="basket-size" src="/productupload/image/<%=list.get("PRODUCT_IMAGE")%>" style="padding: 0 3% 3% 0;">
								<input type="hidden" class="BASKET_NUM" name="BASKET_NUM" value="<%=list.get("BASKET_NUM")%>">
								<input type="hidden" name="BASKET_AMOUNT" value="<%=list.get("BASKET_AMOUNT")%>">
								<input type="hidden" name="PRODUCT_PRICE" value="<%=list.get("PRODUCT_PRICE")%>">
								<input type="hidden" class="PRODUCT_NUM" name="PRODUCT_NUM" value="<%=list.get("PRODUCT_NUM")%>">
							</td>
							<td colspan="2">
								<dl>
									<c:forTokens var="list" items="${orderList}">  
									</c:forTokens> 
									<dt><%=list.get("PRODUCT_TITLE")%></dt>
									<dd><%=list.get("PRODUCT_BRIEF")%></dd>
									<dd>사이즈 : <%=list.get("BASKET_SIZE")%> | 컬러 : <%=list.get("BASKET_COLOR")%></dd>
								</dl>
							</td>
							<td>
								<dl> 
									<div>
										<span>가격</span>
										<span class="text-center price"><%=list.get("PRODUCT_PRICE")%></span>
									</div>
									<div>
										<span>수량</span>
										<span class="text-center amount"><%=list.get("BASKET_AMOUNT")%></span>
									</div>
									<dd>&nbsp;</dd>
									<div>
										<span>+배송비</span>
										<span class="text-center ship"><%=list.get("PRODUCT_SHIP_PRICE")%></span>
									</div>
								</dl>
	
							</td>
						</tr>
						<%
						} 
						%>
					</table><hr>
				</div>
	
				<div style="padding: 0 0 5% 0;">
					<div class="row mt-5">
						<div class="col-2">
							<h5 style="padding-top: 2%;">배송지</h5>
						</div>
						<div class="col-10">
							
						</div>
					</div>
					<hr>
					<form id="orderForm">
						<div class="form-group row">
							<div class="col-2">
								<label for="inputAddress">받는분</label>
							</div>
							<div class="col-5">
								<input type="text" class="form-control name">
							</div>
							<div class="col-5">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-2">
								<label for="inputAddress">우편번호</label>
							</div>
							<div class="col-3">
								<input type="text" class="form-control addrNum">
							</div>
							<div class="col-2">
								<a href="#" class="btn btn-dark text-white w-100" role="button" aria-pressed="true">우편번호</a>
							</div>
							<div class="col-5">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-2">
								<label for="inputAddress">주소</label>
							</div>
							<div class="col-10 input-group">
								<input type="text" class="form-control address1" >
							</div>
						</div>
						<div class="form-group row">
							<div class="col-2">
								
							</div>
							<div class="col-10 input-group">
								<input type="text" class="form-control address2" >
							</div>
						</div>
						<div class="form-group row">
							<div class="col-2">
								<label for="inputAddress">휴대전화</label>
							</div>
							<div class="col-5">
								<input type="text" class="form-control phone" >
							</div>
							<div class="col-5">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-2">
								<label for="inputAddress">배송 메모</label>
							</div>
							<div class="col-10 input-group">
								<input type="text" class="form-control memo">
							</div>
						</div>
					</form>
				</div>
	
				<div>
					<div class="row">
						<div class="col-2">
							<h5 style="padding-top: 2%;">주문자</h5>
						</div>
						<div class="col-10">
							<button type="button" id="getInfo_btn" class="btn btn-outline-dark"><font size="2">배송지 정보와 동일하게 채우기</button>
							
						</div>
					</div>
					<hr>
					<form>
						<div class="form-group row">
							<div class="col-2">
								<label for="inputAddress">이름</label>
							</div>
							<div class="col-5">
								<input type="text" class="form-control toName" name="ORDER_PERSON">
							</div>
							<div class="col-5">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-2">
								<label for="inputAddress">주소</label>
							</div>
							<div class="col-10">
								<input type="text" class="form-control toAddress1">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-2">
							</div>
							<div class="col-10 input-group">
								<input type="text" class="form-control toAddress2">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-2">
								<label for="inputAddress">휴대전화</label>
							</div>
							<div class="col-5">
								<input type="text" class="form-control toPhone" >
							</div>
							<div class="col-5">
							</div>
						</div> 
					</form>
				</div>
	
				<div>
					<div class="row">
						<div class="col-4">
							<h5 style="padding-top: 2%;">최종 결제 금액</h5>
						</div>
						<div class="col-8">
						</div>
					</div>
					<hr>
					<div class="row" style="font-size: 24px; padding-bottom: 1%;">
						<div class="col-2">
							총 상품 금액
						</div>
						<div class="col-8">
						</div>
						<div class="col-2 d-flex justify-content-end totalPrice">
						</div>
					</div>
					<div class="row" style="font-size: 16px; padding-bottom: 1%;">
						<div class="col-2">
							+ 배송비  
						</div>
						<div class="col-8">
						</div>
						<div class="col-2 d-flex justify-content-end totalShipPrice">
						</div>
					</div>
					<div class="row" style="font-size: 30px; padding-bottom: 1%;">
						<div class="col-4">
						</div>
						<div class="col-8 d-flex justify-content-end totalPayPrice">
						</div>
					</div>
				</div>
				<div>
					<div class="row mt-3">
						<div class="col-4">
							<h5 style="padding-top: 2%;">결제 수단</h5>
						</div>
						<div class="col-8">
						</div>
					</div>
					<hr>
					<div>
						<ul class="nav nav-pills mb-3 table table-bordered" id="pills-tab" role="tablist">
							<li class="nav-item">
								<a class="nav-link active pay_method" value="toss" id="pills-toss-tab" data-toggle="pill" href="#pills-toss" role="tab" aria-controls="pills-home" aria-selected="true">
									<label>
										<img width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/toss.png" alt="Toss">
										<div class="text-center"><font color="black">토스</font></div>
									</label>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link pay_method" value="card" id="pills-card-tab" data-toggle="pill" href="#pills-card" role="tab" aria-controls="pills-home" aria-selected="true">
									<label>
										<img width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/card.png" alt="Toss">
										<div class="text-center"><font color="black">카드</font></div>
									</label>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link pay_method" value="kakao" id="pills-naver-tab" data-toggle="pill" href="#pills-naver" role="tab" aria-controls="pills-home" aria-selected="true">
									<label>
										<img width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/naver.png" alt="Toss">
										<div class="text-center"><font color="black">카카오페이</font></div>
									</label>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link pay_method" value="payco"  id="pills-vbank-tab" data-toggle="pill" href="#pills-vbank" role="tab" aria-controls="pills-home" aria-selected="true">
									<label>
										<img width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/vbank.png" alt="Toss">
										<div class="text-center"><font color="black">페이코</font></div>
									</label>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link pay_method" value="samsung" id="pills-phone-tab" data-toggle="pill" href="#pills-phone" role="tab" aria-controls="pills-home" aria-selected="true">
									<label>
										<img width="64" src="https://bucketplace-v2-development.s3.amazonaws.com/pg/phone.png" alt="Toss">
										<div class="text-center"><font color="black">삼성페이</font></div>
									</label>
								</a>
							</li>
						</ul>
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade active show" id="pills-toss" role="tabpanel" aria-labelledby="pills-toss-tab">
								<div style="background-color: #EAEAEA; padding: 1%; " class="radius mb-5">
									<dl>
										<dt><font size="3">토스 결제 혜택</font></dt>
										<dd>- 수/목요일에 10만원 이상 결제 시 7천원 즉시 할인</dd>
										<dd>- 1월 중 1인 1회 한정</dd>
									</dl>
								</div>
								<div style="padding-left: 3%;">
									<dl>
										<dt>
											<input type="checkbox" class="custom-control-input" id="tossControlInline">
											<label class="custom-control-label" for="tossControlInline">
												<font size="3">결제 진행 필수사항 동의</font>
											</label>
										</dt>
										<dd>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</dd>
									</dl>
								</div>
							</div>
							<div class="tab-pane fade" id="pills-card" role="tabpanel" aria-labelledby="pills-card-tab"  style="padding-left: 3%;">
								<dl>
									<dt>
										<input type="checkbox" class="custom-control-input" id="cardControlInline">
										<label class="custom-control-label" for="cardControlInline">
											<font size="3">결제 진행 필수사항 동의</font>
										</label>
									</dt>
									<dd>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</dd>
								</dl>
							</div>
							<div class="tab-pane fade" id="pills-naver" role="tabpanel" aria-labelledby="pills-naver-tab"  style="padding-left: 3%;">
								<dl>
									<dt>
										<input type="checkbox" class="custom-control-input" id="naverControlInline">
										<label class="custom-control-label" for="naverControlInline">
											<font size="3">결제 진행 필수사항 동의</font>
										</label>
									</dt>
									<dd>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</dd>
								</dl>
							</div>
							<div class="tab-pane fade" id="pills-vbank" role="tabpanel" aria-labelledby="pills-vbank-tab"  style="padding-left: 3%;">
								<dl>
									<dt>
										<input type="checkbox" class="custom-control-input" id="vbankControlInline">
										<label class="custom-control-label" for="vbankControlInline">
											<font size="3">결제 진행 필수사항 동의</font>
										</label>
									</dt>
									<dd>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</dd>
								</dl>
							</div>
							<div class="tab-pane fade" id="pills-phone" role="tabpanel" aria-labelledby="pills-phone-tab"  style="padding-left: 3%;">
								<dl>
									<dt>
										<input type="checkbox" class="custom-control-input" id="phoneControlInline">
										<label class="custom-control-label" for="phoneControlInline">
											<font size="3">결제 진행 필수사항 동의</font>
										</label>
									</dt>
									<dd>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</dd>
								</dl>
							</div>
						</div>
						<div class="row mt-5">
							<div class="col-12" style="padding-bottom:5%;">
								<a class="btn btn-dark btn-lg text-white w-100 IMP_pay" role="button" aria-pressed="true">결제하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>
		

<script src="https://kit.fontawesome.com/b74b42490f.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="	sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>

	
	
	$(document).ready(function(){
		
		var totalPrice=0;
		var totalShipPrice=0;
		var totalPayPrice=0;
		function getTotalPrice(){
	 		//오른쪽 상품금액 + 배송비 + 결제금액 구해서 뿌리기
			$('.price').each(function (index,item){
				var price = $(item).text()
				var amount = $(item).parent().parent().find('.amount').text()
				totalPrice += price*amount
				$('.totalPrice').text(totalPrice);
			})
			$('.ship').each(function (index,item){
				totalShipPrice += $(item).text()*1
				$('.totalShipPrice').text('+'+totalShipPrice);
			})
			totalPayPrice = totalPrice+totalShipPrice;
			$('.totalPayPrice').text('총 결제금액 : '+totalPayPrice);
	 	}
		getTotalPrice();
		
		//배송지 정보와 동일하게 채우기
		$(document).on('click','#getInfo_btn',function(){ 
			$('.toName').val($('.name').val())
			$('.toAddress1').val($('.address1').val())
			$('.toAddress2').val($('.address2').val())
			$('.toPhone').val($('.phone').val())
		});
		
		var card ='';
		$(document).on('click','.pay_method',function(){ 
			if($(this).hasClass('active')){
				card = $(this).attr('value')  
			}
		})
		
		
		
		$(document).on('click','.IMP_pay',function(){
			//유효성 검사
			if($('.toName').val()==''){
				alert('이름을 채워주세요'); 
				return
			}if($('.toAddress1').val()=='' || $('.toAddress2').val()==''){
				alert('주소를 채워주세요'); 
				return
			}if($('.toAddress1').val()=='' || $('.toAddress2').val()==''){
				alert('주소를 채워주세요'); 
				return
			}if($('.toPhone').val()==''){
				alert('번호를 채워주세요'); 
				return
			}if(!$('.active').find('input').is(':checked')){
				alert('동의란에 체크주세요'); 
				return
			}
			
			
			var BASKET_NUMS ='';
			var BASKET_AMOUNTS='';
			var ORDER_PRICE = totalPayPrice;
			var ORDER_PERSON = $('.toName').val();
			var ORDER_ADDRESS = $('.toAddress1').val();
				ORDER_ADDRESS += $('.toAddress2').val();
			var ORDER_PHONE= $('.toPhone').val();
			var ORDER_MEMO= $('.memo').val();
			var PRODUCT_NUM = '';
			
			var nums = $('input[name=BASKET_NUM]')
			for (var i = 0; i < nums.length; i++) {
				if (i != nums.length - 1) {
					BASKET_NUMS += nums[i].value + ',';
				} else {
					BASKET_NUMS += nums[i].value;
				} 
			}
			$('input[name=BASKET_AMOUNT]').each(function (index,item){
				if(index== ($('input[name=BASKET_AMOUNT]').length-1)){
					BASKET_AMOUNTS += $(item).val()
				}else{
					BASKET_AMOUNTS += $(item).val() + ',';	
				}
			})
			var p_nums = $('input[name=PRODUCT_NUM]')
			$(p_nums).each(function(index,item){
				if(index== ($(p_nums).length-1)){
					PRODUCT_NUM += $(item).val()
				}else{
					PRODUCT_NUM += $(item).val() + ',';	
				}
			})
			//결제수단 구하기
			console.log(new Date().getTime());
			console.log(card)
				var IMP = window.IMP; // 생략가능
				   IMP.init('imp41335180');  // 가맹점 식별 코드
				   
				   IMP.request_pay({
			       pg : 'html5_inicis', // 결제방식 
			       merchant_uid : 'merchant_' + new Date().getTime(),
			       name : 'NAGAGU 결제',	// order 테이블에 들어갈 주문명 혹은 주문 번호
			       amount : '100',	// 결제 금액
			       
			       buyer_name :  $('.toName').val(),	// 구매자 이름
			       buyer_tel :  $('.toPhone').val(),	// 구매자 전화번호
			       buyer_addr1 :  $('.toAddress1').val(),	// 구매자 주소
			       buyer_addr2 :  $('.toAddress2').val(),
			       buyer_postcode :  '',	// 구매자 우편번호
				   }, function(rsp) {
					  if ( rsp.success ){
							for(var i=0; i<$('.BASKET_NUM').length;i++){
								var BASKET_NUM = $('input[name=BASKET_NUM]')[i].value
								console.log('bnum'+BASKET_NUM)
								$.ajax({
									  url: "/NAGAGU/insertOrderProduct.my", 
						              type: "POST",
						              data: {'ORDER_NUM' : BASKET_NUM,'ORDER_PERSON' : ORDER_PERSON, 'ORDER_ADDRESS':ORDER_ADDRESS, 'ORDER_PHONE':ORDER_PHONE,'ORDER_MEMO':ORDER_MEMO, 'ORDER_METHOD' : card},
						              contentType:
						  				'application/x-www-form-urlencoded; charset=utf-8'
						  		});
							}
							var arr = new Array();
							$('.BASKET_NUM').each(function (index,item){
								var num = $(item).attr('value')
								arr.push(num)
							});
							var category='paid'
							var Data = { "arr": arr,"category":category}; 
								$.ajax({ 
									type: "post", 
									url: "/NAGAGU/updateCheck.my",
									dataType: "json", 
									data: Data, 
									success: function(){ 
										alert('성공')
									},
									error:function(){
										alert("ajax통신 실패!!");
									} 
								}).done(function(retVal){
				                	console.log(retVal.merchant_uid)
				                	location.href='./mypage_order_success.my'    
				                });
			    	  }else{
			    	  //[3] 아직 제대로 결제가 되지 않았습니다.
			          //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
			          }
			      });
			});
	});
	
	
	//$('#Amount').html(amount.toLocaleString()+"원");
</script>
</body>
</html>