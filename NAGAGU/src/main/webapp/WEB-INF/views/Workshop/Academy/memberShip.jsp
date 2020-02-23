<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	   .btn_search {
       width:55px;
       border-radius: 4px;
       border:1px solid orangered;
       color:orangered; 
   }
   
   
   .btn_search:hover {
       color: #1b1b27;
       background-color: #ef902e;
       box-shadow: 200px 0 0 0 #ef902e inset,
                   -200px 0 0 0 #ef902e inset;
   }
   .dropdown{
      padding: 2px 4px;
   }
   .dropbtn {
       width:68px;
       border-radius: 4px;
       border:1px solid orangered;
       color:orangered;    
   }
   
   .dropbtn:hover {
       color: #1b1b27;
       background-color: #ef902e;
       box-shadow: 200px 0 0 0 #ef902e inset,
                   -200px 0 0 0 #ef902e inset;
   }
   .btn_modify {
       border-radius: 4px;
       border: 1px solid orangered;
       color: orangered;
       font-size: 14px;
       background: white;
   }
</style>
<!-- 작업 구역 -->
<div id="page-content-wrapper" style="padding-top: 5%;">
	<div class="container-fluid">
	    <div class="pb-5">
	        <h1 class="">아카데미 회원 관리</h1>
	    </div>
	    <div class="d-flex justify-content-between pb-2">
	        <div class="d-flex flex-row bd-highlight mb-3">
	            <button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">전체표시</button> 
	            <button type="button" id="selectMember" class="btn btn-sm btn-outline-dark mr-2">선택 삭제</button> 
	            <button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">선택 쪽지</button>                        
	            <span class="listnum_txt pt-2 bd-highlight">전체 회원 수</span>&nbsp;
	            <span class="listnum_num pt-2 bd-highlight">0명</span>
	        </div>
	
	        <div class="d-flex justify-content-end">
	            <div class="dropdown">
	                <button class="btn dropbtn btn-sm dropdown-toggle btn-search-mode" type="button" id="searchType" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                    	선택
	                </button>
	                <div class="dropdown-menu" aria-labelledby="searchType">
	                    <a class="dropdown-item" onclick="class_name()">강의명</a>
						<a class="dropdown-item" onclick="member_name()">회원 이름</a>
						<a class="dropdown-item" onclick="member_phone()">전화번호</a>
	               </div>
	           </div>
	           <!-- search -->
	           <nav class="navbar-light">
	             <form class="form-inline" onsubmit="return false">
	               <input class="form-control mr-sm-2" id="keyword" type="search" aria-label="Search" style="height:90%">
	                <button class="btn btn_search btn-sm my-2 my-sm-0" type="button" id="btn_search">검색</button>
	              </form>
	            </nav>
	        </div>
	    </div>
		<div style="height: 600px; overflow-y: auto;">
			<table class="table table-hover" id="work_store">
				<thead>
				    <tr>
				        <th style="width: 5%;" class="th1"><input id="all_select" type="checkbox"></th>
				        <th style="width: 15%;" class="th2">분류</th>
				        <th style="width: 25%;" class="th3">강의명</th>
				        <th style="width: 10%;" class="th4">회원이름</th>
				        <th style="width: 15%;" class="th5">전화번호</th>
				        <th style="width: 20%;" class="th6">이메일</th>
				        <th style="width: 10%;" class="th7">관리</th>
					</tr>
				</thead>
			    <tbody id="memberList"></tbody>
			</table>
			<div id="list_none"></div>
		</div>
		<div class="d-flex justify-content-center">
			<nav aria-label="Page navigation example" class="paginated" id="user-page"></nav>
		</div>
    </div>
</div>
<style>
		.btn_search {
	    width:55px;
	    border-radius: 4px;
	    border:1px solid orangered;
	    color:orangered; 
	}
	
	
	.btn_search:hover {
	    color: #1b1b27;
	    background-color: #ef902e;
	    box-shadow: 200px 0 0 0 #ef902e inset,
	                -200px 0 0 0 #ef902e inset;
	}
	.dropdown{
		padding: 2px 4px;
	}
	.dropbtn {
	    width:68px;
	    border-radius: 4px;
	    border:1px solid orangered;
	    color:orangered;    
	}
	
	.dropbtn:hover {
	    color: #1b1b27;
	    background-color: #ef902e;
	    box-shadow: 200px 0 0 0 #ef902e inset,
	                -200px 0 0 0 #ef902e inset;
	}
	.btn_modify {
	    border-radius: 4px;
	    border: 1px solid orangered;
	    color: orangered;
	    font-size: 14px;
	    background: white;
	}
