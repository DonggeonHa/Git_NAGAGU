<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.spring.member.MemberVO "%>
<%@page import="com.spring.estimate.EstimateOrderVO"%>

<%
	EstimateOrderVO eovo = (EstimateOrderVO)request.getAttribute("eovo");
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
</style>

<div class="container order-container">
	<form id="orderForm" method="POST" action="mypage_estimate_update.my">
	<input type="hidden" name="ES_ORDER_NUM" value=<%=eovo.getES_ORDER_NUM()%>>
	<div class="second-container">
		<div style="padding: 0 0 5% 0;">
			<div class="row mt-5">
				<div class="col-2">
					<h5 style="padding-top: 2%;">배송 정보</h5>
				</div>
				<div class="col-10">
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
		<div class="col-12 row" style="padding-bottom:5%;">
			<div class="col-6">
				<button class="btn btn-outline-dark btn-lg w-100" type="submit">수정</button>
			</div>
			<div class="col-6">
				<a href="mypage_estimate.my" class="btn btn-outline-dark btn-lg w-100" role="button" aria-pressed="true">주문목록</a>
			</div>
		</div>
	</form>
</div>

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
</script>