<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="page-content-wrapper" style="padding-top: 5%;">
	<div class="container-fluid">
        <div class="pb-5">
            <h1>견적 제안 관리</h1>
        </div>
        <div class="d-flex justify-content-between pb-2">
	        <div class="justify-content-start">
	            <button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">전체표시</button>
	            <button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">선택 삭제</button>                         
	            <span class="listnum_txt pt-2">전체 제안내역</span>
	            <span class="listnum_num pt-2">194건</span>
	        </div>
	        <div class="justify-content-end">
	        	<div class="d-flex justify-content-end">
		            <!-- Example split danger button -->
		            <div class="dropdown">
		                <button class="btn dropbtn btn-sm dropdown-toggle btn-search-mode" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                   	 선택
		                </button>
		                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		                    <a class="dropdown-item" href="#">식별제목</a>
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
	                <th scope="col" class="th2">분류</th>                        
	                <th scope="col" class="th3">작성자</th>
	                <th scope="col" class="th4">게시물 제목</th>
	                <th scope="col" class="th5">식별 제목</th>
	                <th scope="col" class="th6">카테고리</th>
	                <th scope="col" class="th7">제안가격</th>
	                <th scope="col" class="th8">상태</th>
	                <th scope="col" class="th9">관리</th>
	                <th scope="col" class="th10">채팅</th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td scope="col" ><input type="checkbox"></td>
	                <td scope="col">4</td>
	                <td scope="col" >abc123</td>
	                <td scope="col" >견적 문의드립니다!테이블</td>
	                <td scope="col" >테이블 상+하부 40</td>
	                <td scope="col" >테이블</td>
	                <td scope="col" >400,000</td>
	                <td scope="col" >경매진행중</td>
	                <td rowspan="2" scope="col">
	                    <button class="btn_modify" >보기</button>
	                    <button class="btn_modify" id="modform4" >수정</button>
	                    <button class="btn_modify">삭제</button>
	                </td>
	                <td rowspan="2" scope="col">
	                    <button class="btn_modify">채팅</button>
	                </td>
	            </tr>
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
		var all_check = false;

		$("#all_select").click(function() {
			if (all_check == false) {
				$("input[type=checkbox]").prop("checked", true);
				all_check = true;
			} else {
				$("input[type=checkbox]").prop("checked", false);
				all_check = false;
			}

		});

		$("#modform4").click(function() {
			var data = $("mod3").val();
			alert(data);
		});

		function modifyform(num) {
			var id = $('#exam').val();
			var data = $("mod3").val();
			alert(data);
		}

	});
</script>