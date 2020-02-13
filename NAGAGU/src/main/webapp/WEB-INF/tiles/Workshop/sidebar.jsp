<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 사이드바 -->
<div id="sidebar-wrapper">
	<nav>
		<ul class="sidebar-image">
			<li class="sidebar-brand" style="margin: 15px 0;">
				<a href="./workshop.ws">
					<div class="sidebar_title">
						<i class="fas fa-store"></i> 공방관리센터
					</div>
				</a>
			</li>
			<li class="sidebar-brand" style="margin: 15px 0;">
				<a href="./index.ma" id="index">
					메인페이지로
				</a>
			</li>
		</ul>
		<ul class="sidebar-nav">
			<li class="main text-white">
				공방정보
				<ul>
					<li><a href="./workshop.ws">대시보드</a></li>
					<li><a href="./workshop_modify.ws">정보수정</a></li>
				</ul>
			</li>
			<li class="main text-white">
				후기/문의 관리
				<ul>
					<li><a href="./workshop_review_Store.ws">상품후기 목록</a></li>
					<li><a href="./workshop_review_qnaStore.ws">상품문의 목록</a></li>
					<li><a href="./workshop_review_Academy.ws">강의후기 목록</a></li>
					<li><a href="./workshop_review_qnaAcademy.ws">강의문의 목록</a></li>
				</ul>
			</li>
			<li class="main text-white">
				스토어관리
				<ul>
					<li><a href="./workshop_product_items.ws">등록된 상품 관리</a></li>
					<li><a href="./workshop_product_selled.ws">판매된 상품 관리</a></li>
					<li><a href="./workshop_estimate_offers.ws">견적 제안 관리</a></li>
					<li><a href="./workshop_estimate_product.ws">견적 주문 관리</a></li>
				</ul>
			</li>
			<li class="main text-white">
				아카데미관리
				<ul>
					<li><a href="./workshop_academy_Management.ws">등록된 강의 관리</a></li>
					<li><a href="./workshop_academy_Membership.ws">회원 관리</a></li>
				</ul>
			</li>
		</ul>
	</nav>
</div>
<!-- /사이드바 -->