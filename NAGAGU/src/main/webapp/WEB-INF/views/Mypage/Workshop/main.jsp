<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/workshop_my_index.css">

</head>
<body>
<div class="work_container">
	<%@ include file="../sidebar.jsp" %>

    <!-- 작업 구역 -->
    <div class="row work_main">
            <div class="work_body">
                <br/><br/><br/><br/><br/>
                <div class="row work_profile">
                    <div class="col-3">&nbsp;</div>
                    <div class="col-2 profile_pic"><i class="fas fa-user-circle stats_icon "></i></div>
                    <div class="col-4 profile_detail">
                        <div class="row detail_title ef pt-5" >공방 이름</div>
                        <div class="row detail_list">
                            <div class="col-4 detail_list_name">팔로워</div>
                            <div class="col-8 list_item">28 명</div>
                        </div>
                        <div class="row detail_list">
                            <div class="col-4 detail_list_name">팔로워</div>
                            <div class="col-8 list_item">28 명</div>
                        </div>
                    </div>
                    <div class="col-3">&nbsp;</div>
                </div>
                <div class ="row work_stats">
                    <div class="col-stat stats_shop pr-5">
                        <div class="row head_icon"><i class="fas fa-store stats_icon"></i></div>
                        <div class="row detail_title ef">상품 관리</div>
                        <div class="row detail_list">
                            <div class="col-4 shop_list_name">입금대기</div>
                            <div class="col-8 list_item">1건</div>
                        </div>
                        <div class="row detail_list">
                            <div class="col-4 shop_list_name">입금완료</div>
                            <div class="col-8 list_item">1건</div>
                        </div>
                        <div class="row detail_list">
                            <div class="col-4 shop_list_name">배송준비</div>
                            <div class="col-8 list_item">1건</div>
                        </div>
                        <div class="row detail_list">
                            <div class="col-4 shop_list_name">배송중</div>
                            <div class="col-8 list_item">1건</div>
                        </div>
                        <div class="row detail_list">
                            <div class="col-4 shop_list_name">배송완료</div>
                            <div class="col-8 list_item">1건</div>
                        </div>
                        <div class="row detail_list">
                            <div class="col-4 shop_list_name">구매확정</div>
                            <div class="col-8 list_item">1건</div>
                        </div>
                    </div>
                    <div class="col-stat work_product pr-5">
                        <div class="row head_icon"><i class="fas fa-truck stats_icon"></i></i></div>
                        <div class="row detail_title ef">배송 및 교환</div>
                        <div class="row detail_list">
                            <div class="col-4 product_list_name">교환요청</div>
                            <div class="col-8 list_item">0건</div>
                        </div>
                        <div class="row detail_list">
                            <div class="col-4 product_list_name">환불요청</div>
                            <div class="col-8 list_item">0건</div>
                        </div>
                        <div class="row detail_list">
                            <div class="col-4 product_list_name">취소요청</div>
                            <div class="col-8 list_item">0건</div>
                        </div>
                    </div>
                    <div class="col-stat work_class pr-5">
                        <div class="row head_icon"><i class="fas fa-chalkboard-teacher stats_icon"></i></i></div>
                        <div class="row detail_title ef">강좌 관리</div>
                        <div class="row detail_list">
                            <div class="col-4 class_list_name">개설 강좌</div>
                            <div class="col-8 list_item">2개</div>
                        </div>
                        <div class="row detail_list">
                            <div class="col-4 class_list_name">총 회원수</div>
                            <div class="col-8 list_item">17 명</div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>