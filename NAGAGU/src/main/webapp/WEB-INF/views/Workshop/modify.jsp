<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.workshop.*" %>
<%
	WorkShopMemberVO workshopVO = new WorkShopMemberVO();
	workshopVO = (WorkShopMemberVO)request.getAttribute("WorkShopMemberVO");
	String WORKSHOP_CEO_NAME = workshopVO.getWORKSHOP_CEO_NAME();
	String WORKSHOP_NAME = workshopVO.getWORKSHOP_NAME();
	String WORKSHOP_PHONE = workshopVO.getWORKSHOP_PHONE();
	String WORKSHOP_PICTURE = workshopVO.getWORKSHOP_PICTURE();
	String WORKSHOP_LICENSE = workshopVO.getWORKSHOP_LICENSE();
	String WORKSHOP_INTRO = workshopVO.getWORKSHOP_INTRO();
	String WORKSHOP_ZIP = workshopVO.getWORKSHOP_ZIP();
	String WORKSHOP_ADDRESS1 = workshopVO.getWORKSHOP_ADDRESS1();
	String WORKSHOP_ADDRESS2 = workshopVO.getWORKSHOP_ADDRESS2();
%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/workshopModify.css">
<div id="page-content-wrapper" style="padding-top: 2%;">
	<div class="container-fluid">
        <div class="work_info_box">
            <div class="row work_title">
                <h1 id="edit-title">공방 정보수정</h1>
            </div>
            <div class="row" id="second_title">
            	<span id="span_text">공방 고객님께서 가입하신 공방 정보입니다.<br>공방가입시 기본정보를 정확하게 입력하여 주시면 서비스 이용시 편리하게 이용하실 수 있습니다.</span>
            </div>
            <br/>
            <!-- work_info 폼 시작-->
            <form id="work_info" name="work_info" action="./wsModify.mywork" method="post" enctype="multipart/form-data">
            <div class="row work_info_box">
                <!-- 첫번째 블럭 -->
                <div class="col-5 work_info_first">
                    <div class="info_box_title">공방 정보</div>
                    <div class="row info_list">
                        <div class="col-4 info_label">공방 이름</div>
                        <div class="col-8 info_input">
                            <h4><%=WORKSHOP_NAME%></h4>
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
                            <input type="text" class="form_input" id="workshop_license" name="WORKSHOP_LICENSE" value="<%=WORKSHOP_LICENSE%>" placeholder="(-)하이픈까지 입력">
                        </div>
                    </div>
                    <br>
					<div class="row info_sm_list">
						<div class="col-2 info_label">우편번호</div>
						<div class="col-10 info_input">
							<input type="text" id="WORKSHOP_ZIP" name="WORKSHOP_ZIP"
								readonly="readonly" value="<%=WORKSHOP_ZIP %>" class="form_input">
							<button type="button" id="zipcode_btn" onclick="openZipSearch()"
								class="zipcode_button">주소찾기</button>
						</div>
					</div>
					<div class="row info_sm_list">
						<div class="col-2 info_label">주소</div>
						<div class="col-10 info_input">
							<input type="text" id="WORKSHOP_ADDRESS1"
								name="WORKSHOP_ADDRESS1" value="<%=WORKSHOP_ADDRESS1 %>" placeholder="기본주소"
								class="form_input" readonly>
						</div>
					</div>
					<div class="row info_sm_list">
						<div class="col-2 info_label">상세주소</div>
						<div class="col-10 info_input">
							<input type="text" id="WORKSHOP_ADDRESS2"
								name="WORKSHOP_ADDRESS2" value="<%=WORKSHOP_ADDRESS2 %>" placeholder="상세주소"
								class="form_input">
						</div>
					</div>
                </div>
                <div class="col-1">&nbsp;</div>
                <div class="col-5 work_info_second">
                    <div class="info_box_title">공방 소개 정보</div>
                    <div class="row info_img_list">
                        <div class="col-4 info_label">대표 이미지</div>
                        <div class="col-8 info_img_input">
                            <div class="image-upload">
							<div class="image-edit">
								<input type="hidden" name="WORKSHOP_PICTURE" value="<%=WORKSHOP_PICTURE %>">
								<input type="file" name="img" id="imageUpload"
									class="imageUpload" data-preview="imagePreview"
									accept=".png, .jpg, .jpeg" /> <label for="imageUpload"></label>
							</div>
							<div class="preview">
								<div id="imagePreview"></div>
							</div>
						</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="info_label">소개글</div>
                        <div class="intro_form" style="height: 211px;">
                        	<textarea class="form_input intro" id="workshop_intro" name="WORKSHOP_INTRO"><%=WORKSHOP_INTRO%></textarea>
						</div>
                    </div>
                </div>
            </div>
            <div class="d-flex w_btn">
           		<button type="button" id="btn_submit" onclick="click_sub();">수정</button>
           		<input type='reset' id="btn_cancel" value="취소">
            </div>
        </form>
        </div>
    </div>
