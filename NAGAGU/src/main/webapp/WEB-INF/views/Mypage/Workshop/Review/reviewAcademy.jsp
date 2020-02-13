<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="page-content-wrapper" style="padding-top: 5%;">
	<div class="container-fluid">
		<div class="work_title">
		    <div class="pb-5">
		        <h1 class="header2_adj">강의 후기</h1>
		    </div>
	        <div class="d-flex justify-content-start pb-2">
	            <button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">전체표시</button>                        
	            <span class="listnum_txt pt-2">전체 문의내역</span>
	            <span class="listnum_num pt-2">194건</span>
	        </div>
	        <div class="d-flex justify-content-between pb-2">
	        	<div class="justify-content-start">
		        	<select class="search_hidden_state form-control">
					    <option>전체</option>
					    <option value="0">답변대기</option>
					    <option value="1">답변완료</option>
					</select>
				</div>
	            <!-- Example split danger button -->
	            <div class="justify-content-end">
	            	<div class="d-flex justify-content-end">
						<div class="dropdown">
						    <button class="btn dropbtn btn-sm dropdown-toggle btn-search-mode" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						       	 선택
						    </button>
						    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						        <a class="dropdown-item" href="#">작성자</a>
						        <a class="dropdown-item" href="#">강의명</a>
						        <a class="dropdown-item" href="#">카테고리</a>
						        <a class="dropdown-item" href="#">답변여부</a>
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
		</div>
        <table class="table" id="work_store">
		    <thead>
		    <tr>
		        <th scope="col" class="th1"><input id="all_select" type="checkbox"></th>
		        <th scope="col" class="th2">번호</th>
		        <th scope="col" class="th3">카테고리</th>
		        <th scope="col" class="th4">작성자</th>
		        <th scope="col" class="th5">강의명</th>
		        <th scope="col" class="th6">작성날짜</th>
		        <th scope="col" class="th7">보기</th>
		    </tr>
		    </thead>
		    <tbody>
		    <tr>
		        <td><input type="checkbox"></td>
		        <td>5</td>
		        <td>테이블</td>
		        <td>abc123</td>
		        <td>[텐텐클래스](동작)귀여운 진저맨 디저트 캔들 만들기</td>
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
		        <td>[텐텐클래스](동작)귀여운 진저맨 디저트 캔들 만들기</td>
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
		        <td>[텐텐클래스](동작)귀여운 진저맨 디저트 캔들 만들기</td>
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
		        <td>[텐텐클래스](동작)귀여운 진저맨 디저트 캔들 만들기</td>
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
		        <td>[텐텐클래스](동작)귀여운 진저맨 디저트 캔들 만들기</td>
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
		        <td>[텐텐클래스](동작)귀여운 진저맨 디저트 캔들 만들기</td>
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
		        <td>[텐텐클래스](동작)귀여운 진저맨 디저트 캔들 만들기</td>
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
		        <td>[텐텐클래스](동작)귀여운 진저맨 디저트 캔들 만들기</td>
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
		        <td>[텐텐클래스](동작)귀여운 진저맨 디저트 캔들 만들기</td>
		        <td>2020.01.08</td>
		        <td>
		            <button class="btn_modify">보기</button>
		    </tr>
		    <tr>
		        <td><input type="checkbox"></td>
		        <td>5</td>
		        <td>테이블</td>
		        <td>abc123</td>
		        <td>[텐텐클래스](동작)귀여운 진저맨 디저트 캔들 만들기</td>
		        <td>2020.01.08</td>
		        <td>
		            <button class="btn_modify">보기</button>
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
</script>