<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import ="java.util.*" %>
<%@ page import ="com.spring.estimate.EstimateVO" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.text.DecimalFormat" %>
<%
	ArrayList<EstimateVO> eList = (ArrayList<EstimateVO>)request.getAttribute("eList");
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int rnum = ((Integer) request.getAttribute("rnum")).intValue();
	int estimateCount = ((Integer) request.getAttribute("estimateCount")).intValue();
	String ES_SEARCH = "";
	String ES_CATEGORY = "";
	
	if (request.getAttribute("ES_SEARCH") != null) {
		request.getAttribute("ES_SEARCH").toString();
	}
	if (request.getAttribute("ES_CATEGORY") != null) {
		request.getAttribute("ES_CATEGORY").toString();
	}
	
	String MEMBER_EMAIL = "";
	String MEMBER_NICK = "";
	if (session.getAttribute("MEMBER_EMAIL") != null) {
		MEMBER_EMAIL = session.getAttribute("MEMBER_EMAIL").toString();
		MEMBER_NICK = session.getAttribute("MEMBER_NICK").toString();
	}
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd HH:mm");
	DecimalFormat dfmp = new DecimalFormat("#,###원");
%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Store/estimatelist.css">
<!-- GOOGLE FONT -->
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua&display=swap&subset=korean" rel="stylesheet">
<style>
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
	
	dl.text-center {
		color: orange;
	}
	
	a.btn-outline-dark:hover {
		color: white !important;
	}

	.pagination .pageNum {
	  	color: black;
	  	float: left;
	 	padding: 8px 16px;
	}
	
	.pagination .pagelink {
		color:#6d6d6d;
	 	text-decoration: none;
	}
	
	.pagination .pagelink:hover {
	  	background-color: #ef902e;
	  	color:black;
	  	cursor:pointer;
	}	
	
	.pagination .currentpage {
		font-weight:700;
	}		
	
	.bid {
		background:#d3d3d3;
		color:#808080;
		user-select:none;
	}
</style>

<div class="text-center" style="padding: 3% 0 3% 0;">
	<h1>견적 문의시 이용가이드</h1>
