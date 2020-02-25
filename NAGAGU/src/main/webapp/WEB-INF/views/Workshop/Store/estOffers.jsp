<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	String MEMBER_EMAIL = (String)session.getAttribute("MEMBER_EMAIL");
%>
<style>
	
	.table_container {
		min-height:550px;
	}
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
	<input type="hidden" id="wo_category" name="wo_category">
	<input type="hidden" id="wo_state" name="wo_state">
	<input type="hidden" id="wo_page" name="page">
</form>

<!-- 리스트 폼 끝 -->


	<div class="container-fluid">
        <div class="pb-5">
            <h1>견적 제안 관리</h1>
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
						<select class="search_hidden_state form-control" id="selectState" name="selectState" style="height: 33px;">
							<option disabled hidden>현재 상태</option>
							<option value="-1">전체</option>
							<option value="0">입찰중</option>
							<option value="1">낙찰</option>
							<option value="2">유찰</option>
							<option value="3">취소</option>
							<option value="4">제작중</option>
						</select>
					</div>
				</div>
			</div>
	        <div class="justify-content-end">
	        	<div class="d-flex justify-content-end" style="padding: 0;">
		            <!-- Example split danger button -->
		            <div class="dropdown">
		                <button class="btn btn_search btn-outline-danger dropbtn dropdown-toggle btn-search-mode" type="button" id="scButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                   	 선택
		                </button>
		                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		                    <button class="dropdown-item" value="cate_title">제목</button>
		                    <button class="dropdown-item" value="cate_member">작성자</button>
		                </div>
		            </div>
		
		            <!-- search -->
		            <nav class="navbar-light">
		              <form class="form-inline">
		                <input class="form-control mr-sm-2" id="search_input"type="search" aria-label="Search" style="height:90%">
		                <button class="btn btn_search btn-outline-danger btn_search my-2 my-sm-0" id="btn_search">검색</button>
		              </form>
		            </nav>
	            </div>
	        </div>
        </div>
        <div class="table_container">
	        <form id="chk_form" name="chk_form">
			    <table class="table" id="work_store">
			        <thead>
			            <tr>
			                <th style="width: 5%;" class="th1" ><input id="all_select" type="checkbox"></th>      
			                <th style="width: 5%;" class="th2">번호</th>            
			                <th style="width: 5%;" class="th3">작성자</th>
			                <th style="width: 25%;" class="th4">게시물 제목</th>
			                <th style="width: 8%;" class="th6">카테고리</th>
			                <th style="width: 10%;" class="th7">제안가격</th>
			                <th style="width: 10%;" class="th5">제안날짜</th>
			                <th style="width: 7%;" class="th8">상태</th>
			                <th style="width: 15%;" class="th9">관리</th>
			                <th style="width: 10%;" class="th10">문의</th>
			            </tr>
			        </thead>
			        <tbody>
			         </tbody>
			    </table>
		    </form>
	    </div>
	    
	    <!--  견적 수정 modal -->
		<div class="modal fade" id="modifyFormModal" tabindex="-1" role="dialog"
			aria-labelledby="offerFormLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="offerFormLabel">견적 수정</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="modifyForm" method="POST">
						<input type="hidden" id="modify_estimate" name="OFFER_ESTIMATE">
						<input type="hidden" id="modify_offer_num" name="OFFER_NUM">
							<label class="modalLabel" for="OFFER_PRICE">제시 가격</label>
							<input class="modalInput" id="modify_offer_price" type="text" name="OFFER_PRICE"><br>
							<label class="modalLabel" for="OFFER_CONTENT">내용</label>
							<textarea class="modalInput" id="modify_offer_content" name="OFFER_CONTENT" maxlength="200"></textarea>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
						<button type="button" id="btn_modify_submit" class="btn btn-primary">수정하기</button>
					</div>
				</div>
			</div>
		</div>
	
		<br/><br/><br/>
	
		<!-- 댓글 페이지네이션 -->
	</div>
		<div class="row justify-content-center">
			<div id="pagination" class="pagination justify-content-center">
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
					console.log(data.woList);
					
					var output = '';
					var pagination = '';
					
					var woList = data.woList;
					var rnum = data.rnum;

		            $('#offer_count').html(woList.length + '건');
					
					if (woList.length == 0) {
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
								switch (item.OFFER_STATE) {
								case 1 :
									es_state = '<b><font color="red">낙찰</font></b>';
									break;
								case 2 :
									es_state = '<b><font color="#d3d3d3">낙찰 실패</font></b>';
									break;
								}
								break;
							case 2 :
								es_state = '유찰';
								break;
							case 3 :
								es_state = '취소';
								break;
							case 4 :
								es_state = '<b><font color="#ef900e">제작중</font></b>';
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
				            output += '<button class="btn_detail btn btn_search btn-outline-danger btn-sm" value=' + item.ESTIMATE_NUM + '>보기</button>&nbsp;&nbsp;';
				            output += '<button class="btn_modify btn btn_search btn-outline-danger btn-sm" of_num=' + item.OFFER_NUM + ' es_num=' + item.ESTIMATE_NUM + ' alt="" data-toggle="modal" data-target="#modifyFormModal" aria-haspopup="true" aria-expanded="false">수정</button>&nbsp;&nbsp;';
				           	output += '<button class="btn_delete btn btn_search btn-outline-danger btn-sm" of_num=' + item.OFFER_NUM + '>삭제</button>';
				            output += '</td>';
				            output += '<td scope="col">';
				            output += '<button class="btn_note btn btn_search btn-outline-danger btn-sm" value=' + item.ESTIMATE_MEMBER + '>쪽지</button>';
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
				    alertify.alert("확인","code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
		
		$(document).delegate('.page-item','click' , function() {
			if ($(this).attr('value') == -1) {
				return false;
			}
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
			window.open('/NAGAGU/noteForm.nt?receive_mail=' + send_address, "쪽지 보내기", "width=440 height=580");
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
		    
		    var frm = document.forms["chk_form"];
		    frm.action = 'selectedForm.nt';
		    frm.target = 'new_pop';
		    frm.method = 'post';
		    
		    frm.submit();
		  
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