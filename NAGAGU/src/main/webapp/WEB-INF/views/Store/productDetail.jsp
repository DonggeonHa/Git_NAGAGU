<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@page import="com.spring.order.BasketVO"%>
<%@ page import="com.spring.store.ProductVO" %>
<%@ page import="com.spring.store.Product_reviewVO" %>
<%@ page import="com.spring.store.Product_qnaVO" %>
<%@ page import="com.spring.member.MemberVO" %>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%
	System.out.println("=========================================");
	System.out.println("=========================================");
	System.out.println("ProductDetail.jsp");
	
	//멤버가 댓글 작성시 필요
	String MEMBER_PICTURE = (String)session.getAttribute("MEMBER_PICTURE"); 
	String MEMBER_NICK = (String)session.getAttribute("MEMBER_NICK"); 
	Integer MEMBER_NUM = (Integer)session.getAttribute("MEMBER_NUM"); 

//	System.out.println("MEMBER_NUM="+MEMBER_NUM);
//	System.out.println("MEMBER_PICTURE="+MEMBER_PICTURE);
//	System.out.println("MEMBER_NICK="+MEMBER_NICK);

	//WORKSHOP이 댓글 달 때 필요
	String WORKSHOP_PICTURE = (String)session.getAttribute("WORKSHOP_PICTURE");
	String WORKSHOP_NAME = (String)session.getAttribute("WORKSHOP_NAME");

//	System.out.println("WORKSHOP_PICTURE="+WORKSHOP_PICTURE);
//	System.out.println("WORKSHOP_NAME="+WORKSHOP_NAME);	

	//로그인 상태 체크 위한
	Integer MEMBER_STATUS = 100;	//비로그인시 100
	if(MEMBER_NUM != null) {
		MEMBER_STATUS = (Integer)session.getAttribute("MEMBER_STATUS");		
	}
	Integer WORKSHOP_STATUS = 100;	//비로그인시 100
	if(WORKSHOP_NAME != null) {
		WORKSHOP_STATUS = (Integer)session.getAttribute("WORKSHOP_STATUS");		
	}

	//로그인 상태 체크 위한2
	String WORKSHOP_CEO_NAME = (String)session.getAttribute("WORKSHOP_CEO_NAME");
	String MEMBER_EMAIL = (String)session.getAttribute("MEMBER_EMAIL");
	
//	System.out.println("MEMBER_STATUS="+MEMBER_STATUS);
//	System.out.println("WORKSHOP_STATUS="+WORKSHOP_STATUS);
	
	//(QNA)글쓴이만 답글 버튼이 보인다. 글쓴이인지 체크하기 위해 이 글의 WORKSHOP_NUM 받아옴
	int WorkshopMatchingNumber = (int)request.getAttribute("WorkshopMatchingNumber");
	Integer WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");
	String WorkshopPic = (String)request.getAttribute("WorkshopPic");
//	System.out.println("WotkshopMatchingNumber="+WorkshopMatchingNumber);

	//상품상세 관련
	ProductVO vo = (ProductVO)request.getAttribute("productVO");
	String PRODUCT_CATEGORY = (String)request.getAttribute("PRODUCT_CATEGORY");
	int PRODUCT_NUM = ((Integer)request.getAttribute("PRODUCT_NUM")).intValue();
	String PRODUCT_COLOR = vo.getPRODUCT_COLOR();
	String PRODUCT_SIZE = vo.getPRODUCT_SIZE();
	int bannerImgCount = StringUtils.countOccurrencesOf(vo.getPRODUCT_BANNER(), ",");
	
	//품절일 경우 빨갛게 표시
	//1 판매중 2판매완료 0품절
	int PRODUCT_STATUS = vo.getPRODUCT_STATUS();

	//날짜 포맷 형식
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	BasketVO basketVO = new BasketVO();
	
	//상품 이미지 관련
	String images = vo.getPRODUCT_BANNER();
	String[] imgArr = images.split(",");
%>  

<style>
	@charset "UTF-8";
	
	img {
	   max-width: 100%;
	   height: auto;
	}
	
	table {
	   font-size: 0.98em;
	}
	
	.nav_tab {
	   background-color: #FEE100;
	}
	
	/*안 먹힘*/
	@media screen and (max-width: 375px) { 
	   .nav-item {
	      font-size:0.5em !important;
	   }
	   
	}
	
	.name {
	   font-weight: bold;
	}
	
	.smallfont {
	   font-size: 0.7em;
	}
	
	a {
	   color: gray;
	   text-decoration: none;
	}
	
	.row_ship_info {
	   padding:3px;
	}      
	
	.Precautions dl dd {
	   font-size: 0.7rem;
	}
	
	#subject {
	   font-size: 1.0rem;
	}
	
	.class-detail-container {
	   margin-top: 100px;
	   margin-bottom: 100px;
	}
	
	.hr-class {
	   width: 100%;
	   color: #f6f6f6;
	   margin-top: 100px;
	   margin-bottom: 100px;
	}
	
	.sticky {
	   padding-top: 5%;
	   z-index:2;
	   position: -webkit-sticky;
	   position: sticky;
	   background-color: #FFFFFF;
	   top: 0;
	}
	
	.sticky2 {
	   z-index:2;
	   position: -webkit-sticky;
	   position: sticky;
	   background-color: #FFFFFF;
	   top: 20px;
	}
	
	.nav-item .nav-link {
	   color: #9d9d9d;
	}
	
	.comments_table {
	   font-size: 1rem;
	}
	
	@media ( max-width : 700px) {
	   .comments_table {
	      font-size: 0.7rem;
	   }
	}
	
	div.col-2 img {
	   width: 100%;
	   height: 100%;
	}
	

	hr {
	   background-color: #EF902E;
	}
	
	/*별점주기*/
	.star-rating { 
		width:52px; 
	}
	.star-rating,.star-rating span { 
		display:inline-block; height:10px; overflow:hidden; background:url('${pageContext.request.contextPath}/resources/images/star_2.png') no-repeat; 
	}
	.star-rating span{ 
		background-position:left bottom; line-height:0; vertical-align:top; 
	}   		
	
	/*리뷰 이미지 호버*/   
	.img {
		width:100px;
	}
	.review_img_modify {
		width:100px;
		height:100px;         
	}      
	.addlike {
		background-color:#23272B !important;
		color:white !important; 
	}
	.row h6{
		margin-left:30px; 
	}
	.row h6 a,.row h6 a:link,.row h6 a:hover{
		text-decoration: none !important;
		color: black !important;
	}		
	/*input type=file css*/
	.file_input label {
		position:relative;
		cursor:pointer;
		display:inline-block;
		vertical-align:middle;
		overflow:hidden;
		width:80px;
		height:30px;
		background:RGBA(204, 204, 204, 0.5);
		color:black;
		text-align:center;
		line-height:30px;
		margin-bottom:0;
		font-size:0.8rem;
		padding:1px 1px;
		border-radius:3px;
	}
	.file_input label input {
		position:absolute;
		width:0;
		height:0;
		overflow:hidden;
	}
	.file_input input[type=text] {
		vertical-align:middle;
		display:inline-block;
		width:400px;
		height:28px;
		line-height:28px;
		font-size:11px;
		padding:0;
		border:0;
	}

	/*댓글 폼 영역*/
	#ReviewformSection {
		display:none ;
		padding:8px 0; 
		border-bottom:1px solid gray;		
	}
	/*ReviewAndReplySum : 리뷰(하나)+리뷰 답글(여러개)이 묶여서 반복되는 영역 - bottom에 회색 구분선*/
	.ReviewAndReplySum {
		border-bottom:1px solid RGBA(128, 128, 128, 0.5);	
		padding-bottom:8px;	
	}

	
	.imgs_wrap {
		display:none;
	}

	.review_img {
		width:100px;
		height:100px;
	}

	.replytext {	
		font-size:0.7em; font-weight:bold;	/*답글 버튼*/
	}
	
	.ReviewList {
		padding-top:8px; 
		padding-bottom:8px;
	}		
	
	

	/*REVIEW*/
	#REVIEW_GRADE{
		width=15px;			/*리뷰 입력폼에서 별점 선택창*/
	}
	.insertReview {
		cursor: pointer;	/*리뷰 입력폼에서 작성버튼*/
	}
	.formCancel {
		cursor: pointer;	/*Review, ReviewReply 입력취소, 수정 취소버튼*/
	}		
	

	/*REVIEW_REPLY*/

	.review_replybtn {
		cursor: pointer;	/*리뷰 리스트에서 답글달기 폼 버튼*/
	}
	.gomodifyReviewform {
		cursor: pointer;	/*리뷰 수정버튼*/
	}
	.deleteReview {
		cursor: pointer;	/*Review, ReviewReply 삭제*/
	}		
	
	
	.ReviewbeforeControl {
		font-size:0.7em; 
		font-weight:bold;
	}
	.ReviewafterControl {
		display:none;	
		font-size:0.7em; 
		font-weight:bold;	
	}

	
	.ReviewReplyformSection {
		padding:8px 0;		/*?*/
	}
	.afterModifyReviewReply {
		display:none;		/*리뷰 답글 작성폼*/	
	}
			
	.insertReviewReply {
		cursor: pointer;	/*리뷰답글 작성*/
	}
	.gomodifyReviewReplyform {
		cursor: pointer;	/*ReviewReply 수정폼 버튼*/
	}

	.modifyReviewReply {
		cursor: pointer;	/*ReviewReply 수정버튼*/
	}

	/* 상품 이미지 관련*/
	.thumbMain {
		width: 510px;
		height: 510px;
		overflow: hidden;
		display: block;
		margin-right: 10px;
	}
	
	.thumbMain img {
		display: block;
		min-height: 100%;
		min-width: 100%;
		-ms-interpolation-mode: bicubic;
	}
	
	.thumbItem {
		width: 95px;
		height: 95px;
		overflow: hidden;
		display: block;
		margin: 6px;
	}
	
	.thumbCheck {
		border: 2px solid #ef902e;
		border-radius: 4px;
	}
	
	.thumbItem img {
		display: block;
		min-height: 100%;
		min-width: 100%;
		-ms-interpolation-mode: bicubic;
		transition: transform 0.2s;
	}
	
	.thumbItem img:hover {
		transform: scale(1.05);
		cursor: pointer;
	}

/*qna*/
	#QnaformSection {
		display:none ;
		padding:8px 0; 
		border-bottom:1px solid gray;		
	}
	/*QnaAndReplySum : 리뷰(하나)+리뷰 답글(여러개)이 묶여서 반복되는 영역 - bottom에 회색 구분선*/
	.QnaAndReplySum {
		border-bottom:1px solid RGBA(128, 128, 128, 0.5);	
		padding-bottom:8px;	
	}		
	.QnaList {
		padding-top:8px; 
		padding-bottom:8px;
	}	
	.insertQna {
		cursor: pointer;	/*리뷰 입력폼에서 작성버튼*/
	}	
	.qna_replybtn {
		cursor: pointer;	/*리뷰 리스트에서 답글달기 폼 버튼*/
	}
	.gomodifyQnaform {
		cursor: pointer;	/*리뷰 수정버튼*/
	}
	.deleteQna {
		cursor: pointer;	/*Qna, QnaReply 삭제*/
	}			
	.QnaReplyformSection {
		padding:8px 0;		/*?*/
	}
	.afterModifyQnaReply {
		display:none;		/*리뷰 답글 작성폼*/	
	}
	.insertQnaReply {
		cursor: pointer;	/*리뷰답글 작성*/
	}
	.gomodifyQnaReplyform {
		cursor: pointer;	/*QnaReply 수정폼 버튼*/
	}	
	.modifyQnaReply {
		cursor: pointer;	/*QnaReply 수정버튼*/
	}	
	.QnabeforeControl {
		font-size:0.7em; 
		font-weight:bold;
	}
	.QnaafterControl {
		display:none;	
		font-size:0.7em; 
		font-weight:bold;	
	}		
	.page-link {
		color: black !important;
	}
	
	.nav-item .active {
		color : white !important;
		background-color : #1B1B27 !important;
	}
	
	li.nav-item a.nav-link {
		color: black; 
	}
</style>

