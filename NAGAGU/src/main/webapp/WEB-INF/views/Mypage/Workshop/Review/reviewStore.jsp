<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/b74b42490f.js" crossorigin="anonymous"></script>

    <!-- 공방관리 기본 스타일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/workshop_my.css">
    <!-- 페이지 고유 스타일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/review_store.css">
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script>
    
	$(document).ready(function() {
		ProductreviewList();
	});    
	
	function ProductreviewList() {
		$('#ProductreviewList').empty();
		var number = 1;
		$.ajax({
			url: '/NAGAGU/productManagementList.my',
			type: 'POST',
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(reviewList) {
 				$('.listnum_num').text(reviewList.length+"건");
				console.log(reviewList);
				
				var output = ' ';	
	        	for(var j=0; j<reviewList.length; j++){
 	        		var PRODUCT_CATEGORY = reviewList[j].PRODUCT_CATEGORY
 	        		switch(PRODUCT_CATEGORY){
 	        	    case 'table' : 
 	        	    	PRODUCT_CATEGORY = '테이블'
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
 	        		
        		var REVIEW_MEMBER = reviewList[j].REVIEW_MEMBER
        		var PRODUCT_TITLE = reviewList[j].PRODUCT_TITLE
        		var REVIEW_DATE = reviewList[j].REVIEW_DATE
        		
        		var REVIEW_DATE = new Date(reviewList[j].REVIEW_DATE);
        		var date = date_format(REVIEW_DATE);
        		
        		console.log(reviewList.PRODUCT_CATEGORY)
				output += '<tr>';
				output += '<td><input type="checkbox"></td>';
				output += '<td>' + number + '</td>';
				
				output += '<td>' + PRODUCT_CATEGORY + '</td>';
				output += '<td>' + REVIEW_MEMBER + '</td>';
				output += '<td>' + PRODUCT_TITLE + '</td>';
				output += '<td>' + date + '</td>';

				output += '<td><button class="btn_modify">' + "수정" + '</button></td>';
				output += '</tr>';
				number += 1;
	        	}					
				

				
				$('#ProductreviewList').append(output);
					
				
			},
			error: function() {
				alert("ajax 통신 실패!");
			}
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
                    <h1 class="col-3 header2_adj">상품 후기</h1>
                    <div class="col-9 px-0">
                    </div>
                </div>
                
                    <div class="row pt-2 pb-2">
                        <button type="button" id="" class="btn btn-sm btn-outline-dark mr-2">전체표시</button>
                        <span class="listnum_txt pt-2">전체 후기내역</span>
                        <span class="listnum_num pt-2"></span>
                    </div>
                    
                    <div class="row">
                        <!-- Example split danger button -->
                        <div class="dropdown">
                            <button class="btn dropbtn btn-sm dropdown-toggle btn-search-mode" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              	선택
                            </button>
                            <div class="dropdown-menu" aria-labelledby="searchType">
                            	<button class="dropdown-item" id="dropdown-item-1" onclick="member_nick()">작성자</button>
								<button class="dropdown-item" id="dropdown-item-2" onclick="product_title()">상품명</button>
								<button class="dropdown-item" id="dropdown-item-3" onclick="category()">카테고리</button>
                            </div>
                        </div>
                        <!-- search -->
                        <nav class="navbar-light bg-light">
                        <!-- input에 enter키 누르면 자동으로 submit -->
                          <form class="form-inline" onsubmit="return false">
                            <input class="form-control mr-sm-2" type="search" aria-label="Search" id="keyword" style="height:90%">
                            <button class="btn btn_search btn-sm my-2 my-sm-0" type="button" id="btn_search">검색</button>
                          </form>
                        </nav>
						<select class="search_hidden_state" id="selectClassType" name="selectClassType" onchange="btn_select()">
                            <option value="allClass">전체</option>
                            <option value="inClass">강의중</option>
                            <option value="endClass">강의종료</option>
                            <option value="onedayClass">원데이클래스</option>
                            <option value="regularClass">정규클래스</option>
                        </select>
                    </div>
                
            	</div>
            <table class="table" id="work_store">
                <thead>
                <tr>
                    <th scope="col" class="th1"><input id="all_select" type="checkbox"></th>
                    <th scope="col" class="th2">번호</th>
                    <th scope="col" class="th3">카테고리</th>
                    <th scope="col" class="th4">작성자</th>
                    <th scope="col" class="th5">상품명</th>
                    <th scope="col" class="th6">후기 내용</th>
                    <th scope="col" class="th7">작성날짜</th>
                    <th scope="col" class="th8">보기</th>
                </tr>
                </thead>
                <tbody id="ProductreviewList">
    <!--             
                <tr>
                    <td><input type="checkbox"></td>
                    <td>5</td>
                    <td>테이블</td>
                    <td>abc123</td>
                    <td>원목 테이블</td>
                    <td>상품 후기 어쩌구 어쩌구 저쩌구</td>
                    <td>2020.01.08</td>
                    <td>
                        <button class="btn_modify">보기</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>5</td>
                    <td>테이블</td>
                    <td>abc123</td>
                    <td>원목 테이블</td>
                    <td>상품 후기 어쩌구 어쩌구 저쩌구</td>
                    <td>2020.01.08</td>
                    <td>
                        <button class="btn_modify">보기</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>5</td>
                    <td>테이블</td>
                    <td>abc123</td>
                    <td>원목 테이블</td>
                    <td>상품 후기 어쩌구 어쩌구 저쩌구</td>
                    <td>2020.01.08</td>
                    <td>
                        <button class="btn_modify">보기</button>
                    </td>
                </tr>

                <tr>
                    <td><input type="checkbox"></td>
                    <td>5</td>
                    <td>테이블</td>
                    <td>abc123</td>
                    <td>원목 테이블</td>
                    <td>2020.01.08</td>
                    <td>
                        <button class="btn_modify">보기</button>   
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>5</td>
                    <td>테이블</td>
                    <td>abc123</td>
                    <td>원목 테이블</td>
                    <td>2020.01.08</td>
                    <td>
                        <button class="btn_modify">보기</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>5</td>
                    <td>테이블</td>
                    <td>abc123</td>
                    <td>원목 테이블</td>
                    <td>2020.01.08</td>
                    <td>
                        <button class="btn_modify">보기</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>5</td>
                    <td>테이블</td>
                    <td>abc123</td>
                    <td>원목 테이블</td>
                    <td>2020.01.08</td>
                    <td>
                        <button class="btn_modify">보기</button>
                    </td>
                </tr>                
                <tr>
                    <td><input type="checkbox"></td>
                    <td>5</td>
                    <td>테이블</td>
                    <td>abc123</td>
                    <td>원목 테이블</td>
                    <td>2020.01.08</td>
                    <td>
                        <button class="btn_modify">보기</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>5</td>
                    <td>테이블</td>
                    <td>abc123</td>
                    <td>원목 테이블</td>
                    <td>2020.01.08</td>
                    <td>
                        <button class="btn_modify">보기</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>5</td>
                    <td>테이블</td>
                    <td>abc123</td>
                    <td>원목 테이블</td>
                    <td>2020.01.08</td>
                    <td>
                        <button class="btn_modify">보기</button>
                    </td>
                </tr>
                 -->
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
	
	function member_nick() {
		$('#searchType').html('작성자');
		$('#searchType').val('member_nick');
	};
	function product_title() {
		$('#searchType').html('상품명');
		$('#searchType').val('product_title');
	}
	function category() {
		$('#searchType').html('카테고리');
		$('#searchType').val('category');
	}
    
	
	$("#keyword").keyup(function(event){
		if (event.keyCode == 13) {
			event.preventDefault();
			keyupSearch(event);
			return;
		}
	});
	
	
	function btn_select() {
		
		selectClassType();
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