<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.spring.order.BasketVO"%>
<%@page import="com.spring.order.ProductOrderVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>

<%
	ArrayList<Map<String, Object>> orderList = (ArrayList<Map<String, Object>>) request.getAttribute("orderList");
%>

<link rel="stylesheet" type="text/css" href="./resources/css/Mypage/order.css">
		
<style type="text/css">
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
		margin-top: 30px;
		margin-bottom: 100px;
	}
	
	.nav-link.active {
		background-color: #EAEAEA !important;
	}
    td dl div{
        text-align: right;  
    }
    .second-container .table{
        font-weight:600; 
    }
</style>

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
                                        <span>+배송비</span>
                                        <span class="text-center ship"><%=list.get("PRODUCT_SHIP_PRICE")%></span>
                                    </div>
									<div>
										<span>수량 X</span>
										<span class="text-center amount"><%=list.get("BASKET_AMOUNT")%></span>
									</div>
									<dd>&nbsp;</dd>
									<div>
										<span style="font-size:1.2rem;">총가격</span>
                                        <span class="text-center chongPrice" style="font-size:1.2rem;"></span>
									</div>
								</dl>
							</td>
							<td>
								<button class="btn btn-outline-dark delete_btn" value="<%=list.get("BASKET_NUM")%>">삭제</button> 
							</td>
						</tr>
				<%
					} 
				%>
			</table><hr>
		</div>
				<div>
			<div class="row">
				<div class="col-2">
					<h5 style="padding-top: 2%;">주문자</h5>
				</div>
			</div>
			<hr>
			<form>
				<div class="form-group row">
					<div class="col-2">
						<label for="inputAddress">이름</label>
					</div>
					<div class="col-5">
						<input type="text" class="form-control name" value="${memberDetail.MEMBER_NAME}">
					</div>
					<div class="col-5">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-2">
						<label for="inputAddress">우편번호</label>
					</div>
					<div class="col-3">
						<input type="text" class="form-control zip" value="${memberDetail.ADDRESS_ZIP}">
					</div>
					<div class="col-7"></div>
				</div>
				<div class="form-group row">
					<div class="col-2">
						<label for="inputAddress">주소</label>
					</div>
					<div class="col-10">
						<input type="text" class="form-control address1" value="${memberDetail.ADDRESS_ADDRESS1}">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-2">
					</div>
					<div class="col-10 input-group">
						<input type="text" class="form-control address2" value="${memberDetail.ADDRESS_ADDRESS2}">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-2">
						<label for="inputAddress">휴대전화</label>
					</div>
					<div class="col-5">
						<input type="text" class="form-control phone" value="${memberDetail.MEMBER_PHONE}" >
					</div>
					<div class="col-5">
					</div>
				</div> 
			</form> 
		</div>
		
		<div style="padding: 0 0 5% 0;">
			<div class="row mt-5">
				<div class="col-2">
					<h5 style="padding-top: 2%;">배송지</h5>
				</div>
				<div class="col-10">
					<button type="button" id="getInfo_btn" class="btn btn-outline-dark" ><font size="2">주문자 정보와 동일하게 채우기</button>
				</div>
			</div>
			<hr>
			<form id="orderForm">
				<div class="form-group row">
					<div class="col-2">
						<label for="inputAddress">받는분</label>
					</div>
					<div class="col-5">
						<input type="text" class="form-control toName" name="ORDER_PERSON">
					</div>
					<div class="col-5">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-2">
						<label for="inputAddress">우편번호</label>
					</div>
					<div class="col-3">
						<input type="text" id="postcode" class="txtInp form-control toZip"readonly />
					</div>
					<div class="col-2">
						<input type = "button" onclick="execDaumPostcode()" value = "주소검색" class="btn btn-outline-dark">
					</div>
					<div class="col-5">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-2">
						<label for="inputAddress">주소</label>
					</div>
					<div class="col-10 input-group">
						<input id = "address" class = "txtInp form-control toAddress1" type = "text" readonly/> &nbsp;
					</div>
				</div>
				<div class="form-group row">
					<div class="col-2">
					</div>
					<div class="col-10 input-group">
						<input id= "detailAddress" class = "txtInp form-control toAddress2" type = "text" placeholder = "상세 주소를 입력해주세요."/>
						<input id="extraAddress" type="hidden" placeholder="참고항목">
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
			<div class="row" style="font-size: 20px; padding-bottom: 1%;">
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
								<img width="64" src="${pageContext.request.contextPath}/resources/images/Mypage/kakao.png" alt="Toss">
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