<div class="container class-detail-container category_st">
	<div class="row justify-content-between title">
		<h6>
			<a href="productlist.pro?PRODUCT_CATEGORY=all">STORE</a> > 상세보기
		</h6>
	</div>
	<div class="row" style="padding-bottom: 5%;">
		<div class="col-7">
			<div class="row justify-content-center pt-4">
				<div class="thumbList">
					<%
						for (int i = 0; i < imgArr.length; i++) {
					%>
							<div class="thumbItem<% if (i == 0) { %> thumbCheck <% } %>" thumb-idx="<%=i%>">
								<img src=<%=imgArr[i]%>>
							</div>
					<%
						}
					%>
				</div>
				<div class="thumbMain">
					<a href=<%=imgArr[0]%> target="_blank">
						<img src=<%=imgArr[0]%>>
					</a>
				</div>
			</div>
		</div>
		<div class="col-5">
			<form name="goodsform" action="#" method="post" id="goodsform" class="goodsform">
				<div class="row pt-4 pl-4">
					<div class="col-3">
						<img src="<%=WorkshopPic %>" width="95%">
					</div>
					<hr>
					<div class="col-9">
						<h3 name="PRODUCT_SHOPNAME"><%=vo.getPRODUCT_SHOPNAME()%></h3>
						<p name="PRODUCT_TITLE">
							<font size="2"><%=vo.getPRODUCT_BRIEF()%></font>
						</p>
					</div>
				</div>
				<div>
					<table class="table table-borderless">
						<thead>
							<tr>
								<th scope="col">가격</th>
								<th scope="col" class="PRODUCT_PRICE" value="<%=vo.getPRODUCT_PRICE()%>" name="PRODUCT_PRICE"><%=vo.getPRODUCT_PRICE()%>원</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">배송비</th>
								<td class="PRODUCT_SHIP_PRICE" value="<%=vo.getPRODUCT_SHIP_PRICE()%>" name="PRODUCT_SHIP_PRICE"><%=vo.getPRODUCT_SHIP_PRICE()%></td>
							</tr>
							<tr>
								<th scope="row">배송 기간</th>
								<td name="PRODUCT_SHIP_DAYS"><%=vo.getPRODUCT_SHIP_DAYS()%>일</td>
							</tr>
							<tr>
								<th scope="row">색상선택</th>
								<td><select name="BASKET_COLOR" size="1"
									class="pauseSale form-control BASKET_COLOR">
										<option value="">선택</option>
										<c:forTokens var="color" items="<%=PRODUCT_COLOR %>" delims=",">
											<option value="${fn:trim(color)}">${fn:trim(color)}</option>
										</c:forTokens>
								</select></td>
							</tr>
							<tr>
								<th scope="row">사이즈선택</th>
								<td><select name="BASKET_SIZE" size="1"
									class="form-control BASKET_SIZE">
										<option value="">선택</option>
										<c:forTokens var="size" items="<%=PRODUCT_SIZE %>" delims=",">
											<option value="${fn:trim(size)}">${fn:trim(size)}</option>
										</c:forTokens>
								</select></td>
							</tr>
							<tr>
								<th scope="row">수량</th>
								<td>
									<div>
										<select name="BASKET_AMOUNT" size="1" class="form-control BASKET_AMOUNT">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">총 합계금액</th>
								<td class="total">12</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="d-flex justify-content-between">
										<% 
											if(WORKSHOP_CEO_NAME == null && MEMBER_EMAIL == null) { 
										%>
												<%-- 비로그인일 때 --%>
												<div>
													<button type="button" class="btn btn-outline-dark btn-lg" data-toggle="modal" data-target="#exampleModalCenter">
														<input type="hidden" name="PRODUCT_NUM"	value="<%=PRODUCT_NUM %>">♥
													</button>
												</div>
												<div style="width: 45%;">
													<button type="button"
														class="pauseSale btn btn-outline-dark btn-lg btn-block"
														data-toggle="modal" data-target="#exampleModalCenter">장바구니</button>
												</div>
												<div style="width: 45%;">
													<button type="button"
														class="pauseSale btn btn-outline-dark btn-lg btn-block"
														data-toggle="modal" data-target="#exampleModalCenter">바로구매</button>
												</div>
										<% 
											} else if(WORKSHOP_CEO_NAME != null) { 
										%>
												<%-- 공방 로그인일 때(하트 안 보임) --%>
												<div style="width: 50%;">
													<a href="classreservation.ac"
														class="btn btn-outline-dark btn-lg btn-block disabled"
														role="button" aria-pressed="true">장바구니</a>
												</div>
												<div style="width: 50%;">
													<a href="#"
														class="btn btn-outline-dark btn-lg btn-block disabled"
														role="button" aria-pressed="true">바로구매</a>
												</div>
										<% 
											} else { 
										%>
												<%-- 일반회원일때 --%>
												<div>
													<a href="#" class="btn btn-outline-dark btn-lg LikeAjax" role="button" aria-pressed="true"> 
														<input type="hidden" name="PRODUCT_NUM" value="<%=PRODUCT_NUM %>">♥
													</a>
												</div>
												<div style="width: 45%;">
													<a href="#" class="pauseSale btn btn-outline-dark btn-lg btn-block basket_btn" role="button" aria-pressed="true" id="basket_btn">장바구니</a>
												</div>
												<div style="width: 45%;">
													<a href="#" class="pauseSale btn btn-outline-dark btn-lg btn-block order_btn"	role="button" aria-pressed="true" id="order_btn">바로구매</a>
												</div>
										<% 
												} 
										%>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btnArea text-center"></div>
				<br />
			</form>
		</div>
	</div>
	<div class="d-flex justify-content-between" style="padding: 15px 0;">
		<div class="col-8">
			<div style="line-height: 0.5em;">
				<dl>
					<dt><h3><%=vo.getPRODUCT_TITLE() %></h3><br></dt>
					<dl><h5><%=vo.getPRODUCT_BRIEF() %></h5></dl>
				</dl>
			</div>
			<div class="sticky">
					<ul class="nav nav-tabs nav-fill d-flex justify-content-between" style="z-index: 10;">
					   <li class="nav-item">
					      <a class="nav-link" href="#t1"><h5 style="margin-top: .5rem;">상품정보</h5></a>
					   </li>
					   <li class="nav-item">
					      <a class="nav-link" href="#t4"><h5 style="margin-top: .5rem;">배송/환불</h5></a>
					   </li>
					   <li class="nav-item">
					      <a class="nav-link" href="#t2"><h5 style="margin-top: .5rem;">리뷰</h5></a>
					   </li>
					   <li class="nav-item">
					      <a class="nav-link" href="#t3"><h5 style="margin-top: .5rem;">Q&A</h5></a>
					   </li>
					</ul>
			</div>
			<div>
				<div id="t1">
				<% 
					if (vo.getPRODUCT_INFO() != null) { 
				%>
						<dl >
							<dd><%=vo.getPRODUCT_INFO() %></dd>
							<br /><br />
						</dl>
				<% 
					} else { 
				%>
						<!-- vo.getPRODUCT_INFO() = 없는 경우-->
						<table width="50%" border="0" cellpadding="0" cellspacing="0" align="center" valign="middle">
							<tr align="center" valign="middle">
								<td align="right"><font size=2>상세 정보가 없습니다.</font></td>
							</tr>
						</table>
				<% 
					} 
				%>
				</div>
				<!-- 상세 사진정보 끝 -->
	      
	            <!-- 배송 및 환불 시작 -->
	      
	            <h3 id="t4">배송 및 환불</h3>
	            <br /><br />
				<div class="ship_info" style="width: 100%; margin: 0 auto; font-size: 0.9em; color: #212529;">
					<div class="row_ship_info">
				    	<h5>배송정보</h5>
						모든 제품은 메이킹퍼니처 직원이 직접 배송하며 배송비는 고객 부담입니다. 지역, 제품 수량 또는 설치 여부에 따라 주문 시
						배송비를 미리 안내해드립니다. 기본 배송비 외에 사다리차, 엘레베이터, 주차비 사용료 등 추가 비용이 발생 시 고객님
						부담입니다.
						<%=vo.getPRODUCT_SHIP_INFO() %>
					</div>
					<div class="row_ship_info">
						<h5>배송정보</h5>
						모든 제품은 메이킹퍼니처 직원이 직접 배송하며 배송비는 고객 부담입니다. 지역, 제품 수량 또는 설치 여부에 따라 주문 시
						배송비를 미리 안내해드립니다. 기본 배송비 외에 사다리차, 엘레베이터, 주차비 사용료 등 추가 비용이 발생 시 고객님
						부담입니다.
						반품 배송지 : <%=vo.getPRODUCT_SHIP_RETURN_PLACE() %>
					</div>
					<br />
					
					<div class="row_ship_info">
						<h5>A/S</h5>
						핸드메이드 제품으로 나뭇결, 무늬, 옹이의 형태나 파임, 칠과 색상이 다를 수 있고 약간의 흠집이나 찍힘(표면의 크랙 또는
						뜯김)이 있을 수 있으며, 100% 원목으로 기후변화에 따른 수축, 팽창으로 인한 휘어짐(상판), 갈라짐(마구리면)이
						발생할 수 있습니다. 이런 자연스러운 현상들은 교체 및 교환 대상이 아니며 무상 A/S 사유가 되지 않습니다. 구매 전 꼭
						참고해주시기 바랍니다.
						<%=vo.getPRODUCT_AS_INFO() %>
					</div>
					<br />
					
					<div class="row_ship_info">
						<h5>Wood Furniture</h5>
						원목가구의 수축 및 팽창은 원목만의 자연스러운 특징입니다.<br /> -지나치게 건조한 곳, 습한 곳은 피하세요. -가구의
						수평을 유지해주세요.(수평이 안 맞게 되면 가구가 뒤틀려버립니다.) -가구에 화학약품(신나, 메니큐어 등)이 닿지 않게
						해주세요. -평소에는 물걸레 청소하시면 됩니다. -뜨거운 냄비와 같은 고온의 뜨거운 물체에 직접 닿는 것은 피하시기
						바랍니다. -한 달에 1~2번 가구용 왁스로 닦아주세요. -원목가구는 수축기와 팽창기(계절의 변화)에 따라 갈라짐이나
						미세한 크랙이 발생할 수 있으며, 시간이 경과하면 원상회복이 될 수 있습니다. 이는 원목가구만의 자연스러운 현상이며 제품의
						하자가 아닙니다.
						<%=vo.getPRODUCT_STORE_INFO() %>
					</div>
					<br />
					
					<div class="row_ship_info">
						<h5>A/S규정[1년 무상]</h5>
						무상 A/S -보증기간 이내의 제품으로 정상적인 상태에서 제조상의 결함 제품 -원/부나내의 결함이 발생된 경우
						-메이킹퍼니처의 귀책 사유로 인한 결함 발생 제품
						<%=vo.getPRODUCT_RETURN_INFO() %>
					</div>
					<div class="row_ship_info">
						유상 A/S -고객의 취급 부주의 및 고의적 훼손 경우 -고객 임의 개조에 의한 파손의 경우나 타 업체에서 수리해 변경된 경우 -유상 서비스 요금은 [수리비+부품비+출장비+기타실 비용] 등이 포함됩니다.
					</div>
				</div>
			</div>
			
			<span id="t2"></span>
			<br /><br /><hr />
           
			<!-- 리뷰 테이블 시작 -->
			<div id="ReviewSection">
				<div id="ReviewButtonSection">	
					<div class="d-flex justify-content-between pb-3 pt-2">	
						<div class="justify-content-start">
							<h3 id="review_scroll"><strong>Review</strong></h3>
						</div>
						<div class="justify-content-end"> <!-- 리뷰 댓글달기 버튼 -->
							<%
								if(MEMBER_STATUS == 100 && WORKSHOP_STATUS == 100) {
							%>
									<button class="btn btn-dark btn-sm" data-toggle="modal" data-target="#exampleModalCenter">리뷰쓰기</button>
							<%
								} else {
							%>
									<button class="btn btn-dark btn-sm review_btn">리뷰쓰기</button>
							<%
								}
							%>
						</div>
					</div>
				</div>
				<div id="ReviewWrapSection" class="pb-1">
					<div id="ReviewformSection" class="pb-2">
						<form id="ReviewForm" name="REVIEW_CONTENT" enctype="multipart/form-data"> <!-- 리뷰 작성 폼 영역 : 하나 -->
							<input type="hidden" name="MEMBER_NUM" value="MEMBER_NUM">
							<input type="hidden" name="PRODUCT_NUM" value="<%=PRODUCT_NUM %>">
							<div class="row justify-content-center">
								<div class="col-1 justify-content-end">
									<img src="<%=MEMBER_PICTURE%>" alt="" class="rounded-circle">
								</div>
								<div class="col-11">
									<div class="row pb-1">
										<div class="col-2 justify-content-end name"><%=MEMBER_NICK%> </div>
										<div class="col-8 justify-content-center"></div>
										<div class="col-2 justify-content-center smallfont"></div>
									</div>
									<div class="row pb-1"> <!-- 평점 -->
										<div class="col-3 pr-0">
											<img src="${pageContext.request.contextPath}/resources/images/star1.png" alt="" width="15px" height="15px" >
											&nbsp;
											<select name="REVIEW_GRADE" id="REVIEW_GRADE" style="">
												<option value="0">0</option>
												<option value="0.5">0.5</option>
												<option value="1">1.0</option>
												<option value="1.5">1.5</option>
												<option value="2">2.0</option>
												<option value="2.5">2.5</option>
												<option value="3">3.0</option>
												<option value="3.5">3.5</option>
												<option value="4">4.0</option>
												<option value="4.5">4.5</option>
												<option value="5">5.0</option>
											</select>											
										</div>
										<div class="9"></div>
									</div>
									
									<div class="row pb-2"> <!-- 파일 -->
										<div class="col-12">
											<div class="file_input">
											    <label>
											       	 사진 업로드
											        <input type="file" multiple="multiple" name="REVIEW_FILE" id="input_imgs">
											    </label>
											    <input type="text" readonly="readonly" title="File Route" value="선택된 파일이 없습니다">
											</div>			
										</div>
									</div>
									<div class="row pb-2">
										<div class="col-12 imgs_wrap">
											<img id="inputimg">
										</div>
									</div>
									<div class="row pb-1">	<!-- 내용 textarea -->
										<div class="col-11 pr-0">
											<textarea rows="3" name="REVIEW_CONTENT" class="col-12 pl-0 pr-0" id=""></textarea>
										</div>	
									</div>
									<div class="row"> <!-- 수정, 삭제 -->
										<div class="col-2 justify-content-center"></div>
										<div class="col-8 justify-content-center"></div>
										<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;">
											<a class="insertReview">작성</a> &nbsp;
											<a class="formCancel" value="ReviewForm">취소</a>
										</div>
									</div>
								</div>
							</div>
						</form>		
					</div>
					<div id="ReviewtableSection" class="pb-2">
					</div>
				</div>
			</div>
			<!-- 리뷰 페이지네이션 -->
			<br/>
			<div class="d-flex justify-content-center">
				<nav aria-label="Page navigation example" class="review_paginated" id="review-page"></nav>
			</div>
			<br />
			<!-- 리뷰 페이지네이션 끝 -->

	
			<span id="t3"></span>
			<br /><br /><hr />
			
			<!-- Q&A 테이블 시작 -->
			<div id="QnaSection">
				<div id="QnaButtonSection">	
					<div class="d-flex justify-content-between pb-3 pt-2">	
						<div class="justify-content-start">
								<h3 id="qna_scroll"><strong>Q&A</strong></h3>
						</div>
						<div class="justify-content-end"> <!-- 리뷰 댓글달기 버튼 -->
							<%
								if(MEMBER_STATUS == 100 && WORKSHOP_STATUS == 100) {
							%>
									<button class="btn btn-dark btn-sm" data-toggle="modal" data-target="#exampleModalCenter">문의하기</button>
							<%
								} else {
							%>
									<button class="btn btn-dark btn-sm qna_btn">문의하기</button>
							<%
								}
							%>
						</div>
					</div>
				</div>
				<div id="QnaWrapSection" class="pb-1">
					<div id="QnaformSection" class="pb-2">
						<form id="QnaForm" name="QNA_CONTENT"> <!-- 리뷰 작성 폼 영역 : 하나 -->
							<input type="hidden" name="MEMBER_NUM" value="MEMBER_NUM">
							<input type="hidden" name="PRODUCT_NUM" value="<%=PRODUCT_NUM %>">
							<div class="row justify-content-center">
								<div class="col-1 justify-content-end">
									<img src="<%=MEMBER_PICTURE%>" alt="" class="rounded-circle">
								</div>
								<div class="col-11">
									<div class="row pb-1">
										<div class="col-2 justify-content-end name"><%=MEMBER_NICK%> </div>
										<div class="col-8 justify-content-center"></div>
										<div class="col-2 justify-content-center smallfont"></div>
									</div>
									<div class="row pb-1">	<!-- 내용 textarea -->
										<div class="col-11 pr-0">
											<textarea rows="3" name="QNA_CONTENT" class="col-12 pl-0 pr-0" 
												id=""></textarea>
										</div>	
									</div>
									<div class="row"> <!-- 수정, 삭제 -->
										<div class="col-2 justify-content-center"></div>
										<div class="col-8 justify-content-center"></div>
										<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;">
											<a class="insertQna">작성</a> &nbsp;
											<a class="formCancel" value="QnaForm">취소</a>
										</div>
									</div>
								</div>
							</div>
						</form>		
					</div>
					<div id="QnatableSection" class="pb-2">
					</div>
				</div>
			</div>
		
			<!-- Q&A pagenation -->
			<br/>
			<div class="d-flex justify-content-center">
				<nav aria-label="Page navigation example" class="qna_paginated" id="qna-page"></nav>
			</div>
			
			<!-- Q&A pagenation 끝 -->			

			<!-- Q&A 테이블 끝 -->
		</div>
		<div class="col-4">
        	<div class="sticky2" style="border: 1px solid #EAEAEA;">
            	<form name="goodsform" action="#" method="post" id="goodsform" class="goodsform">
                	<div>
                    	<table class="table table-borderless">
                        	<tbody>
	                            <tr>
									<th scope="row">색상선택</th>
									<td>
										<select name="BASKET_COLOR" size="1" class="form-control BASKET_COLOR">
											<option value="">선택</option>
											<c:forTokens var="color" items="<%=PRODUCT_COLOR %>" delims=",">
												<option value="${fn:trim(color)}">${fn:trim(color)}</option>
											</c:forTokens>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">사이즈선택</th>
									<td>
										<select name="BASKET_SIZE" size="1" class="form-control BASKET_SIZE">
											<option value="">선택</option>
											<c:forTokens var="size" items="<%=PRODUCT_SIZE %>" delims=",">
												<option value="${fn:trim(size)}">${fn:trim(size)}</option>
											</c:forTokens>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">수량</th>
									<td>
										<div>
											<select name="BASKET_AMOUNT" size="1" class="form-control BASKET_AMOUNT">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>
										</div>
									</td>
								</tr>
								<tr><td></td></tr>
								<tr><td></td></tr>
								<tr><td></td></tr>
								<tr><td></td></tr>
								<tr><td></td></tr>
								<tr><td></td></tr>
								<tr><td></td></tr>
								<tr><td></td></tr>
								<tr><td></td></tr>
								<tr><td></td></tr>
								<tr><td></td></tr>
							</tbody>
						</table>
                  	</div>
                  	<div>
                  		<table class="table table-borderless">
                  			<tbody>
                  				<tr>
									<th scope="row">총 합계금액</th>
									<td class="total"></td>
								</tr>
                  			</tbody>
                  		</table>
                  	</div>
					<div class="d-flex justify-content-between d-flex align-items-end">
						<% 
							if(WORKSHOP_CEO_NAME == null && MEMBER_EMAIL == null) { 
						%> <%-- 비로그인일 때 --%>
								<div>
									<button type="button" class="btn btn-outline-dark btn-lg" data-toggle="modal" data-target="#exampleModalCenter">
										<input type="hidden" name = "PRODUCT_NUM" value="<%=PRODUCT_NUM %>">♥
									</button>
								</div>	
								<div style="width:45%;">
									<button type="button" class="pauseSale btn btn-outline-dark btn-lg btn-block" data-toggle="modal" data-target="#exampleModalCenter" >장바구니</button>
								</div>
								<div style="width:45%;">
									<button type="button" class="pauseSale btn btn-outline-dark btn-lg btn-block" data-toggle="modal" data-target="#exampleModalCenter" >바로구매</button>
								</div>
						<% 
							} else if(WORKSHOP_CEO_NAME != null) { 
						%>	<%-- 공방 로그인일 때(하트 안 보임) --%>
								<div style="width:50%;">
									<a href="classreservation.ac" class="btn btn-outline-dark btn-lg btn-block disabled" role="button" aria-pressed="true">장바구니</a>
								</div>
								<div style="width:50%;">
									<a href="#" class="btn btn-outline-dark btn-lg btn-block disabled" role="button" aria-pressed="true" >바로구매</a>
								</div>
						<% 
							} else { 
						%> <%-- 일반회원일때 --%>
								<div>
									<a href="#" class="btn btn-outline-dark btn-lg LikeAjax" role="button" aria-pressed="true">
										<input type="hidden" name = "PRODUCT_NUM" value="<%=PRODUCT_NUM %>">♥
									</a>
								</div>
								<div style="width:45%;">
									<a href="#" class="pauseSale btn btn-outline-dark btn-lg btn-block basket_btn" role="button" aria-pressed="true" id="basket_btn">장바구니</a>
								</div>
								<div style="width:45%;">
									<a href="#" class="pauseSale btn btn-outline-dark btn-lg btn-block order_btn" role="button" aria-pressed="true" id="order_btn">바로구매</a>
								</div>
						<% 
							} 
						%>
					</div>
					<br/>
				</form>
			</div>
		</div>
	</div>
  	<br>
