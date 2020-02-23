<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.academy.ClassVO"%>
<%
	if (session.getAttribute("WORKSHOP_NUM") == null) {
		out.println("<script>");
		out.println("alertify.alert('확인','로그인 해주세요!');");
		out.println("location.href='./index.ma'");
		out.println("</script>");	
	} 

	String voExist = "N";
	int count = 0;
	ClassVO classVO = null;
	String CLASS_CATEGORY = null;
	String CLASS_NAME = null;
	String CLASS_AREA = null;
	int CLASS_NUMBER = 0;
	if(request.getAttribute("classVO") != null) {	//상품관리 페이지에서 넘어왔다
		count = (int)request.getAttribute("count");	//
		classVO = (ClassVO)request.getAttribute("classVO");
		voExist = "Y";
		CLASS_CATEGORY = classVO.getCLASS_CATEGORY();
		CLASS_NAME = classVO.getCLASS_NAME();
		CLASS_AREA = classVO.getCLASS_AREA();
		System.out.println("VO 존재함 : 강의관리페이지 통해 들어옴");
	}
	System.out.println(CLASS_CATEGORY);
	System.out.println(CLASS_NAME);
	System.out.println(CLASS_AREA);
%>


<div id="page-content-wrapper" style="padding-top: 5%;">
	<div class="container-fluid">
		<div class="work_title">
		    <div class="pb-5">
		        <h1 class="header2_adj">강의 후기</h1>
		    </div>
	        <div class="d-flex justify-content-start pb-2">
	            <span class="listnum_txt pt-2">전체 문의내역</span>
	            <span class="listnum_num pt-2"></span>
	        </div>
	        <div class="d-flex justify-content-between pb-2">
	        	<div class="justify-content-start" style="padding: 0;">
					<div class="d-flex justify-content-start">
						<button type="button" id="listall" class="btn btn-sm btn-outline-dark mr-2">전체표시</button> 
						<div class="select1">
							<select class="search_hidden_state justify-content-start form-control" id="selectClassType1" name="selectClassType1" onchange="btn_select1()" style="height: 33px;">
								<option value="all">강의상태</option>
								<option value="inClass">강의중</option>
								<option value="endClass">강의종료</option>
							</select>
						</div>
						<div class="select2" style="padding-left:5px">
							<select class="search_hidden_state justify-content-start form-control" id="selectClassType2" name="selectClassType2" onchange="btn_select2()" style="height: 33px;">
								<option value="allClass">클래스</option>
								<option value="원데이클래스">원데이클래스</option>
								<option value="정규클래스">정규클래스</option>
							</select>
						</div>
						<div class="select3" style="padding-left:5px">
							<select class="search_hidden_state justify-content-start form-control"  id="selectCategory1" name="selectCategory1" onchange="btn_select3()" style="height: 33px;">
								<option value="지역" selected>지역</option>
								<option value="종로구">종로구</option>
								<option value="중구">중구</option>
								<option value="용산구">용산구</option>
								<option value="성동구">성동구</option>
								<option value="광진구">광진구</option>
								<option value="동대문구">동대문구</option>
								<option value="중랑구">중랑구</option>
								<option value="성북구">성북구</option>
								<option value="강북구">강북구</option>
								<option value="도봉구">도봉구</option>
								<option value="노원구">노원구</option>
								<option value="은평구">은평구</option>
								<option value="서대문구">서대문구</option>
								<option value="마포구">마포구</option>
								<option value="양천구">양천구</option>
								<option value="강서구">강서구</option>
								<option value="구로구">구로구</option>
								<option value="금천구">금천구</option>
								<option value="영등포구">영등포구</option>
								<option value="동작구">동작구</option>
								<option value="관악구">관악구</option>
								<option value="서초구">서초구</option>
								<option value="강남구">강남구</option>
								<option value="송파구">송파구</option>
								<option value="강동구">강동구</option>	
							</select>
						</div>	
						<div class="select4" style="padding-left:5px">
							<select class="search_hidden_state justify-content-start form-control"  id="selectCategory2" name="selectCategory2" onchange="btn_select4()" style="height: 33px;">
								<option value="all">카테고리</option>
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
						<div class="select5" style="padding-left:5px">	<!-- 보기 정렬 -->
							<select class="search_hidden_state justify-content-start form-control" id="selectListAlign" name="selectListAlign" onchange="btn_select5()" style="height: 33px;">
								<option value="review_date">최근 등록순</option>
								<option value="review_grade">평점순</option>
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
						        <button class="dropdown-item" id="dropdown-item-1" onclick="member_nick()">작성자</button>
								<button class="dropdown-item" id="dropdown-item-2" onclick="class_name()">강의명</button>
								<button class="dropdown-item" id="dropdown-item-3" onclick="review_content()">후기내용</button>
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
		</div>
        <table class="table" id="work_store">
		    <thead>
			    <tr class="text-center">
					<th style="width: 5%;">번호</th>
					<th style="width: 5%;">상태</th>
					<th style="width: 7%;">카테고리</th>
					<th style="width: 10%;">클래스</th>
					<th style="width: 5%;">지역</th>
					<th style="width: 10%;">작성자</th>
					<th style="width: 18%;">강의명</th>
					<th style="width: 5%;">평점</th>
					<th style="width: 20%;">후기 내용</th>
					<th style="width: 10%;">작성날짜</th>
					<th style="width: 5%;">상세</th>
			    </tr>
		    </thead>
		    <tbody id="ClassReviewList"></tbody>
		</table>
		<div id="list_none"></div>
		<div class="d-flex justify-content-center">
			<nav aria-label="Page navigation example" class="paginated" id="user-page"></nav>
		</div>
    </div>
