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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/workshop_est_product.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    

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
                    <h1 class="col-3 header2_adj">견적 주문 관리</h1>

                </div>
                <div>
                    <div class="row pt-2 pb-2">
                        <button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">전체표시</button>          
                        <button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">선택 쪽지</button>               
                        <span class="listnum_txt pt-2">전체 주문내역</span>
                        <span class="listnum_num pt-2">194건</span>
                    </div>
                    <div class="row">
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
                    <th scope="col" ><input id="all_select" type="checkbox"></th>
                    <th scope="col">분류</th>
                    <th scope="col">작성자</th>
                    <th scope="col">식별 제목</th>
                    <th scope="col">카테고리</th>
                    <th scope="col">진행상태</th>
                    <th scope="col">낙찰시기</th>
                    <th scope="col">글보기</th>
                    <th scope="col">채팅</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td scope="col" ><input type="checkbox"></td>
                    <td scope="col">4</td>
                    <td scope="col">abc123</td>
                    <td scope="col">테이블 상+하부 40</td>
                    <td scope="col">테이블</td>
                    <td scope="col">제작중&nbsp;&nbsp;<button class="btn_modify">수정</button></td>
                    <td scope="col">20.01.11</td>
                    <td scope="col">
                        <button class="btn_modify">보기</button>
                    </td>
                    <td scope="col">
                        <button class="btn_modify">채팅</button>
                    </td>
                </tr>
                 <tr>
                    <td scope="col" ><input type="checkbox"></td>
                    <td scope="col">3</td>
                    <td scope="col">bityeah0</td>
                    <td scope="col">테이블 상판 그린 20</td>
                    <td scope="col">테이블</td>
                    <td scope="col">배송중&nbsp;&nbsp;<button class="btn_modify">수정</button></td>
                    <td scope="col">20.01.11</td>
                    <td scope="col">
                        <button class="btn_modify">보기</button>
                    </td>
                    <td scope="col">
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

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>