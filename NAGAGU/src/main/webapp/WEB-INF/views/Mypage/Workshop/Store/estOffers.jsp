<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	String MEMBER_EMAIL = (String)session.getAttribute("MEMBER_EMAIL");
%>
<style>
	#work_store th, td {
		text-align:center;
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
	            <span class="listnum_num pt-2">건</span>
	        </div>
	        <div class="justify-content-end">
	        	<div class="d-flex justify-content-end">
		            <!-- Example split danger button -->
		            <div class="dropdown">
		                <button class="btn dropbtn btn-sm dropdown-toggle btn-search-mode" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                   	 선택
		                </button>
		                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		                    <a class="dropdown-item" href="#">제목</a>
		                    <a class="dropdown-item" href="#">작성자</a>
		                    <a class="dropdown-item" href="#">상태</a>
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
	    <div class="table_bottom">
	        <div class="page_nav">
	            <strong class="current_page">1</strong> 
	            <a href="">2</a>
	            <a href="">3</a>
	            <a href="">4</a>
	            <a href="">5</a>  
	            <a href="">→</a>
	        </div>
	    </div>
    </div>
</div>

<script>
	$(document).ready(function() {
		getList();
		
		function getList() {
			
			var params = $('#listinfo').serialize();
			
			$.ajax({
				url:'/NAGAGU/workshop_offer_list.ws', 
				type:'POST', 
				data: params,
				dataType:"json", //서버에서 보내줄 데이터 타입
				async:false,
				contentType:'application/x-www-form-urlencoded; charset=utf-8',
				success:function(data) {
					console.log(data.offerCount);
					console.log(data.woList);
					
					var output = '';
					var pagination = '';
					
					var nowpage = data.page;
					var maxpage = data.maxpage;
					var startpage = data.startpage;
					var endpage = data.endpage;
					var woList = data.woList;
					var rnum = data.rnum;
					
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
				            
				            switch (category) {
				            case 'desk':
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
				            output += '<td scope="col" >' + addComma(item.OFFER_PRICE) + '</td>';
				            output += '<td scope="col" >' + datepicker.formatDate('yy-mm-dd', item.OFFER_DATE) + '</td>';
				            output += '<td scope="col" >' + item.ESTIMATE_STATE + '</td>';
				            output += '<td scope="col">';
				            
				            output += '<button class="btn_detail" value=' + item.ESTIMATE_NUM + '>보기</button>';
				            output += '<button class="btn_modify" value=' + item.OFFER_NUM + '>수정</button>';
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

	});
	
	/* 쪽지 보내기 */
	$(document).delegate('.btn_note', 'click', function() {
		var send_address = $(this).attr("value");
		console.log(send_workshop);
		window.open('/NAGAGU/noteForm.nt?receive_mail=' + send_address, "쪽지 보내기", "width=600 height=700");
		return false;
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
	
</script>