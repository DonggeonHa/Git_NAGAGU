<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	String MEMBER_EMAIL = (String)session.getAttribute("MEMBER_EMAIL");
%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	#work_store th, td {
		text-align:center;
	}
	
	.modal-dialog {
		width:480px;
		height:640px;
	}
		
	.modalLabel {
		width:80px;
	}
		
	.btn_bid_cancle {
		color:red;
	}
	
	.selector {
		float:left;
	}
	
	#selectState {
		margin-left:5px;
	}
	
</style>
<div id="page-content-wrapper" style="padding-top: 5%;">

<!-- 리스트 폼 시작 -->
<form id="listinfo" method="post">
	<input type="hidden" id="search_category" name="search_category">
	<input type="hidden" id="search_text" name="search_text">
	<input type="hidden" id="eo_category" name="eo_category">
	<input type="hidden" id="eo_state" name="eo_state">
</form>

<!-- 리스트 폼 끝 -->


	<div class="container-fluid">
        <div class="pb-5">
            <h1>수제가구 주문 관리</h1>
        </div>
        <div class="d-flex justify-content-between pb-2">
	        <div class="justify-content-start">
	            <button type="button" id="btn_reset" class="btn btn-sm btn-outline-dark mr-2">전체표시</button>
	            <button type="button" id="btn_select_note" class="btn btn-sm btn-outline-dark mr-2">선택 쪽지</button>    
	            <button type="button" id="btn_select_delete" class="btn btn-sm btn-outline-dark mr-2">선택 삭제</button>                         
	            <span class="listnum_txt pt-2">전체 제안내역</span>
	            <span class="listnum_num pt-2" id="offer_count"></span>
	        </div>
	    </div>
	    <div class="d-flex justify-content-between pb-2">
	    	<div class="justify-content-start" style="padding: 0;">
				<div class="selector">
					<select class="search_hidden_state form-control" id="selectCategory" name="selectCategory" style="height: 100%;">
						<option disabled hidden>가구 종류</option>
						<option value="all">전체</option>
						<option value="table">책상</option>
						<option value="chair">의자</option>
						<option value="bookshelf">책장</option>
						<option value="bed">침대</option>
						<option value="drawer">서랍장</option>
						<option value="sidetable">협탁</option>
						<option value="dressing_table">화장대</option>
						<option value="misc">기타</option>
					</select>
				</div>
				<div class="selector">
					<select class="search_hidden_state form-control" id="selectState" name="selectState" style="height: 100%;">
						<option disabled hidden>현재 상태</option>
						<option value="-1">전체</option>
						<option value="0">입금대기</option>
						<option value="1">결제완료</option>
						<option value="2">제작중</option>
						<option value="3">배송준비</option>
						<option value="4">배송중</option>
						<option value="5">배송완료</option>
						<option value="6">구매확정</option>
					</select>
				</div>
			</div>
	        <div class="justify-content-end">
	        	<div class="d-flex justify-content-end">
		            <!-- Example split danger button -->
		            <div class="dropdown">
		                <button class="btn dropbtn btn-sm dropdown-toggle btn-search-mode" type="button" id="scButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                   	 선택
		                </button>
		                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		                    <button class="dropdown-item" value="cate_title">제목</button>
		                    <button class="dropdown-item" value="cate_member">고객명</button>
		                </div>
		            </div>
		
		            <!-- search -->
		            <nav class="navbar-light bg-light">
		              <form class="form-inline" >
		                <input class="form-control mr-sm-2" id="search_input"type="search" aria-label="Search" style="height:90%">
		                <button class="btn btn_search btn-sm my-2 my-sm-0" id="btn_search">검색</button>
		              </form>
		            </nav>
	            </div>
	        </div>
        </div>
        <form id="chk_form">
	    <table class="table" id="work_store">
	        <thead>
	            <tr>
	                <th scope="col" class="th1" ><input id="all_select" type="checkbox"></th>      
	                <th scope="col" class="th2">번호</th>            
	                <th scope="col" class="th3">고객명</th>
	                <th scope="col" class="th4">제목</th>
	                <th scope="col" class="th6">카테고리</th>
	                <th scope="col" class="th7">주문금액</th>
	                <th scope="col" class="th5">주문날짜</th>
	                <th scope="col" class="th8">상태</th>
	                <th scope="col" class="th9">관리</th>
	                <th scope="col" class="th10">1:1채팅</th>
	            </tr>
	        </thead>
	        <tbody>
	         </tbody>
	    </table>
	    </form>
	   
		<br/><br/><br/>
	
		<!-- 페이지네이션 -->
		<div class="row justify-content-center">
			<div id="pagination" class="pagination justify-content-center">
			</div>
		</div>

		</div>
    </div>