</div>

<!-- 우편번호 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	#imagePreview {
		background-image: url('<%=WORKSHOP_PICTURE%>');
	}
	.w_btn{
      margin-left: 400px;
      margin-top: 50px;
   }
</style>
<script>
$(document).ready(function() {
	
});

$(function () {
    // Hide URL/FileReader API requirement message in capable browsers:
    if (
        window.createObjectURL ||
        window.URL ||
        window.webkitURL ||
        window.FileReader
    ) {
        $('.browser').hide()
        $('.preview').children().show()
    }

    function isDataURL(s) {
        return !!s.match(isDataURL.regex);
    }
    isDataURL.regex = /^\s*data:([a-z]+\/[a-z]+(;[a-z\-]+\=[a-z\-]+)?)?(;base64)?,[a-z0-9\!\$\&\'\,\(\)\*\+\,\;\=\-\.\_\~\:\@\/\?\%\s]*\s*$/i;

    function readURL(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();
            var preview = $(input).data('preview');
            var _invalid = $(input).parent().parent().find('.invalid-file')

            reader.onload = function(e) {

                if( isDataURL(e.target.result) )    {
                    _invalid.hide()
                    $('#' + preview).css('background-image', 'url('+e.target.result +')');
                    $('#' + preview).hide();
                    $('#' + preview).fadeIn(650);
                } else {
                    $('#' + preview).hide()
                    _invalid.html('<div class="alert alert-false"><strong>Error!</strong> Invalid image file.</div>')
                    _invalid.show()
                }
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $('.imageUpload').bind('change', function(e) {
        e.preventDefault()

        readURL(this)
    });
})

//우편번호 주소검색
function openZipSearch() {
   new daum.Postcode({
      oncomplete: function(data) {
         $('[name=WORKSHOP_ZIP]').val(data.zonecode); // 우편번호 (5자리)
         $('[name=WORKSHOP_ADDRESS1]').val(data.address);   // 기본주소
         $('[name=WORKSHOP_ADDRESS2]').val(data.buildingName);   // 상세주소
         $('[name=WORKSHOP_ADDRESS2]').focus();
         console.log(data);
      }
   }).open();
}

function click_sub() {
	var ceoName = $('#WORKSHOP_CEO_NAME').val();
	var phone = $('#WORKSHOP_PHONE').val();
	var license = $('#WORKSHOP_LICENSE').val();
	var zip = $('#WORKSHOP_ZIP').val();
	var address1 = $('#WORKSHOP_ADDRESS1').val();
	var address2 = $('#WORKSHOP_ADDRESS2').val();
	
	if(ceoName=="" || phone=="" || license=="" || zip=="" || address1=="" || address2==""){
		alert("정보 중 빈칸이 있습니다.");
		
		return false;
	}else {
		document.work_info.submit();
	}
}
</script>