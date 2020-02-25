<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.spring.member.MemberVO "%>
<%@page import="com.spring.estimate.EstimateOrderVO"%>

<%
	EstimateOrderVO eovo = (EstimateOrderVO)request.getAttribute("eovo");
	MemberVO memvo = (MemberVO)request.getAttribute("memvo");
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
    
    .eo_price {
    	text-align:right;
    	padding-left:5px;
    }
    
    .payment_no_selected {
    	opacity:0.8;
    	user-select:none;
    }
    
    .es_title a {
        color:#1B1B27;
        text-decoration:none;
        padding-left:1.8rem;
        font-size:1.2rem;
    }
    
    .es_title a:hover {
        color:#5f5f27;
        text-decoration:none;
    }
</style>

<div class="container order-container">
	<form id="orderForm" method="POST" action="mypage_estimate_payment.my">
	<input type="hidden" name="ES_ORDER_NUM" value=<%=eovo.getES_ORDER_NUM()%>>
	<input type="hidden" name="ES_ORDER_PRICE" value=<%=eovo.getES_ORDER_PRICE() %>> 
	<div class="second-container">
		<div>
		<h3>주문/결제</h3>
		<br/><br/>

		<h5 style="padding-bottom: 2%;">주문상품</h5>
		</div>
		<div class="mb-5">
				<table class="table table-hover">
				<colgroup>
					<col width="10%">
					<col width="90%">
				</colgroup>
					<tr>
						<td align="center">
							<a href="estimate_detail.es?ESTIMATE_NUM=<%=eovo.getES_ORDER_ESTIMATE()%>"><img class="basket-size" src="<%=eovo.getES_ORDER_PIC()%>"></a>
							
						</td>
						<td colspan="2">
							<dl>
								<dt class="es_title"><a href="estimate_detail.es?ESTIMATE_NUM=<%=eovo.getES_ORDER_ESTIMATE()%>"><%=eovo.getES_ORDER_TITLE()%></a></dt>
							</dl>
						</td>
					</tr>
				</table>
				<hr>
		</div>
		<div>
			<div class="row">
				<div class="col-2">
					<h5 style="padding-top: 2%;">주문자 정보</h5>
				</div>
			</div>
			<hr>
				<div class="form-group row">
					<div class="col-2">
						<label for="inputAddress">이름</label>
					</div>
					<div class="col-5">
						<input type="text" class="form-control name" name="ES_ORDER_BUYER_NAME" value=<%=memvo.getMEMBER_NAME() %>>
					</div>
					<div class="col-5">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-2">
						<label for="inputAddress">우편번호</label>
					</div>
					<div class="col-3">
						<input type="text" class="form-control zip" name="ES_ORDER_BUYER_ZIP">
					</div>
					<div class="col-7"></div>
				</div>
				<div class="form-group row">
					<div class="col-2">
						<label for="inputAddress">주소</label>
					</div>
					<div class="col-10">
						<input type="text" class="form-control address1" name="ES_ORDER_BUYER_ADDRESS1">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-2">
					</div>
					<div class="col-10 input-group">
						<input type="text" class="form-control address2" name="ES_ORDER_BUYER_ADDRESS2">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-2">
						<label for="inputAddress">연락처</label>
					</div>
					<div class="col-5">
						<input type="text" class="form-control phone" name="ES_ORDER_BUYER_PHONE">
					</div>
					<div class="col-5">
					</div>
				</div> 
		</div>
		
		<div style="padding: 0 0 5% 0;">
			<div class="row mt-5">
				<div class="col-2">
					<h5 style="padding-top: 2%;">배송지</h5>
				</div>
				<div class="col-10">
					<button type="button" id="getInfo_btn" class="btn btn-outline-dark" ><font size="2">주문자 정보와 동일</button>
				</div>
			</div>
			<hr>
				<div class="form-group row">
					<div class="col-2">
						<label for="inputAddress">받는분</label>
					</div>
					<div class="col-5">
						<input type="text" class="form-control toName" name="ES_ORDER_RECEIVER">
					</div>
					<div class="col-5">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-2">
						<label for="inputAddress">우편번호</label>
					</div>
					<div class="col-3">
						<input type="text" id="postcode" class="txtInp form-control toZip" name="ES_ORDER_ZIP" readonly />
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
						<input id = "address" class = "txtInp form-control toAddress1" type = "text" name="ES_ORDER_ADDRESS1" readonly/> &nbsp;
					</div>
				</div>
				<div class="form-group row">
					<div class="col-2">
					</div>
					<div class="col-10 input-group">
						<input id= "detailAddress" class = "txtInp form-control toAddress2" type = "text" name="ES_ORDER_ADDRESS2" placeholder = "상세 주소를 입력해주세요."/>
						<input id="extraAddress" type="hidden" placeholder="참고항목">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-2">
						<label for="inputAddress">연락처</label>
					</div>
					<div class="col-5">
						<input type="text" class="form-control toPhone" name="ES_ORDER_PHONE" >
					</div>
					<div class="col-5">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-2">
						<label for="inputAddress">배송 메모</label>
					</div>
					<div class="col-10 input-group">
						<input type="text" class="form-control memo" name="ES_ORDER_MEMO">
					</div>
				</div>
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
				<div class="col-10 eo_price" id="eo_price">
					<%=eovo.getES_ORDER_PRICE() %>
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
						<a class="nav-link pay_method" value="toss" id="pills-toss-tab" data-toggle="pill" href="#pills-toss" role="tab" aria-controls="pills-home" aria-selected="true">
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
					<div class="tab-pane fade" id="pills-toss" role="tabpanel" aria-labelledby="pills-toss-tab">
						<div style="padding: 1%; " class="radius mb-5">
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
		
		var formatted_price = addComma($('.eo_price').html()) + '원';
		$('.eo_price').html(formatted_price);
		
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
					console.log(id);
					$('#orderForm').submit();
				} else {
				 	  //[3] 아직 제대로 결제가 되지 않았습니다.
				      //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
				}
			});
		});

		function addComma(inputNumber) {
			   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	});
</script>