<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.workshop.*" %>
<%
	WorkShopMemberVO workshopVO = new WorkShopMemberVO();
	workshopVO = (WorkShopMemberVO)request.getAttribute("WorkShopMemberVO");
	String WORKSHOP_CEO_NAME = workshopVO.getWORKSHOP_CEO_NAME();
	String WORKSHOP_PHONE = workshopVO.getWORKSHOP_PHONE();
	String WORKSHOP_LICENSE = workshopVO.getWORKSHOP_LICENSE();
	String WORKSHOP_INTRO = workshopVO.getWORKSHOP_INTRO();
	String WORKSHOP_ZIP = workshopVO.getWORKSHOP_ZIP();
	String WORKSHOP_ADDRESS1 = workshopVO.getWORKSHOP_ADDRESS1();
	String WORKSHOP_ADDRESS2 = workshopVO.getWORKSHOP_ADDRESS2();
%>
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

   	
   	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>	
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
                            <h3><%=WORKSHOP_NAME %></h3>
                        </div>
                    </div>
                    <div class="row info_list">
                        <div class="col-4 info_label">대표 이름</div>
                        <div class="col-8 info_input">
                            <input type="text" class="form_input" id="workshop_host" name="WORKSHOP_CEO_NAME" value="<%=WORKSHOP_CEO_NAME%>">
                        </div>
                    </div>
                    <div class="row info_list">
                        <div class="col-4 info_label">연락처</div>
                        <div class="col-8 info_input">
                            <input type="text" class="form_input" id="workshop_phone" name="WORKSHOP_PHONE" value="<%=WORKSHOP_PHONE%>">
                        </div>
                    </div>
                    <div class="row info_list">
                        <div class="col-4 info_label">사업자 번호</div>
                        <div class="col-8 info_input">
                            <input type="text" class="form_input" id="workshop_license" name="WORKSHOP_LICENSE" value="<%=WORKSHOP_LICENSE%>">
                        </div>
                    </div>
                    <div class="row info_list">
                        <div class="info_label">공방 주소</div>
                    </div>
                    <div class="row info_sm_list">
                        <div class="col-2 info_label ">우편번호</div>
                        <div class="col-10 info_input">
                            <input type="text" class="form_input zipcode" id="zip" name="WORKSHOP_ZIP" value="" readonly="readonly">
                            <button id="zip_search" class="form_button" onclick="openZipSearch();">주소찾기</button>
                        </div>
                    </div>
                    <div class="row info_sm_list">
                        <div class="col-2 info_label ">주소</div>
                        <div class="col-10 info_input">
                            <input type="text" class="form_input" id="address1" name="WORKSHOP_ADDRESS1" value="" readonly>
                        </div>
                    </div>
                    <div class="row info_sm_list">
                        <div class="col-2 info_label ">상세 주소</div>
                        <div class="col-10 info_input">
                            <input type="text" class="form_input" id="address2" name="WORKSHOP_ADDRESS2" value="">
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
                                    <img class="profile-pic" src="<%=WORKSHOP_PICTURE%>">
                             
                                    <!-- Default Image -->
                                    <!-- <i class="fa fa-user fa-5x"></i> -->
                                  </div>
                                  <div class="p-image">
                                  	
                                    <i class="fa fa-camera upload-button"></i>
                                  </div>
                               </div>
                             </div>
                             
                        </div>
                        
                    </div>
                    <div class="row info_intro_list">
                        <div class="row info_label intro_label">소개글</div>
                        <div class="row intro_form">
                            <textarea class="form_input intro" id="workshop_intro" name="WORKSHOP_INTRO"><%=WORKSHOP_INTRO%></textarea>
                        </div>
                    </div>
                    <input class="file-upload" type="file" accept=".png, .jpg, .jpeg" name="WORKSHOP_PICTURE"/>
                </div>
            </div>
        </form>
        </div>
    </div>
</div>

<!-- 우편번호 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
	
});
//우편번호 주소검색
function openZipSearch() {
   new daum.Postcode({
      oncomplete: function(data) {
    	 $('#zip').val(data.zonecode); // 우편번호 (5자리)
    	 $('#address1').val(data.address);   // 기본주소
    	 $('#address2').val(data.buildingName);   // 상세주소
    	 $('#address2').focus();
         $.log(data);
      }
   }).open();
}
</script>
</body>
</html>