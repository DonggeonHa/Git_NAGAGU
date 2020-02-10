<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 사이드바 -->
<div id="sidebar-wrapper">
	<nav>
		<ul class="sidebar-nav">
			<li class="sidebar-brand" style="margin: 15px 0;">
				<a href="./index.ad">
					<img src="${pageContext.request.contextPath}/resources/images/Main/NAGAGU2.png">
				</a>
			</li>
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
					<li>게시글관리</li>
				</ul>
			</li>
			<li class="main text-white">
				아카데미관리
				<ul>
					<li>강의게시글관리</li>
				</ul>
			</li>
			<li class="main text-white">
				상품관리
				<ul>
					<li>상품게시글관리</li>
				</ul>
			</li>
			<li class="main text-white">
				견적관리
				<ul>
					<li>견적게시글관리</li>
				</ul>
			</li>
			<li class="main text-white">
				댓글관리
			</li>
		</ul>
	</nav>
</div>
<!-- /사이드바 -->