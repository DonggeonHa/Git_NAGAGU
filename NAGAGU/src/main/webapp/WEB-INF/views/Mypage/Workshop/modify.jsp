<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/workshop_my_info.css">

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</head>
<body>
<div class="work_container">
	<%@ include file="./sidebar.jsp" %>


    <!-- 작업 구역 -->
    <div class="work_main">
        <div class="work_info_box">
            <div class="row work_title">
                <h1>공방 정보수정</h1>
            </div>
            <br/>
            <!-- work_info 폼 시작-->
            <form id="work_info" name="work_info" method="post">
            <div class="row work_info_box">
                <!-- 첫번째 블럭 -->
                <div class="col-5 work_info_first">
                    <div class="info_box_title">공방 정보</div>
                    <div class="row info_list">
                        <div class="col-4 info_label">공방 이름</div>
                        <div class="col-8 info_input">
                            <input type="text" class="form_input" id="workshop_name" name="workshop_name">
                        </div>
                    </div>
                    <div class="row info_list">
                        <div class="col-4 info_label">대표 이름</div>
                        <div class="col-8 info_input">
                            <input type="text" class="form_input" id="workshop_host" name="workshop_host">
                        </div>
                    </div>
                    <div class="row info_list">
                        <div class="col-4 info_label">연락처</div>
                        <div class="col-8 info_input">
                            <input type="text" class="form_input" id="workshop_phone" name="workshop_phone">
                        </div>
                    </div>
                    <div class="row info_list">
                        <div class="col-4 info_label">사업자 번호</div>
                        <div class="col-8 info_input">
                            <input type="text" class="form_input" id="workshop_license" name="workshop_license">
                        </div>
                    </div>
                    <div class="row info_list">
                        <div class="info_label">공방 주소</div>
                    </div>
                    <div class="row info_sm_list">
                        <div class="col-2 info_label ">우편번호</div>
                        <div class="col-10 info_input">
                            <input type="text" class="form_input zipcode" id="workshop_zip" name="workshop_zip">
                            <button id="zip_search" class="form_button">주소찾기</button>
                        </div>
                    </div>
                    <div class="row info_sm_list">
                        <div class="col-2 info_label ">주소</div>
                        <div class="col-10 info_input">
                            <input type="text" class="form_input" id="workshop_adress1" name="workshop_address1">
                        </div>
                    </div>
                    <div class="row info_sm_list">
                        <div class="col-2 info_label ">상세 주소</div>
                        <div class="col-10 info_input">
                            <input type="text" class="form_input" id="workshop_adress2" name="workshop_address2">
                        </div>
                    </div>
                </div>
                <div class="col-2">&nbsp;</div>
                <div class="col-5 work_info_second">
                    <div class="info_box_title">공방 소개 정보</div>
                    <div class="row info_img_list">
                        <div class="col-4 info_label">대표 이미지</div>
                        <div class="col-8 info_img_input">
                            <div class="row">
                                <div class="small-12 medium-2 large-2 columns">
                                  <div class="circle">
                                    <!-- User Profile Image -->
                                    <img class="profile-pic" src="https://testkj.s3.ap-northeast-2.amazonaws.com/images/20150803_1257391.png">
                             
                                    <!-- Default Image -->
                                    <!-- <i class="fa fa-user fa-5x"></i> -->
                                  </div>
                                  <div class="p-image">
                                    <i class="fa fa-camera upload-button"></i>
                                     <input class="file-upload" type="file" accept="image/*"/>
                                  </div>
                               </div>
                             </div>
                        </div>
                    </div>
                    <div class="row info_intro_list">
                        <div class="row info_label intro_label">소개글</div>
                        <div class="row intro_form">
                            <textarea class="form_input intro" id="workshop_intro" name="workshop_intro">
                            </textarea>
                        </div>
                    </div>
                    
                    <div class="info_box_title">은행 계좌</div>
                    
                    <div class="row info_list">
                        <div class="col-2 info_label">은행</div>
                        <div class="col-10 info_input">
                            <select id="selector" class="form_input selector">
                                <option value="081">하나은행</option>
                                <option value="020">우리은행</option>
                                <option value="088">신한은행</option>
                                <option value="011">농협</option>
                                <option value="045">새마을금고</option>
                                <option value="004">국민은행</option>
                                <option value="071">우체국</option>
                                <option value="002">산업은행</option>
                                <option value="003">기업은행</option>
                            </select>
                        </div>
                    </div>
                    <div class="row info_list">
                        <div class="col-2 info_label">예금주</div>
                        <div class="col-10 info_input">
                            <input type="text" class="form_input owner_input" id="workshop_owner" name="workshop_owner">
                        </div>
                    </div>
                    
                    <div class="row info_list">
                        <div class="col-2 info_label">계좌번호</div>
                        <div class="col-10 info_input">
                            <input type="text" class="form_input" id="workshop_acnum" name="workshop_acnum">
                        </div>
                    </div>

                </div>
            </div>
        </form>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
    </div>
    <!-- 하단 작업 버튼 바 -->
    <div class="col-12 task_bar">
        <button class="info_submit" tpye="submit">수정</button>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>