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
		<div class="d-flex justify-content-between pb-5">
			<div class="justify-content-start">
           		<h1>등록된 상품 관리</h1>
           	</div>
            <div class="justify-content-end">
            	<div class="justify-content-end">
            		<a href="./product_write.pro" class="btn mx-2 btn-outline-dark" role="button" aria-pressed="true">상품등록</a>
                </div>
            </div>
           </div>
            
		<div class="d-flex justify-content-start pb-2">
		    <button type="button" id="to_ingSale" class="btn btn-sm btn-outline-dark mr-2">선택 판매중</button>  
		    <button type="button" id="to_pauseSale" class="btn btn-sm btn-outline-dark mr-2">선택 품절</button>  
		    <button type="button" id="to_endSale" class="btn btn-sm btn-outline-dark mr-2">선택 판매종료</button>                              
		    <button type="button" id="deleteProducts" class="btn btn-sm btn-outline-dark mr-2">선택 삭제</button>                              
		    <span class="listnum_txt pt-2">전체 상품내역</span>
		    <span class="listnum_num pt-2"></span>
		</div>
		<div class="d-flex justify-content-between pb-2">
			<div class="justify-content-start" style="padding: 0;">
				<div class="d-flex justify-content-start">
					<button type="button" id="listall" class="btn btn-sm btn-outline-dark mr-2">전체표시</button>
					<div class="select1">
						<select class="search_hidden_state justify-content-start form-control" id="selectClassType" name="selectClassType" onchange="btn_select1()" style="height: 33px;">
							<option value="allProducts">전체</option>
							<option value="ingSale">판매중</option>
							<option value="pauseSale">품절</option>
							<option value="endSale">판매종료</option>
						</select>
					</div>
					<div class="select2" style="padding-left:5px">
						<select class="search_hidden_state justify-content-start form-control"  id="selectCategory" name="selectCategory" onchange="btn_select2()" style="height: 33px;">
							<option value="all">전체</option>
							<option value="table">책상</option>
							<option value="chair">의자</option>
							<option value="bookshelf">책장</option>
							<option value="bed">침대</option>
							<option value="drawer">서랍장</option>
							<option value="sidetable">협탁</option>
							<option value="dressing_table">화장대</option>
							<option value="others">기타</option>		
						</select>
					</div>	
					<div class="select3" style="padding-left:5px">	<!-- 보기 정렬 -->
						<select class="search_hidden_state justify-content-start form-control" id="selectListAlign" name="selectListAlign" onchange="btn_select3()" style="height: 33px;">
							<option value="product_date">최근 등록순</option>									
							<option value='product_sales'>판매량순</option>
							<option value="product_grade">평점순</option>
							<option value="product_read">조회순</option>
							<option value="product_like">좋아요순</option>
							<option value="product_price">판매가격순</option>
						</select>
					</div>
				</div>
			</div>
			<div class="justify-content-end" style="padding: 0;">
				<div class="d-flex justify-content-end">
					<!-- Example split danger button -->
					<div class="dropdown">
						<button class="btn btn-sm " type="button" id="searchType" disabled="disabled">
					        상품명
					    </button>
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
		        <th scope="col">번호</th>
		        <th scope="col">상태</th>
		        <th scope="col">카테고리</th>
		        <th scope="col">상품명</th>
		        <th scope="col">판매가</th>
		        <th scope="col">재고량</th>
		        <th scope="col">판매량</th>
		        <th scope="col">평점</th>
		        <th scope="col">조회수</th>
		        <th scope="col">좋아요</th>
		        <th scope="col">작성날짜</th>
		        <th scope="col">관리</th>
		        <th scope="col">이동</th>
		    </tr>
		    </thead>
		    <tbody id="productList">
		     </tbody>
		</table>
		<div id="list_none"></div>
		<div class="table_bottom">
			<table class="tbl paginated" id="tbl"></table>
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

	$(document).on('click', '#listall', function(event) {
		$("#keyword").val('');
		$('#list_none').empty();
		$("#selectClassType").val('allProducts').prop("selected", true);
		$("#selectCategory").val('all').prop("selected", true);
		$("#selectListAlign").val('product_date').prop("selected", true);
		productList();
	});    
	
	
	//선택한 체크들 상태 변경해주는 함수
	function modifyProductStatus(to_status, checkBoxArr) {
		console.log("to_status : " + to_status)
		for (i=0;i<checkBoxArr.length;i++) {
			console.log("checkBoxArr[i] : " + checkBoxArr[i])
		}
		$.ajax({
			url: '/NAGAGU/modifyProductStatus.my',
			type: 'POST',
			data: { "to_status" : to_status, "checkBoxArr" : checkBoxArr },
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(res) {
				if(res == 1) {
					alert("판매중으로 변경 완료!");						
				} else if(res == 0) {
					alert("품절로 변경 완료!");						
				} else if(res == 2) {
					alert("판매종료로 변경 완료!");						
				} else if(res == -1) {
					alert("삭제 완료!");	
				} else {
					alert("실패!");
				}
				
				$("#keyword").val('');
				$("#selectClassType").val('allProducts').prop("selected", true);
				$("#selectCategory").val('all').prop("selected", true);
				$("#selectListAlign").val('product_date').prop("selected", true);
				productList();
			},
			error: function() {
				alert("실행할 수 없습니다.");
			}
		});
		event.preventDefault();
		
	}		
	
	
	
	$(document).on('click', '#to_ingSale', function(event) {
		if ($("input[name=chk]:checked").length == 0) {
			alert('상품을 선택해주세요!');
			return false;
		}
		var alert_confirm = confirm("선택하신 상품을 판매중 상태로 변경하시겠습니까??");
		if (alert_confirm) {
			var to_status = 1;
			var checkBoxArr = [];
			$("input[name=chk]:checked").each(function(i){
				var PRODUCT_NUM = $(this).val(); 
				checkBoxArr.push(PRODUCT_NUM);
				console.log("판매중으로 update할 PRODUCT_NUM : " + PRODUCT_NUM)
			});
			
			//상태 변경해주는 함수 호출
			modifyProductStatus(to_status, checkBoxArr);				
		}
	});  
	
	
	
	
	$(document).on('click', '#to_pauseSale', function(event) {
		if ($("input[name=chk]:checked").length == 0) {
			alert('상품을 선택해주세요!');
			return false;
		}
		var alert_confirm = confirm("선택하신 상품을 품절상태로 변경하시겠습니까??");
		if (alert_confirm) {
			var to_status = 0;
			var checkBoxArr = [];
			$("input[name=chk]:checked").each(function(i){
				var PRODUCT_NUM = $(this).val(); 
				checkBoxArr.push(PRODUCT_NUM);
				console.log("품절상태로 update할 PRODUCT_NUM : " + PRODUCT_NUM)
			});
			
			//상태 변경해주는 함수 호출
			modifyProductStatus(to_status, checkBoxArr);				
		}
	});    
	$(document).on('click', '#to_endSale', function(event) {
		if ($("input[name=chk]:checked").length == 0) {
			alert('상품을 선택해주세요!');
			return false;
		}
		var alert_confirm = confirm("선택하신 상품을 판매종료 상태로 변경하시겠습니까??");
		if (alert_confirm) {
			var to_status = 2;
			var checkBoxArr = [];
			$("input[name=chk]:checked").each(function(i){
				var PRODUCT_NUM = $(this).val(); 
				checkBoxArr.push(PRODUCT_NUM);
				console.log("판매종료로 update할 PRODUCT_NUM : " + PRODUCT_NUM)
			});
			
			//상태 변경해주는 함수 호출
			modifyProductStatus(to_status, checkBoxArr);				
		}
	});    
	$(document).on('click', '#deleteProducts', function(event) {
		if ($("input[name=chk]:checked").length == 0) {
			alert('상품을 선택해주세요!');
			return false;
		}
		var alert_confirm = confirm("선택하신 상품을 삭제하시겠습니까??");
		if (alert_confirm) {
			var to_status = -1;
			var checkBoxArr = [];
			$("input[name=chk]:checked").each(function(i){
				var PRODUCT_NUM = $(this).val(); 
				checkBoxArr.push(PRODUCT_NUM);
				console.log("삭제할 PRODUCT_NUM : " + PRODUCT_NUM)
			});
			
			//상태 변경해주는 함수 호출
			modifyProductStatus(to_status, checkBoxArr);				
		}
	});    
	
	
	$(document).on('click', '.btn_remove', function(event) {
		var alert_confirm = confirm("선택하신 상품을 삭제하시겠습니까??");
		if (alert_confirm) {
			var to_status = -1;
			var checkBoxArr = [];
			checkBoxArr.push($(this).val());
			console.log("삭제할 PRODUCT_NUM : " + $(this).val())
			
			//상태 변경해주는 함수 호출
			modifyProductStatus(to_status, checkBoxArr);				
		}
	}); 										
	
	

	$(document).on('click', '#btn_search', function(event) {
		if ($('#keyword') == null) {
			alert("검색어를 입력하세요!");
			$('#keyword').focus();
			return false;
		} else {
			console.log('aa');
		}
		productList();
		$('#list_none').empty();
	//	$("#keyword").val('');
		event.preventDefault();
	//	$("#selectClassType").val('all').prop("selected", true);	//display를 all로 바꿔줌
	});	
	
	$("#keyword").keyup(function(event){
		if (event.keyCode == 13) {
			if(!$('#keyword').val() || !$('#searchType').val()){
				alert("카테고리 선택, 검색어를 입력하세요!");
				$('#keyword').focus();
				return false;
			}	
			productList(event);
			$('#list_none').empty();
			event.preventDefault();
			return;
		}
		
	});	
		
	/*select1-판매상태 선택*/	
	function btn_select1() {		
		console.log("$('#selectClassType option:selected').val() : "+$("#selectClassType option:selected").val())
		$('#productList').empty();
		productList();
	}	
	
	/*select2-카테고리 선택*/	
	function btn_select2() {		
		console.log("$('#selectCategory option:selected').val() : "+$("#selectCategory option:selected").val())
		
		$('#productList').empty();
		productList();
	}	

	/*select3-리스트 정렬*/
	function btn_select3() {		
		console.log("$('#selectListAlign option:selected').val() : "+$("#selectListAlign option:selected").val())
		
		$('#productList').empty();
		productList();	
	}	
	
	
	/*후기 버튼 눌렀을 때 그 상품의 후기 관리 페이지로 이동*/
	function goqna(PRODUCT_NUM) {
		console.log("PRODUCT_NUM : " + PRODUCT_NUM)
		location.href= './goReviewOrQna.my?PRODUCT_NUM='+PRODUCT_NUM+'&GO=QNA';
	}		
	
	
	/*후기 버튼 눌렀을 때 그 상품의 후기 관리 페이지로 이동*/
	function goreview(PRODUCT_NUM) {
		console.log("PRODUCT_NUM : " + PRODUCT_NUM)
		location.href='./goReviewOrQna.my?PRODUCT_NUM='+PRODUCT_NUM+'&GO=REVIEW';
	}		
	
	
	
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
		productList();
	});
			
	function productList() {
		$('#remo').remove();
		$('#productList').empty();
		$('#list_none').empty();
		var selectClassType = $("#selectClassType option:selected").val();	//필터 값 가져오기
		var selectCategory = $("#selectCategory option:selected").val();	//필터 값 가져오기
		var selectListAlign = $("#selectListAlign option:selected").val();	//필터 값 가져오기
		var keyword = ''; 
		if ($('#keyword').val() != null) {
			keyword = $("#keyword").val();
		}
		console.log("selectClassType="+selectClassType)
		console.log("selectCategory="+selectCategory)
		console.log("selectListAlign="+selectListAlign)
		console.log("keyword : " + keyword)
		
		var title = "";
		var number = 1;
		$.ajax({
			url: '/NAGAGU/AllproductsList.my',
			type: 'POST',
			data: {"selectClassType" : selectClassType, 
					"selectCategory" : selectCategory, 
					"selectListAlign" : selectListAlign,
					"keyword" : keyword
				},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(productList) {
				console.log(productList);
				var output = ' ';	
				
				if(productList.length!=0) {
					$('.listnum_num').text(productList.length+"건");
					var myreply = new Array();
			     	for(var j=0; j<productList.length; j++){
			      		var PRODUCT_CATEGORY = productList[j].PRODUCT_CATEGORY
			      		switch(PRODUCT_CATEGORY){
				      	    case 'table' : 
				      	    	PRODUCT_CATEGORY = '책상'
				      	        break;
				      	    case 'chair' : 
				      	    	PRODUCT_CATEGORY = '의자' 
				      	        break;  
				      	    case 'bookshelf' : 
				      	    	PRODUCT_CATEGORY = '책장'
				      	        break;
				      	    case 'bed' : 
				      	    	PRODUCT_CATEGORY = '침대' 
				      	        break;  
				      	    case 'drawer' : 
				      	    	PRODUCT_CATEGORY = '서랍장'
				      	        break;
				      	    case 'sidetable' : 
				      	    	PRODUCT_CATEGORY = '협탁' 
				      	        break;  
				      	    case 'dressing_table' : 
				      	    	PRODUCT_CATEGORY = '화장대'
				      	        break;
				      	    case 'others' : 
				      	    	PRODUCT_CATEGORY = '기타' 
				      	        break;
			      	    }

				      	var product_category = productList[j].PRODUCT_CATEGORY;
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
			    		var PRODUCT_TITLE = productList[j].PRODUCT_TITLE;
			    		var PRODUCT_NUM = productList[j].PRODUCT_NUM;
			    		var PRODUCT_PRICE = productList[j].PRODUCT_PRICE;
    					var PRODUCT_STOCK = productList[j].PRODUCT_STOCK;
    					var PRODUCT_SALES = productList[j].PRODUCT_SALES;
    					var PRODUCT_GRADE = productList[j].PRODUCT_GRADE;
    					var PRODUCT_READ = productList[j].PRODUCT_READ;
    					var PRODUCT_LIKE = productList[j].PRODUCT_LIKE;
			    		var PRODUCT_DATE = new Date(productList[j].PRODUCT_DATE);
			    		var date = date_format(PRODUCT_DATE);
			      
						output += '<tr class="text-center">';
						output += '<td><input type="checkbox" name="chk" value="'+PRODUCT_NUM+'"></td>';
						output += '<td>' + number + '</td>';
						output += '<td>' + PRODUCT_STATUS + '</td>';
						output += '<td>' + PRODUCT_CATEGORY + '</td>';
						if(PRODUCT_TITLE.length >= 14) {
							PRODUCT_TITLE = PRODUCT_TITLE.substr(0,14)+"...";
						}
						output += '<td><a href="productdetail.pro?PRODUCT_NUM=' + PRODUCT_NUM + '&PRODUCT_CATEGORY=' + product_category + '">'+PRODUCT_TITLE+'</a></td>';
						output += '<td class="price">' + PRODUCT_PRICE + '</td>';
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
					$('#productList').append(output);
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
				changeComma();
				page();
			},
			error: function() {
				alert("productList를 띄울 수 없습니다.");
			}
		});
	}		
	
	//상품페이지 수정
	function updateProduct($PRODUCT_NUM){
		var PRODUCT_NUM = $PRODUCT_NUM;
		console.log(PRODUCT_NUM);
		
		location.href="./updateProductForm.mywork?PRODUCT_NUM=" + PRODUCT_NUM;
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