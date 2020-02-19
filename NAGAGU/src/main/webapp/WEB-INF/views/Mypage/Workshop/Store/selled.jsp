<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<button type="button" id="listall" class="btn btn-sm btn-outline-dark mr-2">전체표시</button>
			<button type="button" id="ShippingStandby" class="btn btn-sm btn-outline-dark mr-2">선택 배송대기</button>  
			<button type="button" id="ShippingIng" class="btn btn-sm btn-outline-dark mr-2">선택 배송중</button>  
			<button type="button" id="ShippingCompleted" class="btn btn-sm btn-outline-dark mr-2">선택 배송완료</button>  
			<button type="button" id="OrderConfirm" class="btn btn-sm btn-outline-dark mr-2">선택 구매확정</button>                              
			<button type="button" id="RefundRequest" class="btn btn-sm btn-outline-dark mr-2">선택 환불요청</button>                              
			<button type="button" id="RefundStandby" class="btn btn-sm btn-outline-dark mr-2">선택 환불대기</button>                              
			<button type="button" id="RefundCompleted" class="btn btn-sm btn-outline-dark mr-2">선택 환불완료</button>                              
			<span class="listnum_txt pt-2">전체 판매내역</span>
			<span class="listnum_num pt-2"></span>
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
					<div class="select2" style="padding-left:5px">
						<select class="search_hidden_state justify-content-start form-control"  id="selectORDER_METHOD" name="selectORDER_METHOD" onchange="btn_select2()" style="height: 33px;">
							<option value="ORDER_METHOD">결제수단</option>
							<option value="toss">토스</option>
							<option value="card">카드</option>
							<option value="kakao">카카오페이</option>
							<option value="payco">페이코</option>
							<option value="samsung">삼성페이</option>
							<option value="sidetable">협탁</option>
							<option value="dressing_table">화장대</option>
							<option value="others">기타</option>		
						</select>
					</div>	
					<div class="select4" style="padding-left:5px">
						<select class="search_hidden_state justify-content-start form-control"  id="selectORDER_METHOD" name="selectORDER_METHOD" onchange="btn_select4()" style="height: 33px;">
							<option value="PRODUCT_NAME">포함하는 상품</option>
							<option value="toss">토스</option>
							<option value="card">카드</option>
							<option value="kakao">카카오페이</option>
							<option value="payco">페이코</option>
							<option value="samsung">삼성페이</option>
							<option value="sidetable">협탁</option>
							<option value="dressing_table">화장대</option>
							<option value="others">기타</option>		
						</select>
					</div>	
					<div class="select3" style="padding-left:5px">	<!-- 보기 정렬 -->
						<select class="search_hidden_state justify-content-start form-control" id="selectListAlign" name="selectListAlign" onchange="btn_select3()" style="height: 33px;">
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
								<button class="dropdown-item" id="dropdown-item-1" onclick="member_nick()">주문번호</button>
								<button class="dropdown-item" id="dropdown-item-2" onclick="product_title()">주문자</button>
								<button class="dropdown-item" id="dropdown-item-3" onclick="qna_content()">상품명</button>
						</div>
					</div>								
					<!-- search -->
					<nav class="navbar-light bg-light">
						<!-- input에 enter키 누르면 자동으로 submit -->
						<form class="form-inline" onsubmit="return false">
							<input class="form-control mr-sm-2" type="search" id="keyword" aria-label="Search" style="height:90%">
							<button class="btn btn_search btn-sm my-2 my-sm-0" type="button" id="btn_search">검색</button>
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
			<nav aria-label="Page navigation example" class="paginated" id="user-page"></nav>
		</div>
	</div>
</div>

<script>

    
	function setSelect() {
		if ($("#all_select").is(":checked")) {
		            $("input[type=checkbox]").prop("checked",true);
		    } else {
		        $("input[type=checkbox]").prop("checked",false);
		}
	}
    
    function checkSelect() {
    
    if ($("input[name='chk']:checked").length == 3) {
        $("#all_select").prop("checked",true);
    }
    else {
        $("#all_select").prop("checked",false);
    }
    
    return true;
    }
    
        $(document).ready(function(){
            $("#all_select").prop("checked",false);
            setSelect();
        
            $("#all_select").click(function() {
                setSelect();
            });
    
            $("input[name='chk']").click(function() {
                checkSelect();
            });
        });
        
</script>