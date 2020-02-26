<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	String MEMBER_EMAIL = (String)session.getAttribute("MEMBER_EMAIL");
%>
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

<div id="page-content-wrapper" style="padding-top: 3%;">
	<!-- 리스트 폼 시작 -->
	<form id="listinfo" method="post">
		<input type="hidden" id="search_category" name="search_category">
		<input type="hidden" id="search_text" name="search_text">
		<input type="hidden" id="eo_category" name="eo_category">
		<input type="hidden" id="eo_state" name="eo_state">
		<input type="hidden" id="eo_page" name="page">
	</form>
	<!-- 리스트 폼 끝 -->
	<div class="container-fluid">
        <div class="pb-5">
            <h1>견적 주문 관리</h1>
        </div>
        <div class="d-flex justify-content-start pb-2">
            <button type="button" id="btn_select_note" class="btn btn-sm btn-outline-dark mr-2">선택 쪽지</button>    
            <button type="button" id="btn_select_delete" class="btn btn-sm btn-outline-dark mr-2">선택 삭제</button>                         
            <span class="listnum_txt pt-2">전체 제안내역</span>
            <span class="listnum_num pt-2" id="offer_count"></span>
        </div>
	    <div class="d-flex justify-content-between pb-2">
	    	<div class="justify-content-start" style="padding: 0;">
				<div class="d-flex justify-content-start">
		    		<button type="button" id="btn_reset" class="btn btn-sm btn-outline-dark mr-2">전체표시</button>
					<div class="selector">
						<select class="search_hidden_state form-control" id="selectCategory" name="selectCategory" style="height: 33px;">
							<option disabled>가구 종류</option>
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
						<select class="search_hidden_state form-control" id="selectState" name="selectState" style="height: 33px;">
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
			</div>
        	<div class="d-flex justify-content-end">
	            <!-- Example split danger button -->
	            <div class="dropdown">
	                <button class="btn dropbtn btn-outline-danger dropdown-toggle btn-search-mode" type="button" id="scButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                   	 선택
	                </button>
	                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	                    <button class="dropdown-item" value="cate_title">제목</button>
	                    <button class="dropdown-item" value="cate_member">고객명</button>
	                </div>
	            </div>
	
	            <!-- search -->
				<form class="form-inline" >
					<input class="form-control mr-sm-2" id="search_input"type="search" aria-label="Search" style="height:90%">
					<button class="btn btn_search btn-outline-danger my-2 my-sm-0" id="btn_search">검색</button>
				</form>
            </div>
        </div>
        <div style="height: 630px; overflow-y: auto;">
	        <form id="chk_form">
		    <table class="table" id="work_store">
		        <thead>
		            <tr>
		                <th style="width: 5%;" class="th1" ><input id="all_select" type="checkbox"></th>      
		                <th style="width: 5%;" class="th2">번호</th>            
		                <th style="width: 10%;" class="th3">고객명</th>
		                <th style="width: 17%;" class="th4">제목</th>
		                <th style="width: 10%;" class="th6">카테고리</th>
		                <th style="width: 15%;" class="th7">주문금액</th>
		                <th style="width: 10%;" class="th5">주문날짜</th>
		                <th style="width: 10%;" class="th8">상태</th>
		                <th style="width: 8%;" class="th9">관리</th>
		                <th style="width: 10%;" class="th10">1:1채팅</th>
		            </tr>
		        </thead>
		        <tbody>
		         </tbody>
		    </table>
		    </form>
		</div>
		<!-- 페이지네이션 --->
		<div class="row justify-content-center">
			<div id="pagination" class="pagination justify-content-center">
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
				url:'/NAGAGU/workshop_estimate_list.ws', 
				type:'POST', 
				data: params,
				dataType:"json", 
				async:false,
				contentType:'application/x-www-form-urlencoded; charset=utf-8',
				success:function(data) {
					
					console.log(data.offerCount);
					console.log(data.eoList);
					
					var output = '';
					var pagination = '';
					
					var eoList = data.eoList;	
					var rnum = data.rnum;

		            $('#offer_count').html(eoList.length + '건');
					
					if (eoList.length == 0) {
						output += '<tr><td colspan="10" class="list_caution">등록된 주문이 없습니다</td><tr>';
					}
					
					else {
						/* 리스트 작성*/
						
						$.each(eoList, function(index, item) {
							
							var eo_date = formatDate(item.es_ORDER_DATE);
							
							var eo_state = '';
							
							switch (item.es_ORDER_STATE) {
							case 0 :
								eo_state = '입금대기';
								break;
							case 1 :
								eo_state = '결제완료'
								break;
							case 2 :
								eo_state = '제작중';
								break;
							case 3 :
								eo_state = '배송준비';
								break;
							case 4 :
								eo_state = '배송중';
								break;
							case 5 :
								eo_state = '배송완료';
								break;
							case 6 :
								eo_state = '구매확정';
								break;
							}

				            output += '<tr>';
				            output += '<td scope="col" ><input type="checkbox" class="chk" name="chk" value=' + item.es_ORDER_NUM + '>';  
				            output += '<input type="hidden" class="disabled chechbox2" name="chk2" value=' + item.es_ORDER_BUYER_MAIL + '></td>';
				            output += '<th scope="col" >' + rnum + '</th>';
				            output += '<td scope="col" >' + item.es_ORDER_BUYER + '</td>';
				            output += '<td scope="col" >' + item.es_ORDER_TITLE + '</td>';
				            output += '<td scope="col" >';

				            var category = item.es_ORDER_CATEGORY;
				            console.log(category);
				            
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
				            output += '<td scope="col" >' + addComma(item.es_ORDER_PRICE) + '</td>';
				            output += '<td scope="col" >' + eo_date + '</td>';
				            output += '<td scope="col" >' + eo_state + '</td>';
				            output += '<td scope="col">';
				            output += '<button type="button" class="btn_detail btn btn-outline-danger btn-sm" value=' + item.es_ORDER_ESTIMATE + '>보기</button>';
				            output += '</td>';
				            output += '<td scope="col">';
				            output += '<button type="button" class="btn_note btn btn-outline-danger btn-sm" value=' + item.es_ORDER_BUYER_MAIL + '>쪽지</button>&nbsp;&nbsp;';
				            output += '<button type="button" class="btn_chat btn btn-outline-danger btn-sm" value=' + item.es_ORDER_NUM + '>채팅</button>';
				            output += '</td>';
				            output += '</tr>';
				            
				            rnum--; 
						});
						
						/* 페이지네이션 */

			            var nowpage = data.page;
			            var maxpage = data.maxpage;
			            var startpage = data.startpage;
			            var endpage = data.endpage;
			            var startRow = data.startRow;
			            var endRow = data.endRow;
			            
			            console.log("nowpage : " + nowpage);
			            console.log("maxpage : " + maxpage);
			            console.log("startpage : " + startpage);
			            console.log("endpage : " + endpage);
			            
						pagination += '<li class="page-item" cursor: "pointer" value=1><a class="page-link" href="#">처음</a></li>';
						pagination += '<li class="page-item" cursor: "pointer" value=';
						
						if (startpage < 6) {
							pagination += '-1';
						}
						else {
							pagination += (startpage - 1);
						}
						
						pagination += '><a class="page-link" href="#">이전</a></li>';
						
						for (var page = startpage; page < endpage+1; page++) {
							pagination += '<li class="page-item';
							if (page == nowpage) {
								pagination += ' active';
							}
							pagination += '" cursor: "pointer" value=' + page + '><a class="page-link" href="#">' + page + '</a></li>';
				            console.log("page : " + page);
						}
						
						pagination += '<li class="page-item" cursor: "pointer" value=';
						
						if (maxpage < 11) {
							pagination += '-1';
						}
						else {
							pagination += (endpage + 1);
						}
						
						pagination += '><a class="page-link" href="#">다음</a></li>';
						pagination += '<li class="page-item" cursor: "pointer" value=' + maxpage + '><a class="page-link" href="#">끝</a></li>';
				}
				
				$('#work_store > tbody').html(output);
				$('#pagination').html(pagination);
				
			},
			error:function(request, status, error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}

		$(document).delegate('.page-item','click' , function() {
			var pageLink = $(this).attr('value');
			$('#wo_page').val(pageLink);
			getList();
		});
		
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
			var num = "" + inputNumber;
			return num.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		function unComma(str) {
		    str = String(str);
		    return str.replace(/[^\d]+/g, '');
		}
		
		/* 쪽지 보내기 */
		$(document).delegate('.btn_note', 'click', function() {
			var send_address = $(this).attr("value");
			console.log(send_address);
			window.open('/NAGAGU/noteForm.nt?receive_mail=' + send_address, "쪽지 보내기", "width=440 height=580");
			return false;
		});
		
		/* 채팅창 열기 */
		$(document).delegate('.btn_chat', 'click', function() {
			var address = '/NAGAGU/chatRoom.ch?ES_ORDER_NUM=';
			address += $(this).attr("value");
			window.open(address, "1:1 채팅방", "width=400 height=740");
			return false;
		});
		
		/* 견적 제안글 상세보기 */
		
		$(document).delegate('.btn_detail', 'click', function() {
			var href = 'estimate_detail.es?ESTIMATE_NUM=' + $(this).attr('value');
			window.open(href);
			
			return false;
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
			$('#eo_category').val($('#selectCategory').val());
			
			getList();
			
			return false;
		});

		$('#selectState').change(function() {
			$('#eo_state').val($('#selectState').val());
			
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
		    
		    var frm = document.forms["chk_form"];
		    
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