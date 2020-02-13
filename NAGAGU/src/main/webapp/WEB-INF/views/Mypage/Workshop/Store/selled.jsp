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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/workshop_store_selled.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    

</head>
<body>
<div class="work_container">
    <!-- 작업 구역 -->
    <div class="work_main">
        <div class="work_store_body">
            <div class="work_title">
                <div class="header row justify-content-end p-2">
                    &nbsp;
                </div>

                <div class="header2 row p-2">
                    <h1 class="col-3 header2_adj">판매된 상품 관리</h1>
                </div>
                <div>

                    <div class="row pt-2 pb-2">
                        <button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">전체표시</button>                        
                        <button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">선택 입금확인</button>    
                        <button type="button" id="all_select" class="btn btn-sm btn-outline-dark mr-2">선택 주문취소</button>    
                        <span class="listnum_txt pt-2">전체 문의내역</span>
                        <span class="listnum_num pt-2">194건</span>
                    </div>

                    <div class="row">
                        <!-- Example split danger button -->


                        <div class="dropdown">
                            <button class="btn dropbtn btn-sm dropdown-toggle btn-search-mode" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                선택
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="#">주문번호</a>
                                <a class="dropdown-item" href="#">주문회원</a>
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
                        <select class="search_hidden_state">
                            <option value="0">전체</option>
                            <option value="1">입금대기</option>
                            <option value="2">입금완료</option>
                            <option value="3">배송준비</option>
                            <option value="4">배송중</option>
                            <option value="5">배송완료</option>
                            <option value="6">교환요청</option>
                            <option value="7">교환중</option>
                            <option value="8">교환완료</option>
                            <option value="9">환불요청</option>
                            <option value="10">환불중</option>
                            <option value="11">환불완료</option>
                            <option value="12">구매확정</option>
                            <option value="13">주문취소</option>
                        </select>
                    </div>
                </div>
            </div>
            <table class="table" id="work_store">
                <thead>
                <tr>
                    <th scope="col" class="th1"><input id="all_select" type="checkbox"></th>
                    <th scope="col" class="th2">주문번호</th>
                    <th scope="col" class="th3">결제수단</th>
                    <th scope="col" class="th4">상태</th>
                    <th scope="col" class="th5">주문회원</th>
                    <th scope="col" class="th6">받는분</th>
                    <th scope="col" class="th7">주문합계</th>
                    <th scope="col" class="th8">주문취소</th>
                    <th scope="col" class="th9">미입금</th>
                    <th scope="col" class="th10">주문일자</th>
                    <th scope="col" class="th11">상세</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="checkbox" name='chk'></td>
                    <td>3</td>
                    <td>신용카드</td>
                    <td>배송중</td>
                    <td>요가구</td>
                    <td>오진득</td>
                    <td>89,700</td>
                    <td>0</td>
                    <td>0</td>
                    <td>2020.01.08</td>
                    <td>
                        <button class="btn_modify" onclick="location.href='./workshop_selled_detail.html'">보기</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox" name='chk'></td>
                    <td>2</td>
                    <td>무통장입금</td>
                    <td>환불요청</td>
                    <td>김효기</td>
                    <td>김효기</td>
                    <td>330,000</td>
                    <td>0</td>
                    <td>0</td>
                    <td>2020.01.08</td>
                    <td>
                        <button class="btn_modify" onclick="location.href='workshop_selled_detail2.html'">보기</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox" name='chk'></td>
                    <td>1</td>
                    <td>신용카드</td>
                    <td>배송중</td>
                    <td>요가구</td>
                    <td>오진득</td>
                    <td>30,000</td>
                    <td>0</td>
                    <td>0</td>
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
</div>

<script>

    
    function setSelect() {
                if ($("#all_select").is(":checked")) {
                            $("input[type=checkbox]").prop("checked",true);
                    } else {
                        $("input[type=checkbox]").prop("checked",false);
                }
    }
    
    function checkSelect() {
    
    if ($("input[name='chk']:checked").length == 3) {
        $("#all_select").prop("checked",true);
    }
    else {
        $("#all_select").prop("checked",false);
    }
    
    return true;
    }
    
        $(document).ready(function(){
            $("#all_select").prop("checked",false);
            setSelect();
        
            $("#all_select").click(function() {
                setSelect();
            });
    
            $("input[name='chk']").click(function() {
                checkSelect();
            });
        });
        
 </script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>