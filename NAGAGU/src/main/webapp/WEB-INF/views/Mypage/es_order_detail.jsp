<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.estimate.EstimateVO" %>
<%
	String member_mail = "";
	String workshop_name = "";
	int login_state = 0;
	
	EstimateVO vo = (EstimateVO)request.getAttribute("estimatevo");
	
	if (session.getAttribute("MEMBER_EMAIL") != null) {
		member_mail = (String)session.getAttribute("MEMBER_EMAIL");
		System.out.println("estimateDetail 일반 회원 : " + member_mail);
		login_state = 1;
	}
	else {
		if (session.getAttribute("WORKSHOP_NAME") != null) {
			workshop_name = (String)session.getAttribute("WORKSHOP_NAME");
			System.out.println("estimateDetail 공방 회원 : " + workshop_name);
			login_state = 2;
		}
	}
	
	int ESTIMATE_NUM = (int)request.getAttribute("ESTIMATE_NUM");
	int ES_STATE = vo.getESTIMATE_STATE();
	String mailChk = vo.getESTIMATE_MEMBER();
	
	int nowpage = 1;
	if (request.getAttribute("page")!=null) {
		nowpage = Integer.parseInt((String)request.getAttribute("page"));
	}
			
	String images = vo.getESTIMATE_FILE();
	String[] imgArr = images.split(",");

%>
<style type="text/css">
	.es_body {
		min-width:720px;
	}
	
	.es_requestform {
		font-size: 1.1em;
		margin: 0 180px 0 0;
	}
	
	img {
		max-width:100%;
	}

	.title {
		font-weight:bold;
	}
	
	.row {
		padding-bottom:3px;
	}		
	
	@media screen and (max-width:375px) {
		table {
			font-size:0.7rem;
		}
	}
	
	.es_content {
		margin:0 auto;
		background:#d3d3d3;
		border-radius:8px;
		padding:10px;
	}
	
	.offer_textarea {
		width:60%;

	}
	
	#offerTable {
		width:800px;
    }
       
    #offerList {
        width:100%;
    }
    
    #offerList thead {
        background:#575b69;
        color:#ffffff;
        font-weight:700;
        line-height:32px;
        text-align:center;
    }
    
    .list_caution {
        background:#fafafa;    
        text-align:center;
        height:32px;
    }
    
    .item_head {
        text-align:center;
        transition:border 0.2s;
        box-sizing:border-box;
    }
    
    .item_head:hover {
        cursor:pointer;
        border:1px solid #ef900e;
        z-index:1;
    }
    
    .item_content {
        display:none;
        text-align:left;
    }
    
    .item_content .item_content_body {
        padding:10px;
    }
	
	.pagination {
	  display: inline-block;
	  margin-bottom:30px;
	}
	
	.pagination .pageNum {
	  color: black;
	  float: left;
  		text-align: center;
  		line-height:44px;	
	  width:44px;
	  height:44px;
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
		font-size:18px;
	}		

	.page-tap a {
	   text-decoration: none;
	   color: black;
	}	
	.page-tap a:hover{
		color: #ef900e !important;
		transform: scale(1.2);
		text-decoration: none;
	}
	
	.modal-dialog {
		width:480px;
		height:640px;
	}
	
	.modalLabel {
		width:80px;
	}
	
	.btn_bid_cancle {
		color:red;
	}
	
	.btn_offer_modify {
		border:1px solid #575b69;
		color:#575b69;
		transition:color 0.3s, background 0.3s;
	}
	
	.btn_offer_modify:hover {
		background:#575b69;
		color:#ffffff;
	}
	
	
	.btn_offer_delete {
		border:1px solid #ef902e;
		color:#ef902e;
		transition:color 0.3s, background 0.3s;
	}
	
	.btn_offer_delete:hover {
		background:#ef902e;
		color:#ffffff;
	}
	
	.thumbMain {
		width:800px;
		height:600px;
		overflow:hidden;
		display:block;
		clear: both;
	}
	
	.thumbMain img {
		display:block;
		min-height:100%;
		min-width:100%;
		-ms-interpolation-mode: bicubic;
	}
	
	.thumbItem {
		width:153px;
		height:120px;
		overflow:hidden;
		display:block;
		margin:6px 3px 0 3px;
	}
	
	.thumbCheck {
		border:2px solid #ef902e;
		border-radius:4px;
	}
	
	.thumbItem img {
		display:block;
		min-height:100%;
		min-width:100%;
		-ms-interpolation-mode: bicubic;
		transition:transform 0.2s;
	}
	
	.thumbItem img:hover {
		transform:scale(1.05);
		cursor:pointer;
	}
</style>
<!-- content starts -->
<div class="container" style="margin-top: 30px; margin-bottom: 30px;">
	<div class="justify-content-between title">
		<div class="col-10 page-tap">
			<h6><a href="estimate.es">STORE 견적 문의</a> > 상세보기 </h6>
		</div>
	</div>
	<br><br>
	<div class="d-flex justify-content-center">			
		<div class="d-flex flex-column bd-highlight pb-3">
			<div class="thumbMain d-flex justify-content-center">
				<a href=<%=imgArr[0] %> target="_blank"><img src=<%=imgArr[0] %>></a>
			</div>
			<div class="thumbList d-flex justify-content-center">
			<%
				for (int i=0; i<imgArr.length; i++) {
			%>
				<div class="thumbItem<% if (i==0) { %> thumbCheck <% } %>" thumb-idx=<%=i %>><img src=<%=imgArr[i] %>></div>
			<% 
				}
			%>
			</div>
		</div>
	</div>
	<br/><br/>
	<div class="d-flex justify-content-center">
		<table class="table table-borderless" style="width:800px;">
			<colgroup>
				<col style="width:40%">
				<col style="width:60%">
			</colgroup>
			<tr>
				<th style="vertical-align:middle">배송희망지역</th>
				<td>
					<%=vo.getESTIMATE_AREA() %>
				</td>
			</tr>
			<tr>
				<th style="vertical-align:middle">제품 종류</th>
				<td>
					<%=vo.getESTIMATE_CATEGORY() %>
				</td>
			</tr>
			<tr>
				<th style="vertical-align:middle">소재</th>
				<td>
					<%=vo.getESTIMATE_SOURCE() %>
				</td>
			</tr>
			<tr>
				<th style="vertical-align:middle">색상(염색)</th>
				<td>
					<%=vo.getESTIMATE_COLOR() %>
				</td>
			</tr>
			<tr>
				<th style="vertical-align:middle">코팅</th>
				<td>
					<%=vo.getESTIMATE_COAT() %>
				</td>
			</tr>
			<tr>
				<th style="vertical-align:middle">규격</th>
				<td>
					<%=vo.getESTIMATE_SIZE() %>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					기타사항
				</th>
			</tr>
			<tr>
				<td colspan="2">
					<div class="es_content justify-content-center">
						<%=vo.getESTIMATE_CONTENT() %>
					</div>
				</td>
			</tr>
		</table>
	</div>
		
</div>
<!-- content 끝 -->			
<br/><br/><br/><br/>
	
<script>
	var checkPrice =  /^[0-9]*$/;
	
	/* 썸네일 클릭 */
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
			} <% } if (imgArr.length > 4) { %> else {
				$('.thumbMain').html('<a href="' + '<%=imgArr[4]%>' + '" target="_blank"><img src="' + '<%=imgArr[4]%>' + '"></a>');
			} <%}%>
	});
	
	
	function addComma(inputNumber) {
		   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function unComma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}
</script>