<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.spring.store.Product_qnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	ArrayList<Map<String, Object>> selledInfo = (ArrayList<Map<String, Object>>)request.getAttribute("selledInfo");
	String ORDER_AMOUNT = (String)selledInfo.get(0).get("ORDER_AMOUNT");
	String ORDER_DATE = sdf.format(selledInfo.get(0).get("ORDER_DATE")); 
	String MEMBER_NICK = (String)selledInfo.get(0).get("MEMBER_NICK");
	String ORDER_METHOD = (String)selledInfo.get(0).get("ORDER_METHOD");
	int STATE = (int)selledInfo.get(0).get("ORDER_STATE");
	String ORDER_STATE = null;
	switch(STATE){
	    case 0 : 
	    	ORDER_STATE = "결제완료";
	        break;
	    case 1 : 
	    	ORDER_STATE = "배송대기" ;
	        break;  
	    case 2 : 
	    	ORDER_STATE = "배송중";
	        break;
	    case 3 : 
	    	ORDER_STATE = "배송완료";
	        break;
	    case 4 : 
	    	ORDER_STATE = "구매확정";
	        break;
	    case 5 : 
	    	ORDER_STATE = "환불요청";
	        break;
	    case 6 : 
	    	ORDER_STATE = "환불대기";
	        break;
	    case 7 : 
	    	ORDER_STATE = "환불완료";
	        break;
  	    }				 
	int ORDER_PRICE = (int)selledInfo.get(0).get("ORDER_PRICE");
	String ORDER_PERSON = (String)selledInfo.get(0).get("ORDER_PERSON");
	String ORDER_PHONE = (String)selledInfo.get(0).get("ORDER_PHONE");
	String ORDER_MEMO = (String)selledInfo.get(0).get("ORDER_MEMO");
	String ORDER_ADDRESS = (String)selledInfo.get(0).get("ORDER_ADDRESS");
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<style>
			a {
				color: black; 
			}			
			a:hover { 
				color: black; 
				font-weight: bold;
				text-decoration: none;
			}
			td {
				border-right: 1px solid black;
			}		
			.bgcolor {
				background-color:#F2F2F2;
			}
			.bold {
				font-weight: bold;
			}
			.headercol {
				background-color:white;
				font-weight: bold;
			}
		</style>
	</head>
	<body>
		<div>
			<table class="table table-striped mb-0">
  				<colgroup>
					<col style="width:15%">
					<col style="width:35%">
					<col style="width:15%">
					<col style="width:35%">
				</colgroup>
				<tr>
					<th colspan="4" scope="colgroup">상품 판매 상세 페이지</th>
				</tr>
				<tr>
					<th scope="col">주문번호</th>
					<td scope="col"><%=ORDER_AMOUNT %></td>
					<th scope="col">주문상태</th>
					<td scope="col" class="status">
						<span><%=ORDER_STATE %></span>&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="to_status">수정</button>
					</td>
				</tr>			
				<tr>
					<th scope="col">결제수단</th>
					<td scope="col"><%=ORDER_METHOD %></td>
					<th scope="col">결제금액</th>
					<td scope="col" class="price"><%=ORDER_PRICE %> 원</td>
				</tr>
				<tr>
					<th scope="col">주문자</th>
					<td scope="col"><%=MEMBER_NICK %></td>
					<th scope="col">주문일자</th>
					<td scope="col"><%=ORDER_DATE %></td>
				</tr>			
				<tr>
					<th scope="col">받는사람</th>
					<td scope="col"><%=ORDER_PERSON %></td>
					<th scope="col">전화번호</th>
					<td scope="col"><%=ORDER_PHONE %></td>
				</tr>					
				<tr>
					<th scope="col">주소</th>
					<td colspan="3" scope="colgroup"><%=ORDER_ADDRESS %></td>
				</tr>			
				<tr>
					<th scope="col">메모</th>
					<td colspan="3" scope="colgroup"><%=ORDER_MEMO %></td>
				</tr>	
			</table>
			<table class="table table-striped">
				<tr>
					<td scope="col" style="width:15%" class="headercol"></td>
					<td style="width:21%;" class="headercol">상품명</td>
					<td style="width:21%;" class="headercol">수량</td>
					<td style="width:21%;" class="headercol">색상</td>
					<td style="width:21%;" class="headercol">사이즈</td>
				</tr>
				<%	
				for(int i=0; i<selledInfo.size(); i++) {
					int PRODUCT_NUM = (int)selledInfo.get(i).get("PRODUCT_NUM");
					String PRODUCT_TITLE = (String)selledInfo.get(i).get("PRODUCT_TITLE");				
					String PRODUCT_COLOR = (String)selledInfo.get(i).get("PRODUCT_COLOR");				
					String PRODUCT_SIZE = (String)selledInfo.get(i).get("PRODUCT_SIZE");				
					int BASKET_AMOUNT = (int)selledInfo.get(i).get("BASKET_AMOUNT");				
				%>										
					<tr class="bgcolor">	
						<td scope="col" class="headercol">
							<%if(i==0) {%>상품 내역<%} %>
						</td>
						<td><a href="productdetail.pro?PRODUCT_NUM=<%=PRODUCT_NUM %>" target="_blank" class="bold"><%=PRODUCT_TITLE %></a></td>
						<td style="width:25%;"><%=BASKET_AMOUNT %>&nbsp;개</td>
						<td style="width:25%;"><%=PRODUCT_COLOR %></td>
						<td style="width:25%;"><%=PRODUCT_SIZE %></td>
					</tr>
				<%
				}
				%> 			

			</table>


			<div class="d-flex justify-content-center">
				<button type="button" class="btn btn-outline-dark btn-lg" onclick="window.close();">닫기</button>
			</div>	
		</div>					
		
		<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		<script>
	    function changeComma(){ 
	        $('.price').each(function (index,item){
	            var price = $(item).text()*1
	            $(item).text(price.toLocaleString()+'원')    
	        })
	    }
	    
	    $(document).ready(function() {
	  //  	changeComma();
		});

		$(document).on('click', '.to_status', function(event) {
			$('.status').empty();
			var output='';
			output += '<div class="selectSection">';
			output += '<select class="" style="height:30px;" id="selectORDER_STATE" name="selectORDER_STATE">';
			output += '<option value="0">결제완료</option>';
			output += '<option value="1">배송대기</option>';
			output += '<option value="2">배송중</option>';
			output += '<option value="3">배송완료</option>';
			output += '<option value="4">구매확정</option>';
			output += '<option value="5">환불요청</option>';
			output += '<option value="6">환불대기</option>';
			output += '<option value="7">환불완료</option>';
			output += '</select>';
			output += '&nbsp;&nbsp;&nbsp;';
			output += '<button class="btn_modify">수정하기</button>';
			output += '</div>';
			
			$('.status').append(output);
		});	

		$(document).on('click', '.btn_modify', function(event) {
			console.log($('#selectORDER_STATE').val())
			var to_state = $('#selectORDER_STATE').val();
			var state='';
	  		switch(to_state){
	  	    case 0 : 
	  	    	state = '결제완료';
	  	        break;
	  	    case 1 :
	  	    	state = '배송대기';
	  	        break;  
	  	    case 2 : 
	  	    	state = '배송중';
	  	        break;
	  	    case 3 : 
	  	    	state = '배송완료';
	  	        break;
	  	    case 4 : 
	  	    	state = '구매확정';
	  	        break;
	  	    case 5 : 
	  	    	state = '환불요청';
	  	        break;
	  	    case 6 : 
	  	    	state = '환불대기';
	  	        break;
	  	    case 7 : 
	  	    	state = '환불완료';
	  	        break;
			}		
	  		console.log('state : '+state)
			alertify.confirm('확인', "선택하신 상품을 " + state + " 상태로 변경하시겠습니까?", function() {
				var checkBoxArr = [];
				var ORDER_AMOUNT = '<%=ORDER_AMOUNT%>'; 
				checkBoxArr.push(ORDER_AMOUNT);
				modifyProductStatus(to_state, checkBoxArr);			
			}, function() {}
			);
		});
		
		//선택한 체크들 상태 변경해주는 함수
		function modifyProductStatus(to_state, checkBoxArr) {
			console.log("to_state : " + to_state)
			for (i=0;i<checkBoxArr.length;i++) {
				console.log("checkBoxArr[i] : " + checkBoxArr[i])
			} 
			$.ajax({
				url: '/NAGAGU/modifySelledProductStatus.my',
				type: 'POST',
				data: { "to_state" : to_state, "checkBoxArr" : checkBoxArr },
				dataType: 'json',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(retVal) {
					if(retVal.res == "OK") {
						location.href='./SproductSelledInfo.my?ORDER_AMOUNT=<%=ORDER_AMOUNT%>';
					} else {
						alertify.alert('확인',"상태변경 실패!");
					}
				},
				error: function() {
					alertify.alert("실행할 수 없습니다.");
				}
			}); 
			event.preventDefault();	
		}		
		</script>

	</body>
</html>