</div>
   <!-- content end -->
<script>
   	$('.basket_btn').on('click',function(){
   		if($('.BASKET_COLOR').val()==''){
   			alertify.alert('확인','색상을 선택해주세요') 
   			return
   		}
   		if($('.BASKET_SIZE').val()==''){
   			alertify.alert('확인','사이즈를 선택해주세요') 
   			return
   		}
   		insert_basket()
   	});
   	function insert_basket(item){
   		var params=$("#goodsform").serialize();
   		var list ='';
		$.ajax({
			  url: "/NAGAGU/insertBasket.my",
              type: "POST",
              data: params,
              async: false,
              dataType: "json",
              contentType:
  				'application/x-www-form-urlencoded; charset=utf-8',
              success: function (retVal) {
            	  console.log(params)
        		if(retVal.res=="OK"){
       				if(item=='order'){
       					list = retVal.getbasketList[0].BASKET_NUM
       					return
       				}
        			if(confirm('장바구니로 이동하시겠습니까?')){
        				location.href= './mypage_basket.my'
        			}else{
        				alertify.alert('확인',"장바구니에 담겼습니다")
        			}
        			return 
				}else{
					alertify.alert('확인',"update fail");
				}  
			 },
			error:function(){
				alertify.alert('확인',"ajax통신 실패!!");
			}
		})
		return list
   	}
   	$('.order_btn').on('click',function(){
		if(confirm('바로 구매 하시겠습니까??')){
			var bNum = insert_basket('order')
			var category='order'
			var arr = new Array();
				arr.push(bNum)
			var Data = { "arr": arr,"category":category}; 
			$.ajax({ 
				type: "post", 
				url: "/NAGAGU/updateCheck.my",
				dataType: "json", 
				data: Data, 
				success: function (data){
					var url = '/NAGAGU/mypage_order.my';
					location.href = url
				},
				error:function(){
					alertify.alert('확인',"ajax통신 실패!!");
				} 
			});		
		}	
   	})

    /*장바구니 수량 변경*/
	function count_change(temp) {
		var test = document.goodsform.BASKET_AMOUNT.value;
		if (temp == 0) {
			test++;
		} else if (temp == 1) {
			if (test > 1)
				test--;
		}
		document.goodsform.BASKET_AMOUNT.value = test;
	}
    function getPrice(){
    	var amount = $('.BASKET_AMOUNT').val();
    	var price = $('.PRODUCT_PRICE').attr('value')*1;
    	$('.PRODUCT_PRICE').text(price.toLocaleString()+'원');  
    	var shipPrice = $('.PRODUCT_SHIP_PRICE').attr('value')*1;
    	$('.PRODUCT_SHIP_PRICE').text(shipPrice.toLocaleString()+'원');
    	console.log(amount)
    	console.log(price)
    	console.log(shipPrice)
    	var total = (price*1+shipPrice*1)*amount*1
    	$('.total').text(total.toLocaleString()+'원');
    }
    getPrice();
	   	
	//장바구니 2개 밸류 일치시키기
	$('select[name=BASKET_COLOR]').on('change',function(){
		var value = $(this).val()
		$('.BASKET_COLOR').val(value)
	})
	$('select[name=BASKET_SIZE]').on('change',function(){
		var value = $(this).val()
		$('.BASKET_SIZE').val(value)
	})
	$('select[name=BASKET_AMOUNT]').on('change',function(){
		var value = $(this).val()
		$('.BASKET_AMOUNT').val(value)
		getPrice()
	})

      
	//좋아요 기능
	$(document).ready(function(){  
		//처음 로드되고 로그인 사용자가 누른글 하트는 검게 바꿔줌
		function heart_check(){
			var PRODUCT_NUM = <%=PRODUCT_NUM%>;
			if(<%=MEMBER_STATUS%> == 100){
				return;
			}
			$.ajax({
				url: "/NAGAGU/getProductLike.pro",
				type: "POST",
				data: { 'PRODUCT_NUM' : PRODUCT_NUM},
				datatype: 'json',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function (retVal) {
					if(retVal.status==0){
						$('.LikeAjax').removeClass('addlike');
					}else {
						$('.LikeAjax').addClass('addlike');
					}
				},
				error:function(){
					alertify.alert('확인',"heart_check ajax통신 실패!!");
				}
			})
		}
		heart_check()
         
		//좋아요 누르는 기능
		$(document).on("click",".LikeAjax",function getLike(){
			if(<%=MEMBER_STATUS%> == 100){
				alertify.alert('확인','로그인 해주세요!');
				return
			}
			var MEMBER_NUM = <%=MEMBER_NUM%>;
            var PRODUCT_NUM = $(this).children('input').val();
			$.ajax({
				url: "/NAGAGU/insertProLike.pro",
				type: "POST",
				data: { 'MEMBER_NUM' : MEMBER_NUM , 'PRODUCT_NUM' : PRODUCT_NUM},
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success: function (retVal) {
					if(retVal.cnt=='0') {
						$('.LikeAjax').addClass('addlike');                     
					} else {
						$('.LikeAjax').removeClass('addlike');
					}
				},
				error:function(){
					alertify.alert('확인',"LikeAjax ajax통신 실패!!");   
				}
			})
			event.preventDefault();
         });
	 });      
      

	//------------------------------------------- 상품 이미지 관련
	$(document).delegate('.thumbItem', 'click', function() {
		var idx = $(this).attr('thumb-idx');
		$('.thumbItem').removeClass('thumbCheck');
		$(this).addClass('thumbCheck');
		if (idx == 0) {
			$('.thumbMain').html('<a href="' + '<%=imgArr[0]%>' + '" target="_blank"><img src="' + '<%=imgArr[0]%>' + '"></a>');
		} <% if (imgArr.length > 1) { %> else if (idx == 1) {
			$('.thumbMain').html('<a href="' + '<%=imgArr[1]%>' + '" target="_blank"><img src="' + '<%=imgArr[1]%>' + '"></a>');
		} <% } if (imgArr.length > 2) { %> else if (idx == 2) {
			$('.thumbMain').html('<a href="' + '<%=imgArr[2]%>' + '" target="_blank"><img src="' + '<%=imgArr[2]%>' + '"></a>');
		} <% } if (imgArr.length > 3) { %> else if (idx == 3) {
			$('.thumbMain').html('<a href="' + '<%=imgArr[3]%>' + '" target="_blank"><img src="' + '<%=imgArr[3]%>' + '"></a>');
		} <% } if (imgArr.length > 4) { %> else if (idx == 4) {
			$('.thumbMain').html('<a href="' + '<%=imgArr[4]%>' + '" target="_blank"><img src="' + '<%=imgArr[4]%>' + '"></a>');
		} <% } %>
	});
	 
	
	$(document).ready(function() {
		function splitImg(REVIEW_FILE) {
			var reviewImgArray = REVIEW_FILE.split(',');
			return reviewImgArray;
		}    
		/*날짜 형식 변경*/
		function date_format(format) {
			var year = format.getFullYear();
			var month = format.getMonth() + 1;
			if(month<10) {
				month = '0' + month;
			}
			var date = format.getDate();
			if(date<10) {
				date = '0' + date;
			}
			return year + "-" + month + "-" + date + " " ;
		}		

		function getReviewList() {
			$('#remo').empty();
			$('#ReviewtableSection').empty();	//table 내부 내용을 제거(초기화)
			$.ajax({
				url:'/NAGAGU/getReviewList.pro',
				type:'POST',
				data : { 'PRODUCT_NUM' : <%=PRODUCT_NUM%> },
				dataType : "json", // 서버에서 보내줄 데이터 타입
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success:function(retVal) {
					var reviewCount = retVal.reviewCount;
					console.log(retVal.reviewList)
					console.log("retVal.reviewCount : "+retVal.reviewCount)
					console.log("retVal.reviewList : "+retVal.reviewList)
					console.log("retVal.review_RE_Count : "+retVal.review_RE_Count)
					console.log("retVal.review_RE_List : "+retVal.review_RE_List)

					if(retVal.reviewCount > 0) {
						for(var i=0; i<retVal.reviewList.length; i++) {	//reviewCount도 상관 없음
							var output='';
							var REVIEW_NUM = retVal.reviewList[i].REVIEW_NUM;
							var MEMBER_PICTURE = retVal.reviewList[i].MEMBER_PICTURE;
							var MEMBER_NICK = retVal.reviewList[i].MEMBER_NICK;
							var REVIEW_DATE = new Date(retVal.reviewList[i].REVIEW_DATE);
							var date = date_format(REVIEW_DATE);
							var REVIEW_GRADE = retVal.reviewList[i].REVIEW_GRADE;
							var rate = 20*retVal.reviewList[i].REVIEW_GRADE;
							var REVIEW_FILE = retVal.reviewList[i].REVIEW_FILE;
							var REVIEW_CONTENT = retVal.reviewList[i].REVIEW_CONTENT;

							output += '<div class="ReviewAndReplySum pt-2 pb-1" id="ReviewAndReplySum'+ REVIEW_NUM +'">';
								output += '<div class="ReviewSum" id="ReviewSum'+ REVIEW_NUM +'">';
									output += '<div class="ReviewList pb-3" id="ReviewList'+ REVIEW_NUM +'">';
										output += '<div class="beforeModifyReview" id="beforeModifyReview'+ REVIEW_NUM +'">';
											output += '<div class="row justify-content-center">';
												output += '<div class="col-1 justify-content-end"><img src="'+ MEMBER_PICTURE +'" alt="" class="rounded-circle"></div>';
												output += '<div class="col-11">';
													output += '<div class="row pb-1">';
														output += '<div class="col-2 justify-content-end name">'+ MEMBER_NICK +'</div>';
														output += '<div class="col-8 justify-content-center"></div>';
														output += '<div class="col-2 justify-content-center smallfont">'+ date +'</div>';
													output += '</div>';
													output += '<div class="row pb-2">';
														output += '<div class="col-12" style="font-size:0.7em; font-weight:bold;">'+REVIEW_GRADE+' &nbsp;';
															output += '<span class="star-rating">';
																output += '<span style ="width:'+rate+'%"></span>';
															output += '</span>';
														output += '</div>';
													output += '</div>';
													output += '<div class="row pb-2">';
														output += '<div class="col-12">';
														if(REVIEW_FILE == '#') {
															output += '<img src="#" class="review_img"  style="display:none;">   &nbsp;&nbsp;';            
														} else {
															var reviewImgArray = splitImg(REVIEW_FILE);
															for(var k=0;k<reviewImgArray.length;k++) {
																output += '<a href="/productupload/image/'+reviewImgArray[k]+'" target="_blank"><img src="/productupload/image/' + reviewImgArray[k] + '" class="review_img"></a>&nbsp;';                        
															}               
														}
														output += '</div>';
													output += '</div>';
													output += '<div class="row pb-2">';
														output += '<div class="col-11 pr-0">' + REVIEW_CONTENT + '</div>';
													output += '</div>';
													output += '<div class="row">';
														output += '<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold; cursor: pointer;">';
															output += '<a class="review_replybtn" id="review_replybtn' + REVIEW_NUM + '" value="' + REVIEW_NUM + '">답글</a>';
														output += '</div>';
														output += '<div class="col-8 justify-content-center"></div>';
														
							console.log("MEMBER_NICK = " + MEMBER_NICK)
							
													//작성 본인만 수정,삭제버튼 보인다
													if('<%=MEMBER_NICK%>' == MEMBER_NICK) {
														output += '<div class="col-2 ReviewbeforeControl justify-content-center" id="ReviewbeforeControl'+REVIEW_NUM+'" style="font-size:0.7em; font-weight:bold;">';
															output += '<input type="hidden" name="REVIEW_NUM" value="'+REVIEW_NUM+'">';
															output += '<a class="gomodifyReviewform">수정</a> &nbsp;';
															output += '<a class="deleteReview">삭제</a>';
														output += '</div>';
													}
													output += '</div>'; // <div class="row">
												output += '</div>'; // <div class="col-11">
											output += '</div>'; // <div class="row justify-content-center">
										output += '</div>'; // <div class="beforeModifyReview" id="beforeModifyReview'+REVIEW_NUM+'">
										output += '<div class="afterModifyReview" id="afterModifyReview'+REVIEW_NUM+'"></div>';
									output += '</div>'; // <div class="ReviewList pb-3" id="ReviewList'+REVIEW_NUM+'">
								output += '</div>'; // <div class="ReviewSum" id="ReviewSum'+REVIEW_NUM+'">
								output += '<div class="ReviewReplySum" id="ReviewReplySum'+REVIEW_NUM+'">';
									output += '<div class="ReviewReplyformSection" id="ReviewReplyformSection'+REVIEW_NUM+'"></div>';
						if(retVal.review_RE_Count > 0) {
							for(var j=0; j < retVal.review_RE_List.length; j++) {
								if(REVIEW_NUM == retVal.review_RE_List[j].REVIEW_RE) {
									var REPLY_NUM = retVal.review_RE_List[j].REVIEW_NUM;
									var REPLY_NICK = retVal.review_RE_List[j].MEMBER_NICK;
									var REPLY_PICTURE = retVal.review_RE_List[j].MEMBER_PICTURE;
									var REPLY_CONTENT = retVal.review_RE_List[j].REVIEW_CONTENT;
									var REPLY_DATE = new Date(retVal.review_RE_List[j].REVIEW_DATE);
									var replydate = date_format(REPLY_DATE);
									//리뷰 출력
									output += '<div class="ReviewReplyList pb-2" id="ReviewReplyList'+REPLY_NUM+'">';
										output += '<div class="row justify-content-center">';
											output += '<div class="col-1"></div>';
											output += '<div class="col-1"><img src="'+REPLY_PICTURE+'" alt="" class="rounded-circle"></div>';
											output += '<div class="col-10">';
												output += '<div class="row">';
													output += '<div class="col-2 justify-content-end name">'+REPLY_NICK+'</div>';
													output += '<div class="col-8 justify-content-center"></div>';
													output += '<div class="col-2 justify-content-center smallfont pl-1">'+replydate+'</div>';
												output += '</div>';
												output += '<div class="beforeModifyReviewReply" id="beforeModifyReviewReply'+REPLY_NUM+'">';
													output += '<div class="row">';
														output += '<div class="col-11 pr-0">'+ REPLY_CONTENT + '</div>';
													output += '</div>';
												output += '</div>';
												output += '<div class="afterModifyReviewReply" id="afterModifyReviewReply'+REPLY_NUM+'">';
													output += '<form class="modifyReviewReplyForm" id="modifyReviewFormReply'+REPLY_NUM+'">';	
														output += '<div class="row">';			
															output += '<div class="col-11 pr-0">';			
																output += '<input type="hidden" name="REVIEW_NUM" value="'+REPLY_NUM+'">';			
																output += '<textarea rows="2" name="REVIEW_CONTENT" id="REVIEW_CONTENT'+REPLY_NUM+'" class="col-12 pl-0 pr-0">'+REPLY_CONTENT+'</textarea>';			
															output += '</div>';
														output += '</div>';
													output += '</form>';
												output += '</div>';
												output += '<div class="row">';
													output += '<div class="col-2 replytext justify-content-center"></div>';
													output += '<div class="col-8 justify-content-center"></div>';
													
												//작성 본인만 수정,삭제버튼 보인다
												if('<%=MEMBER_NICK%>' == REPLY_NICK) {
												
													output += '<div class="col-2 ReviewbeforeControl justify-content-center pl-1" id="ReviewbeforeControl'+REPLY_NUM+'">';								
														output += '<input type="hidden" name="REVIEW_NUM" value="'+REPLY_NUM+'">';
														output += '<a class="gomodifyReviewReplyform">수정</a> &nbsp;';
														output += '<a class="deleteReview">삭제</a>';
													output += '</div>';
													output += '<div class="col-2 ReviewafterControl justify-content-center pl-1" id="ReviewafterControl'+REPLY_NUM+'">';
														output += '<input type="hidden" name="REVIEW_NUM" value="'+REPLY_NUM+'">';
														output += '<a class="modifyReviewReply">수정</a> &nbsp;';
														output += '<a class="formCancel" value="reviewReplyModify">취소</a>';
													output += '</div>';
												}
												output += '</div>'; // <div class="row">
											output += '</div>'; // <div class="col-10">
										output += '</div>'; // <div class="row justify-content-center">
									output += '</div>'; // <div class="ReviewReplyList pb-2" id="ReviewReplyList'+REPLY_NUM+'">
								}			
							}
						}
								output += '</div>'; // <div class="ReviewReplySum" id="ReviewReplySum'+REVIEW_NUM+'">
							output += '</div>'; // <div class="ReviewAndReplySum pt-2 pb-1" id="ReviewAndReplySum'+REVIEW_NUM+'">
							$('#ReviewtableSection').append(output);				
						}					
					} else {
						var output = '<div class="justify-content-center pt-3 pb-1" style="text-align:center;">등록된 댓글이 없습니다.</div>';
						$('#ReviewtableSection').append(output);	//이상한데...!?!?!?
					}
					review_page();
		          },
		          error:function() {
		        	  alertify.alert('확인',"getReviewList ajax통신 실패!!!");
		          }
	       });
		}
				
		// 만들어진 댓글에 페이지 처리
		function review_page() { 	
			$('#remo').empty();
			var reSortColors = function($table) {};
			$('nav.review_paginated').each(function() {
				var pagesu = 10;  //페이지 번호 갯수
		  		var currentPage = 0;
		  		var numPerPage = 5;  //목록의 수
		  		var $table = $('#ReviewtableSection');    
		  		var $user = $('#review-page');
		  
				//length로 원래 리스트의 전체길이구함
				var numRows = $table.find('.ReviewAndReplySum').length;
				//Math.ceil를 이용하여 반올림
				var numPages = Math.ceil(numRows / numPerPage);
				//리스트가 없으면 종료
				if (numPages==0) return;
				//pager라는 클래스의 div엘리먼트 작성
				var $pager = $('<ul id="remo" class="pager pagination"></ul>');
				
				var nowp = currentPage;
				var endp = nowp+10;
		  
				//페이지를 클릭하면 다시 셋팅
				$table.bind('repaginate', function() {
				//기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
		  
					$table.find('.ReviewAndReplySum').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
					$("#remo").html("");
		   
					if (numPages > 1) {     // 한페이지 이상이면
						if (currentPage < 5 && (numPages-currentPage) >= 5) {   // 현재 5p 이하이면
							nowp = 0;     // 1부터 
							endp = pagesu;    // 10까지
						} else {
							nowp = currentPage -5;  // 6넘어가면 2부터 찍고
							endp = nowp+pagesu;   // 10까지
							pi = 1;
						}
					 
						if (numPages < endp) {   // 10페이지가 안되면
							endp = numPages;   // 마지막페이지를 갯수 만큼
							nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
						}
						if (nowp < 1) {     // 시작이 음수 or 0 이면
							nowp = 0;     // 1페이지부터 시작
						}
					} else {       // 한페이지 이하이면
						nowp = 0;      // 한번만 페이징 생성
						endp = numPages;
					}
					// [처음]
					$('<li class="page-item" style="cursor: pointer"><span class="page-link">처음</span></li>').bind('click', {newPage: page},function(event) {
						currentPage = 0;   
						$table.trigger('repaginate');  
						$($(".page-item")[2]).addClass('active').siblings().removeClass('active');
					}).appendTo($pager).addClass('clickable');
					
			    	// [이전]
					$('<li class="page-item" style="cursor: pointer"><span class="page-link">이전</span></li>').bind('click', {newPage: page},function(event) {
						if(currentPage == 0) return; 
						currentPage = currentPage-1;
						$table.trigger('repaginate'); 
						$($(".page-item")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
					}).appendTo($pager).addClass('clickable');
			    	
			    	// [1,2,3,4,5,6,7,8]
					for (var page = nowp ; page < endp; page++) {
						$('<li class="page-item" style="cursor: pointer"></li>').html('<span class="page-link">' + (page + 1) + '</span>').bind('click', {newPage: page}, function(event) {
							currentPage = event.data['newPage'];
							$table.trigger('repaginate');
							$($(".page-item")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
						}).appendTo($pager).addClass('clickable');
					}
			    	
			    	// [다음]
					$('<li class="page-item" style="cursor: pointer"><span class="page-link">다음</span></li>').bind('click', {newPage: page},function(event) {
						if(currentPage == numPages-1) return;
						currentPage = currentPage+1;
						$table.trigger('repaginate'); 
						$($(".page-item")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
					}).appendTo($pager).addClass('clickable');
			    	
			    	// [끝]
					$('<li class="page-item" style="cursor: pointer"><span class="page-link">끝</span></li>').bind('click', {newPage: page},function(event) {
						currentPage = numPages-1;
						$table.trigger('repaginate');
						$($(".page-item")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
					}).appendTo($pager).addClass('clickable');
			     
			     	$($(".page-item")[2]).addClass('active');
		  		});
				
				$pager.insertAfter($pager).find('li.page-item:first').next().next().addClass('active');   
				$pager.appendTo($user);
				$table.trigger('repaginate');
			});
		}
	
		//Review 등록하기 버튼(insert) //원글
		$(document).on("click",".insertReview",function(event){
			$('#remo').remove();
			var formId = 'ReviewForm';
			var REVIEW_RE = 0;	//원글
			
			var form = new FormData(document.getElementById(formId));
		
			$.ajax({
				url : "/NAGAGU/insertReview.do", 
				data : form,
				dataType: 'json',
				processData : false,
				contentType : false,
				type : 'POST',				
				success:function(retVal) {
					if(retVal.insertres == "OK") {
		 				$("#ReviewformSection").css('display','none');	//댓글 등록 성공하면 form은 초기화
						$('#ReviewForm').each(function() {  
							this.reset();  
						});  
						$('.imgs_wrap').empty();
						$("#ReviewButtonSection").show();
						getReviewList();
					} else {
						alertify.alert('확인',"insert 실패!!!");
					}
					review_page();
				},
				error:function() {
					alertify.alert('확인',"ajax통신 실패!!!");
				}
			});
			event.preventDefault();		
		})


		//Review 등록하기 버튼(insert) //답글
		$(document).on("click",".insertReviewReply",function(event){
			$('#remo').remove();
			var REVIEW_NUM = $(this).prev().val();	//원글번호(review_re로 저장할 것)
			console.log("REVIEW_NUM : " + REVIEW_NUM)
			
			var formId = 'ReviewReplyform'+REVIEW_NUM;
			var form = new FormData(document.getElementById(formId));
			$.ajax({
				url : "/NAGAGU/insertReview.do", 
				data : form,
				dataType: 'json',
				processData : false,
				contentType : false,
				type : 'POST',				
				success:function(retVal) {
					if(retVal.insertres == "OK") {
						getReviewList();
					} else {
						alertify.alert('확인',"insert 실패!!!");
					}
					review_page();
				},
				error:function() {
					alertify.alert('확인',"ajax통신 실패!!!");
				}
			});
			event.preventDefault();			
		})
		
//Review 수정하기----------------------------------------------------------------------------------------------------	  		
			
		//review 수정 폼 (원글)
		$(document).on("click",".gomodifyReviewform",function(event){
			$('#remo').remove();
			var REVIEW_NUM = $(this).prev().val();
			console.log("REVIEW_NUM : " + REVIEW_NUM)
			
			$('#beforeModifyReview'+REVIEW_NUM).css('display', 'none');

			$.ajax({
				url : "/NAGAGU/gomodifyReviewform.do", 
				data : { 'REVIEW_NUM' : REVIEW_NUM },
				dataType: 'JSON',
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				type : 'POST',				
				success:function(retVal) {
					console.log(retVal)
					if(retVal.res == "OK") {
		 				var output='';
						var REVIEW_NUM = retVal.reviewVO.review_NUM;
						var REVIEW_DATE = new Date(retVal.reviewVO.review_DATE);
						var date = date_format(REVIEW_DATE);
						var REVIEW_GRADE = retVal.reviewVO.review_GRADE;
						var REVIEW_FILE = retVal.reviewVO.review_FILE;
						var REVIEW_CONTENT = retVal.reviewVO.review_CONTENT;		 
		 				var beforeimgcount = 0;	//수정폼 뿌렸을 때 기존 이미지 n개 표시하기 위해
						
		 				output += '<form class="modifyReviewForm" id="modifyReviewForm'+REVIEW_NUM+'">';
		 				output += '<div class="row justify-content-center">';
		 				output += '<div class="col-1 justify-content-end"><img src="<%=MEMBER_PICTURE%>" alt="" class="rounded-circle"></div>';
		 				output += '<div class="col-11">';
		 				output += '<div class="row pb-1">';
		 				output += '<div class="col-2 justify-content-end name"><%=MEMBER_NICK%></div>';
		 				output += '<div class="col-8 justify-content-center"></div>';
		 				output += '<div class="col-2 justify-content-center smallfont">'+date+'</div>';
		 				output += '</div>';
		 				output += '<div class="row pb-2">';
		 				output += '<div class="col-3 pr-0">';
		 				output += '<img src="${pageContext.request.contextPath}/resources/images/star1.png" alt="" width="15px" height="15px">&nbsp;';
		 				output += '<select name="REVIEW_GRADE" id="REVIEW_GRADE'+REVIEW_NUM+'"style="width=15px;">';
		 				output += '<option value="0">0</option><option value="0.5">0.5</option><option value="1">1.0</option><option value="1.5">1.5</option>';
		 				output += '<option value="2">2.0</option><option value="2.5">2.5</option><option value="3">3.0</option><option value="3.5">3.5</option>';
		 				output += '<option value="4">4.0</option><option value="4.5">4.5</option><option value="5">5.0</option></select></div>';
		 				output += '<div class="9"></div></div>';
		 				output += '<div class="row ">';
		 				output += '<div class="col-12 pb-2">';
						if(REVIEW_FILE == '#') {
							output += '<img src="#" class="review_img"  style="display:none;">   &nbsp;&nbsp;';            
						} else {
							output += '<div class="before_imgs_wrap">';
							reviewImgArray = splitImg(REVIEW_FILE);
							beforeimgcount = reviewImgArray.length;
							for(var k=0;k<reviewImgArray.length;k++) {
								output += '<a onclick="deleteBeforeImageAction('+k+')" id="beforeimg_id_'+k+'">';                        
								output += '<img src="/productupload/image/' + reviewImgArray[k] + '" class="review_img beforeimg" value="'+reviewImgArray[k]+'" title="Click to remove" width="100" height="100">&nbsp;';                        
								output += '</a>';
							}     
							output += '</div>';
							output += '<div class="modify_imgs_wrap">';
							output += '<img id="modify_inputimg" >';
							output += '</div>';
						}
						output += '</div>';
						output += '<div class="col-12 pb-2">';
		 				output += '<div class="file_input">';		
		 				output += '<label>추가 업로드<input type="file" multiple="multiple" name="REVIEW_FILE" id="modify_input_imgs"></label>';		
		 				output += '<input type="text" readonly="readonly" title="File Route" value="기존 파일'+beforeimgcount+'개">';		
		 				output += '</div></div></div>';		
		 				output += '<div class="row">';		
		 				output += '<div class="col-11 pr-0">';		
		 				output += '<textarea rows="3" name="REVIEW_CONTENT" id="REVIEW_CONTENT'+REVIEW_NUM+'" class="col-12 pl-0 pr-0">'+REVIEW_CONTENT+'</textarea>';		
		 				output += '</div></div>';	
		 				output += '<div class="row">';	
		 				output += '<div class="col-2 justify-content-center"></div>';	
		 				output += '<div class="col-8 justify-content-center"></div>';	
		 				output += '<div class="col-2 justify-content-center" id="ReviewafterControl" style="font-size:0.7em; font-weight:bold;">';	///응?
		 				output += '<input type="hidden" name="deleteImg" value="">';		
		 				output += '<input type="hidden" name="beforeImg" value="">';		
		 				output += '<input type="hidden" name="REVIEW_NUM" value="'+REVIEW_NUM+'">';	
		 				output += '<a class="modifyReview" style="cursor: pointer;">수정</a> &nbsp;';	
		 				output += '<a class="formCancel" value="reviewModify" style="cursor: pointer;">취소</a>';	
		 				output += '</div></div></div></div></form>';
		 				
		 				$('#afterModifyReview'+REVIEW_NUM).append(output);
		 				$("#REVIEW_GRADE"+REVIEW_NUM).val(+REVIEW_GRADE).prop("selected", true); //원래 평점을 set해줌
					} else {
						alertify.alert('확인',"수정폼 데이터 가져오기 실패!!!");
					}
					review_page();
				},
				error:function() {
					alertify.alert('확인',"ajax통신 실패!!!");
				}
			});
			event.preventDefault();		
		})		
		
		
		//review 수정 process (원글)
		$(document).on("click",".modifyReview",function(event){
			$('#remo').remove();
			var REVIEW_NUM = $(this).prev().val();
			console.log("REVIEW_NUM"+REVIEW_NUM)
			
			//deleteImg는 기존 이미지 중 삭제 원하는 사진
			//beforeImg는 기존 이미지 중 원하는 사진은 삭제하고 남은 사진들. 새로 추가한 사진과 함께 db에 다시 업로드할 것임
			var beforeImg = '';		//beforeImg는 
			for(var i=0;i<$('.beforeimg').length;i++) {
				var tmp = $('.beforeimg')[i];
				beforeImg += $(tmp).attr("value") + ',';
			}
			console.log("beforeImg : "+beforeImg)
			$("input[type=hidden][name=beforeImg]").val(beforeImg);

 			var formId = 'modifyReviewForm'+REVIEW_NUM;
 	 		var form = new FormData(document.getElementById(formId));
			$.ajax({
				url : "/NAGAGU/modifyReview.do", 
				data : form,
				dataType: 'json',
				processData : false,
				contentType : false,
				type : 'POST',				
				success:function(retVal) {
					if(retVal.res == "OK") {
						getReviewList();
					} else {
						alertify.alert('확인',"수정 실패!!!");
					}
					review_page();
				},
				error:function() {
					alertify.alert('확인',"ajax통신 실패!!!");
				}
			});
			event.preventDefault();				
		})		
		
		//review 수정 process (답글)
		$(document).on("click",".modifyReviewReply",function(event){
			$('#remo').remove();
			var REVIEW_NUM = $(this).prev().val();
			console.log("REVIEW_NUM"+REVIEW_NUM)


 			var formId = 'modifyReviewFormReply'+REVIEW_NUM;
			console.log("formId"+formId)
 	 		var form = new FormData(document.getElementById(formId));
 	 		
			$.ajax({
				url : "/NAGAGU/modifyReviewReply.do", 
				data : form,
				dataType: 'json',
				processData : false,
				contentType : false,
				type : 'POST',				
				success:function(retVal) {
					if(retVal.res == "OK") {
						getReviewList();
					} else {
						alertify.alert('확인',"수정 실패!!!");
					}
					review_page();
				},
				error:function() {
					alertify.alert('확인',"ajax통신 실패!!!");
				}
			});
			event.preventDefault();				
		})				
//Review 삭제하기----------------------------------------------------------------------------------------------------	  
		//원글, 답글 same
		$(document).on("click",".deleteReview",function(event){
			$('#remo').remove();
			var REVIEW_NUM = $(this).prev().prev().val();
			console.log("REVIEW_NUM : " + REVIEW_NUM)
			var delete_confirm = confirm("삭제하시겠습니까?");
			if(delete_confirm) {
				$.ajax({
					url : "/NAGAGU/deleteReview.do", 
					type:'GET',
					data : {'REVIEW_NUM':REVIEW_NUM},
					dataType : 'json', // 서버에서 보내줄 데이터 타입
					async: false,
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success:function(retVal) {
						if(retVal.res == "OK") {
							getReviewList();
						} else if(retVal.res == "Children"){
							alertify.alert('확인',"답글이 존재하는 댓글은 삭제할 수 없습니다.");
						} else {
							alertify.alert('확인',"삭제 실패!");
						}
						review_page();
					},
					error:function() {
						alertify.alert('확인',"ajax통신 실패!!!");
					}
				});
				event.preventDefault();					
			}
		})				
		
//QNA----------------------------------------------------------------------------------------------------	 		
//QNA----------------------------------------------------------------------------------------------------	 		
//QNA----------------------------------------------------------------------------------------------------	 		
		function getQnaList() {
			$('#remo2').empty();
			$('#QnatableSection').empty();	//table 내부 내용을 제거(초기화)
			$.ajax({
				url:'/NAGAGU/getQnaList.pro',
				type:'POST',
				data : { 'PRODUCT_NUM' : <%=PRODUCT_NUM%> },
				dataType : "json", // 서버에서 보내줄 데이터 타입
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success:function(retVal) {
					var reviewCount = retVal.qnaCount;
					console.log(retVal.qnaList)
					console.log("retVal.qnaCount : "+retVal.qnaCount)
					console.log("retVal.qnaList : "+retVal.qnaList)
					console.log("retVal.qna_RE_Count : "+retVal.qna_RE_Count)
					console.log("retVal.qna_RE_List : "+retVal.qna_RE_List)
					
					if(retVal.qnaCount > 0) {
						for(var i=0; i<retVal.qnaList.length; i++) {	//reviewCount도 상관 없음
							var output='';
							var QNA_NUM = retVal.qnaList[i].QNA_NUM;
							var MEMBER_PICTURE = retVal.qnaList[i].MEMBER_PICTURE;
							var MEMBER_NICK = retVal.qnaList[i].MEMBER_NICK;
							var QNA_DATE = new Date(retVal.qnaList[i].QNA_DATE);
							var date = date_format(QNA_DATE);
							var QNA_CONTENT = retVal.qnaList[i].QNA_CONTENT;

							output += '<div class="QnaAndReplySum pt-2 pb-1" id="QnaAndReplySum'+QNA_NUM+'">';
							
							if((<%=WORKSHOP_NUM%> == <%=WorkshopMatchingNumber%>) || ('<%=MEMBER_NICK%>' == MEMBER_NICK)) {
								output += '<div class="QnaSum" id="QnaSum'+QNA_NUM+'">';
								output += '<div class="QnaList pb-3" id="QnaList'+QNA_NUM+'">';
								output += '<div class="beforeModifyQna" id="beforeModifyQna'+QNA_NUM+'">';
								output += '<div class="row justify-content-center">';
								output += '<div class="col-1 justify-content-end"><img src="'+MEMBER_PICTURE+'" alt="" class="rounded-circle"></div>';
								output += '<div class="col-11">';
								output += '<div class="row pb-1">';
								output += '<div class="col-2 justify-content-end name">'+MEMBER_NICK+'</div>';
								output += '<div class="col-8 justify-content-center"></div>';
								output += '<div class="col-2 justify-content-center smallfont">'+date+'</div>';
								output += '</div>';
								output += '<div class="row pb-2">';
								output += '</div>';
								output += '<div class="row pb-2">';
								output += '<div class="col-11 pr-0">' + QNA_CONTENT + '</div></div>';
								output += '<div class="row">';
								output += '<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold; cursor: pointer;">';
								//답글 버튼은 작성한 공방만 보인다
								if(<%=WORKSHOP_NUM%> == <%=WorkshopMatchingNumber%>) {
									output += '<a class="qna_replybtn" id="qna_replybtn' + QNA_NUM + '" value="' + QNA_NUM + '">답글</a>';
								}
								output += '</div>';		
								output += '<div class="col-8 justify-content-center"></div>';
								console.log("MEMBER_NICK = " + MEMBER_NICK)
								//수정,삭제버튼은 작성 본인만 보인다
								if('<%=MEMBER_NICK%>' == MEMBER_NICK) {
									output += '<div class="col-2 QnabeforeControl justify-content-center" id="QnabeforeControl'+QNA_NUM+'" style="font-size:0.7em; font-weight:bold;">';
									output += '<input type="hidden" name="REVIEW_NUM" value="'+QNA_NUM+'">';
									output += '<a class="gomodifyQnaform">수정</a> &nbsp;';
									output += '<a class="deleteQna">삭제</a>';
									output += '</div>';
								}
								output += '</div></div></div></div>';
								output += '<div class="afterModifyQna" id="afterModifyQna'+QNA_NUM+'"></div>';
								output += '</div></div>';
								output += '<div class="QnaReplySum" id="QnaReplySum'+QNA_NUM+'">';
								output += '<div class="QnaReplyformSection" id="QnaReplyformSection'+QNA_NUM+'"></div>';
								
								if(retVal.qna_RE_Count>0) {
									for(var j=0; j<retVal.qna_RE_List.length; j++) {
										if(QNA_NUM == retVal.qna_RE_List[j].QNA_RE) {
											var REPLY_NUM = retVal.qna_RE_List[j].QNA_NUM;
											var WORKSHOP_PICTURE = retVal.qna_RE_List[j].WORKSHOP_PICTURE;
											var WORKSHOP_NAME = retVal.qna_RE_List[j].WORKSHOP_NAME;
											var REPLY_CONTENT = retVal.qna_RE_List[j].QNA_CONTENT;
											var REPLY_DATE = new Date(retVal.qna_RE_List[j].QNA_DATE);
											var replydate = date_format(REPLY_DATE);
	
											//리뷰 출력
											output += '<div class="QnaReplyList pb-2" id="QnaReplyList'+REPLY_NUM+'">';
											output += '<div class="row justify-content-center">';
											output += '<div class="col-1"></div>';
											output += '<div class="col-1"><img src="'+WORKSHOP_PICTURE+'" alt="" class="rounded-circle"></div>';
											output += '<div class="col-10">';
											output += '<div class="row">';
											output += '<div class="col-2 justify-content-end name">'+WORKSHOP_NAME+'</div>';
											output += '<div class="col-8 justify-content-center"></div>';
											output += '<div class="col-2 justify-content-center smallfont pl-1">'+replydate+'</div>';
											output += '</div>';
											output += '<div class="beforeModifyQnaReply" id="beforeModifyQnaReply'+REPLY_NUM+'">';
											output += '<div class="row">';
											output += '<div class="col-11 pr-0">'+REPLY_CONTENT;
											output += '</div></div></div>';
											output += '<div class="afterModifyQnaReply" id="afterModifyQnaReply'+REPLY_NUM+'">';
											output += '<form class="modifyQnaReplyForm" id="modifyQnaFormReply'+REPLY_NUM+'">';	
											output += '<div class="row">';			
											output += '<div class="col-11 pr-0">';			
											output += '<input type="hidden" name="QNA_NUM" value="'+REPLY_NUM+'">';			
											output += '<textarea rows="2" name="QNA_CONTENT" id="QNA_CONTENT'+REPLY_NUM+'" class="col-12 pl-0 pr-0">'+REPLY_CONTENT+'</textarea>';			
											output += '</div></div></form></div>';
											output += '<div class="row">';
											output += '<div class="col-2 replytext justify-content-center"></div>';
											output += '<div class="col-8 justify-content-center"></div>';
											
											//수정 삭제 버튼은 작성한 워크샵만 보인다
											if(<%=WORKSHOP_NUM%> == <%=WorkshopMatchingNumber%>) {
												output += '<div class="col-2 QnabeforeControl justify-content-center pl-1" id="QnabeforeControl'+REPLY_NUM+'">';								
												output += '<input type="hidden" name="QNA_NUM" value="'+REPLY_NUM+'">';
												output += '<a class="gomodifyQnaReplyform">수정</a> &nbsp;';
												output += '<a class="deleteQna">삭제</a>';
												output += '</div>';
												output += '<div class="col-2 QnaafterControl justify-content-center pl-1" id="QnaafterControl'+REPLY_NUM+'">';
												output += '<input type="hidden" name="QNA_NUM" value="'+REPLY_NUM+'">';
												output += '<a class="modifyQnaReply">수정</a> &nbsp;';
												output += '<a class="formCancel" value="qnaReplyModify">취소</a>';
												output += '</div>';
											}
											output += '</div></div></div></div>';
										}			
									}
								}
								output += '</div>';
							} else {
								output += '<div class="justify-content-center pt-1 pb-1 mt-3 mb-3 text-center">';
								output += '문의는 작성 회원만 열람 가능합니다.';
								output += '</div>';
							}
							output += '</div>';
							$('#QnatableSection').append(output);				
						}	//for 끝					
					} else {
						var output = '<div class="justify-content-center pt-3 pb-1" style="text-align:center;">등록된 문의가 없습니다.</div>';
						$('#QnatableSection').append(output);	
					}
					qna_page();
		          },
		          error:function() {
		        	  alertify.alert('확인',"getQnaList ajax통신 실패!!!");
		          }
	       });
		}		
		
		// 만들어진 QNA에 페이지 처리
		function qna_page() { 	
			$('#remo2').empty();
			var reSortColors = function($table) {};
			$('nav.qna_paginated').each(function() {
				var pagesu = 10;  //페이지 번호 갯수
		  		var currentPage = 0;
		  		var numPerPage = 5;  //목록의 수
		  		var $table = $('#QnatableSection');    
		  		var $user = $('#qna-page');
		  
				//length로 원래 리스트의 전체길이구함
				var numRows = $table.find('.QnaAndReplySum').length;
				//Math.ceil를 이용하여 반올림
				var numPages = Math.ceil(numRows / numPerPage);
				//리스트가 없으면 종료
				if (numPages==0) return;
				//pager라는 클래스의 div엘리먼트 작성
				var $pager = $('<ul id="remo2" class="pager pagination"></ul>');
				
				var nowp = currentPage;
				var endp = nowp+10;
		  
				//페이지를 클릭하면 다시 셋팅
				$table.bind('repaginate', function() {
				//기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
		  
					$table.find('.QnaAndReplySum').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
					$("#remo2").html("");
		   
					if (numPages > 1) {     // 한페이지 이상이면
						if (currentPage < 5 && (numPages-currentPage) >= 5) {   // 현재 5p 이하이면
							nowp = 0;     // 1부터 
							endp = pagesu;    // 10까지
						} else {
							nowp = currentPage -5;  // 6넘어가면 2부터 찍고
							endp = nowp+pagesu;   // 10까지
							pi = 1;
						}
					 
						if (numPages < endp) {   // 10페이지가 안되면
							endp = numPages;   // 마지막페이지를 갯수 만큼
							nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
						}
						if (nowp < 1) {     // 시작이 음수 or 0 이면
							nowp = 0;     // 1페이지부터 시작
						}
					} else {       // 한페이지 이하이면
						nowp = 0;      // 한번만 페이징 생성
						endp = numPages;
					}
					// [처음]
					$('<li class="page-item2" style="cursor: pointer"><span class="page-link">처음</span></li>').bind('click', {newPage: page},function(event) {
						currentPage = 0;   
						$table.trigger('repaginate');  
						$($(".page-item2")[2]).addClass('active').siblings().removeClass('active');
					}).appendTo($pager).addClass('clickable');
					
			    	// [이전]
					$('<li class="page-item2" style="cursor: pointer"><span class="page-link">이전</span></li>').bind('click', {newPage: page},function(event) {
						if(currentPage == 0) return; 
						currentPage = currentPage-1;
						$table.trigger('repaginate'); 
						$($(".page-item2")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
					}).appendTo($pager).addClass('clickable');
			    	
			    	// [1,2,3,4,5,6,7,8]
					for (var page = nowp ; page < endp; page++) {
						$('<li class="page-item2" style="cursor: pointer"></li>').html('<span class="page-link">' + (page + 1) + '</span>').bind('click', {newPage: page}, function(event) {
							currentPage = event.data['newPage'];
							$table.trigger('repaginate');
							$($(".page-item2")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
						}).appendTo($pager).addClass('clickable');
					}
			    	
			    	// [다음]
					$('<li class="page-item2" style="cursor: pointer"><span class="page-link">다음</span></li>').bind('click', {newPage: page},function(event) {
						if(currentPage == numPages-1) return;
						currentPage = currentPage+1;
						$table.trigger('repaginate'); 
						$($(".page-item2")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
					}).appendTo($pager).addClass('clickable');
			    	
			    	// [끝]
					$('<li class="page-item2" style="cursor: pointer"><span class="page-link">끝</span></li>').bind('click', {newPage: page},function(event) {
						currentPage = numPages-1;
						$table.trigger('repaginate');
						$($(".page-item2")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
					}).appendTo($pager).addClass('clickable');
			     
			     	$($(".page-item2")[2]).addClass('active');
		  		});
				
				$pager.insertAfter($pager).find('li.page-item2:first').next().next().addClass('active');   
				$pager.appendTo($user);
				$table.trigger('repaginate');
			});
		}
		
		
		//Qna 등록하기 버튼(insert) //원글
		$(document).on("click",".insertQna",function(event){
			$('#remo2').remove();
			var formId = 'QnaForm';
			var QNA_RE = 0;	//원글
		
			var form = new FormData(document.getElementById(formId));
		
			$.ajax({
				url : "/NAGAGU/insertQna.do", 
				data : form,
				dataType: 'json',
				processData : false,
				contentType : false,
				type : 'POST',				
				success:function(retVal) {
					if(retVal.res == "OK") {
	 				$("#QnaformSection").css('display','none');	//댓글 등록 성공하면 form은 초기화
						$('#QnaForm').each(function() {  
							this.reset();  
						});  
						$("#QnaButtonSection").show();
						getQnaList();
					} else {
						alertify.alert('확인',"qna insert 실패!!!");
					}
					qna_page();
				},
				error:function() {
					alertify.alert('확인',"qna insert ajax통신 실패!!!");
				}
			});
			event.preventDefault();		
		})
		
		//qna 등록하기 버튼(insert) //답글
		$(document).on("click",".insertQnaReply",function(event){
			$('#remo2').remove();
			var QNA_NUM = $(this).prev().val();	//원글번호(qna_re로 저장할 것)
			console.log("QNA_NUM : " + QNA_NUM)
			
			var formId = 'QnaReplyform'+QNA_NUM;
			var form = new FormData(document.getElementById(formId));
			$.ajax({
				url : "/NAGAGU/insertQna.do", 
				data : form,
				dataType: 'json',
				processData : false,
				contentType : false,
				type : 'POST',				
				success:function(retVal) {
					if(retVal.res == "OK") {
						getQnaList();
					} else {
						alertify.alert('확인',"qna reply insert 실패!!!");
					}
					qna_page();
				},
				error:function() {
					alertify.alert('확인',"qna reply ajax통신 실패!!!");
				}
			});
			event.preventDefault();			

		})
				
//Qna 수정하기----------------------------------------------------------------------------------------------------	  		
		//qna 수정 폼 (원글)
		$(document).on("click",".gomodifyQnaform",function(event){
			$('#remo2').remove();
			var QNA_NUM = $(this).prev().val();
			console.log("QNA_NUM : " + QNA_NUM)
			
			$('#beforeModifyQna'+QNA_NUM).css('display', 'none');

			$.ajax({
				url : "/NAGAGU/gomodifyQnaform.do", 
				data : { 'QNA_NUM' : QNA_NUM },
				dataType: 'JSON',
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				type : 'POST',				
				success:function(retVal) {
					console.log(retVal)
					if(retVal.res == "OK") {
		 				var output='';
						var QNA_NUM = retVal.qnaVO.qna_NUM;
						var QNA_DATE = new Date(retVal.qnaVO.qna_DATE);
						var date = date_format(QNA_DATE);
						var QNA_CONTENT = retVal.qnaVO.qna_CONTENT;		 
		 				
		 				output += '<form class="modifyQnaForm" id="modifyQnaForm'+QNA_NUM+'">';
		 				output += '<div class="row justify-content-center">';
		 				output += '<div class="col-1 justify-content-end"><img src="<%=MEMBER_PICTURE%>" alt="" class="rounded-circle"></div>';
		 				output += '<div class="col-11">';
		 				output += '<div class="row pb-1">';
		 				output += '<div class="col-2 justify-content-end name"><%=MEMBER_NICK%></div>';
		 				output += '<div class="col-8 justify-content-center"></div>';
		 				output += '<div class="col-2 justify-content-center smallfont">'+date+'</div>';
		 				output += '</div>';		
		 				output += '<div class="row">';		
		 				output += '<div class="col-11 pr-0">';		
		 				output += '<textarea rows="3" name="QNA_CONTENT" id="QNA_CONTENT'+QNA_NUM+'" class="col-12 pl-0 pr-0">'+QNA_CONTENT+'</textarea>';		
		 				output += '</div></div>';	
		 				output += '<div class="row">';	
		 				output += '<div class="col-2 justify-content-center"></div>';	
		 				output += '<div class="col-8 justify-content-center"></div>';	
		 				output += '<div class="col-2 justify-content-center" id="QnaafterControl" style="font-size:0.7em; font-weight:bold;">';		
		 				output += '<input type="hidden" name="QNA_NUM" value="'+QNA_NUM+'">';	
		 				output += '<a class="modifyQna" style="cursor: pointer;">수정</a> &nbsp;';	
		 				output += '<a class="formCancel" value="qnaModify" style="cursor: pointer;">취소</a>';	
		 				output += '</div></div></div></div></form>';
		 				
		 				$('#afterModifyQna'+QNA_NUM).append(output);
					} else {
						alertify.alert('확인',"수정폼 데이터 가져오기 실패!!!");
					}
					qna_page();
				},
				error:function() {
					alertify.alert('확인',"ajax통신 실패!!!");
				}
			});
			event.preventDefault();		
		})			
		
		//qna 수정 process (원글)
		$(document).on("click",".modifyQna",function(event){
			$('#remo2').remove();
			var QNA_NUM = $(this).prev().val();
			console.log("QNA_NUM"+QNA_NUM)

 			var formId = 'modifyQnaForm'+QNA_NUM;
 	 		var form = new FormData(document.getElementById(formId));
			$.ajax({
				url : "/NAGAGU/modifyQna.do", 
				data : form,
				dataType: 'json',
				processData : false,
				contentType : false,
				type : 'POST',				
				success:function(retVal) {
					if(retVal.res == "OK") {
						getQnaList();
					} else {
						alertify.alert('확인',"수정 실패!!!");
					}
					qna_page();
				},
				error:function() {
					alertify.alert('확인',"ajax통신 실패!!!");
				}
			});
			event.preventDefault();				
		})		
		
		//qna 수정 process (답글)
		$(document).on("click",".modifyQnaReply",function(event){
			$('#remo2').remove();
			var QNA_NUM = $(this).prev().val();
			console.log("QNA_NUM"+QNA_NUM)

 			var formId = 'modifyQnaFormReply'+QNA_NUM;
			console.log("formId"+formId)
 	 		var form = new FormData(document.getElementById(formId));
 	 		
			$.ajax({
				url : "/NAGAGU/modifyQna.do", 
				data : form,
				dataType: 'json',
				processData : false,
				contentType : false,
				type : 'POST',				
				success:function(retVal) {
					if(retVal.res == "OK") {
						getQnaList();
					} else {
						alertify.alert('확인',"수정 실패!!!");
					}
					qna_page();
				},
				error:function() {
					alertify.alert('확인',"ajax통신 실패!!!");
				}
			});
			event.preventDefault();				
		})			
		

//Qna 삭제하기----------------------------------------------------------------------------------------------------	  
		//원글, 답글 same
		$(document).on("click",".deleteQna",function(event){
			$('#remo2').remove();
			var QNA_NUM = $(this).prev().prev().val();
			console.log("QNA_NUM : " + QNA_NUM)
			var delete_confirm = confirm("삭제하시겠습니까?");
			if(delete_confirm) {
				$.ajax({
					url : "/NAGAGU/deleteQna.do", 
					type:'GET',
					data : {'QNA_NUM':QNA_NUM},
					dataType : 'json', // 서버에서 보내줄 데이터 타입
					async: false,
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success:function(retVal) {
						if(retVal.res == "OK") {
							getQnaList();
						} else if(retVal.res == "Children"){
							alertify.alert('확인',"답변이 존재하는 문의는 삭제할 수 없습니다.");
						} else {
							alertify.alert('확인',"삭제 실패!");
						}
						qna_page();
					},
					error:function() {
						alertify.alert('확인',"ajax통신 실패!!!");
					}
				});
				event.preventDefault();					
			}
		})						
		
	//ready 끝	
	getReviewList();
	getQnaList();
	});		
	

//취소버튼들
		//Review입력폼 / Qna입력폼
		$(document).on("click",".formCancel",function(event){
			console.log(this)
			console.log($(this).attr('value'))
			var formType = $(this).attr('value');
			
			if(formType=='ReviewForm') {	//리뷰 입력폼에서 취소
 				$("#ReviewformSection").css('display','none');
				$('#ReviewForm').each(function() {  
					this.reset();  
				});  
				$('.imgs_wrap').empty();
				$("#ReviewButtonSection").show();
			} 
			else if(formType=='reviewModify') {	//리뷰 수정폼에서 취소
				var REVIEW_NUM = $(this).prev().prev().val();
				$('#beforeModifyReview'+REVIEW_NUM).css('display', 'block');	//수정,삭제버튼 보임
				$('#afterModifyReview'+REVIEW_NUM).empty();

			}
			else if(formType=='reviewReply') {	//답글 입력 취소
				var REVIEW_NUM = $(this).prev().prev().val();
				console.log(REVIEW_NUM)
				$("#review_replybtn"+REVIEW_NUM).css('display','block');	//답글버튼 보임
				$("#ReviewReplyformSection"+REVIEW_NUM).empty();	//답글 지움
			}
			else if(formType=='reviewReplyModify') {	//답글 수정 취소
				var REVIEW_NUM = $(this).prev().prev().val();
				$('#beforeModifyReviewReply'+REVIEW_NUM).css('display', 'block');
				$('#afterModifyReviewReply'+REVIEW_NUM).css('display', 'none'); 
				$('#ReviewbeforeControl'+REVIEW_NUM).css('display', 'block');	//수정,삭제버튼 보임
				$('#ReviewafterControl'+REVIEW_NUM).css('display', 'none'); 	//수정,취소버튼 숨김
//				$('#modifyReviewFormReply'+REVIEW_NUM).empty();	//수정폼 초기화(content)
				$('#modifyReviewFormReply'+REVIEW_NUM).each(function() {  
					this.reset();  
				});  
			}
			else if(formType=='QnaForm') {	//문의 입력폼에서 취소
 				$("#QnaformSection").css('display','none');
				$('#QnaForm').each(function() {  
					this.reset();  
				});  
				$("#QnaButtonSection").show();
			} 
			else if(formType=='qnaModify') {	//리뷰 수정폼에서 취소
				var QNA_NUM = $(this).prev().prev().val();
				$('#beforeModifyQna'+QNA_NUM).css('display', 'block');	//수정,삭제버튼 보임
				$('#afterModifyQna'+QNA_NUM).empty();
			}
			else if(formType=='qnaReply') {	//답글 입력 취소
				var QNA_NUM = $(this).prev().prev().val();
				console.log(QNA_NUM)
				$("#qna_replybtn"+QNA_NUM).css('display','block');	//답글버튼 보임
				$("#QnaReplyformSection"+QNA_NUM).empty();	//답글 지움
			}
			else if(formType=='qnaReplyModify') {	//답글 수정 취소
				var QNA_NUM = $(this).prev().prev().val();
				$('#beforeModifyQnaReply'+QNA_NUM).css('display', 'block');
				$('#afterModifyQnaReply'+QNA_NUM).css('display', 'none'); 
				$('#QnabeforeControl'+QNA_NUM).css('display', 'block');	//수정,삭제버튼 보임
				$('#QnaafterControl'+QNA_NUM).css('display', 'none'); 	//수정,취소버튼 숨김
//				$('#modifyQnaFormReply'+QNA_NUM).empty();	//수정폼 초기화(content)
				$('#modifyQnaFormReply'+QNA_NUM).each(function() {  
					this.reset();  
				});  
			}			
			event.preventDefault();	
		});


//input type=file 이미지 업로드/수정----------------------------------------------------------------------------------------------------	    	
		//파일 업로드창 css 바꾸기
		$('.file_input [id="input_imgs"]').change(function() {
			var fileName = $(this).val();
			var fileCount = $(this).get(0).files.length;
			var tmpvar = $('.file_input input[type=text]')[0];
			if($(this).get(0).files.length == 1){
				$(tmpvar).val(fileName);
			}
			else {
				$(tmpvar).val('파일 '+fileCount+'개');
			}
		});
		$('.file_input [id="modify_input_imgs"]').change(function() {
			var fileName = $(this).val();
			var fileCount = $(this).get(0).files.length;
			var tmpvar = $('.file_input input[type=text]')[1];
			if($(this).get(0).files.length == 1){
				$(tmpvar).val(fileName);
			}
			else {
				$(tmpvar).val('추가 업로드 파일 '+fileCount+'개');
			}
		});
		
		
		//입력-------------------------------------------------------------
		//ReviewForm 다중이미지 업로드
		$('#input_imgs').on("change", handleImgFileSelect);
		
		//이미지 정보들을 담을 배열
		var sel_files= [];
		function handleImgFileSelect(e) {
			$('.imgs_wrap').css('display','block');
			//이미지 정보들을 초기화
			sel_files = [];
			$('.imgs_wrap').empty();
			
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			var index = 0;
			filesArr.forEach(function(f) {
				if(!f.type.match("image.*")) {
					alertify.alert('확인',"확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_files.push(f);
				
				var reader = new FileReader();
				reader.onload = function(e) {
					var html="<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='review_img' title='Click to remove' width='100' height='100'>&nbsp;</a>";
					
					$(".imgs_wrap").append(html);
					index++;
				}
				reader.readAsDataURL(f);          
			});
		}      

		//파일 선택 후 클릭해서 삭제 가능
		//ReviewForm 이미지 삭제
		function deleteImageAction(index) {
			var delete_confirm = confirm("삭제하시겠습니까?");
			if(delete_confirm) {
				console.log("index : " + index);
				sel_files.splice(index, 1);
				
				var img_id = "#img_id_" + index;
				console.log("img_id : " + img_id);
				$(img_id).remove();
				
				console.log("sel_files : " + sel_files);            
			} 
		}		
		
		//수정-------------------------------------------------------------
		//Review Modify 댓글 수정시 이미지 추가 가능
		$(document).on("change","#modify_input_imgs",function(e){ 
			sel_files = [];
			$('.modify_imgs_wrap').empty();
			
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			var index = 0;
			filesArr.forEach(function(f) {
				if(!f.type.match("image.*")) {
					alertify.alert('확인',"확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_files.push(f);
			          
				var reader = new FileReader();
				reader.onload = function(e) {
					var html="<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='review_img ' title='Click to remove' width='100' height='100'>&nbsp;</a>";
					
					$(".modify_imgs_wrap").append(html);
					index++;
				}
				reader.readAsDataURL(f);
			 });
		 });    

		//Review Modify - 댓글 수정시 before 이미지 삭제
		function deleteBeforeImageAction(index) {
			var delete_confirm = confirm("삭제하시겠습니까?");
			if(delete_confirm) {
				console.log("index : " + index);
				sel_files.splice(index, 1);
				
				var img_id = "#beforeimg_id_" + index;
				console.log("#beforeimg_id_+index : " + img_id);
				
				var deleteImg=$("input[type=hidden][name=deleteImg]").val();	//기본은 ""
				deleteImg += $(img_id).children().attr('value')+',';	//삭제할 때마다 deleteImg의 value에 추가됨
				console.log("deleteImg : " + deleteImg);
				$("input[type=hidden][name=deleteImg]").val(deleteImg);
					
				$(img_id).remove();
				
				console.log("sel_files : " + sel_files);            
			} 
		}

		
//Review 등록하기----------------------------------------------------------------------------------------------------	    

		//Review폼 버튼 (review)
		$(document).on("click",".review_btn",function(event){
			if(<%=MEMBER_STATUS%> == 100){
				if(<%=WORKSHOP_STATUS%> == 100) {
					alertify.alert('확인','로그인 해주세요!');					
				} else {
					alertify.alert('확인','회원만 작성 가능합니다.');
				}
				return;
			}
			$("#ReviewformSection").css('display','block');
			$("#ReviewButtonSection").css('display','none');	//댓글달기버튼영역 숨김
		})
		
		//ReviewReplyform폼 버튼	//답글 버튼 (reply)
		$(document).on("click",".review_replybtn",function(event){
			if(<%=MEMBER_STATUS%> == 100){
				if(<%=WORKSHOP_STATUS%> == 100) {
					alertify.alert('확인','로그인 해주세요!');					
				} else {
					alertify.alert('확인','회원만 작성 가능합니다.');
				}
				return;
			}
			var REVIEW_NUM = $(this).attr('value');
			console.log(REVIEW_NUM);   
			$("#review_replybtn"+REVIEW_NUM).css('display','none');	//답글버튼 숨김
			
			var replyform = '';
			replyform += '<form class="ReviewReplyform" id="ReviewReplyform'+REVIEW_NUM+'" name="REVIEW_CONTENT" enctype="multipart/form-data">';
			replyform += '<div class="row justify-content-center">';
			replyform += '<div class="col-1"></div>';
			replyform += '<div class="col-1"><img src="<%=MEMBER_PICTURE%>" alt="" class="rounded-circle"></div>';
			replyform += '<div class="col-10">';
			replyform += '<div class="row">';
			replyform += '<div class="col-2 justify-content-end name"><%=MEMBER_NICK%></div>';
			replyform += '<div class="col-8 justify-content-center"></div>';
			replyform += '<div class="col-2 justify-content-center smallfont pl-1"></div></div>';	
			replyform += '<div class="row">';
			replyform += '<div class="col-11 pr-0">';
			replyform += '<textarea rows="3" name="REVIEW_CONTENT" class="col-12 pl-0 pr-0"></textarea>';
			replyform += '</div></div>';
			replyform += '<div class="row">';
			replyform += '<div class="col-2 replytext justify-content-center"></div>';
			replyform += '<div class="col-8 justify-content-center"></div>';
			replyform += '<div class="col-2 ReviewbeforeControl justify-content-center pl-1">';
			replyform += '<input type="hidden" name="PRODUCT_NUM" value="'+<%=PRODUCT_NUM%>+'">';		
			replyform += '<input type="hidden" name="REVIEW_RE" value="'+REVIEW_NUM+'">';		
			replyform += '<a class="insertReviewReply">작성</a> &nbsp;';
			replyform += '<a class="formCancel" value="reviewReply">취소</a>';
			replyform += '</div></div></div></div></form>';
			
			$('#ReviewReplyformSection'+REVIEW_NUM).append(replyform);
		})

		//afterModifyReviewReply 답글수정폼 (reply)		
		$(document).on("click",".gomodifyReviewReplyform",function(event){
			var REVIEW_NUM = $(this).prev().val();
			console.log("REVIEW_NUM : " + REVIEW_NUM)
			
			$('#beforeModifyReviewReply'+REVIEW_NUM).css('display', 'none');
			$('#afterModifyReviewReply'+REVIEW_NUM).css('display', 'block'); 
			$('#ReviewbeforeControl'+REVIEW_NUM).css('display', 'none');	//수정,삭제버튼 숨김
			$('#ReviewafterControl'+REVIEW_NUM).css('display', 'block'); 	//수정,취소버튼 보임
		})
				

//-----------------------------------------------------------------------------
//QNA--------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//Review 등록하기----------------------------------------------------------------------------------------------------	    
		//Qna폼 버튼 (qna)
		$(document).on("click",".qna_btn",function(event){
			if(<%=MEMBER_STATUS%> == 100){
				if(<%=WORKSHOP_STATUS%> == 100) {
					alertify.alert('확인','로그인 해주세요!');					
				} else {
					alertify.alert('확인','회원만 작성 가능합니다.');
				}
				return;
			}
			$("#QnaformSection").css('display','block');
			$("#QnaButtonSection").css('display','none');	//댓글달기버튼영역 숨김
		})
		
		//QnaReplyform폼 버튼	//답글 버튼 (reply)
		$(document).on("click",".qna_replybtn",function(event){

			var QNA_NUM = $(this).attr('value');
			console.log(QNA_NUM);   
			$("#qna_replybtn"+QNA_NUM).css('display','none');	//답글버튼 숨김
			
			var replyform = '';
			replyform += '<form class="QnaReplyform" id="QnaReplyform'+QNA_NUM+'" name="QNA_CONTENT">';
			replyform += '<div class="row justify-content-center">';
			replyform += '<div class="col-1"></div>';
			replyform += '<div class="col-1"><img src="<%=WORKSHOP_PICTURE%>" alt="" class="rounded-circle"></div>';
			replyform += '<div class="col-10">';
			replyform += '<div class="row">';
			replyform += '<div class="col-2 justify-content-end name"><%=WORKSHOP_NAME%></div>';
			replyform += '<div class="col-8 justify-content-center"></div>';
			replyform += '<div class="col-2 justify-content-center smallfont pl-1"></div></div>';	
			replyform += '<div class="row">';
			replyform += '<div class="col-11 pr-0">';
			replyform += '<textarea rows="3" name="QNA_CONTENT" class="col-12 pl-0 pr-0"></textarea>';
			replyform += '</div></div>';
			replyform += '<div class="row">';
			replyform += '<div class="col-2 replytext justify-content-center"></div>';
			replyform += '<div class="col-8 justify-content-center"></div>';
			replyform += '<div class="col-2 QnabeforeControl justify-content-center pl-1">';
			replyform += '<input type="hidden" name="PRODUCT_NUM" value="'+<%=PRODUCT_NUM%>+'">';		
			replyform += '<input type="hidden" name="QNA_RE" value="'+QNA_NUM+'">';		
			replyform += '<a class="insertQnaReply">작성</a> &nbsp;';
			replyform += '<a class="formCancel" value="qnaReply">취소</a>';
			replyform += '</div></div></div></div></form>';
			
			$('#QnaReplyformSection'+QNA_NUM).append(replyform);
		})

		//afterModifyQnaReply 답글수정폼 (reply)		
		$(document).on("click",".gomodifyQnaReplyform",function(event){
			var QNA_NUM = $(this).prev().val();
			console.log("QNA_NUM : " + QNA_NUM)
			$('#beforeModifyQnaReply'+QNA_NUM).css('display', 'none');
			$('#afterModifyQnaReply'+QNA_NUM).css('display', 'block'); 
			$('#QnabeforeControl'+QNA_NUM).css('display', 'none');	//수정,삭제버튼 숨김
			$('#QnaafterControl'+QNA_NUM).css('display', 'block'); 	//수정,취소버튼 보임
		})
	
		$(document).ready(function(){
			if(<%=PRODUCT_STATUS%> == 0) {
				console.log('품절된 상품')
				$('.pauseSale').addClass('disabled');
				$('.goodsform').find('td.total').text('품절된 상품').css('color', 'red')
			} else {
				console.log('품절 아닌 상품')
				$('.pauseSale').removeClass('disabled');
			}
		}) 
	
				
</script>