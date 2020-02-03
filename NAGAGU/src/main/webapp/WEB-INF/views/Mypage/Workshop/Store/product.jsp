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
    <!-- 사이드 바 스타일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/sidebar_kt.css">
    <!-- 공방관리 기본 스타일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/workshop_my.css">
    <!-- 페이지 고유 스타일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/workshop_store_product.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    

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
                    <h1 class="col-3 header2_adj">등록된 상품 관리</h1>
                    <div class="col-9 px-0">
                        <div class="row justify-content-end">
                            <button class="btn mx-2 btn_enroll">상품 등록</button>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="row pt-2 pb-2">
                        <button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">전체표시</button>
                        <button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">선택 판매중</button>  
                        <button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">선택 품절</button>  
                        <button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">선택 판매종료</button>                              
                        <span class="listnum_txt pt-2">전체 상품내역</span>
                        <span class="listnum_num pt-2">194건</span>
                    </div>
                    <div class="row">
                        <!-- Example split danger button -->


                        <div class="dropdown">
                            <button class="btn dropbtn btn-sm dropdown-toggle btn-search-mode" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                선택
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="#">상품이름</a>
                                <a class="dropdown-item" href="#">상품코드</a>
                                <a class="dropdown-item" href="#">상태</a>
                                <a class="dropdown-item" href="#">판매가</a>
                            </div>
                        </div>

                        <!-- search -->
                        <nav class="navbar-light bg-light">
                          <form class="form-inline" >
                            <input class="form-control mr-sm-2" type="search" aria-label="Search" style="height:90%">
                            <button class="btn btn_search btn-sm my-2 my-sm-0" type="submit">검색</button>
                          </form>
                        </nav>
                        <select class="search_hidden_state">
                            <option value="0">대기</option>
                            <option value="1">판매중</option>
                            <option value="2">품절</option>
                            <option value="3">판매종료</option>
                        </select>
                    </div>
                </div>
            </div>
            <table class="table" id="work_store">
                <thead>
                <tr>
                    <th scope="col" class="th1"><input id="all_select" type="checkbox"></th>
                    <th scope="col" class="th2">상품코드</th>
                    <th scope="col" class="th3">상태</th>
                    <th scope="col" class="th4">상품이름</th>
                    <th scope="col" class="th5">판매가</th>
                    <th scope="col" class="th6">재고량</th>
                    <th scope="col" class="th7">판매량</th>
                    <th scope="col" class="th8">배송</th>
                    <th scope="col" class="th9">조회수</th>
                    <th scope="col" class="th10">좋아요</th>
                    <th scope="col" class="th11">등록일</th>
                    <th scope="col" class="th12">관리</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>1</td>
                    <td>판매중</td>
                    <td class="p_title">
                        <a href="">
                            <img src="https://testkj.s3.ap-northeast-2.amazonaws.com/images/like2.jpg">
                            페코링링
                        </a>
                    </td>
                    <td>29900 원</td>
                    <td>28</td>
                    <td>11</td>
                    <td>기본 배송</td>
                    <td>347</td>
                    <td>79</td>
                    <td>2020.01.08</td>
                    <td><button class="btn_modify">수정</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>2</td>
                    <td>품절</td>
                    <td class="p_title">
                        <img src="https://testkj.s3.ap-northeast-2.amazonaws.com/images/like1.jpg">
                        도도링
                    </td>
                    <td>19900 원</td>
                    <td>48</td>
                    <td>31</td>
                    <td>기본 배송</td>
                    <td>476</td>
                    <td>129</td>
                    <td>2020.01.09</td>
                    <td><button class="btn_modify">수정</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>3</td>
                    <td>품절</td>
                    <td class="p_title">
                        <img src="https://testkj.s3.ap-northeast-2.amazonaws.com/images/like1.jpg">
                        도도링
                    </td>
                    <td>19900 원</td>
                    <td>48</td>
                    <td>31</td>
                    <td>기본 배송</td>
                    <td>476</td>
                    <td>129</td>
                    <td>2020.01.09</td>
                    <td><button class="btn_modify">수정</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>4</td>
                    <td>품절</td>
                    <td class="p_title">
                        <img src="https://testkj.s3.ap-northeast-2.amazonaws.com/images/like1.jpg">
                        도도링
                    </td>
                    <td>19900 원</td>
                    <td>48</td>
                    <td>31</td>
                    <td>기본 배송</td>
                    <td>476</td>
                    <td>129</td>
                    <td>2020.01.09</td>
                    <td><button class="btn_modify">수정</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>5</td>
                    <td>품절</td>
                    <td class="p_title">
                        <img src="https://testkj.s3.ap-northeast-2.amazonaws.com/images/like1.jpg">
                        도도링
                    </td>
                    <td>19900 원</td>
                    <td>48</td>
                    <td>31</td>
                    <td>기본 배송</td>
                    <td>476</td>
                    <td>129</td>
                    <td>2020.01.09</td>
                    <td><button class="btn_modify">수정</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>5</td>
                    <td>품절</td>
                    <td class="p_title">
                        <img src="https://testkj.s3.ap-northeast-2.amazonaws.com/images/like1.jpg">
                        도도링
                    </td>
                    <td>19900 원</td>
                    <td>48</td>
                    <td>31</td>
                    <td>기본 배송</td>
                    <td>476</td>
                    <td>129</td>
                    <td>2020.01.09</td>
                    <td><button class="btn_modify">수정</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>5</td>
                    <td>품절</td>
                    <td class="p_title">
                        <img src="https://testkj.s3.ap-northeast-2.amazonaws.com/images/like1.jpg">
                        도도링
                    </td>
                    <td>19900 원</td>
                    <td>48</td>
                    <td>31</td>
                    <td>기본 배송</td>
                    <td>476</td>
                    <td>129</td>
                    <td>2020.01.09</td>
                    <td><button class="btn_modify">수정</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>5</td>
                    <td>품절</td>
                    <td class="p_title">
                        <img src="https://testkj.s3.ap-northeast-2.amazonaws.com/images/like1.jpg">
                        도도링
                    </td>
                    <td>19900 원</td>
                    <td>48</td>
                    <td>31</td>
                    <td>기본 배송</td>
                    <td>476</td>
                    <td>129</td>
                    <td>2020.01.09</td>
                    <td><button class="btn_modify">수정</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>5</td>
                    <td>품절</td>
                    <td class="p_title">
                        <img src="https://testkj.s3.ap-northeast-2.amazonaws.com/images/like1.jpg">
                        도도링
                    </td>
                    <td>19900 원</td>
                    <td>48</td>
                    <td>31</td>
                    <td>기본 배송</td>
                    <td>476</td>
                    <td>129</td>
                    <td>2020.01.09</td>
                    <td><button class="btn_modify">수정</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>5</td>
                    <td>품절</td>
                    <td class="p_title">
                        <img src="https://testkj.s3.ap-northeast-2.amazonaws.com/images/like1.jpg">
                        도도링
                    </td>
                    <td>19900 원</td>
                    <td>48</td>
                    <td>31</td>
                    <td>기본 배송</td>
                    <td>476</td>
                    <td>129</td>
                    <td>2020.01.09</td>
                    <td><button class="btn_modify">수정</button></td>
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