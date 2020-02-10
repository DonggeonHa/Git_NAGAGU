<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<!-- 사이드 바 스타일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/sidebar_kt.css">
    <style>
	/*홈페이지 가기*/
	.goHomepage {
		font-size:16px;
		color:white !important;
		text-align:center;
	}
	.goHomepage a{
		color:white !important;
	}    
    </style>
</head>
<body>
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
        <div class="goHomepage">
        	<a href="./index.ma">홈페이지 가기</a>
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
                            <li><a href="./workshop_review_qnaStore.no">상품문의 목록</a></li>
                            <li><a href="./workshop_review_Academy.no">강의후기 목록</a></li>
                            <li><a href="./workshop_review_qnaAcademy.no">강의문의 목록</a></li>
                        </ul>                            
                    </li>
                    <li><a>스토어관리</a>
                        <ul class="nav child_menu">
                            <li><a href="./workshop_product_items.no">등록된 상품 관리</a></li>
                            <li><a href="./workshop_product_selled.no">판매된 상품 관리</a></li>
                            <li><a href="./workshop_estimate_offers.no">견적 제안 관리</a></li>
                            <li><a href="./workshop_estimate_product.no">견적 주문 관리</a></li>
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
</body>
</html>