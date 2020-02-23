<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.store.ProductVO"%>	
<%
	if (session.getAttribute("WORKSHOP_NUM") == null) {
		out.println("<script>");
		out.println("alertify.alert('확인','로그인 해주세요!')");
		out.println("location.href='./index.ma'");
		out.println("</script>");
	}
	ArrayList<ProductVO> WorkshopProoductList = (ArrayList<ProductVO>)request.getAttribute("WorkshopProoductList");
	
%>

<div id="page-content-wrapper" style="padding-top: 5%;">
	<div class="container-fluid">
		<div class="pb-5">
			<h1>판매된 상품 관리</h1>
		</div>
		<div class="d-flex justify-content-start pb-2">
			<button type="button" id="PaymentCompleted" class="to_status btn btn-sm btn-outline-dark mr-2">선택 결제완료</button>
			<button type="button" id="ShippingStandby" class="to_status btn btn-sm btn-outline-dark mr-2">선택 배송대기</button>
			<button type="button" id="ShippingIng" class="to_status btn btn-sm btn-outline-dark mr-2">선택 배송중</button>
			<button type="button" id="ShippingCompleted" class="to_status btn btn-sm btn-outline-dark mr-2">선택 배송완료</button>
			<button type="button" id="OrderConfirm" class="to_status btn btn-sm btn-outline-dark mr-2">선택 구매확정</button>
			<button type="button" id="RefundRequest" class="to_status btn btn-sm btn-outline-dark mr-2">선택 환불요청</button>
			<button type="button" id="RefundStandby" class="to_status btn btn-sm btn-outline-dark mr-2">선택 환불대기</button>
			<button type="button" id="RefundCompleted" class="to_status btn btn-sm btn-outline-dark mr-2">선택 환불완료</button>
			<span class="listnum_txt pt-2">전체 판매내역</span> 
			<span class="listnum_num pt-2"></span>
		</div>
		<div class="d-flex justify-content-between pb-2">
			<div class="justify-content-start" style="padding: 0;">
				<div class="d-flex justify-content-start">
					<button type="button" id="listall" class="btn btn-sm btn-outline-dark mr-2">전체표시</button>
					<div class="select1">
						<select class="search_hidden_state justify-content-start form-control" id="selectORDER_STATE" name="selectORDER_STATE" onchange="btn_select1()" style="height: 33px;">
							<option value="ORDER_STATE">주문상태</option>
							<option value="0">결제완료</option>
							<option value="1">배송대기</option>
							<option value="2">배송중</option>
							<option value="3">배송완료</option>
							<option value="4">구매확정</option>
							<option value="5">환불요청</option>
							<option value="6">환불대기</option>
							<option value="7">환불완료</option>
						</select>
					</div>
					<div class="select2" style="padding-left: 5px">
						<select class="search_hidden_state justify-content-start form-control" id="selectORDER_METHOD" name="selectORDER_METHOD" onchange="btn_select2()" style="height: 33px;">
							<option value="ORDER_METHOD">결제수단</option>
							<option value="toss">토스</option>
							<option value="card">카드</option>
							<option value="kakao">카카오페이</option>
							<option value="payco">페이코</option>
							<option value="samsung">삼성페이</option>
						</select>
					</div>
					<div class="select3" style="padding-left: 5px">
						<select class="search_hidden_state justify-content-start form-control" id="selectMYPRODUCT" name="selectMYPRODUCT" onchange="btn_select3()" style="height: 33px;">
							<option value="MYPRODUCT">포함하는 상품</option>
						<%
							for(int i=0; i<WorkshopProoductList.size(); i++) {
						%>	
							<option value="<%=WorkshopProoductList.get(i).getPRODUCT_TITLE() %>"><%=WorkshopProoductList.get(i).getPRODUCT_TITLE() %></option>
						<%
							}
						%>	
						</select>
					</div>
					<div class="select4" style="padding-left: 5px">
						<!-- 보기 정렬 -->
						<select class="search_hidden_state justify-content-start form-control" id="selectListAlign" name="selectListAlign" onchange="btn_select4()" style="height: 33px;">
							<option value="order_date">최근 판매순</option>
							<option value='order_price'>결제 금액순</option>
						</select>
					</div>
				</div>
			</div>
			<div class="justify-content-end" style="padding: 0;">
				<div class="d-flex justify-content-end">
					<!-- Example split danger button -->
					<div class="dropdown">
						<button class="btn dropbtn btn-sm dropdown-toggle btn-search-mode" type="button" id="searchType" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							선택
						</button>
						<div class="dropdown-menu" aria-labelledby="searchType">
							<button class="dropdown-item" id="dropdown-item-1" onclick="order_amount()">주문번호</button>
							<button class="dropdown-item" id="dropdown-item-2" onclick="member_nick()">주문자</button>
							<button class="dropdown-item" id="dropdown-item-3" onclick="product_title()">상품명</button>
						</div>
					</div>
					<!-- search -->
					<nav class="navbar-light bg-light">
						<!-- input에 enter키 누르면 자동으로 submit -->
						<form class="form-inline" onsubmit="return false">
							<input class="form-control mr-sm-2" type="search" id="keyword"
								aria-label="Search" style="height: 90%">
							<button class="btn btn_search btn-sm my-2 my-sm-0" type="button"
								id="btn_search">검색</button>
						</form>
					</nav>
				</div>
			</div>
		</div>
		<table class="table" id="work_store">
			<thead>
				<tr class="text-center">
					<th style="width: 5%;"><input id="all_select" type="checkbox"></th>
					<th style="width: 10%;">번호</th>
					<th style="width: 15%;">주문번호</th>
					<th style="width: 15%;">주문내역</th>
					<th style="width: 10%;">주문상태</th>
					<th style="width: 10%;">결제수단</th>
					<th style="width: 10%;">결제금액</th>
					<th style="width: 10%;">주문자</th>
					<th style="width: 10%;">주문일자</th>
					<th style="width: 5%;">상세</th>
				</tr>
			</thead>
			<tbody id="SelledproductList"></tbody>
		</table>
		<div id="list_none"></div>
		<div class="d-flex justify-content-center">
			<nav aria-label="Page navigation example" class="paginated" id="user-page"></nav>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(){
		var all_check = false;
		$("#all_select").click(function() {
			if (all_check == false) {
				$("input[type=checkbox]").prop("checked",true);
				all_check = true;
			}
			else {
				$("input[type=checkbox]").prop("checked",false);
				all_check = false;
			}
		});
	});
	//검색타입 선택
	function order_amount() {
		$('#searchType').html('주문번호');
		$('#searchType').val('order_amount');
	};
	function member_nick() {
		$('#searchType').html('주문자');
		$('#searchType').val('member_nick');
	}
	
	function product_title() {
		$('#searchType').html('상품명');
		$('#searchType').val('product_title');
	}

	//좌측 sort검색
	function btn_select1() {	/*select1-주문상태 선택*/			
		console.log("$('#selectORDER_STATE option:selected').val() : "+$("#selectORDER_STATE option:selected").val())
		$('#SelledproductList').empty();
		SelledproductList();
	}	
	function btn_select2() {	/*select2-결제수단 선택*/	
		console.log("$('#selectORDER_METHOD option:selected').val() : "+$("#selectORDER_METHOD option:selected").val())
		$('#SelledproductList').empty();
		SelledproductList();
	}
	function btn_select3() {	/*select3-포함하는 상품 선택*/		
		console.log("$('#selectMYPRODUCT option:selected').val() : "+$("#selectMYPRODUCT option:selected").val())
		$('#SelledproductList').empty();
		SelledproductList();
	}	
	function btn_select4() {	/*select4-리스트 정렬*/	
		console.log("$('#selectListAlign option:selected').val() : "+$("#selectListAlign option:selected").val())
		$('#SelledproductList').empty();
		SelledproductList();	
	}	
	
	//전체표시 버튼
	$(document).on('click', '#listall', function(event) {
		$("#keyword").val('');
		$('#list_none').empty();
		$("#selectORDER_STATE").val('ORDER_STATE').prop("selected", true);
		$("#selectORDER_METHOD").val('ORDER_METHOD').prop("selected", true);
		$("#selectMYPRODUCT").val('MYPRODUCT').prop("selected", true);
		$("#selectListAlign").val('order_date').prop("selected", true);
		$('#searchType').text('선택');
		$("#searchType").val('');
		$("#keyword").val('');
		SelledproductList();
	});  

	//검색버튼
	$(document).on('click', '#btn_search', function(event) {
		if ($('#keyword').val() == null) {
			alert("검색어를 입력하세요!");
			$('#keyword').focus();
			return false;
		}
		SelledproductList();
		$('#list_none').empty();
		event.preventDefault();
	});		
	
	$("#keyword").keyup(function(event){
		if (event.keyCode == 13) {
			if(!$('#keyword').val() || !$('#searchType').val()){
				alert("카테고리 선택, 검색어를 입력하세요!");
				$('#keyword').focus();
				return false;
			}	
			SelledproductList(event);
			$('#list_none').empty();
			event.preventDefault();
			return;
		}
		
	});	

	//상태변경 버튼들
	$(document).on('click', '.to_status', function(event) {
		if ($("input[name=chk]:checked").length == 0) {
			alertify.alert("확인",'상품을 선택해주세요!');
			return false;
		}
		var state = '';
		var to_state = 0;
  		switch($(this).attr('id')){
  	    case 'PaymentCompleted' : 
  	    	to_state = 0;
  	    	state = '결제완료';
  	        break;
  	    case 'ShippingStandby' : 
  	    	to_state = 1;
  	    	state = '배송대기';
  	        break;  
  	    case 'ShippingIng' : 
  	    	to_state = 2;
  	    	state = '배송중';
  	        break;
  	    case 'ShippingCompleted' : 
  	    	to_state = 3;
  	    	state = '배송완료';
  	        break;
  	    case 'OrderConfirm' : 
  	    	to_state = 4;
  	    	state = '구매확정';
  	        break;
  	    case 'RefundRequest' : 
  	    	to_state = 5;
  	    	state = '환불요청';
  	        break;
  	    case 'RefundStandby' : 
  	    	to_state = 6;
  	    	state = '환불대기';
  	        break;
  	    case 'RefundCompleted' : 
  	    	to_state = 7;
  	    	state = '환불완료';
  	        break;
		}			

		alertify.confirm('확인', "선택하신 상품을 " + state + " 상태로 변경하시겠습니까?", function() {
			var checkBoxArr = [];
			$("input[name=chk]:checked").each(function(i){
				var ORDER_AMOUNT = $(this).val(); 
				checkBoxArr.push(ORDER_AMOUNT);
				console.log("상태를 " + state + "으로 update할 주문번호 : " + ORDER_AMOUNT)
			});
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
					alertify.alert('확인',"상태변경 완료!");
				} else {
					alertify.alert('확인',"상태변경 실패!");
				}
				$("#keyword").val('');
				$('#list_none').empty();
				$("#selectORDER_STATE").val('ORDER_STATE').prop("selected", true);
				$("#selectORDER_METHOD").val('ORDER_METHOD').prop("selected", true);
				$("#selectMYPRODUCT").val('MYPRODUCT').prop("selected", true);
				$("#selectListAlign").val('order_date').prop("selected", true);
				$('#searchType').text('선택');
				$("#searchType").val('');
				$("#keyword").val('');
				SelledproductList();
			},
			error: function() {
				alertify.alert("확인","실행할 수 없습니다.");
			}
		}); 
		event.preventDefault();	
	}		
	/*구매내역 상세보기*/
	$(document).on('click', '.btn_detail', function(event) {
		var ORDER_AMOUNT = $(this).attr("value");
		var popupX = (window.screen.width / 2) - (500 / 2); // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 뺴주었음
		var popupY = (window.screen.height / 2) - (630 / 2); // 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 뺴주었음
		var pop = window.open('about:blank', 'Info', 'scrollbars=yes, resizable=yes, width=500, height=630, left=' + popupX + ', top=' + popupY);
		
		pop.location.href="SproductSelledInfo.my?ORDER_AMOUNT=" + ORDER_AMOUNT;	

	});	
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
	
    function changeComma(){ 
        $('.price').each(function (index,item){
            var price = $(item).text()*1
            $(item).text(price.toLocaleString()+'원')    
        })
    }
    
	$(document).ready(function() {
		SelledproductList();
	});
	
	function SelledproductList() {
		$('#remo').remove();
		$('#SelledproductList').empty();
		$('#list_none').empty();
		
		var selectORDER_STATE = $("#selectORDER_STATE option:selected").val();	//필터 값 가져오기
		var selectORDER_METHOD = $("#selectORDER_METHOD option:selected").val();	//필터 값 가져오기
		var selectMYPRODUCT = $("#selectMYPRODUCT option:selected").val();	//필터 값 가져오기
		var selectListAlign = $("#selectListAlign option:selected").val();	//필터 값 가져오기
		var searchType = $("#searchType").val();	//필터 값 가져오기
		var keyword = ''; 
		if ($('#keyword').val() != null) {
			keyword = $("#keyword").val();
		}
		console.log("selectORDER_STATE="+selectORDER_STATE)
		console.log("selectORDER_METHOD="+selectORDER_METHOD)
		console.log("selectMYPRODUCT="+selectMYPRODUCT)
		console.log("selectListAlign="+selectListAlign)
		console.log("searchType : " + searchType)
		console.log("keyword : " + keyword)
		
		var title = "";
		var number = 1;
		$.ajax({
			url: '/NAGAGU/SelledproductsList.my',
			type: 'POST',
			data: {"selectORDER_STATE" : selectORDER_STATE, 
					"selectORDER_METHOD" : selectORDER_METHOD, 
					"selectMYPRODUCT" : selectMYPRODUCT, 
					"selectListAlign" : selectListAlign,
					"searchType" : searchType,
					"keyword" : keyword
				},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(selledProductList) {
				console.log(selledProductList);
				var output = ' ';	
				
				if(selledProductList.length!=0) {
					$('.listnum_num').text(selledProductList.length+"건");
			     	for(var j=0; j<selledProductList.length; j++){
			     		if(selledProductList[j].length != 0) {
				     		console.log('졸려')
				     		var productList = selledProductList[j];
				     		console.log(productList)	//같은 주문번호를 가지고 있는 상품들 리스트
				     		var PRODUCT_TITLE = productList[0].PRODUCT_TITLE + ' 외 ' + (productList.length-1) + '건';	//상품이름 외 다른 정보들은 다 같으므로 0번째 데이터의 값으로 출력
							var ORDER_STATE = productList[0].ORDER_STATE;
				      		switch(ORDER_STATE){
				      	    case 0 : 
				      	    	ORDER_STATE = '결제완료'
				      	        break;
				      	    case 1 : 
				      	    	ORDER_STATE = '배송대기' 
				      	        break;  
				      	    case 2 : 
				      	    	ORDER_STATE = '배송중'
				      	        break;
				      	    case 3 : 
				      	    	ORDER_STATE = '배송완료'
				      	        break;
				      	    case 4 : 
				      	    	ORDER_STATE = '구매확정'
				      	        break;
				      	    case 5 : 
				      	    	ORDER_STATE = '환불요청'
				      	        break;
				      	    case 6 : 
				      	    	ORDER_STATE = '환불대기'
				      	        break;
				      	    case 7 : 
				      	    	ORDER_STATE = '환불완료'
				      	        break;
			   		   	    }				     		
				    		var ORDER_NUM = productList[0].ORDER_NUM;
				    		var ORDER_AMOUNT = productList[0].ORDER_AMOUNT;
							var ORDER_METHOD = productList[0].ORDER_METHOD;
							if(ORDER_METHOD == 'kakao') {
								ORDER_METHOD = '카카오페이';
							}
							var ORDER_PRICE = productList[0].ORDER_PRICE;
							var MEMBER_NICK = productList[0].MEMBER_NICK;
				    		var ORDER_DATE = new Date(productList[0].ORDER_DATE);
				    		var date = date_format(ORDER_DATE);			      
							output += '<tr class="text-center">';
							output += '<td><input type="checkbox" name="chk" value="'+ORDER_AMOUNT+'"></td>';
							output += '<td>' + number + '</td>';
							output += '<td>' + ORDER_AMOUNT + '</td>';
							output += '<td>' + PRODUCT_TITLE + '</td>';
							output += '<td>' + ORDER_STATE + '</td>';
							output += '<td>' + ORDER_METHOD + '</td>';
							output += '<td class="price">' + ORDER_PRICE + '</td>';
							output += '<td>' + MEMBER_NICK + '</td>';
							output += '<td>' + date + '</td>';
							output += '<td><button class="btn_detail" value="'+ORDER_AMOUNT+'">' + "상세" + '</button></td>';
							output += '</tr>';
							number += 1;
			     		} 
	 				}
					$('#SelledproductList').append(output);
				} else {	//판매된 상품이 아예 없을 경우
					output += '검색 결과가 없습니다.';
					$('.listnum_num').text("0건");
					$('#list_none').append(output);
					//검색결과 없을시 select조건들 초기화
					$("#selectORDER_STATE").val('ORDER_STATE').prop("selected", true);
					$("#selectORDER_METHOD").val('ORDER_METHOD').prop("selected", true);
					$("#selectMYPRODUCT").val('MYPRODUCT').prop("selected", true);
					$("#selectListAlign").val('order_date').prop("selected", true);
					$('#searchType').text('선택');
					$("#searchType").val('');
					$("#keyword").val('');		
				} 
				
		     	if(output.length == 1) {	//검색 결과가 없을 때
		     		output += '검색 결과가 없습니다.';
					$('.listnum_num').text("0건");
					$('#list_none').append(output);
					//검색결과 없을시 select조건들 초기화
					$("#selectORDER_STATE").val('ORDER_STATE').prop("selected", true);
					$("#selectORDER_METHOD").val('ORDER_METHOD').prop("selected", true);
					$("#selectMYPRODUCT").val('MYPRODUCT').prop("selected", true);
					$("#selectListAlign").val('order_date').prop("selected", true);
					$('#searchType').text('선택');
					$("#searchType").val('');
					$("#keyword").val('');					     		
		     	} 
				
		     	changeComma();
				page();
			},
			error: function() {
				alertify.alert("확인","productList를 띄울 수 없습니다.");
			}
		});
	}		



	// 만들어진 테이블에 페이지 처리
	function page() { 	
		$('#remo').empty();
		var reSortColors = function($table) {};
		$('nav.paginated').each(function() {
			var pagesu = 10;  //페이지 번호 갯수
	  		var currentPage = 0;
	  		var numPerPage = 10;  //목록의 수
	  		var $table = $('#work_store');    
	  		var $user = $('#user-page');
	  
			//length로 원래 리스트의 전체길이구함
			var numRows = $table.find('tbody tr').length;
			//Math.ceil를 이용하여 반올림
			var numPages = Math.ceil(numRows / numPerPage);
			//리스트가 없으면 종료
			if (numPages==0) return;
			//pager라는 클래스의 div엘리먼트 작성
			var $pager = $('<ul id="remo" class="pager pagination"></ul>');
			
			var nowp = currentPage;
			var endp = nowp+10;
	  
			//페이지를 클릭하면 다시 셋팅
			$table.bind('repaginate', function() {
			//기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
	  
				$table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
				$("#remo").html("");
	   
				if (numPages > 1) {     // 한페이지 이상이면
					if (currentPage < 5 && (numPages-currentPage) >= 5) {   // 현재 5p 이하이면
						nowp = 0;     // 1부터 
						endp = pagesu;    // 10까지
					} else {
						nowp = currentPage -5;  // 6넘어가면 2부터 찍고
						endp = nowp+pagesu;   // 10까지
						pi = 1;
					}
				 
					if (numPages < endp) {   // 10페이지가 안되면
						endp = numPages;   // 마지막페이지를 갯수 만큼
						nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
					}
					if (nowp < 1) {     // 시작이 음수 or 0 이면
						nowp = 0;     // 1페이지부터 시작
					}
				} else {       // 한페이지 이하이면
					nowp = 0;      // 한번만 페이징 생성
					endp = numPages;
				}
				// [처음]
				$('<li class="page-item" cursor: "pointer"><a class="page-link" href="#">처음</a></li>').bind('click', {newPage: page},function(event) {
					currentPage = 0;   
					$table.trigger('repaginate');  
					$($(".page-item")[2]).addClass('active').siblings().removeClass('active');
				}).appendTo($pager).addClass('clickable');
				
		    	// [이전]
				$('<li class="page-item" cursor: "pointer"><a class="page-link" href="#">이전</a></li>').bind('click', {newPage: page},function(event) {
					if(currentPage == 0) return; 
					currentPage = currentPage-1;
					$table.trigger('repaginate'); 
					$($(".page-item")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
				}).appendTo($pager).addClass('clickable');
		    	
		    	// [1,2,3,4,5,6,7,8]
				for (var page = nowp ; page < endp; page++) {
					$('<li class="page-item" cursor: "pointer"></li>').html('<a class="page-link" href="#">' + (page + 1) + '</a>').bind('click', {newPage: page}, function(event) {
						currentPage = event.data['newPage'];
						$table.trigger('repaginate');
						$($(".page-item")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
					}).appendTo($pager).addClass('clickable');
				}
		    	
		    	// [다음]
				$('<li class="page-item" cursor: "pointer"><a class="page-link" href="#">다음</a></li>').bind('click', {newPage: page},function(event) {
					if(currentPage == numPages-1) return;
					currentPage = currentPage+1;
					$table.trigger('repaginate'); 
					$($(".page-item")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
				}).appendTo($pager).addClass('clickable');
		    	
		    	// [끝]
				$('<li class="page-item" cursor: "pointer"><a class="page-link" href="#">끝</a></li>').bind('click', {newPage: page},function(event) {
					currentPage = numPages-1;
					$table.trigger('repaginate');
					$($(".page-item")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
				}).appendTo($pager).addClass('clickable');
		     
		     	$($(".page-item")[2]).addClass('active');
	  		});
			
			$pager.insertAfter($pager).find('li.page-item:first').next().next().addClass('active');   
			$pager.appendTo($user);
			$table.trigger('repaginate');
		});
	}
</script>