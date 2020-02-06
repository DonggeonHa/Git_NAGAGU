<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.workshopMypage.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="http://example.com/myicon.png"> 
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <title>Document</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/b74b42490f.js" crossorigin="anonymous"></script>
    <!-- 사이드 바 스타일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/sidebar_kt.css">
    <!-- 공방관리 기본 스타일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/workshop_my.css">
    <!-- 페이지 고유 스타일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/Lecture_Management.css">


	<script>
	
	
	
		$(document).ready(function() {
			alert("문서준비");
			classList();
			
		});
		
		function classList() {
			$('#academyList').empty();
			var number = 1;
			
			$.ajax({
				url: '/NAGAGU/classManagementList.my',
				type: 'POST',
				dataType: 'json',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(data) {
					$('.listnum_num').text(data.length+"건");
					console.log(data);
					$.each(data, function(index, item) {
						
						var output = ' ';
						output += '<tr>';
						output += '<td><input type="checkbox"></td>';
						output += '<td>' + number + '</td>';
						
						if(item.class_STATUS == 0) {
							output += '<td>' + "준비중" + '</td>';
						} else if(item.class_STATUS == 1) {
							output += '<td>' + "강의중" + '</td>';
						} else {
							output += '<td>' + "강의종료" + '</td>';
						}
						output += '<td>' + item.class_AREA + '</td>';
						output += '<td>' + item.class_AMOUNT + '</td>';
						output += '<td>' + item.class_NAME + '</td>';
						output += '<td>' + item.class_CATEGORY + '</td>';
						output += '<td>' + item.class_DATE_CONFIGURATION_1 + ' ~ ' + item.class_DATE_CONFIGURATION_2  + '</td>';
						output += '<td>' + item.class_COUNT_MEMBER + '</td>';
						output += '<td><button class="btn_modify">' + "수정" + '</button></td>';
						output += '</tr>';
						
						$('#academyList').append(output);
						number += 1;
					});
				},
				error: function() {
					alert("ajax 통신 실패!");
				}
			});
		}
		
		$(document).on('click', '#btn_search', function(event) {
			var searchType = $('#searchType').val();
			var keyword = $('#keyword').val();
			var number = 1;
			
			$('#academyList').empty();
			alert(searchType + keyword);
			
			if(!keyword || !searchType){
				alert("카테고리 선택, 검색어를 입력하세요.");
				classList();
				return false;
			}
			
			$.ajax({
				url: '/NAGAGU/searchTypeList.my',
				type: 'POST',
				data: {"searchType" : searchType, "keyword" : keyword},
				dataType: 'json',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(data) {
					$('.listnum_num').text(data.length+"건");
					console.log(data);
					$.each(data, function(index, item) {
						
						var output = ' ';
						output += '<tr>';
						output += '<td><input type="checkbox"></td>';
						output += '<td>' + number + '</td>';
						
						if(item.class_STATUS == 0) {
							output += '<td>' + "준비중" + '</td>';
						} else if(item.class_STATUS == 1) {
							output += '<td>' + "강의중" + '</td>';
						} else {
							output += '<td>' + "강의종료" + '</td>';
						}
						output += '<td>' + item.class_AREA + '</td>';
						output += '<td>' + item.class_AMOUNT + '</td>';
						output += '<td>' + item.class_NAME + '</td>';
						output += '<td>' + item.class_CATEGORY + '</td>';
						output += '<td>' + item.class_DATE_CONFIGURATION_1 + ' ~ ' + item.class_DATE_CONFIGURATION_2  + '</td>';
						output += '<td>' + item.class_COUNT_MEMBER + '</td>';
						output += '<td><button class="btn_modify">' + "수정" + '</button></td>';
						output += '</tr>';
						
						$('#academyList').append(output);
						number += 1;
					});
				},
				error: function() {
					alert("ajax 통신 실패!");
				}
			});
			event.preventDefault();
		});
		
		function keyupSearch(event) {
			var searchType = $('#searchType').val();
			var keyword = $('#keyword').val();
			var number = 1;
			
			$('#academyList').empty();
			alert(searchType + keyword);
			
			if(!keyword || !searchType){
				alert("카테고리 선택,검색어를 입력하세요.");
				classList();
				return false;
			}
			$.ajax({
				url: '/NAGAGU/searchTypeList.my',
				type: 'POST',
				data: {"searchType" : searchType, "keyword" : keyword},
				dataType: 'json',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(data) {
					$('.listnum_num').text(data.length+"건");
					console.log(data);
					$.each(data, function(index, item) {
						
						var output = ' ';
						output += '<tr>';
						output += '<td><input type="checkbox"></td>';
						output += '<td>' + number + '</td>';
						
						if(item.class_STATUS == 0) {
							output += '<td>' + "준비중" + '</td>';
						} else if(item.class_STATUS == 1) {
							output += '<td>' + "강의중" + '</td>';
						} else {
							output += '<td>' + "강의종료" + '</td>';
						}
						output += '<td>' + item.class_AREA + '</td>';
						output += '<td>' + item.class_AMOUNT + '</td>';
						output += '<td>' + item.class_NAME + '</td>';
						output += '<td>' + item.class_CATEGORY + '</td>';
						output += '<td>' + item.class_DATE_CONFIGURATION_1 + ' ~ ' + item.class_DATE_CONFIGURATION_2  + '</td>';
						output += '<td>' + item.class_COUNT_MEMBER + '</td>';
						output += '<td><button class="btn_modify">' + "수정" + '</button></td>';
						output += '</tr>';
						
						$('#academyList').append(output);
						number += 1;
					});
				},
				error: function() {
					alert("ajax 통신 실패!");
				}
			});
			event.preventDefault();
		}
		
		function selectClassType() {
			
		}
	</script>
    