</style>
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
	}
	function member_name() {
		$('#searchType').html('회원이름');
		$('#searchType').val('memberName');
		$('#searchType').css('width', '83px');
	}
	function member_phone() {
		$('#searchType').html('전화번호');
		$('#searchType').val('memberPhone');
		$('#searchType').css('width', '83px');
	}
	
	$("#keyword").keyup(function(event){
		var searchType = $('#searchType').val();
		var keyword = $('#keyword').val();
		
		if (event.keyCode == 13) {
			if(!keyword || !searchType){
				alert("카테고리 선택, 검색어를 입력하세요.");
				memberList();
				return false;
			}
			event.preventDefault();
			Search(event);
			return;
		}
	});
	
	$(document).ready(function() {
		memberList();
		
	});
	
	function memberList() {
		$('#remo').remove();
		$('#memberList').empty();
		$('#list_none').empty();
		
		var title = "";
		var output = '';
		$.ajax({
			url: '/NAGAGU/classMemberManagementList.my',
			type: 'POST',
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				$('.listnum_num').text(data.length+"명");
				console.log(data.length);
				if(data.length != 0){
					$.each(data, function(index, item) {
						
						output += '<tr>';
						output += '<td><input type="checkbox" name="chk_status" value="'+ item.my_CLASS_MEMBERNUM +'"></td>';
						output += '<td>' + item.class_DIVISION + '</td>';
						
						if(item.class_NAME.length >= 14) {
							title = item.class_NAME.substr(0,14)+"...";
							
							output += '<td><a href="classdetail.ac?CLASS_NUMBER=' + item.my_CLASS_CLASSNUM + '">' + title + '</a></td>';
						} else {
							output += '<td><a href="classdetail.ac?CLASS_NUMBER=' + item.my_CLASS_CLASSNUM + '">' + item.class_NAME + '<a/></td>';
						}
						
						output += '<td>' + item.member_NAME + '</td>';
						
						if(item.member_PHONE==null){
							output += '<td>미입력 상태</td>';
						} else {
							output += '<td>' + item.member_PHONE + '</td>';
						}
						
						output += '<td>' + item.member_EMAIL + '</td>';
						output += '<td><button class="btn_modify" onclick="btn_delete('+ item.my_CLASS_MEMBERNUM +')">삭제</button></td>';
						output += '</tr>';
						
						$('#memberList').append(output);
					});
				} else{
					output += '등록된 회원이 없습니다.';
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
			alert("카테고리 선택, 검색어를 입력하세요.");
			memberList();
			return false;
		}
		event.preventDefault();
		Search(event);
		return;
	});
	
	function Search(event) {
		$('#remo').remove();
		$('#memberList').empty();
		$('#list_none').empty();
		
		var searchType = $('#searchType').val();
		var keyword = $('#keyword').val();
		var title = "";
		var output = '';
		
		$.ajax({
			url: '/NAGAGU/searchMemberManagementList.my',
			type: 'POST',
			data: {"searchType" : searchType, "keyword" : keyword},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				$('.listnum_num').text(data.length+"명");
				console.log(data);
				if(data.length != 0){
					$.each(data, function(index, item) {
						
						output += '<tr>';
						output += '<td><input type="checkbox"></td>';
						output += '<td>' + item.class_DIVISION + '</td>';
						
						if(item.class_NAME.length >= 14) {
							title = item.class_NAME.substr(0,14)+"...";
							
							output += '<td><a href="classdetail.ac?CLASS_NUMBER=' + item.my_CLASS_CLASSNUM + '">' + title + '</a></td>';
						} else {
							output += '<td><a href="classdetail.ac?CLASS_NUMBER=' + item.my_CLASS_CLASSNUM + '">' + item.class_NAME + '<a/></td>';
						}
						
						output += '<td>' + item.member_NAME + '</td>';
						
						if(item.member_PHONE==null){
							output += '<td>미입력 상태</td>';
						} else {
							output += '<td>' + item.member_PHONE + '</td>';
						}
						
						output += '<td>' + item.member_EMAIL + '</td>';
						output += '<td><button class="btn_modify" onclick="btn_delete('+ item.my_CLASS_MEMBERNUM +')">삭제</button></td>';
						output += '</tr>';
						
						$('#memberList').append(output);
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
	}
	
	function btn_delete($my_CLASS_MEMBERNUM) {
		var MY_CLASS_MEMBERNUM = $my_CLASS_MEMBERNUM;
		warning = "삭제된 회원은 복구가 불가능합니다.\n삭제하시겠습니까?";
		
		if(confirm(warning) != 0) {
			$.ajax({
				url:'/NAGAGU/deleteManagementMember.my',
				type: 'POST',
		        data: {'MY_CLASS_MEMBERNUM' : MY_CLASS_MEMBERNUM},
		        dataType: "json",
		        contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		        success: function(retVal) {
		        	if (retVal.res == "OK") {
		        		alertify.alert("삭제되었습니다.");
		                memberList();
		            } else {
		            	alertify.alert("삭제 실패");
		            }
	
		        },
		        error: function() {
					alert("ajax 통신 실패!");
				}
			});
		}
	}
	
	$(document).on('click', '#selectMember', function(event) {
		var checkArray = new Array();
		 
		 $("input[name=chk_status]:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
			 checkArray.push($(this).val());
	     });
		 
		 if(checkArray.length ==  0) {
			 alertify.alert("삭제할 회원을 선택하세요.");
		 } else {
			 if (confirm("삭제하시겠습니까?") == true){
				 $.ajax({
					 type : 'POST',
		             url : './deleteClassMember.my',
		             data : { 0:0, checkArray : checkArray},
		             success: function(retVal){
		            	 if (retVal.res == "OK") {
		            		alertify.alert("선택된 회원이 삭제되었습니다.");
		            		memberList();
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
	
	// 만들어진 테이블에 페이지 처리
	function page() { 	
		$('#remo').empty();
		var reSortColors = function($table) {};
		$('nav.paginated').each(function() {
			var pagesu = 10;  //페이지 번호 갯수
	  		var currentPage = 0;
	  		var numPerPage = 10;  //목록의 수
	  		var $table = $('#memberList');
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