</div>

<script>
	function member_nick() {
		$('#searchType').html('작성자');
		$('#searchType').val('member_nick');
	};
	function class_name() {
		$('#searchType').html('강의명');
		$('#searchType').val('class_name');
	}
	
	function review_content() {
		$('#searchType').html('후기내용');
		$('#searchType').val('review_content');
	}
	
	$(document).on('click', '#btn_search', function(event) {
		if(!$('#keyword').val() || !$('#searchType').val()){
			alertify.alert('확인',"카테고리 선택, 검색어를 입력하세요!");
			$('#keyword').focus();
			return false;
		}		
		ClassReviewList();
		$('#list_none').empty();
		event.preventDefault();
	
	});    
	
	$(document).on('click', '#listall', function(event) {
		$("#keyword").val('');
		$('#list_none').empty();
		$("#selectClassType1").val('all').prop("selected", true);
		$("#selectClassType2").val('allClass').prop("selected", true);
		$("#selectCategory1").val('지역').prop("selected", true);
		$("#selectCategory2").val('all').prop("selected", true);
		$("#selectListAlign").val('review_date').prop("selected", true);
		$('#searchType').text('선택');
		$("#searchType").val('');
		$("#keyword").val('');
		ClassReviewList();
	});    
	
	$("#keyword").keyup(function(event){
		if (event.keyCode == 13) {
			if(!$('#keyword').val() || !$('#searchType').val()){
				alertify.alert('확인',"카테고리 선택, 검색어를 입력하세요!");
				$('#keyword').focus();
				return false;
			}		
			ClassReviewList(event);
			$('#list_none').empty();
			event.preventDefault();
			return;
		}
		
	});	
	

	/*select1-강의상태 선택*/	
	function btn_select1() {		
		console.log("$('#selectClassType1 option:selected').val() : "+$("#selectClassType1 option:selected").val())
		$('#ClassReviewList').empty();
		ClassReviewList();
	}	
	
	/*select2-강의타입 선택*/	
	function btn_select2() {		
		console.log("$('#selectClassType2 option:selected').val() : "+$("#selectClassType2 option:selected").val())
		$('#ClassReviewList').empty();
		ClassReviewList();
	}	
	
	/*select3-지역 카테고리 선택*/	
	function btn_select3() {		
		console.log("$('#selectCategory1 option:selected').val() : "+$("#selectCategory option:selected").val())
		
		$('#ClassReviewList').empty();
		ClassReviewList();
	}	
	
	/*select4-가구 카테고리 선택*/	
	function btn_select4() {		
		console.log("$('#selectCategory2 option:selected').val() : "+$("#selectCategory option:selected").val())
		
		$('#ClassReviewList').empty();
		ClassReviewList();
	}	

	/*select5-리스트 정렬*/
	function btn_select5() {		
		console.log("$('#selectListAlign option:selected').val() : "+$("#selectListAlign option:selected").val())
		
		$('#ClassReviewList').empty();
		ClassReviewList();	
	}	

	
	/*review 상세보기*/
	$(document).on('click', '.btn_detail', function(event) {
		var REVIEW_NUM = $(this).attr("value");
		var popupX = (window.screen.width / 2) - (500 / 2); // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 뺴주었음
		var popupY = (window.screen.height / 2) - (630 / 2); // 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 뺴주었음
		var pop = window.open('about:blank', 'Info', 'scrollbars=yes, resizable=yes, width=500, height=630, left=' + popupX + ', top=' + popupY);
		pop.location.href="AreviewInfo.my?REVIEW_NUM=" + REVIEW_NUM;
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
		if("<%=voExist%>"=="Y") {	//vo 존재한다
			//vo정보로 검색한다
			//selectCategory1(지역카테고리), selectCategory2(가구카테고리),searchType(상품명), keyword(상품이름)
			//qna 있을 경우/없을경우
			if(<%=count%> != 0) {	//문의 있다
				$("#selectClassType1").val('all').prop("selected", true);
				$("#selectClassType2").val('allClass').prop("selected", true);
				$("#selectCategory1").val('<%=CLASS_AREA%>').prop("selected", true);	
				$("#selectCategory2").val('<%=CLASS_CATEGORY%>').prop("selected", true);	
				$('#searchType').html('강의명');
				$('#searchType').val('class_name');
				$("#keyword").val('<%=CLASS_NAME%>');
			} else if(<%=count%> == 0) {
				alertify.alert('확인','상품 "<%=CLASS_NAME%>" 에 해당하는 문의가 없습니다.');
				location.href='./workshop_academy_Management.ws';
			}
		} 
		
		ClassReviewList();
		
	});		
	

	function ClassReviewList() {
		$('#remo').remove();
		$('#ClassReviewList').empty();
		$('#list_none').empty();
		var selectClassType1 = $("#selectClassType1 option:selected").val();	//필터 값 가져오기
		var selectClassType2 = $("#selectClassType2 option:selected").val();	//필터 값 가져오기
		var selectCategory1 = $("#selectCategory1 option:selected").val();	//필터 값 가져오기
		var selectCategory2 = $("#selectCategory2 option:selected").val();	//필터 값 가져오기
		var selectListAlign = $("#selectListAlign option:selected").val();	//필터 값 가져오기
		var searchType = $("#searchType").val();	//필터 값 가져오기
		var keyword = ''; 
		if ($('#keyword').val() != null) {
			keyword = $("#keyword").val();
		}
		console.log("selectClassType1="+selectClassType1)
		console.log("selectClassType2="+selectClassType2)
		console.log("selectCategory1="+selectCategory1)
		console.log("selectCategory2="+selectCategory2)
		console.log("selectListAlign="+selectListAlign)
		console.log("searchType : " + searchType)
		console.log("keyword : " + keyword)
		
		var title = "";
		var number = 1;
		$.ajax({
			url: '/NAGAGU/classReviewList.my',
			type: 'POST',
			data: {"selectClassType1" : selectClassType1, 
				"selectClassType2" : selectClassType2,
				"selectCategory1" : selectCategory1, 
				"selectCategory2" : selectCategory2, 
				"selectListAlign" : selectListAlign,
				"searchType" : searchType,
				"keyword" : keyword
			},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(reviewList) {
				console.log(reviewList);
				var output = ' ';	
				
				if(reviewList.length!=0) {
					$('.listnum_num').text(reviewList.length+"건");
					var myreply = new Array();
			     	for(var j=0; j<reviewList.length; j++){
			      		var CLASS_CATEGORY = reviewList[j].CLASS_CATEGORY;
			      		switch(CLASS_CATEGORY){
				      	    case 'table' : 
				      	    	CLASS_CATEGORY = '책상'
				      	        break;
				      	    case 'chair' : 
				      	    	CLASS_CATEGORY = '의자' 
				      	        break;  
				      	    case 'bookshelf' : 
				      	    	CLASS_CATEGORY = '책장'
				      	        break;
				      	    case 'bed' : 
				      	    	CLASS_CATEGORY = '침대' 
				      	        break;  
				      	    case 'drawer' : 
				      	    	CLASS_CATEGORY = '서랍장'
				      	        break;
				      	    case 'sidetable' : 
				      	    	CLASS_CATEGORY = '협탁' 
				      	        break;  
				      	    case 'dressing_table' : 
				      	    	CLASS_CATEGORY = '화장대'
				      	        break;
				      	    case 'others' : 
				      	    	CLASS_CATEGORY = '기타' 
				      	        break;
			      	    }
			      		var CLASS_STATUS = reviewList[j].CLASS_STATUS;
			      		switch(CLASS_STATUS){
			      	    case 0 : 
			      	    	CLASS_STATUS = '강의종료'
			      	        break;
			      	    case 1 : 
			      	    	CLASS_STATUS = '강의중' 
			      	        break;  
			      	    }
			      		var class_category = reviewList[j].CLASS_CATEGORY;
			      		var CLASS_AREA = reviewList[j].CLASS_AREA;
			      		var CLASS_DIVISION = reviewList[j].CLASS_DIVISION;
			      		var MEMBER_NICK = reviewList[j].MEMBER_NICK;
			    		var CLASS_NAME = reviewList[j].CLASS_NAME;
			    		var CLASS_NUMBER = reviewList[j].CLASS_NUMBER;
			    		var REVIEW_GRADE = reviewList[j].REVIEW_GRADE;
			    		var REVIEW_DATE = new Date(reviewList[j].REVIEW_DATE);
			    		var date = date_format(REVIEW_DATE);
			    		var REVIEW_CONTENT = reviewList[j].REVIEW_CONTENT;
			    		var REVIEW_NUM = reviewList[j].REVIEW_NUM;
			    		
						output += '<tr class="text-center">';
						output += '<td>' + number + '</td>';
						output += '<td>' + CLASS_STATUS + '</td>';
						output += '<td>' + CLASS_CATEGORY + '</td>';
						output += '<td>' + CLASS_DIVISION + '</td>';
						output += '<td>' + CLASS_AREA + '</td>';
						output += '<td>' + MEMBER_NICK + '</td>';
						if(CLASS_NAME.length >= 14) {
							CLASS_NAME = CLASS_NAME.substr(0,14)+"...";
						}
						output += '<td><a href="classdetail.ac?CLASS_NUMBER=' + CLASS_NUMBER + '" target="_blank">'+CLASS_NAME+'</a></td>';
						if(REVIEW_GRADE != 7) {
							output += '<td>' + REVIEW_GRADE + '점</td>';
						} else {
							output += '<td>-</td>';
						}
						if(REVIEW_CONTENT.length >= 45) {
							REVIEW_CONTENT = REVIEW_CONTENT.substr(0,45)+"...";
						}
						output += '<td style="text-align:left;">'+REVIEW_CONTENT+'</td>';
						output += '<td>' + date + '</td>';
						output += '<td><button class="btn_detail btn btn_search btn-outline-danger btn-sm" value="'+REVIEW_NUM+'">' + "상세" + '</button></td>';						
						output += '</tr>';
						number += 1;
     				}					
					$('#ClassReviewList').append(output);
				} else {
					output += '검색 결과가 없습니다.';
					$('.listnum_num').text("0건");
					$('#list_none').append(output);
					//검색결과 없을시 select조건들 초기화
					$("#selectClassType1").val('all').prop("selected", true);
					$("#selectClassType2").val('allClass').prop("selected", true);
					$("#selectCategory1").val('지역').prop("selected", true);
					$("#selectCategory2").val('all').prop("selected", true);
					$("#selectListAlign").val('review_date').prop("selected", true);
					$('#searchType').text('선택');
					$("#searchType").val('');
					$("#keyword").val('');
				}
				page();
			},
			error: function() {
				alertify.alert('확인',"Review List를 띄울 수 없습니다.");
			}
		});
	}		

	
	// 만들어진 테이블에 페이지 처리
	function page() { 	
		$('#remo').empty();
		var reSortColors = function($table) {};
		$('nav.paginated').each(function() {
			var pagesu = 10;  //페이지 번호 갯수
	  		var currentPage = 0;
	  		var numPerPage = 10;  //목록의 수
	  		var $table = $('#work_store');    
	  		var $user = $('#user-page');
	  
			//length로 원래 리스트의 전체길이구함
			var numRows = $table.find('tbody tr').length;
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