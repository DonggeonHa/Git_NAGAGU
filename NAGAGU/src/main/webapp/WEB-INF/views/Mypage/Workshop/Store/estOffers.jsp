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
</style>
<div id="page-content-wrapper" style="padding-top: 5%;">
	<div class="container-fluid">
        <div class="pb-5">
            <h1>견적 제안 관리</h1>
        </div>
        <div class="d-flex justify-content-between pb-2">
	        <div class="justify-content-start">
	            <button type="button" class="btn btn-sm btn-outline-dark mr-2">전체표시</button>
	            <button type="button" class="btn btn-sm btn-outline-dark mr-2">선택 삭제</button>                         
	            <span class="listnum_txt pt-2">전체 제안내역</span>
	            <span class="listnum_num pt-2" id="offer_count"></span>
	        </div>
	    </div>
	    <div class="d-flex justify-content-between pb-2">
	    	<div class="justify-content-start" style="padding: 0;">
				<div class="">
					<select class="search_hidden_state form-control" id="selectClassType" name="selectClassType" onchange="btn_select()" style="height: 100%;">
						<option value="allClass">전체</option>
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
			</div>
	        <div class="justify-content-end">
	        	<div class="d-flex justify-content-end">
		            <!-- Example split danger button -->
		            <div class="dropdown">
		                <button class="btn dropbtn btn-sm dropdown-toggle btn-search-mode" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                   	 선택
		                </button>
		                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		                    <a class="dropdown-item" onclick="select_category()">제목</a>
		                    <a class="dropdown-item" onclick="select_category()">작성자</a>
		                </div>
		            </div>
		
		            <!-- search -->
		            <nav class="navbar-light bg-light">
		              <form class="form-inline" >
		                <input class="form-control mr-sm-2" type="search" aria-label="Search" style="height:90%">
		                <button class="btn btn_search btn-sm my-2 my-sm-0" type="submit">검색</button>
		              </form>
		            </nav>
	            </div>
	        </div>
        </div>
	    <table class="table" id="work_store">
	        <thead>
	            <tr>
	                <th scope="col" class="th1" ><input id="all_select" type="checkbox"></th>      
	                <th scope="col" class="th2">번호</th>            
	                <th scope="col" class="th3">작성자</th>
	                <th scope="col" class="th4">게시물 제목</th>
	                <th scope="col" class="th6">카테고리</th>
	                <th scope="col" class="th7">제안가격</th>
	                <th scope="col" class="th5">제안날짜</th>
	                <th scope="col" class="th8">상태</th>
	                <th scope="col" class="th9">관리</th>
	                <th scope="col" class="th10">문의</th>
	            </tr>
	        </thead>
	        <tbody>
	         </tbody>
	    </table>
	    
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
		
		/* 제안 댓글 리스트 불러오기 */
		function getList() {
			console.log("get list start");
			
			var params = $('#listinfo').serialize();
			
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

		            $('#offer_count').html(data.offerCount + '건');
					
					if (data.offerCount == 0) {
						output += '<tr><td colspan="5" class="list_caution">등록된 제안이 없습니다</td><tr>';
					}
					
					else {
						/* 리스트 작성*/
						$.each(woList, function(index, item) {

				            output += '<tr>';
				            output += '<td scope="col" ><input type="checkbox" class="chk"></td>';  
				            output += '<th scope="col" >' + rnum + '</th>';
				            output += '<td scope="col" >' + item.ESTIMATE_NICK + '</td>';
				            output += '<td scope="col" >' + item.ESTIMATE_TITLE + '</td>';
				            output += '<td scope="col" >';
				            
				            var category = item.ESTIMATE_CATEGORY;
				            console.log("카테고리 : " + category);
				            
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
				            output += '<td scope="col" >' + item.OFFER_DATE + '</td>';
				            output += '<td scope="col" >' + item.ESTIMATE_STATE + '</td>';
				            output += '<td scope="col">';
				            output += '<input type="hidden" id="offer_content_' + item.OFFER_NUM + '" value=' + item.OFFER_CONTENT + '>';
				            console.log("OFFER_CONTENT : " + item.OFFER_CONTENT);
				            output += '<button class="btn_detail" value=' + item.ESTIMATE_NUM + '>보기</button>';
				            output += '<button class="btn_modify" of_num=' + item.OFFER_NUM + ' es_num=' + item.ESTIMATE_NUM + ' alt="" data-toggle="modal" data-target="#modifyFormModal" aria-haspopup="true" aria-expanded="false">수정</button>';
				           	output += '<button class="btn_delete" of_num=' + item.OFFER_NUM + ' es_num=' + item.ESTIMATE_NUM + '>삭제</button>';
				            output += '</td>';
				            output += '<td scope="col">';
				            output += '<button class="btn_note" value=' + item.ESTIMATE_NUM + '>쪽지</button>';
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
        
        $("input[class='chk']").click(function() {
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
			console.log(send_workshop);
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
				var es_num =  $(this).attr('es_num');
				console.log(of_num);
				console.log(es_num);
				var params = {"OFFER_NUM" : of_num, "ESTIMATE_NUM" : es_num };
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
		
		
		getList();
		

	});
	
</script>