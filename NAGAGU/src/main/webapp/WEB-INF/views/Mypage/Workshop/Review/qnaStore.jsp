<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="http://example.com/myicon.png"> 
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <title>Document</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/b74b42490f.js" crossorigin="anonymous"></script>

    <!-- 공방관리 기본 스타일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/workshop_my.css">
    <!-- 페이지 고유 스타일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/qna_store.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	
	<style type="text/css">
		.clickable {cursor: pointer;}
		.hover {text-decoration: underline;}
		.odd{ background: #FFC;}
		.even{ background: #FF9;}
		.active{ width:10px; height:10px; background:#f60; color:white;}
		#list_none { text-align:center; padding-top:50px; }
		#categoryKeyword { display:none; }
	</style>
	<script>
	$(document).ready(function() {
		ProductqnaList();
	});
/*
	function ProductqnaList() {
		$('#remo').remove();
		$('#ProductqnaList').empty();
		var selectClassType = $("#selectClassType option:selected").val();	//필터 값 가져오기
		var title = "";
		var number = 1;
		$.ajax({
			url: '/NAGAGU/productQnaList.my',
			type: 'POST',
			data: {"selectClassType" : selectClassType},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(qnaList) {
				console.log(qnaList);
				var output = ' ';	
				
				if(qnaList.length!=0) {
					$('.listnum_num').text(qnaList.length+"건");
					var myreply = new Array();
			     	for(var j=0; j<qnaList.length; j++){
			      		var PRODUCT_CATEGORY = qnaList[j].PRODUCT_CATEGORY
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
				      	var product_category = qnaList[j].PRODUCT_CATEGORY;
				      	var MEMBER_NICK = qnaList[j].MEMBER_NICK;
			    		var PRODUCT_TITLE = qnaList[j].PRODUCT_TITLE;
			    		var PRODUCT_NUM = qnaList[j].PRODUCT_NUM;
			    		var QNA_DATE = new Date(qnaList[j].QNA_DATE);
			    		var date = date_format(QNA_DATE);
			    		var QNA_CONTENT = qnaList[j].QNA_CONTENT;
    					var QNA_RE = qnaList[j].QNA_RE;
    					var QNA_STATUS = qnaList[j].QNA_STATUS;

						output += '<tr>';
						output += '<td>' + number + '</td>';
						output += '<td>' + PRODUCT_CATEGORY + '</td>';
						output += '<td>' + MEMBER_NICK + '</td>';
						if(PRODUCT_TITLE.length >= 14) {
							PRODUCT_TITLE = PRODUCT_TITLE.substr(0,14)+"...";
						}
						output += '<td><a href="productdetail.pro?PRODUCT_NUM=' + PRODUCT_NUM + '&PRODUCT_CATEGORY=' + product_category + '">'+PRODUCT_TITLE+'</a></td>';
						if(QNA_CONTENT.length >= 45) {
							QNA_CONTENT = QNA_CONTENT.substr(0,45)+"...";
						}
						if(QNA_STATUS == 0) {
							//답변이 달리지 않은 문의
							output += '<td style="text-align:left;">'+QNA_CONTENT+'</td>';
							output += '<td>' + date + '</td>';
							output += '<td>'+'답변 대기'+'</td>';
							output += '<td><button class="btn_write" onclick="location.href=">' + "작성" + '</button></td>';
						} else if (QNA_STATUS == 1){
							//답변이 달린 문의
							output += '<td style="text-align:left;">'+QNA_CONTENT+'</td>';
							output += '<td>' + date + '</td>';
							output += '<td>'+'답변 완료'+'</td>';
							output += '<td><button class="btn_modify" onclick="location.href=">'+"수정"+'</button></td>';
						}

//						output += '<td style="text-align:left;">' + QNA_CONTENT + '</td>';


						output += '<td><button class="btn_move" onclick="location.href=">' + "이동" + '</button></td>';
						output += '</tr>';
						number += 1;
     				}					
					$('#ProductqnaList').append(output);
				} else {
					output += '검색 결과가 없습니다.';
					$('.listnum_num').text("0건");
					$('#list_none').append(output);
				}
				page();
			},
			error: function() {
				alert("QNA List를 띄울 수 없습니다.");
			}
		});
	}		
*/

function ProductqnaList() {
	$('#remo').remove();
	$('#ProductqnaList').empty();
	var selectClassType = $("#selectClassType option:selected").val();	//필터 값 가져오기
	alert("selectClassType="+selectClassType);
	
	var searchType = '#';
	var keyword = '#';
	var categorySelect = '#';
	
	if(($('#keyword').val() != null) && ($('#searchType').val() != null) ) {
		searchType = $('#searchType').val();
		keyword = $('#keyword').val();
		categorySelect = $('#categorySelect').val();		
		alert("searchType : " + searchType + "keyword : " +  keyword);
	}
	
	var title = "";
	var number = 1;
	$.ajax({
		url: '/NAGAGU/productQnaList1.my',
		type: 'POST',
		data: {"selectClassType" : selectClassType, "searchType" : searchType, "keyword" : keyword, "categorySelect" : categorySelect},
		dataType: 'json',
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(qnaList) {
			console.log(qnaList);
			var output = ' ';	
			
			if(qnaList.length!=0) {
				$('.listnum_num').text(qnaList.length+"건");
				var myreply = new Array();
		     	for(var j=0; j<qnaList.length; j++){
		      		var PRODUCT_CATEGORY = qnaList[j].PRODUCT_CATEGORY
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
			      	var product_category = qnaList[j].PRODUCT_CATEGORY;
			      	var MEMBER_NICK = qnaList[j].MEMBER_NICK;
		    		var PRODUCT_TITLE = qnaList[j].PRODUCT_TITLE;
		    		var PRODUCT_NUM = qnaList[j].PRODUCT_NUM;
		    		var QNA_DATE = new Date(qnaList[j].QNA_DATE);
		    		var date = date_format(QNA_DATE);
		    		var QNA_CONTENT = qnaList[j].QNA_CONTENT;
					var QNA_RE = qnaList[j].QNA_RE;
					var QNA_STATUS = qnaList[j].QNA_STATUS;

					output += '<tr>';
					output += '<td>' + number + '</td>';
					output += '<td>' + PRODUCT_CATEGORY + '</td>';
					output += '<td>' + MEMBER_NICK + '</td>';
					if(PRODUCT_TITLE.length >= 14) {
						PRODUCT_TITLE = PRODUCT_TITLE.substr(0,14)+"...";
					}
					output += '<td><a href="productdetail.pro?PRODUCT_NUM=' + PRODUCT_NUM + '&PRODUCT_CATEGORY=' + product_category + '">'+PRODUCT_TITLE+'</a></td>';
					if(QNA_CONTENT.length >= 45) {
						QNA_CONTENT = QNA_CONTENT.substr(0,45)+"...";
					}
					if(QNA_STATUS == 0) {
						//답변이 달리지 않은 문의
						output += '<td style="text-align:left;">'+QNA_CONTENT+'</td>';
						output += '<td>' + date + '</td>';
						output += '<td>'+'답변 대기'+'</td>';
						output += '<td><button class="btn_write" onclick="location.href=">' + "작성" + '</button></td>';
					} else if (QNA_STATUS == 1){
						//답변이 달린 문의
						output += '<td style="text-align:left;">'+QNA_CONTENT+'</td>';
						output += '<td>' + date + '</td>';
						output += '<td>'+'답변 완료'+'</td>';
						output += '<td><button class="btn_modify" onclick="location.href=">'+"수정"+'</button></td>';
					}

//					output += '<td style="text-align:left;">' + QNA_CONTENT + '</td>';


					output += '<td><button class="btn_move" onclick="location.href=">' + "이동" + '</button></td>';
					output += '</tr>';
					number += 1;
 				}					
				$('#ProductqnaList').append(output);
			} else {
				output += '검색 결과가 없습니다.';
				$('.listnum_num').text("0건");
				$('#list_none').append(output);
			}
			page();
		},
		error: function() {
			alert("QNA List를 띄울 수 없습니다.");
		}
	});
}


	function searchList(event) {
		$('#remo').remove();
		var searchType = $('#searchType').val();
		var keyword = $('#keyword').val();
		var categorySelect = $('#categorySelect').val();
 		var number = 1;
		var title = "";
		
		$('#ProductqnaList').empty();
		alert(searchType + keyword);
		
		if(!keyword || !searchType){
			alert("카테고리 선택, 검색어를 입력하세요.");
			ProductqnaList();
			return false;
		}

		$.ajax({
			url: '/NAGAGU/searchTypeQnaList.my',
			type: 'POST',
			data: {"searchType" : searchType, "keyword" : keyword, "categorySelect" : categorySelect},
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(qnaList) {
				console.log(qnaList);
				var output = ' ';	
				
				if(qnaList.length!=0) {
					$('.listnum_num').text(qnaList.length+"건");					
		        	for(var j=0; j<qnaList.length; j++){
	 	        		var PRODUCT_CATEGORY = qnaList[j].PRODUCT_CATEGORY
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
		 	        	var product_category = qnaList[j].PRODUCT_CATEGORY;
		 	        	var MEMBER_NICK = qnaList[j].MEMBER_NICK;
		        		var PRODUCT_TITLE = qnaList[j].PRODUCT_TITLE;
		        		var PRODUCT_NUM = qnaList[j].PRODUCT_NUM;
		        		var QNA_DATE = new Date(qnaList[j].QNA_DATE);
		        		var date = date_format(QNA_DATE);
		        		var QNA_CONTENT = qnaList[j].QNA_CONTENT;
		        		var QNA_RE = qnaList[j].QNA_RE;
		        		var QNA_STATUS = qnaList[j].QNA_STATUS;

						output += '<tr>';
						output += '<td>' + number + '</td>';
						output += '<td>' + PRODUCT_CATEGORY + '</td>';
						output += '<td>' + MEMBER_NICK + '</td>';
						if(PRODUCT_TITLE.length >= 14) {
							PRODUCT_TITLE = PRODUCT_TITLE.substr(0,14)+"...";
						}
						output += '<td><a href="productdetail.pro?PRODUCT_NUM=' + PRODUCT_NUM + '&PRODUCT_CATEGORY=' + product_category + '">'+PRODUCT_TITLE+'</a></td>';
						if(QNA_CONTENT.length >= 45) {
							QNA_CONTENT = QNA_CONTENT.substr(0,45)+"...";
						}
						if(QNA_STATUS == 0) {
							//답변이 달리지 않은 문의
							output += '<td style="text-align:left;">'+QNA_CONTENT+'</td>';
							output += '<td>' + date + '</td>';
							output += '<td>'+'답변 대기'+'</td>';
							output += '<td><button class="btn_write" onclick="location.href=">' + "작성" + '</button></td>';
						} else if (QNA_STATUS == 1){
							//답변이 달린 문의
							output += '<td style="text-align:left;">'+QNA_CONTENT+'</td>';
							output += '<td>' + date + '</td>';
							output += '<td>'+'답변 완료'+'</td>';
							output += '<td><button class="btn_modify" onclick="location.href=">'+"수정"+'</button></td>';
						}

						output += '<td><button class="btn_move" onclick="location.href=">' + "이동" + '</button></td>';
						output += '</tr>';
						number += 1;
		        	}					
					$('#ProductqnaList').append(output);
				} else {
					alert('0임');
					output += '검색 결과가 없습니다.';
					$('.listnum_num').text("0건");
					$('#list_none').append(output);
					$("#keyword").val('');
				}
				page();
			},
			error: function() {
				alert("Qna List를 띄울 수 없습니다.");
			}
		});
		event.preventDefault();		
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
				if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
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
</head>
<body>
<div class="work_container">
	<%@ include file="../sidebar.jsp" %>

	<!-- 작업 구역 -->
	<div class="work_main">
		<div class="work_store_body">
	       <div class="work_title">
				<div class="header row justify-content-end p-2">
					 &nbsp;
				</div>
				<div class="header2 row p-2">
					<h1 class="col-3 header2_adj">상품 문의</h1>
					<div class="col-9 px-0"></div>
				</div>
				<div class="row pt-2 pb-2">
					<button type="button" id="listall" class="btn btn-sm btn-outline-dark mr-2">전체표시</button>                        
					<span class="listnum_txt pt-2">전체 문의내역</span>
					<span class="listnum_num pt-2"></span>
				</div>    
				<div class="row" style="display: flex;">
					<div class="col-5" style="padding: 0;">
						<div class="row justify-content-start">
							<select class="search_hidden_state justify-content-start" id="selectClassType" name="selectClassType" onchange="btn_select()" style="height: 35px;">
								<option value="all">전체</option>
								<option value="Standby">답변대기</option>
								<option value="Completed">답변완료</option>
							</select>
						<!-- 
						   	<button class="btn-sm my-2 my-sm-0" type="button">강의종료</button>
						 -->
						</div>
					</div>
					<div class="col" style="padding: 0;">
						<div class="row justify-content-end">
							<!-- Example split danger button -->
							<div class="dropdown">
								<button class="btn dropbtn btn-sm dropdown-toggle btn-search-mode" type="button" id="searchType" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									선택
								</button>
								<div class="dropdown-menu" aria-labelledby="searchType">
									<button class="dropdown-item" id="dropdown-item-1" onclick="member_nick()">작성자</button>
									<button class="dropdown-item" id="dropdown-item-2" onclick="product_title()">상품명</button>
									<button class="dropdown-item" id="dropdown-item-3" onclick="category()">카테고리</button>
								</div>
							</div>
							<!-- 카테고리 선택시 나타나는 드롭박스 -->
							<span class="ml-1 mr-2" id="categoryKeyword">
								<select id="categorySelect" style="height:98%;">
									<option value="table">책상</option>
									<option value="chair">의자</option>
									<option value="bookshelf">책장</option>
									<option value="bed">침대</option>
									<option value="drawer">서랍장</option>
									<option value="sidetable">협탁</option>
									<option value="dressing_table">화장대</option>
									<option value="others">기타</option>	
								</select>
							</span>								
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
			</div>
		         <table class="table" id="work_store">
		             <thead>
		             <tr>
		                 <th scope="col" class="th2">번호</th>
		                 <th scope="col" class="th3">카테고리</th>
		                 <th scope="col" class="th4">작성자</th>
		                 <th scope="col" class="th5">상품명</th>
		                 <th scope="col" class="th6">문의 내용</th>
		                 <th scope="col" class="th7">작성날짜</th>
		                 <th scope="col" class="th8">답변상태</th>
		                 <th scope="col" class="th9">관리</th>
		                 <th scope="col" class="th10">이동</th>
		             </tr>
		             </thead>
		             <tbody id="ProductqnaList">
					</tbody>
				</table>
			<div id="list_none"></div>
			<div class="table_bottom">
				<table class="tbl paginated" id="tbl">
				</table>
			</div>
		</div>
	</div>
</div>

<script>


	function member_nick() {
		$('#categoryKeyword').css('display', 'none');
		$('#searchType').html('작성자');
		$('#searchType').val('member_nick');
	};
	function product_title() {
		$('#categoryKeyword').css('display', 'none');
		$('#searchType').html('상품명');
		$('#searchType').val('product_title');
	}
	
	function category() {
		$('#categoryKeyword').css('display', 'block');
		$('#searchType').html('카테고리');
		$('#searchType').val('category');
	}

	$(document).on('click', '#btn_search', function(event) {
		$("#selectClassType").val('all').prop("selected", true);	//display를 all로 바꿔줌
			console.log("1"+$("#selectClassType option:selected").val())
//		$("#selectClassType option:selected").val('all');
			console.log("2"+$("#selectClassType option:selected").val())
//		searchList(event);
		ProductqnaList();
		$('#list_none').empty();
		event.preventDefault();
	});    
    
	$(document).on('click', '#listall', function(event) {
		$("#keyword").val('');
		$('#list_none').empty();
		$("#selectClassType").val('all').prop("selected", true);
		ProductqnaList();
	});    
	
	$("#keyword").keyup(function(event){
		if (event.keyCode == 13) {
			event.preventDefault();
			$("#selectClassType option:selected").val('all');
			$("#selectClassType").val('all').prop("selected", true);
			//searchList(event);
			ProductqnaList();
			$('#list_none').empty();
			event.preventDefault();
			return;
		}
		
	});	

	function btn_select() {		
		alert("btn_select의 selectClassType : " + $("#selectClassType option:selected").val());
		ProductqnaList();
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
    
</script>

</body>
</html>