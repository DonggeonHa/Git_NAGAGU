<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("WORKSHOP_NUM") == null) {
		out.println("<script>");
		out.println("alert('로그인 해주세요!');");
		out.println("location.href='./index.ma'");
		out.println("</script>");
	}
%>

<div id="page-content-wrapper" style="padding-top: 5%;">
	<div class="container-fluid">
		<div class="pb-5">
			<h1>판매된 상품 관리</h1>
		</div>
		<div class="d-flex justify-content-start pb-2">
			<button type="button" id="listall"
				class="btn btn-sm btn-outline-dark mr-2">전체표시</button>
			<button type="button" id="ShippingStandby"
				class="btn btn-sm btn-outline-dark mr-2">선택 배송대기</button>
			<button type="button" id="ShippingIng"
				class="btn btn-sm btn-outline-dark mr-2">선택 배송중</button>
			<button type="button" id="ShippingCompleted"
				class="btn btn-sm btn-outline-dark mr-2">선택 배송완료</button>
			<button type="button" id="OrderConfirm"
				class="btn btn-sm btn-outline-dark mr-2">선택 구매확정</button>
			<button type="button" id="RefundRequest"
				class="btn btn-sm btn-outline-dark mr-2">선택 환불요청</button>
			<button type="button" id="RefundStandby"
				class="btn btn-sm btn-outline-dark mr-2">선택 환불대기</button>
			<button type="button" id="RefundCompleted"
				class="btn btn-sm btn-outline-dark mr-2">선택 환불완료</button>
			<span class="listnum_txt pt-2">전체 판매내역</span> <span
				class="listnum_num pt-2"></span>
		</div>
		<div class="d-flex justify-content-between pb-2">
			<div class="justify-content-start" style="padding: 0;">
				<div class="d-flex justify-content-start">
					<div class="select1">
						<select class="search_hidden_state justify-content-start form-control" id="selectORDER_STATE" name="selectORDER_STATE" onchange="btn_select1()" style="height: 33px;">
							<option value="ORDER_STATE">주문상태</option>
							<option value="PaymentCompleted">결제완료</option>
							<option value="ShippingStandby">배송대기</option>
							<option value="ShippingIng">배송중</option>
							<option value="ShippingCompleted">배송완료</option>
							<option value="OrderConfirm">구매확정</option>
							<option value="RefundRequest">환불요청</option>
							<option value="RefundStandby">환불대기</option>
							<option value="RefundCompleted">환불완료</option>
							<option value="pauseSale">품절</option>
							<option value="endSale">판매종료</option>
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
							<option value="selectMYPRODUCT">포함하는 상품</option>
							<option value="toss">내 상품들 나열할 것임</option>
							<option value="card">카드</option>
							<option value="kakao">카카오페이</option>
							<option value="payco">페이코</option>
							<option value="samsung">삼성페이</option>
						</select>
					</div>
					<div class="select4" style="padding-left: 5px">
						<!-- 보기 정렬 -->
						<select class="search_hidden_state justify-content-start form-control" id="selectListAlign" name="selectListAlign" onchange="btn_select4()" style="height: 33px;">
							<option value="product_date">최근 판매순</option>
							<option value='product_sales'>결제 금액순</option>
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
					<th scope="col"><input id="all_select" type="checkbox"></th>
					<th scope="col">주문번호</th>
					<th scope="col">주문내역</th>
					<th scope="col">주문상태</th>
					<th scope="col">결제수단</th>
					<th scope="col">결제금액</th>
					<th scope="col">주문자</th>
					<th scope="col">주문일자</th>
					<th scope="col">상세/수정</th>
				</tr>
			</thead>
			<tbody id="SelledproductList"></tbody>
		</table>
		<div id="list_none"></div>
		<div class="d-flex justify-content-center">
			<nav aria-label="Page navigation example" class="paginated"
				id="user-page"></nav>
		</div>
	</div>
</div>