</div>

<script>
	var checkPrice =  /^[0-9]*$/;

	$(document).ready(function() {

		$('#selectCategory').val('가구 종류');
		$('#selectState').val('현재 상태');
		
		
		/* 제안 댓글 리스트 불러오기 */
		function getList() {
			console.log("get list start");
			
			var params = $('#listinfo').serialize();
			console.log(params);
			
			$.ajax({
				url:'/NAGAGU/workshop_offer_list.ws', 
				type:'POST', 
				data: params,
				dataType:"json", 
				async:false,
				contentType:'application/x-www-form-urlencoded; charset=utf-8',
				success:function(data) {
					console.log(data.offerCount);
					console.log(data.woList);
					
					var output = '';
					
					var woList = data.woList;
					var rnum = data.rnum;

		            $('#offer_count').html(woList.length + '건');
					
					if (data.offerCount == 0) {
						output += '<tr><td colspan="10" class="list_caution">등록된 제안이 없습니다</td><tr>';
					}
					
					else {
						/* 리스트 작성*/
						
						$.each(woList, function(index, item) {
							
							var es_date = formatDate(item.OFFER_DATE);
							
							var es_state = '';
							
							switch (item.ESTIMATE_STATE) {
							case 0 :
								es_state = '입찰중';
								break;
							case 1 :
								switch (item.OFFER_CASE) {
								case 1 :
									es_state = '낙찰'
									break;
								case 2 :
									es_state = '낙찰 실패'
									break;
								}
								break;
							case 2 :
								es_state = '유찰';
								break;
							case 3 :
								es_state = '취소';
								break;
							}

				            output += '<tr>';
				            output += '<td scope="col" ><input type="checkbox" class="chk" name="chk" value=' + item.OFFER_NUM + '>';  
				            output += '<input type="hidden" class="disabled" name="chk2" value=' + item.ESTIMATE_MEMBER + '></td>';
				            output += '<th scope="col" >' + rnum + '</th>';
				            output += '<td scope="col" >' + item.ESTIMATE_NICK + '</td>';
				            output += '<td scope="col" >' + item.ESTIMATE_TITLE + '</td>';
				            output += '<td scope="col" >';
				            
				            var category = item.ESTIMATE_CATEGORY;
				            
				            switch (category) {
				            case 'table':
				            	output += '책상';
				            	break;
				            case 'chair':
				            	output += '의자';
				            	break;
				            case 'bookshelf':
				            	output += '책장';
				            	break;
				            case 'bed':
				            	output += '침대';
				            	break;
				            case 'drawer':
				            	output += '서랍장';
				            	break;
				            case 'sidetable':
				            	output += '협탁';
				            	break;
				            case 'dressing_table':
				            	output += '화장대';
				            	break;
				            case 'misc':
				            	output += '기타';
				            	break;	
				            }
				            
				            output += '</td>';
				            output += '<td id="offer_price_' + item.OFFER_NUM + '" scope="col" >' + addComma(item.OFFER_PRICE) + '</td>';
				            output += '<td scope="col" >' + es_date + '</td>';
				            output += '<td scope="col" >' + es_state + '</td>';
				            output += '<td scope="col">';
				            output += '<input type="hidden" id="offer_content_' + item.OFFER_NUM + '" value=' + item.OFFER_CONTENT + '>';
				            output += '<button class="btn_detail" value=' + item.ESTIMATE_NUM + '>보기</button>';
				            output += '<button class="btn_modify" of_num=' + item.OFFER_NUM + ' es_num=' + item.ESTIMATE_NUM + ' alt="" data-toggle="modal" data-target="#modifyFormModal" aria-haspopup="true" aria-expanded="false">수정</button>';
				           	output += '<button class="btn_delete" of_num=' + item.OFFER_NUM + '>삭제</button>';
				            output += '</td>';
				            output += '<td scope="col">';
				            output += '<button class="btn_note" value=' + item.ESTIMATE_MEMBER + '>쪽지</button>';
				            output += '</td>';
				            output += '</tr>';
				            
				            rnum--; 
						});
						
						/* 페이지네이션 */
					}
					
					$('#work_store > tbody').html(output);
					$('#pagination').html(pagination);
					
				},
				error:function(request, status, error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
		
		
	    function setSelect() {
	        if ($("#all_select").is(":checked")) {
	               $("input[type=checkbox]").prop("checked", true);
	        } else {
	                $("input[type=checkbox]").prop("checked", false);
	        }
		}
	
	    function checkSelect() {
	        
	        if ($("input[class='chk']:checked").length == $("input[class='chk']").length) {
	            $("#all_select").prop("checked",true);
	        }
	        else {
	            $("#all_select").prop("checked",false);
	        }
	        
	        return true;
	   	}
            
        $("#all_select").click(function() {
            setSelect();
        });

        $(document).delegate('.chk', 'click', function() {
        	var check2 = $(this).parent().find('input[name="chk2"]');
        	if (check2.attr('disabled') == 'true') {
            	check2.attr('disabled', 'false');
        	}
        	else {
            	check2.attr('disabled', 'true');
        	}
        	console.log(check2.val());
            checkSelect();
        });
		            
	    $("#all_select").prop("checked",false);
        setSelect();

		$("#modform4").click(function() {
			var data = $("mod3").val();
			alert(data);
		});

		function modifyform(num) {
			var id = $('#exam').val();
			var data = $("mod3").val();
			alert(data);
		}

		function addComma(inputNumber) {
			   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		function unComma(str) {
		    str = String(str);
		    return str.replace(/[^\d]+/g, '');
		}
		
		/* 쪽지 보내기 */
		$(document).delegate('.btn_note', 'click', function() {
			var send_address = $(this).attr("value");
			console.log(send_address);
			window.open('/NAGAGU/noteForm.nt?receive_mail=' + send_address, "쪽지 보내기", "width=600 height=700");
			return false;
		});
		
		/* 견적 제안글 상세보기 */
		
		$(document).delegate('.btn_detail', 'click', function() {
			var href = 'estimate_detail.es?ESTIMATE_NUM=' + $(this).attr('value');
			window.open(href);
			
			return false;
		});
		
		/* 견적 수정 모달 */
		$(document).delegate('.btn_modify', 'click', function() {
			
			var m_estimate = $(this).attr('es_num');
			$('#modify_estimate').val(m_estimate);
			var m_offer_num = $(this).attr('of_num');
			$('#modify_offer_num').val(m_offer_num);
			var m_price = $('#offer_price_' + m_offer_num).html();
			$('#modify_offer_price').val(unComma(m_price));
			var m_content = $('#offer_content_' + m_offer_num).val();
			$('#modify_offer_content').val(m_content);

			return false;
		});
		
		/* 견적 수정 신청 */
		$('#btn_modify_submit').click(function() {
			var modify_price = $('#modify_offer_price').val();
			var modify_content = $('#modify_offer_content').val();
			
			if (!checkPrice.test(modify_price)) {
				alert("가격란은 숫자만 입력 가능합니다.");
				$('#modify_offer_price').focus();
				
				return false;
			}
			if (modify_price == "") {
				alert("가격을 입력해주십시시오.");
				$('#modify_offer_price').focus();
				
				return false;
			}
			if (modify_content == "") {
				alert("내용을 입력해주십시오.");
				$('#modify_offer_content').focus();
			}
			
			var params = $('#modifyForm').serialize();
			
			$.ajax({
				url:'/NAGAGU/offer_modify.es',
				type:'POST',
				data:params,
				aync:false,
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success : function(data) {
					alert("제안글이 성공적으로 수정되었습니다.");
					location.reload();
				},
			     error:function(request,status,error){
			         alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
				
			});
		});
		
		/* 견적 제안 삭제 */
		$(document).delegate('.btn_delete', 'click', function() {
			if (confirm("정말로 삭제하시겠습니까?")) {
				var of_num = $(this).attr('of_num');
				var params = {"OFFER_NUM" : of_num};
				console.log(params);
				$.ajax({
					url:'/NAGAGU/offer_delete.es',
					type:'POST',
					data:params,
					aync:false,
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success : function(data) {
						alert("제안글이 성공적으로 삭제되었습니다.");
						getList();
					},
				     error:function(request,status,error){
				         alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					}
					
				});
			
			}

			return false;
		});
		
		/* 카테고리 선택 */
		
		$('#selectCategory').change(function() {
			$('#wo_category').val($('#selectCategory').val());
			
			getList();
			
			return false;
		});

		$('#selectState').change(function() {
			$('#wo_state').val($('#selectState').val());
			
			getList();
			
			return false;
		});
		
		/* 검색 드롭다운 */
		
		$('.dropbtn').click(function() {
			$('.dropdown-menu').show();
			
			return false;
		});
		
		$('.dropdown-item').click(function () {
			$('#search_category').val($(this).val());
			$('#scButton').html($(this).html());
			$('.dropdown-menu').hide();
			
			return false;
		});
		
		$(document).click(function(e){
			   
		    if (!$(e.target).is('.dropdown-item')) {
				$('.dropdown-menu').hide();
		    }

		});
		
		$('#btn_search').click(function() {
			$('#search_text').val($('#search_input').val());
			
			getList();
			
			return false;
		});
		
		/* 초기화 */
		$('#btn_reset').click(function() {
			$('#selectCategory').val('가구 종류');
			$('#selectState').val('현재 상태');
			$('#scButton').html('선택');
			$('input[type="hidden"]').val('');
			$('input[type=checkbox]').prop('checked', false);
			getList();
			
			return false;
		});
		
		/* 선택 쪽지보내기 */
		
		$(document).delegate('#btn_select_note', 'click', function() {
			if ($("input[name='chk']:checked").length==0) {
	    		return false;
	    	}
		    
		    window.open('', 'new_pop' ,'width=600,height=700');
		    
		    
		    var frm = $('#chk_form');
		    
		    frm.action = 'selectedForm.nt';
		    frm.target = 'new_pop';
		    frm.method = 'post';
		    
		    frm.submit();
		    
		    return false;
		});
		
		/* 선택 삭제 */
		
		$(document).delegate('#btn_select_delete', 'click', function() {
			if ($("input[name='chk']:checked").length==0) {
	    		return false;
	    	}
			
	    	if (confirm("정말로 삭제하시겠습니까?")) {
				var params = $('#chk_form').serialize();
				console.log(params);
				$.ajax({
					url:'/NAGAGU/offer_delete.es',
					type:'POST',
					data:params,
					aync:false,
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success : function(data) {
						alert("제안글이 성공적으로 삭제되었습니다.");
						getList();
					},
				     error:function(request,status,error){
				         alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					}
					
				});
			
			}

			return false;
		});
	
		
		/* Date format */
		
		function formatDate(date) {
		    var d = new Date(date),
		        month = '' + (d.getMonth() + 1),
		        day = '' + d.getDate(),
		        year = d.getFullYear();
		
		    if (month.length < 2) 
		        month = '0' + month;
		    if (day.length < 2) 
		        day = '0' + day;
	
	    	return [year, month, day].join('.');
		}
		
		getList();
		

	});
	
</script>