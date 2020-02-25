<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 사이드바 -->
<div id="sidebar-wrapper">
	<nav>
		<ul class="sidebar-image">
			<li class="sidebar-brand" style="margin: 15px 0;">
				<a href="./Chart.ad">
					<img src="${pageContext.request.contextPath}/resources/images/Main/NAGAGU2.png">
				</a>
			</li>
			<li class="main text-white" style="padding-left: 20%; list-style: none;">
				<a href="./index.ma" id="index">메인페이지로&nbsp;&nbsp;<i class="fas fa-sign-out-alt"></i></a>
			</li>
		</ul>
		<ul class="sidebar-nav">
			<li class="main text-white">
				회원관리
				<ul>
					<li><a href="./MemberList.ad">일반회원관리</a></li>
					<li><a href="./WMemberList.ad">공방회원관리</a></li>
				</ul>
			</li>
			<li class="main text-white">
				커뮤니티관리
				<ul>
					<li><a href="./picsList.ad">게시글 관리</a></li>
					<li><a href="./picsCommentList.ad">댓글 관리</a></li>
				</ul>
			</li>
			<li class="main text-white">
				아카데미관리
				<ul>
					<li><a href="./academyList.ad">강의 관리</a></li>
					<li><a href="./academyReviewList.ad">강의리뷰 관리</a></li>
					<li><a href="./academyQnAList.ad">강의문의 관리</a></li>
				</ul>
			</li>
			<li class="main text-white">
				상품관리
				<ul>
					<li><a href="./productList.ad">판매중인 상품</a></li>
					<li><a href="./productReviewList.ad">상품리뷰 관리</a></li>
					<li><a href="./productQnAList.ad">상품문의 관리</a></li>
				</ul>
			</li>
			<li class="main text-white">
				견적관리
				<ul>
					<li><a href="./estimateList.ad">견적관리</a></li>
				</ul>
			</li>
		</ul>
	</nav>
</div>
<!-- /사이드바 -->