<script>
	//검색 카테고리?타입? 선택
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
		$("#selectORDER_STATE").val('selectORDER_STATE').prop("selected", true);
		$("#selectORDER_METHOD").val('selectORDER_METHOD').prop("selected", true);
		$("#selectMYPRODUCT").val('selectMYPRODUCT').prop("selected", true);
		$("#selectListAlign").val('product_date').prop("selected", true);
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
			success: function(productList) {
				console.log(productList);
				var output = ' ';	
				
				if(productList.length!=0) {
					$('.listnum_num').text(productList.length+"건");
			     	for(var j=0; j<productList.length; j++){
				      	var PRODUCT_STATUS = productList[j].PRODUCT_STATUS;
			      		switch(PRODUCT_STATUS){
			      	    case 0 : 
			      	    	PRODUCT_STATUS = '품절'
			      	        break;
			      	    case 1 : 
			      	    	PRODUCT_STATUS = '판매중' 
			      	        break;  
			      	    case 2 : 
			      	    	PRODUCT_STATUS = '판매 종료'
			      	        break;
		   		   	    }
			    		var PRODUCT_TITLE = productList[j].PRODUCT_TITLE + '외  3건';
			    		var ORDER_NUM = productList[j].ORDER_NUM;
			    		var PRODUCT_PRICE = productList[j].PRODUCT_PRICE;
						var PRODUCT_STOCK = productList[j].PRODUCT_STOCK;
						var PRODUCT_SALES = productList[j].PRODUCT_SALES;
						var PRODUCT_GRADE = productList[j].PRODUCT_GRADE;
						var PRODUCT_READ = productList[j].PRODUCT_READ;
						var PRODUCT_LIKE = productList[j].PRODUCT_LIKE;
			    		var ORDER_DATE = new Date(productList[j].ORDER_DATE);
			    		var date = date_format(ORDER_DATE);
			      
						output += '<tr class="text-center">';
						output += '<td><input type="checkbox" name="chk" value="'+PRODUCT_NUM+'"></td>';
						output += '<td>' + number + '</td>';
						output += '<td>' + PRODUCT_STATUS + '</td>';
						output += '<td>' + PRODUCT_CATEGORY + '</td>';
						if(PRODUCT_TITLE.length >= 14) {
							PRODUCT_TITLE = PRODUCT_TITLE.substr(0,14)+"...";
						}
						output += '<td><a href="productdetail.pro?PRODUCT_NUM=' + PRODUCT_NUM + '&PRODUCT_CATEGORY=' + product_category + '">'+PRODUCT_TITLE+'</a></td>';
						output += '<td>' + PRODUCT_PRICE + '</td>';
						output += '<td>' + PRODUCT_STOCK + '</td>';
						output += '<td>' + PRODUCT_SALES + '</td>';
						output += '<td>' + PRODUCT_GRADE + '</td>';
						output += '<td>' + PRODUCT_READ + '</td>';
						output += '<td>' + PRODUCT_LIKE + '</td>';
						output += '<td>' + date + '</td>';
	
						output += '<td><button class="btn_modify" onclick="updateProduct(' + PRODUCT_NUM + ')">' + "수정 " + '</button>&nbsp;';
						output += '<button class="btn_remove" value="'+PRODUCT_NUM+'">' + "삭제" + '</button></td>';
						output += '<td><button class="btn_review" value="'+PRODUCT_NUM+'" onclick="goreview(this.value)">' + "후기" + '</button>&nbsp;';
						output += '<button class="btn_qna" value="'+PRODUCT_NUM+'" onclick="goqna(this.value)">' + "문의" + '</button></td>';
						output += '</tr>';
						number += 1;
	 				}
					$('#SelledproductList').append(output);
				} else {
					output += '검색 결과가 없습니다.';
					$('.listnum_num').text("0건");
					$('#list_none').append(output);
					//검색결과 없을시 select조건들 초기화
					$("#keyword").val('');
					$("#selectClassType").val('allProducts').prop("selected", true);
					$("#selectCategory").val('all').prop("selected", true);
					$("#selectListAlign").val('product_date').prop("selected", true);
				}
				page();
			},
			error: function() {
				alert("productList를 띄울 수 없습니다.");
			}
		});
	}		



	// 만들어진 테이블에 페이지 처리
	function page() { 	
	$('#remo').empty();
	var reSortColors = function($table) {
		/* $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd'); */
		/* $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even'); */
	};
	$('table.paginated').each(function() {
		var pagesu = 10;  //페이지 번호 갯수
		var currentPage = 0;
		var numPerPage = 10;  //목록의 수
		var $table = $('#work_store');    
		
		//length로 원래 리스트의 전체길이구함
		var numRows = $table.find('tbody tr').length;
		//Math.ceil를 이용하여 반올림
		var numPages = Math.ceil(numRows / numPerPage);
		//리스트가 없으면 종료
		if (numPages==0) return;
		//pager라는 클래스의 div엘리먼트 작성
		var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
		
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
			$('<br /><span class="page-number" cursor: "pointer">[처음]</span>').bind('click', {newPage: page},function(event) {
				currentPage = 0;   
				$table.trigger('repaginate');  
				$($(".page-number")[2]).addClass('active').siblings().removeClass('active');
			   }).appendTo($pager).addClass('clickable');
			// [이전]
			$('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').bind('click', {newPage: page},function(event) {
				if(currentPage == 0) return; 
			    currentPage = currentPage-1;
				$table.trigger('repaginate'); 
				$($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
			}).appendTo($pager).addClass('clickable');
			// [1,2,3,4,5,6,7,8]
			for (var page = nowp ; page < endp; page++) {
				$('<span class="page-number" cursor: "pointer" style="margin-left: 8px;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
					currentPage = event.data['newPage'];
					$table.trigger('repaginate');
					$($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
				}).appendTo($pager).addClass('clickable');
			} 
			// [다음]
			$('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').bind('click', {newPage: page},function(event) {
				if(currentPage == numPages-1) return;
			    currentPage = currentPage+1;
				$table.trigger('repaginate'); 
				$($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
			}).appendTo($pager).addClass('clickable');
			// [끝]
			$('<span class="page-number" cursor: "pointer">&nbsp;[끝]</span>').bind('click', {newPage: page},function(event) {
				currentPage = numPages-1;
				$table.trigger('repaginate');
				$($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
			}).appendTo($pager).addClass('clickable');
			
	
			$($(".page-number")[2]).addClass('active');
			reSortColors($table);
		});
		$pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
		$pager.appendTo($table);
		$table.trigger('repaginate');
		});
	}




</script>