<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import ="java.util.*" %>
<%@ page import ="com.spring.estimate.EstimateVO" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%
	System.out.println("---------------------------------------");
	ArrayList<EstimateVO> eList = (ArrayList<EstimateVO>)request.getAttribute("eList");
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
	int rnum = ((Integer) request.getAttribute("rnum")).intValue();
	int estimateCount = ((Integer) request.getAttribute("estimateCount")).intValue();
	int nowpage2 = (int)request.getAttribute("page");
	String MEMBER_EMAIL = (String)request.getAttribute("MEMBER_EMAIL");
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd hh:mm");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Store/estimatelist.css">
		<!-- GOOGLE FONT -->
		<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua&display=swap&subset=korean" rel="stylesheet">
		<style>
			@font-face {
				font-family: 'KOMACON';
				src:
					url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')
					format('woff');
				font-weight: normal;
				font-style: normal;
			}
			
			.table .es_state_bid {
				margin:0;
			}
			
			.table .es_state_successful {
				color:blue;
				margin:0;
			}
			
			.table .es_state_failure {
				color:grey;
				margin:0;
			}
			
			.table .es_state_cancel {
				color:red;
				margin:0;
			}
			
			.order-body {
				font-family: '만화진흥원체', 'KOMACON', KOMACON;
				font-size: 15px;
			}
			
			dl.text-center {
				color: orange;
			}
			
			a.btn-outline-dark:hover {
				color: white !important;
			}
		</style>
	</head>
	<body class="order-body">
		<div class="text-center" style="padding: 3% 0 3% 0;">
			<h1>견적 문의시 이용가이드</h1>
		</div>
		<!-- content start -->
		<div class="container">
			<div>
				<nav>
					<div class="nav d-flex justify-content-between shadow p-3 mb5 bg-white rounded" id="nav-tab" role="tablist">
				    	<a class="nav-item nav-link active" id="nav-waiting-tab" data-toggle="tab" href="#nav-waiting" role="tab" aria-controls="nav-home" aria-selected="true">
				    		<dl class="text-center">
				    			<dd></dd>
				    			<dt><h5>견적신청</h5></dt>
				    			<dd></dd>
				    		</dl>
				    	</a>
						<div class="text-center align-self-center">
							<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
						</div>
				    	<a class="nav-item nav-link" id="nav-finish-tab" data-toggle="tab" href="#nav-finish" role="tab" aria-controls="nav-profile" aria-selected="false">
				    		<dl class="text-center">
				    			<dd></dd>
				    			<dt><h5>공방입찰</h5></dt>
				    			<dd></dd>
				    		</dl>
				    	</a>
				    	<div class="text-center align-self-center">
							<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
						</div>
				    	<a class="nav-item nav-link" id="nav-ready-tab" data-toggle="tab" href="#nav-ready" role="tab" aria-controls="nav-contact" aria-selected="false">
				    		<dl class="text-center">
				    			<dd></dd>
				    			<dt><h5>입찰확인</h5></dt>
				    			<dd></dd>
				    		</dl>
				    	</a>
				    	<div class="text-center align-self-center">
							<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
						</div>
						<a class="nav-item nav-link" id="nav-shipping-tab" data-toggle="tab" href="#nav-shipping" role="tab" aria-controls="nav-contact" aria-selected="false">
							<dl class="text-center">
				    			<dd></dd>
				    			<dt><h5>낙찰</h5></dt>
				    			<dd></dd>
				    		</dl>
						</a>
						<div class="text-center align-self-center">
							<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
						</div>
						<a class="nav-item nav-link" id="nav-completed-tab" data-toggle="tab" href="#nav-completed" role="tab" aria-controls="nav-contact" aria-selected="false">
							<dl class="text-center">
				    			<dd></dd>
				    			<dt><h5>낙찰확정</h5></dt>
				    			<dd></dd>
				    		</dl>
						</a>
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active shadow p-3 mb5 bg-white rounded" id="nav-waiting" role="tabpanel" aria-labelledby="nav-waiting-tab" style="padding-top: 30%;">
						<hr>
						<div>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. Numquam consequatur alias sunt ad maxime provident est aut ea commodi 
							laboriosam assumenda hic blanditiis, voluptas nobis omnis quam. Corporis asperiores, id at consequatur possimus ipsum magni deserunt 
							autem sunt, alias labore consectetur iusto quo explicabo quidem omnis distinctio eius vitae optio, totam nobis delectus. Laborum laboriosam 
							expedita deleniti ad quod nostrum sed esse quo corporis veritatis facilis debitis mollitia obcaecati assumenda animi aut, provident commodi cum, 
							architecto possimus dicta explicabo asperiores vitae. Voluptates, consequatur, excepturi! Laboriosam qui at, pariatur distinctio consequuntur 
							tenetur eligendi molestiae, dolorum voluptatem. Eum totam nobis error quae.
						</div>
						<hr>
					</div>
					<div class="tab-pane fade shadow p-3 mb5 bg-white rounded" id="nav-finish" role="tabpanel" aria-labelledby="nav-finish-tab">
						<hr>
						<div>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit.mnis distinctio eius vitae optio, totam nobis delectus. Laborum laboriosam 
							expedita deleniti ad quod nostrum sed esse quo corporis veritatis facilis debitis mollitia obcaecati assumenda animi aut, provident commodi cum, 
							architecto possimus dicta explicabo asperiores vitae. Voluptates, consequatur, excepturi! Laboriosam qui at, pariatur distinctio consequuntur 
							tenetur eligendi molestiae, dolorum voluptatem. Eum totam nobis error quae.
						</div>
						<hr>
					</div>
					<div class="tab-pane fade shadow p-3 mb5 bg-white rounded" id="nav-ready" role="tabpanel" aria-labelledby="nav-ready-tab">
						<hr>
						<div>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. Numquam consequatur alias sunt ad maxime provident est aut ea commodi 
							laboriosam assumenda hic blanditiis, voluptas nobis omnis quam. Corporis asperiores, id at consequatur possimus ipsum magni deserunt 
							autem sunt, alias labore consectetur iusto quo explicabo quidem omnis distinctio eius vitae optio, totam nobis delectus. Laborum laboriosam 
							expedita deleniti ad quod nostrum sed esse quo corporis veritatis facilis debitis mollitia obcaecati assumenda animi aut, provident commodi cum, 
							architecto possimus dicta explicabo asperiores vitae. Voluptates, 
						</div>
						<hr>
					</div>
					<div class="tab-pane fade shadow p-3 mb5 bg-white rounded" id="nav-shipping" role="tabpanel" aria-labelledby="nav-shipping-tab">
						<hr>
						<div>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. Numquam consequatur alias sunt ad maxime provident est aut ea commodi 
							laboriosam assumenda hic blanditiis, voluptas nobis omnis quam. Corporis asperiores, id at consequatur possimus ipsum magni deserunt 
							autem sunt, alias labore consectetur iusto quo explicabo quidem omnis  
						</div>
						<hr>
					</div>
					<div class="tab-pane fade shadow p-3 mb5 bg-white rounded" id="nav-completed" role="tabpanel" aria-labelledby="nav-completed-tab">
						<hr>
						<div>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. Numquam consequatur alias sunt ad maxime provident est aut ea commodi 
							laboriosam assumenda hic blanditiis, voluptas nobis omnis quam. Corporis asperiores, id at consequatur possimus ipsum magni deserunt 
							autem sunt, alias labore consectetur iusto quo explicabo quidem omnis distinctio eius vitae optio, totam nobis delectus. Laborum laboriosam 
							expedita deleniti ad quod nostrum sed esse quo corporis veritatis facilis 
						</div>
						<hr>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<br /> <br /> <br />
			<%
				if (MEMBER_EMAIL != null) {
			%>
			
			<div class="row justify-content-end">
				<a class="btn btn-outline-dark mb-2" onClick="location.href='./estimate_form.es'" style="cursor: pointer;">글쓰기</a>
			</div>
			
			<%
				}
			%>
			<div class="row justify-content-center">
	
				<div class="table-responsive ">
					<table class="table table-hover ">
	
						<tr>
							<th width="55" style="text-align: center;">번호</th>
							<th width="60" style="text-align: center;">신청인</th>
							<th width="370" style="text-align: center;">제목</th>
							<th width="80" style="text-align: center;">카테고리</th>
							<th width="60" style="text-align: center;">최저가</th>
							<th width="55" style="text-align: center;">업체수</th>
							<th width="60" style="text-align: center;">신청 시간</th>
							<th width="60" style="text-align: center;">진행상황</th>
						</tr>
				<%
					if (estimateCount > 0 ) {
						System.out.println(eList.size());
						for (int i=0; i<eList.size(); i++) {
							EstimateVO el = eList.get(i);
							System.out.println(el.getESTIMATE_TITLE());
				%>
						<tr onClick="location.href='./estimate_detail.es?ESTIMATE_NUM=<%=el.getESTIMATE_NUM()%>&page=<%=nowpage %>'"
							style="cursor: pointer;">
							<td><%=rnum %></td>
							<td><%=el.getESTIMATE_NICK() %></td>
							<td class="es_title"><%=el.getESTIMATE_TITLE() %></td>
							<td><%=el.getESTIMATE_CATEGORY() %>
							<td></td>
							<td></td>
							<td><%=df.format(el.getESTIMATE_DATE()) %></td>
							<td>
				<%
							if (el.getESTIMATE_STATE() == 0) {
				%>
								<p class="es_state_bid">진행중</p>
				<%
							} else if (el.getESTIMATE_STATE() == 1) {
				%>
								<p class="es_state_successful">낙찰</p>
				<%
							} else if (el.getESTIMATE_STATE() == 2) {
				%>
								<p class="es_state_failure">유찰</p>
				<%
							} else {
				%>
								<p class="es_state_cancel">취소</p>
				<%
							}
				%>
							</td>
						</tr>
				<%
							rnum--;
						}
					} else {
				%>
					<tr>
						<td colspan="8">등록된 견적글이 없습니다.</td>
					</tr>
				<%
					}
				%>
					</table>
				</div>
				<br /> <br />
			</div>
			<!-- 글찾기 -->
	
			<form id="search_form" action="estimate_search.es" method="post">
			<div class="search" align="center">
				<select id="category" name="color" size="1">
					<option value="">선택</option>
					<option value="">-----------------</option>
					<option value="">제목</option>
					<option value="">본문</option>
					<option value="">별명</option>
					<option value="">제목+본문</option>
				</select> <input type="text" size="12" id="search_text" name="search"> <input
					type="button" name="search" value="검색" onClick="location.href='#'" id="btn_search"
					style="cursor: pointer;">
			</div>
			</form>
			<br />
			<!-- 버튼 -->
	
	
			<div class="pages" align="center">
				<a href="#"><span class="page">1</span></a> &nbsp;&nbsp;&nbsp; <a
					href="#"><span class="page">2</span></a> &nbsp;&nbsp;&nbsp; <a
					href="#"><span class="page">3</span></a> &nbsp;&nbsp;&nbsp; <a
					href="#"><span class="page">4</span></a> &nbsp;&nbsp;&nbsp; <a
					href="#"><span class="page">5</span></a> &nbsp;&nbsp;&nbsp;
			</div>
	
			<br />
		</div>
		<!-- content 끝 -->
	
		<br />
		<br />
		<br />
		<br />
		<!-- Optional JavaScript -->
		<script>
			$.('#btn_search').click(function() {
				var category = $('#category').value();
				if (category == "선택" || category == "-----------------") {
					alert('카테고리를 선택해주십시오.');
					
					return false;
				}
				var search_text = $('#search_text').value();
				if (search_text == "") {
					alert('검색어를 입력해주십시오.');
					$('#search_text').focus();
					
					return false;
				}
				
				$('#search_form').submit();
			});
		
		
		</script>
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>