</div>
<!-- content start -->
<div class="container category_cs">
	<div>
		<nav>
			<div class="nav d-flex justify-content-between shadow p-3 mb5 bg-white rounded" id="nav-tab" role="tablist">
		    	<a class="nav-item nav-link" id="nav-waiting-tab" data-toggle="tab" href="#nav-waiting" role="tab" aria-controls="nav-home" aria-selected="true">
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
			<div class="tab-pane fade shadow p-3 mb5 bg-white rounded" id="nav-waiting" role="tabpanel" aria-labelledby="nav-waiting-tab">
				<div>
					<p>1. 회원 로그인 하신 상태에서 글쓰기 버튼을 클릭합니다.</p>
					<p>2. 제공되는 양식에 맞게 글을 쓴 뒤 신청을 클릭하면 수제가구 의뢰글이 등록됩니다.</p>
				</div>
				<hr>
			</div>
			<div class="tab-pane fade shadow p-3 mb5 bg-white rounded" id="nav-finish" role="tabpanel" aria-labelledby="nav-finish-tab">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/Estimate/Bidding.jpg" width="100%" height="auto">
					<div class="d-flex justify-content-center">
						<p>공방들이 입찰을 해줄 떄 까지 기다립니다..</p>
					</div>
				</div>
				<hr>
			</div>
			<div class="tab-pane fade shadow p-3 mb5 bg-white rounded" id="nav-ready" role="tabpanel" aria-labelledby="nav-ready-tab">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/Estimate/Bid_confirmation.jpg" width="100%" height="auto">
					<div class="d-flex justify-content-center">
						<p>공방들이 입찰을 다 했을 경우 원하는 가격을 선택해 낙찰하기 버튼을 누릅니다.</p>
					</div>
				</div>
				<hr>
			</div>
			<div class="tab-pane fade shadow p-3 mb5 bg-white rounded" id="nav-shipping" role="tabpanel" aria-labelledby="nav-shipping-tab">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/Estimate/bid.jpg" width="100%" height="auto">
					<div class="d-flex justify-content-center">
						<p>원하는 공방으로 낙찰을 하고 해당 공방과 문의를 하여 상세하게 지정합니다.</p>
					</div>
				</div>
				<hr>
			</div>
			<div class="tab-pane fade shadow p-3 mb5 bg-white rounded" id="nav-completed" role="tabpanel" aria-labelledby="nav-completed-tab">
				<div>
					<div class="d-flex justify-content-start">
						<p>마이페이지 견적 주문 관리에서 결제를 완료하여 주문을 완료합니다. </p>
					</div>
				</div>
				<hr>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<br /> <br /> <br />
	<div class="row list_header">
	<%
		if (MEMBER_EMAIL != "") {
	%>
			
			<div class="col-10 justify-content-start">
				<a class="btn btn-outline-warning sm-2" onClick="location.href='./estimate.es?MEMBER_EMAIL=<%=MEMBER_EMAIL %>'" style="cursor: pointer;">내가 쓴 글</a>
			</div>
	
			<div class="col-2 justify-content-end">
				<a class="btn btn-outline-dark mb-2" onClick="location.href='./estimate_form.es'" style="cursor: pointer; float:right;">글쓰기</a>
			</div>
	<%
		}
	%>
	</div>
	<div class="row justify-content-center">

		<div class="table-responsive ">
			<table class="table table-hover ">

				<tr>
					<th width="55" style="text-align: center;">번호</th>
					<th width="60" style="text-align: center;">신청인</th>
					<th width="370" style="text-align: center;">제목</th>
					<th width="80" style="text-align: center;">카테고리</th>
					<th width="60" style="text-align: center;">평균 가격</th>
					<th width="55" style="text-align: center;">업체수</th>
					<th width="60" style="text-align: center;">신청 시간</th>
					<th width="60" style="text-align: center;">진행상황</th>
				</tr>
		<%
			if (eList.size() > 0 ) {
				for (int i=0; i<eList.size(); i++) {
					EstimateVO el = eList.get(i);

					String category = "";
					
					if (el.getESTIMATE_CATEGORY().equals("table")) { category = "책상"; }
					else if (el.getESTIMATE_CATEGORY().equals("chair")) {category = "의자";}
					else if (el.getESTIMATE_CATEGORY().equals("bookshelf")) {category = "책장";}
					else if (el.getESTIMATE_CATEGORY().equals("bed")) {category = "침대";}
					else if (el.getESTIMATE_CATEGORY().equals("drawer")) {category = "서랍장";}
					else if (el.getESTIMATE_CATEGORY().equals("sidetable")) {category = "협탁";}
					else if (el.getESTIMATE_CATEGORY().equals("dressing_table")) {category = "화장대";}
					else {category = "기타";}
					
					if (el.getESTIMATE_STATE() != 0 && !(MEMBER_EMAIL.equals(el.getESTIMATE_MEMBER()))) {
		%>
						<tr class="bid">
		<%
					} else {
		%>
						<tr onClick="location.href='./estimate_detail.es?ESTIMATE_NUM=<%=el.getESTIMATE_NUM()%>&page=<%=nowpage %>'" style="cursor: pointer;">
		<% 
					} 
		%>
					<td><%=rnum %></td>
					<td><%=el.getESTIMATE_NICK() %></td>
					<td class="es_title"><%=el.getESTIMATE_TITLE() %></td>
					<td><%=category %>
					<td class="addComma"><%=dfmp.format(el.getESTIMATE_AVG())%></td>
					<td><%=el.getESTIMATE_OFFERCOUNT()%></td>
					<td><%=df.format(el.getESTIMATE_DATE()) %></td>
					<td>
		<%
					if (el.getESTIMATE_STATE() == 0) {
		%>
						<p class="es_state_bid">진행중</p>
		<%
					} else if (el.getESTIMATE_STATE() == 1 || el.getESTIMATE_STATE() == 4) {
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

	<form id="search_form" action="estimate.es" method="post">
		<input type="hidden" name="page" value="<%=nowpage%>">
		<div class="d-flex justify-content-center">
			<div class="justify-content-start">
				<select id="category" name="category" class="h-100">
					<option value="title">제목</option>
					<option value="content">본문</option>
					<option value="nick">신청인</option>
					<option value="TandC">제목+본문</option>
				</select>
			</div> 
			<div class="justify-content-end">
				<input type="text" id="search_text" name="search_text" class="h-100"> 
				<input type="button" class="btn btn-outline-dark" name="search" value="검색" id="btn_search" style="cursor: pointer;">
			</div>
		</div>
	</form>
	<br />
	<!-- 버튼 -->

	<div id = "pagination" class="pagination justify-content-center" align="center">
	</div>
</div>
<!-- content 끝 -->

<script>
	var ES_CATEGORY = '<%=ES_CATEGORY%>';
	var ES_SEARCH = '<%=ES_SEARCH%>';
	
	$('#btn_search').click(function() {
		var category = $('#category').val();
		if (category == "") {
			alertify.alert('입력 오류', '카테고리를 선택해주십시오.');
			
			return false;
		}
		var search_text = $('#search_text').val();
		if (search_text == "") {
			alertify.alert('입력 오류', '검색어를 입력해주십시오.');
			$('#search_text').focus();
			
			return false;
		}
		
		$('#search_form').submit();
	});
	
	function addComma(inputNumber) {
		   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	$(document).ready(function() {
			
			/* 댓글 페이지네이션 */
			var pagination = "";
			var page = <%=nowpage%>;
			var max_page = <%=maxpage%>;
			
			if (page == max_page && page > 5) {
				pagination += '<div class="pageNum pagelink" value="' + Number(page-5) + '"><i class="fas fa-angle-double-left page_num"></i></div>';
				pagination += '<div class="pageNum pagelink" value="' + Number(page-4) + '">' + Number(page-4) + '</div>';
				pagination += '<div class="pageNum pagelink" value="' + Number(page-3) + '">' + Number(page-3) + '</div>';
			}
			else if (page == max_page-1 && page > 4) {
				pagination += '<div class="pageNum pagelink" value="' + Number(page-4) + '"><i class="fas fa-angle-double-left page_num"></i></div>';
				pagination += '<div class="pageNum pagelink" value="' + Number(page-3) + '">' + Number(page-3) + '</div>';
			}
			else {
				if (page > 3) {
					pagination += '<div class="pageNum pagelink" value="' + Number(page-3) + '"><i class="fas fa-angle-double-left page_num"></i></div>';
				}
			} 
			
			if (page > 2) {
				pagination += '<div class="pageNum pagelink" value="' + Number(page-2) + '">' + Number(page-2) + '</div>';
			}
			if (page > 1) {
				pagination += '<div class="pageNum pagelink" value="' + Number(page-1) + '">' + Number(page-1) + '</div>';
			}
				pagination += '<div class="pageNum currentpage">' + page + '</div>';
			if (max_page > page) {
				pagination += '<div class="pageNum pagelink" value="' + Number(page+1) + '">' + Number(page+1) + '</div>';
			}
			if (max_page > page+1) {
				pagination += '<div class="pageNum pagelink" value="' + Number(page+2) + '">' + Number(page+2) + '</div>';
			}
			
			if (page == 1 && max_page > 5) {
				pagination += '<div class="pageNum pagelink" value="' + Number(page+3) + '">' + Number(page+3) + '</div>';
				pagination += '<div class="pageNum pagelink" value="' + Number(page+4) + '">' + Number(page+4) + '</div>';
				pagination += '<div class="pageNum pagelink" value="' + Number(page+5) + '"><i class="fas fa-angle-double-right page_num"></i></div>';
			}
			else if (page == 2 && max_page > 6) {
				pagination += '<div class="pageNum pagelink" value="' + Number(page+3) + '">' + Number(page+3) + '</div>';
				pagination += '<div class="pageNum pagelink" value="' + Number(page+4) + '"><i class="fas fa-angle-double-right page_num"></i></div>';
			}
			else {
				if (max_page > page+2) {
					pagination += '<div class="pageNum pagelink" value="' + Number(page+3) + '"><i class="fas fa-angle-double-right page_num"></i></div>';
				}
			}
		
		$('#pagination').html(pagination);
	});
	
	/* 페이지 이동 */
	$(document).delegate('.pagelink', 'click', function(){
		var pageNum = $(this).attr("value");
		location.href = 'estimate.es?page=' + pageNum + '&category=' + ES_CATEGORY + '&search_text=' + ES_SEARCH;
	});
</script>