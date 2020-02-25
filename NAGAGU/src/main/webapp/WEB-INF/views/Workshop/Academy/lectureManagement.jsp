<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.workshopMypage.*" %>

<%
	if(session.getAttribute("WORKSHOP_NUM")==null){
		
		response.sendRedirect("/index.ma");
	}
%>
<div id="page-content-wrapper" style="padding-top: 3%;">
	<div class="container-fluid">
		<div class="d-flex justify-content-between pb-5">
		   	<div class="justify-content-start">
		       	<h1>등록된 강의 관리</h1>
		    </div>
			<div class="px-0">
				<div class="justify-content-end">
		        	<a href="./classform.ac" class="btn mx-2 btn-outline-dark" role="button" aria-pressed="true">강의등록</a>
		    	</div>
			</div>
		</div>

		<div class="d-flex justify-content-start pb-2">
		    <button type="button" id="selectClass" class="btn btn-sm btn-outline-dark mr-2">선택 강의종료</button>                
		    <span class="listnum_txt pt-2">전체 문의내역</span>
		    <span class="listnum_num pt-2"></span>
		</div>
		
		
		<div class="d-flex justify-content-between pb-2">
			<div class="justify-content-start" style="padding: 0;">
				<div class="d-flex justify-content-start">
					<button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">전체표시</button>
					<div class="select1">
						<select class="search_hidden_state form-control" id="selectClassType" name="selectClassType" onchange="btn_select()"  style="height: 33px;">
							<option value="allClass">전체</option>
							<option value="inClass">강의중</option>
							<option value="endClass">강의종료</option>
							<option value="onedayClass">원데이클래스</option>
							<option value="regularClass">정규클래스</option>
				    	</select>
			    	</div>
				</div>
			</div>
			<div class="justify-content-end" style="padding: 0;">
				<div class="d-flex justify-content-end">
					<!-- Example split danger button -->
					<div class="dropdown">
					    <button class="btn btn_search btn-outline-danger dropbtn dropdown-toggle btn-search-mode" type="button" id="searchType" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    	선택
					    </button>
					    <div class="dropdown-menu" aria-labelledby="searchType">
					        <button class="dropdown-item" id="dropdown-item-1" onclick="class_name()">강의명</button>
							<button class="dropdown-item" id="dropdown-item-2" onclick="area()">지역</button>
							<button class="dropdown-item" id="dropdown-item-3" onclick="category()">카테고리</button>
					    </div>
					</div>
					<!-- search -->
					<nav class="navbar-light">
						<!-- input에 enter키 누르면 자동으로 submit -->
						<form class="form-inline" onsubmit="return false">
							<input class="form-control mr-sm-2" type="search" id="keyword" aria-label="Search" style="height:90%">
						    <button class="btn btn_search btn-outline-danger btn_search my-2 my-sm-0" type="button" id="btn_search">검색</button>
						</form>
					</nav>
				</div>
			</div>
		</div>
           <div style="height: 620px; overflow-y: auto;">
            <table class="table table-hover" id="work_store">
                <thead>
	                <tr>
	                    <th style="width: 5%;"><input id="all_select" type="checkbox"></th>
	                    <th style="width: 10%;">상태</th>
	                    <th style="width: 5%;" >지역</th>
	                    <th style="width: 10%;">가격</th>
						<th style="width: 10%;" >클래스</th>
	                    <th style="width: 25%;">강의명</th>
	                    <th style="width: 10%;">카테고리</th>
	                    <th style="width: 15%;">일시</th>
	                    <th style="width: 5%;">회원수</th>
	                    <th style="width: 5%;">관리</th>                    
	                </tr>
                </thead>
                <tbody id="academyList">
                	
                </tbody>
            </table>
            <div id="list_none"></div>
           </div>
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
	
	function class_name() {
		$('#searchType').html('강의명');
		$('#searchType').val('className');
	};
	function area() {
		$('#searchType').html('지역');
		$('#searchType').val('area');
	}
	function category() {
		$('#searchType').html('카테고리');
		$('#searchType').val('category');
	}
    
	
	$("#keyword").keyup(function(event){
		var searchType = $('#searchType').val();
		var keyword = $('#keyword').val();
		
		if (event.keyCode == 13) {
			if(!keyword || !searchType){
				alertify.alert("카테고리 선택,검색어를 입력하세요.");
				classList();
				return false;
			}
			
			event.preventDefault();
			search(event);
			return;
		}
	});
	
	
	function btn_select() {
		classList();
	}
	
	$(document).ready(function() {
		classList();
	});
	
	function classList() {
		$('#remo').remove();
		$('#academyList').empty();
		$('#list_none').empty();
		
		var selectClassType = $("#selectClassType option:selected").val();	//필터 값 가져오기
		var title = "";
		var output = '';
		
		$.ajax({
			url: '/NAGAGU/classManagementList.my',
			type: 'POST',
			data: {"selectClassType" : selectClassType},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				$('.listnum_num').text(data.length+"건");
				console.log(data);
				if(data.length != 0) {
					$.each(data, function(index, item) {
						
						output += '<tr>';
						output += '<td><input type="checkbox" name="chk_status" value="'+ item.class_NUMBER + '"></td>';
						
						if(item.class_STATUS == 0) {
							output += '<td>' + "강의종료" + '</td>';
						} else if(item.class_STATUS == 1) {
							output += '<td>' + "강의중" + '</td>';
						}
						
						output += '<td>' + item.class_AREA + '</td>';
						output += '<td>' + item.class_AMOUNT + '</td>';
						output += '<td>' + item.class_DIVISION + '</td>';
						
						if(item.class_NAME.length >= 14) {
							title = item.class_NAME.substr(0,14)+"...";
							
							output += '<td><a href="classdetail.ac?CLASS_NUMBER=' + item.class_NUMBER + '">' + title + '</a></td>';
						} else {
							output += '<td><a href="classdetail.ac?CLASS_NUMBER=' + item.class_NUMBER + '">' + item.class_NAME + '<a/></td>';
						}
						
						switch(item.class_CATEGORY){
			        	    case 'table' :
			        	    	output += '<td>책상</td>';
			        	        break;
			        	    case 'chair' :
			        	    	output += '<td>의자</td>';
			        	        break;
			        	    case 'bookshelf' :
			        	    	output += '<td>책장</td>';
			        	        break;
			        	    case 'bed' :
			        	    	output += '<td>침대</td>';
			        	        break;
			        	    case 'drawer' :
			        	    	output += '<td>서랍장</td>';
			        	        break;
			        	    case 'sidetable' :
			        	    	output += '<td>협탁</td>';
			        	        break;
			        	    case 'dressing_table' :
			        	    	output += '<td>화장대</td>';
			        	        break;
			        	    case 'others' :
			        	    	output += '<td>기타</td>';
			        	        break;
		     			}
						
						output += '<td>' + item.class_DATE_CONFIGURATION_1 + ' ~ ' + item.class_DATE_CONFIGURATION_2  + '</td>';
						output += '<td>' + item.class_COUNT_MEMBER + '</td>';
						output += '<td><button class="btn_modify btn btn_search btn-outline-danger btn-sm" onclick="updateClass(' + item.class_NUMBER + ')">' + "수정" + '</button></td>';
						output += '</tr>';
						
						
					})
					$('#academyList').append(output);
				} else{
					output += '등록된 강의가 없습니다.';
					$('#list_none').append(output);
				}
				page();
			},
			error: function() {
				alert("ajax 통신 실패!");
			}
		});
	}
	
	
	$(document).on('click', '#btn_search', function(event) {
		var searchType = $('#searchType').val();
		var keyword = $('#keyword').val();
		
		if(!keyword || !searchType){
			alertify.alert("카테고리 선택,검색어를 입력하세요.");
			classList();
			return false;
		}

		search(event);
	});
	
	function search(event){
		$('#remo').remove();
		var searchType = $('#searchType').val();
		var keyword = $('#keyword').val();
		var title = "";
		var output = '';
		
		$('#academyList').empty();
		$('#list_none').empty();
		
		$.ajax({
			url: '/NAGAGU/searchTypeList.my',
			type: 'POST',
			data: {"searchType" : searchType, "keyword" : keyword},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				$('.listnum_num').text(data.length+"건");
				console.log(data);
				if(data.length != 0) {
					$.each(data, function(index, item) {
						
						output += '<tr>';
						output += '<td><input type="checkbox" name="chk_status" value="'+ item.class_NUMBER + '"></td>';
						
						if(item.class_STATUS == 0) {
							output += '<td>' + "강의종료" + '</td>';
						} else if(item.class_STATUS == 1) {
							output += '<td>' + "강의중" + '</td>';
						}
						
						output += '<td>' + item.class_AREA + '</td>';
						output += '<td>' + item.class_AMOUNT + '</td>';
						output += '<td>' + item.class_DIVISION + '</td>';
						
						if(item.class_NAME.length >= 14) {
							title = item.class_NAME.substr(0,14)+"...";
							
							output += '<td><a href="classdetail.ac?CLASS_NUMBER=' + item.class_NUMBER + '">' + title + '</a></td>';
						} else {
							output += '<td><a href="classdetail.ac?CLASS_NUMBER=' + item.class_NUMBER + '">' + item.class_NAME + '<a/></td>';
						}
						
						switch(item.class_CATEGORY){
			        	    case 'table' :
			        	    	output += '<td>책상</td>';
			        	        break;
			        	    case 'chair' :
			        	    	output += '<td>의자</td>';
			        	        break;
			        	    case 'bookshelf' :
			        	    	output += '<td>책장</td>';
			        	        break;
			        	    case 'bed' :
			        	    	output += '<td>침대</td>';
			        	        break;
			        	    case 'drawer' :
			        	    	output += '<td>서랍장</td>';
			        	        break;
			        	    case 'sidetable' :
			        	    	output += '<td>협탁</td>';
			        	        break;
			        	    case 'dressing_table' :
			        	    	output += '<td>화장대</td>';
			        	        break;
			        	    case 'others' :
			        	    	output += '<td>기타</td>';
			        	        break;
		     			}
						
						output += '<td>' + item.class_DATE_CONFIGURATION_1 + ' ~ ' + item.class_DATE_CONFIGURATION_2  + '</td>';
						output += '<td>' + item.class_COUNT_MEMBER + '</td>';
						output += '<td><button class="btn_modify btn btn_search btn-outline-danger btn-sm" onclick="updateClass(' + item.class_NUMBER + ')">' + "수정" + '</button></td>';
						output += '</tr>';
						
						$('#academyList').append(output);
					});
				} else{
					output += '검색 결과가 없습니다.';
					$('#list_none').append(output);
				}
				page();
			},
			error: function() {
				alert("ajax 통신 실패!");
			}
		});
		event.preventDefault();
	}
	
	$(document).on('click', '#selectClass', function(event) {
		var checkArray = new Array();
		 
		 $("input[name=chk_status]:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
			 checkArray.push($(this).val());
	     });
		 
		 if(checkArray.length ==  0) {
			 alertify.alert("종료할 강의를 선택하세요.");
		 } else {
			 if (confirm("종료하시겠습니까?") == true){
				 $.ajax({
					 type : 'POST',
		             url : './updateStauts.my',
		             data : { 0:0, checkArray : checkArray},
		             success: function(retVal){
		            	 if (retVal.res == "OK") {
		            		alertify.alert("선택된 강의가 종료되었습니다.");
		            	 	classList();
		            	 } else{
		            		 alertify.alert("삭제 실패!");
		            	 }
		             },
		             error:function(request,status,error){
		            	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		             }
		        });
		        checkArray= new Array();
		    }
		 }
	});
	
	function updateClass($class_NUMBER){
		var CLASS_NUMBER = $class_NUMBER;
		console.log(CLASS_NUMBER);
		
		location.href="./updateClassForm.mywork?CLASS_NUMBER=" + CLASS_NUMBER;
	}
	
	// 만들어진 테이블에 페이지 처리
	function page() { 	
		$('#remo').empty();
		var reSortColors = function($table) {};
		$('nav.paginated').each(function() {
			var pagesu = 10;  //페이지 번호 갯수
	  		var currentPage = 0;
	  		var numPerPage = 10;  //목록의 수
	  		var $table = $('#academyList');
	  		var $user = $('#user-page');
			//length로 원래 리스트의 전체길이구함
			var numRows = $table.find('tr').length;
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
				$table.find('tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
				$("#remo").html("");
				if (numPages > 1) {     // 한페이지 이상이면
					if (currentPage < 5 && (numPages-currentPage) >= 5) { // 현재 5p 이하이면
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