<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<!-- 우편번호 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	/* 우편번호 api */
	function execDaumPostcode() {
	    new daum.Postcode({
			oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	            
	            var themeObj = {
	                     //bgColor: "", //바탕 배경색
	                     searchBgColor: "#3498DB", //검색창 배경색
	                     //contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
	                     //pageBgColor: "", //페이지 배경색
	                     //textColor: "", //기본 글자색
	                     queryTextColor: "#FFFFFF" //검색창 글자색
	                     //postcodeTextColor: "", //우편번호 글자색
	                     //emphTextColor: "", //강조 글자색
	                     //outlineColor: "", //테두리
	            };
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("extraAddress").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("postcode").value = data.zonecode;
	            document.getElementById("address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("detailAddress").focus();
	        }
	    }).open();
	}

	$(document).ready(function(){
		//누르면 주문에서 삭제
        $(document).on('click','.delete_btn',function(){
            if(!confirm('삭제하시겠습니까?')){
                return
            }
			var bNum = $(this).attr('value')
			$.ajax({
				  url: "/NAGAGU/deleteBasket.my",
	              type: "POST",
	              data: { 'BASKET_NUM' : bNum},
	              contentType:
	  				'application/x-www-form-urlencoded; charset=utf-8',
	              success: function (retVal) {
	        		if(retVal.res=="OK"){
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
		});
		//
		
		var totalPrice=0;
		var totalShipPrice=0;
		var totalPayPrice=0;
		function getTotalPrice(){
	 		//오른쪽 상품금액 + 배송비 + 결제금액 구해서 뿌리기
            var sum_price=0;
            var sum_shipPrice=0;
            var sum_PayPrice=0;
			$('.price').each(function (index,item){
                var amount =  $(item).parent().parent().find('.amount').text()
				var price = $(item).text()
                var shipPrice = $(item).parent().parent().find('.ship').text()
                chongPrice = (price*1+shipPrice*1)*amount*1
                $(this).parent().parent().find('.chongPrice').text(chongPrice.toLocaleString()).append('원');
                
                sum_price     += price*1*amount;
                sum_shipPrice += shipPrice*1*amount;
            }) 
            sum_PayPrice= sum_price*1+sum_shipPrice*1;
            $('.totalPrice').text(sum_price.toLocaleString()).append('원')
            $('.totalShipPrice').text('+'+sum_shipPrice.toLocaleString()).append('원')
            $('.totalPayPrice').text('총 결제금액 : '+sum_PayPrice.toLocaleString()).append('원')  
            
		}
        getTotalPrice();
        
        function changeComma(){ 
            $('.price').each(function (index,item){
                var price = $(item).text()*1
                $(item).text(price.toLocaleString()+'원')    
            })
			$('.ship').each(function (index,item){
                var ship = $(item).text()*1
                $(item).text(ship.toLocaleString()+'원')    
			})
	    }
	    changeComma();
	    
	    //컬러 체인지
	    $('.chongPrice').css('color','rgba(239,144,14,1)');
		$('.chongPrice').prev().css('color','rgba(239,144,14,1)');
		$('.totalPayPrice').css('color','rgba(239,144,14,1)');
		
		//배송지 정보와 동일하게 채우기
		$(document).on('click','#getInfo_btn',function(){ 
			$('.toName').val($('.name').val())
			$('.toZip').val($('.zip').val())
			$('.toAddress1').val($('.address1').val())
			$('.toAddress2').val($('.address2').val())
			$('.toPhone').val($('.phone').val())
		});
		
		var card ='toss';
		$(document).on('click','.pay_method',function(){ 
			getPayMethod(this)
		})
		
		function getPayMethod(item){
			if($('.pay_method').hasClass('active')){
				card = $(item).attr('value')  
			}
		}
		
		$(document).on('click','.IMP_pay',function(){
			//유효성 검사
			if($('.toName').val()==''){
				alert('이름을 채워주세요'); 
				return
			}if($('.toZip').val()=='' || $('.toAddress1').val()=='' || $('.toAddress2').val()==''){
				alert('주소를 채워주세요');
				return
			}if($('.toPhone').val()==''){
				alert('번호를 채워주세요'); 
				return
			}if(!$('.active').find('input').is(':checked')){
				alert('동의란에 체크주세요'); 
				return
			}
			var ORDER_PERSON = $('.toName').val();
			var ORDER_ADDRESS = $('.toZip').val();
				ORDER_ADDRESS += $('.toAddress1').val();
				ORDER_ADDRESS += $('.toAddress2').val();
			var ORDER_PHONE= $('.toPhone').val();
			var ORDER_MEMO= '없음';
			if($('.memo').val()!=null){
				ORDER_MEMO=$('.memo').val();
			}
			//결제수단 구하기
			console.log(new Date().getTime());
			console.log(card)
			var IMP = window.IMP; // 생략가능
			IMP.init('imp41335180');  // 가맹점 식별 코드
			IMP.request_pay({
			   pg : 'html5_inicis', // 결제방식 
			   merchant_uid : new Date().getTime(),
			   name : 'NAGAGU 결제',	// order 테이블에 들어갈 주문명 혹은 주문 번호
			   amount : '100',	// 결제 금액
			   buyer_name :  $('.toName').val(),	// 구매자 이름
			   buyer_tel :  $('.toPhone').val(),	// 구매자 전화번호
			   buyer_addr1 :  $('.toAddress1').val(),	// 구매자 주소
			   buyer_addr2 :  $('.toAddress2').val(),
			   buyer_postcode :  $('.toZip').val(),	// 구매자 우편번호
			}, function(rsp) {
				if ( rsp.success ){
					var id= rsp.merchant_uid;
					for(var i=0; i<$('.BASKET_NUM').length;i++){
						var BASKET_NUM = $('input[name=BASKET_NUM]')[i].value
						var PRODUCT_NUM = $('input[name=PRODUCT_NUM]')[i].value
						console.log('pnum'+PRODUCT_NUM)
						$.ajax({
							  url: "/NAGAGU/insertOrderProduct.my", 
					             type: "POST",
					             data: {'ORDER_PRICE':PRODUCT_NUM,'ORDER_NUM':BASKET_NUM,'ORDER_PERSON' : ORDER_PERSON, 'ORDER_ADDRESS':ORDER_ADDRESS, 
					            	 'ORDER_PHONE':ORDER_PHONE,'ORDER_MEMO':ORDER_MEMO,'ORDER_AMOUNT': id, 'ORDER_METHOD' : card},
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
							},
							error:function(){
								alert("ajax통신 실패!!");
							} 
						}).done(function(retVal){
					             	console.log(retVal.merchant_uid)
					             	location.href='./mypage_order_success.my'    
					             });
				} else {
				 	  //[3] 아직 제대로 결제가 되지 않았습니다.
				      //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
				}
			});
		});
	});
</script>