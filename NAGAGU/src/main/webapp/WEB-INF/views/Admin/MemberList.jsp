<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 본문 -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<h1 class="text-center">일반회원관리</h1>
		<br><br>
		<div class="input-group justify-content-end mb-3" style="width: 300px !important;">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default"><i class="fas fa-search"></i></span>
			</div>
			<input type="text" class="form-control" aria-describedby="inputGroup-sizing-default" placeholder="이름을 입력하세요" id="keyword">
		</div>
		
		<table class="table table-hover tableCSS" id="user-table"></table>
	</div>
</div>
<!-- /본문 -->