</head>
<body>
<div class="work_container">
    <!-- 사이드바 -->
    <div class="work_side">
        <!-- 사이드바 헤드 -->
        <div class="sidebar_head">
            <a href="./workshop.no">
                <div class="sidebar_title">
                    <i class="fas fa-store"></i> 공방관리센터
                </div>
            </a>
        </div>
        <!-- 사이드바 프로필 -->
        <div class="sidebar_profile">
            <div class="sidebar_pic">
                <a href="./workshop_modify.no"><img src="https://testkj.s3.ap-northeast-2.amazonaws.com/images/20150803_1257391.png" class="img-circle profile_img"></a>
            </div>
            <div class="sidebar_name">
                <h3><a href="./workshop_modify.no">공방 이름</a></h3>
            </div>
        </div>


        <!-- 사이드바 메뉴 -->
        <div id="sidebar_menu">
            <div class="menu_section">
                <ul class="nav side-menu">
                    <li><a>공방정보</a>
                        <ul class="nav child_menu">
                            <li><a href="./workshop.no">대시보드</a></li>
                            <li><a href="./workshop_modify.no">정보수정</a></li>
                        </ul>
                    </li>
                    <li><a>후기/문의 관리</a>
                        <ul class="nav child_menu">
                            <li><a href="./workshop_review_Store.no">상품후기 목록</a></li>
                            <li><a href="./workshop_review_reqStore.no">상품문의 목록</a></li>
                            <li><a href="./workshop_review_Academy.no">강의후기 목록</a></li>
                            <li><a href="./workshop_review_reqAcademy.no">강의문의 목록</a></li>
                        </ul>                            
                    </li>
                    <li><a>스토어관리</a>
                        <ul class="nav child_menu">
                            <li><a href="./workshop_Store_product.no">등록된 상품 관리</a></li>
                            <li><a href="./workshop_Store_selled.no">판매된 상품 관리</a></li>
                            <li><a href="./workshop_Store_estOffers.no">견적 제안 관리</a></li>
                            <li><a href="./workshop_Store_estProduct.no">견적 주문 관리</a></li>
                        </ul>
                    </li>
                    <li><a>아카데미관리</a>
                        <ul class="nav child_menu">
                            <li><a href="./workshop_academy_Management.no">등록된 강의 관리</a></li>
                            <li><a href="./workshop_academy_Membership.no">회원 관리</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <!-- 작업 구역 -->
    <div class="work_main">
        <div class="work_store_body">
            <div class="work_title">
                <div class="header row justify-content-end p-2">
                    &nbsp;
                </div>

                <div class="header2 row p-2">
                    <h1 class="col-3 header2_adj">등록된 강의 관리</h1>
                    <div class="col-9 px-0">
                        <div class="row justify-content-end">
                            <a href="./Course_registration.html" class="btn mx-2 btn-outline-dark" role="button" aria-pressed="true">강의등록</a>
                            
                        </div>
                    </div>
                </div>

                    <div class="row pt-2 pb-2">
                        <button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">전체표시</button>                        
                        <span class="listnum_txt pt-2">전체 문의내역</span>
                        <span class="listnum_num pt-2"></span>
                    </div>


                    <div class="row">
                        <!-- Example split danger button -->
                        <div class="dropdown">
                            <button class="btn dropbtn btn-sm dropdown-toggle btn-search-mode" type="button" id="searchType" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            	선택
                            </button>
                            <div class="dropdown-menu" aria-labelledby="searchType">
                                <button class="dropdown-item" id="dropdown-item-1" onclick="class_name()">강의명</button>
                                <button class="dropdown-item" id="dropdown-item-2" onclick="area()">지역</button>
                                <button class="dropdown-item" id="dropdown-item-3" onclick="category()">카테고리</button>
                            </div>
                        </div>
                        <!-- search -->
                        <nav class="navbar-light bg-light">
                        <!-- input에 enter키 누르면 자동으로 submit -->
                          <form class="form-inline" onsubmit="return false">
                            <input class="form-control mr-sm-2" type="search" id="keyword" aria-label="Search" style="height:90%">
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
                    <th scope="col" class="th3">상태</th>
                    <th scope="col" class="th4">지역</th>
                    <th scope="col" class="th5">가격</th>
                    <th scope="col" class="th6">강의명</th>
                    <th scope="col" class="th7">카테고리</th>
                    <th scope="col" class="th8">일시</th>
                    <th scope="col" class="th9">회원수</th>
                    <th scope="col" class="th10">관리</th>                    
                </tr>
                </thead>
                <tbody id="academyList">
                	
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
		if (event.keyCode == 13) {
			event.preventDefault();
			keyupSearch(event);
			return;
		}
	});
	
	
	function btn_select() {
		
		selectClassType();
	}
</script>
</body>
</html>


