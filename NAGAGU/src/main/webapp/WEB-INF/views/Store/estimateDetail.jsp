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
<div class="container category_cs" style="margin-top: 30px; margin-bottom: 30px;">
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
		

	<div class="row justify-content-center p-5">
	<% 
		if (login_state==2 && ES_STATE == 0) { 
	%>
		<button class="btn btn-dark btn-md" alt="" data-toggle="modal" data-target="#offerFormModal" aria-haspopup="true" aria-expanded="false">
			입찰하기
		</button>&nbsp;&nbsp;&nbsp;
	<% 
		}
		if (member_mail.equals(mailChk)) { 
	%>
			<button id="btn_modify" class="btn btn-dark btn-md" onclick="location.href='estimate_modify.es?ESTIMATE_NUM=<%=ESTIMATE_NUM%>&page=<%=nowpage%>'">수정</button>  &nbsp;
			<button id="btn_delete" class="btn btn-dark btn-md" onclick="location.href='estimate_delete.es?ESTIMATE_NUM=<%=ESTIMATE_NUM%>'">삭제</button>  &nbsp;
	<% 
		} 
	%>
		<button class="btn btn-dark btn-md" onclick="location.href='estimate.es?page=<%=nowpage%>'">목록</button>
	</div>
	
	<form id="offer_data">
		<input type="hidden" name="ESTIMATE_NUM" value=<%=ESTIMATE_NUM%>>
		<input type="hidden" id="OFFER_PAGE" name="OFFER_PAGE" value=1>
		<% 
			if (login_state == 2) {
		%>
				<input type="hidden" name="OFFER_WORKSHOP" value=<%=workshop_name%>>
		<% 
			} 
		%>
	</form>
	
	<div id="offerWrap" class ="offer_wrap d-flex justify-content-center">
		<div id="offerTable">
			<table id="offerList">
				<thead>
					<tr>
						<th width="10%">번호</th>
						<th width="25%">공방 이름</th>
						<th width="25%">제시 가격</th>
						<th width="20%">문의</th>		
						<th width="20%">처리</th>
					<tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>

	<!--  견적 제시 modal -->
	<div class="modal fade" id="offerFormModal" tabindex="-1" role="dialog"
		aria-labelledby="offerFormLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="offerFormLabel">견적 제안</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="offerForm" method="POST">
					<input type="hidden" id="offer_price" name="OFFER_ESTIMATE" value="<%=vo.getESTIMATE_NUM() %>">
					<input type="hidden" name="OFFER_WORKSHOP" value="<%=workshop_name %>">
						<label class="modalLabel" for="OFFER_PRICE">제시 가격</label>
						<input class="modalInput" type="text" name="OFFER_PRICE"><br>
						<label class="modalLabel" for="OFFER_CONTENT">내용</label>
						<textarea class="modalInput" id="offer_content" name="OFFER_CONTENT"></textarea>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" id="btn_offer" class="btn btn-primary">제시하기</button>
				</div>
			</div>
		</div>
	</div>
	
	<!--  견적 수정 modal -->
	<div class="modal fade" id="modifyFormModal" tabindex="-1" role="dialog"
		aria-labelledby="offerFormLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="offerFormLabel">견적 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="modifyForm" method="POST">
					<input type="hidden" name="OFFER_ESTIMATE" value="<%=vo.getESTIMATE_NUM() %>">
					<input type="hidden" id="modify_offer_num" name="OFFER_NUM">
						<label class="modalLabel" for="OFFER_PRICE">제시 가격</label>
						<input class="modalInput" id="modify_offer_price" type="text" name="OFFER_PRICE"><br>
						<label class="modalLabel" for="OFFER_CONTENT">내용</label>
						<textarea class="modalInput" id="modify_offer_content" name="OFFER_CONTENT" maxlength="200"></textarea>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" id="btn_modify_submit" class="btn btn-primary">수정하기</button>
				</div>
			</div>
		</div>
	</div>
	
	<br/><br/><br/>
	
	<!-- 댓글 페이지네이션 -->
	<div class="row justify-content-center">
		<div id="pagination" class="pagination justify-content-center">
		</div>
	</div>

</div>
<!-- content 끝 -->			
<br/><br/><br/><br/>
	
<script>
	var login_state = <%=login_state%>;
	var es_num = <%=ESTIMATE_NUM%>;
	var es_state = <%=ES_STATE%>;
	var checkPrice =  /^[0-9]*$/;
	
	$(document).ready(function (){
		
		function getOfferList () {
			if ('<%=member_mail%>' != '<%=mailChk%>') {
				if (login_state != 2) {
					var output='';
					output += '<tr><td class="list_caution" colspan="5">제안글은 <b><font color="#f2400">작성자</font></b>만 열람 가능합니다.</td></tr>';
					
					$('#offerList > tbody').html(output);
					return false;
				}
				else if (es_state == 1) {
					var output='';
					output += '<tr><td class="list_caution" colspan="5"><b><font color="#f2400">낙찰</font></b>이 완료된 글입니다.</td></tr>';
					
					$('#offerList > tbody').html(output);
					return false;
				}
				
			}
			
			var OFFER_DATA = $('#offer_data').serialize();
			$.ajax({
				url:'/NAGAGU/offer_list.es', 
				type:'POST', 
				data: OFFER_DATA,
				dataType:"json", //서버에서 보내줄 데이터 타입
				async:false,
				contentType:'application/x-www-form-urlencoded; charset=utf-8',
				success:function(data) {
					console.log(data.offerList);
					
					var output = '';
					var pagination = '';
					
					var offer_page = data.offer_page;
					var max_page = data.offer_maxpage;
					var ol = data.offerList;
					var rnum = data.offer_rnum;
					
					if (ol.length == 0) {
						output += '<tr><td colspan="5" class="list_caution">등록된 제안이 없습니다</td><tr>';
					}
					
					else {
						
						/* 댓글 리스트 작성*/
						$.each(ol, function(index, item) {
							var offerPrice = addComma(item.offer_PRICE);
							
							output += '<tr value="' + index + '" class="item_head">';
							output += '<td>' + rnum + '</td>';
							output += '<td><b>' + item.offer_WORKSHOP + '</b></td>';
							output += '<td id="offer_price_' + item.offer_NUM + '">' + offerPrice + '</td>';
							if (login_state == 1) {
								if (es_state == 1) {
									if (item.offer_STATE == 1) {
										output += '<td><button value="' + item.offer_WORKSHOP + '" class="btn_note btn btn-outline-dark btn-sm">쪽지보내기</button></td>';
										output += '<td><button value="' + item.offer_NUM + '" class="btn_bid_cancel btn btn-outline-dark btn-sm">낙찰취소</button></td>';
									} 
									else {
										output += '<td> - </td>';
										output += '<td> - </td>';
									}
								}
								else {
									output += '<td><button value="' + item.offer_WORKSHOP + '" class="btn_note btn btn-outline-dark btn-sm">쪽지보내기</button></td>';
									output += '<td><button value="' + item.offer_NUM + '" class="btn_bid btn btn-outline-dark btn-sm">낙찰하기</button></td>';
								}
							} 
							else {
							output += '<td> - </td>';
							output += '<td><button value="' + item.offer_NUM + '" class="btn_offer_modify btn-sm" alt="" data-toggle="modal" data-target="#modifyFormModal" aria-haspopup="true" aria-expanded="false">수정</button>&nbsp;';
							output += '<button value="' + item.offer_NUM + '" class="btn_offer_delete btn-sm">삭제</button></td>';
							}
							output += '</tr>';
							output += '<tr id="item_content_'+ index + '" class="item_content">';
							output += '<td colspan="5">';
							output += '<div id = "offer_content_' + item.offer_NUM + '" class="item_content_body">' + item.offer_CONTENT+ '</div>';
							output += '</td></tr>';
							
							rnum--;
						});
						
						/* 댓글 페이지네이션 */
						
						if (offer_page == max_page && offer_page > 5) {
							pagination += '<div class="pageNum pagelink" value="' + Number(offer_page-5) + '"><i class="fas fa-angle-double-left page_num"></i></div>';
							pagination += '<div class="pageNum pagelink" value="' + Number(offer_page-4) + '">' + Number(offer_page-4) + '</div>';
							pagination += '<div class="pageNum pagelink" value="' + Number(offer_page-3) + '">' + Number(offer_page-3) + '</div>';
						}
						else if (offer_page == max_page-1 && offer_page > 4) {
							pagination += '<div class="pageNum pagelink" value="' + Number(offer_page-4) + '"><i class="fas fa-angle-double-left page_num"></i></div>';
							pagination += '<div class="pageNum pagelink" value="' + Number(offer_page-3) + '">' + Number(offer_page-3) + '</div>';
						}
						else {
							if (offer_page > 3) {
								pagination += '<div class="pageNum pagelink" value="' + Number(offer_page-3) + '"><i class="fas fa-angle-double-left page_num"></i></div>';
							}
						} 
						
						if (offer_page > 2) {
							pagination += '<div class="pageNum pagelink" value="' + Number(offer_page-2) + '">' + Number(offer_page-2) + '</div>';
						}
						if (offer_page > 1) {
							pagination += '<div class="pageNum pagelink" value="' + Number(offer_page-1) + '">' + Number(offer_page-1) + '</div>';
						}
							pagination += '<div class="pageNum currentpage">' + offer_page + '</div>';
						if (max_page > offer_page) {
							pagination += '<div class="pageNum pagelink" value="' + Number(offer_page+1) + '">' + Number(offer_page+1) + '</div>';
						}
						if (max_page > offer_page+1) {
							pagination += '<div class="pageNum pagelink" value="' + Number(offer_page+2) + '">' + Number(offer_page+2) + '</div>';
						}
						
						if (offer_page == 1 && max_page > 5) {
							pagination += '<div class="pageNum pagelink" value="' + Number(offer_page+3) + '">' + Number(offer_page+3) + '</div>';
							pagination += '<div class="pageNum pagelink" value="' + Number(offer_page+4) + '">' + Number(offer_page+4) + '</div>';
							pagination += '<div class="pageNum pagelink" value="' + Number(offer_page+5) + '"><i class="fas fa-angle-double-right page_num"></i></div>';
						}
						else if (offer_page == 2 && max_page > 6) {
							pagination += '<div class="pageNum pagelink" value="' + Number(offer_page+3) + '">' + Number(offer_page+3) + '</div>';
							pagination += '<div class="pageNum pagelink" value="' + Number(offer_page+4) + '"><i class="fas fa-angle-double-right page_num"></i></div>';
						}
						else {
							if (max_page > offer_page+2) {
								pagination += '<div class="pageNum pagelink" value="' + Number(offer_page+3) + '"><i class="fas fa-angle-double-right page_num"></i></div>';
							}
						}
					}
					
					$('#offerList > tbody').html(output);
					$('#pagination').html(pagination);
				},
				error:function(request, status, error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
		
		/* 페이지 이동 */
		$(document).delegate('.pagelink', 'click', function(){
			$('#OFFER_PAGE').val($(this).attr("value"));
			console.log($('#OFFER_PAGE').val());
			getOfferList();
		});
		
		/* 제안글 내용 보이기, 숨기기 */
		$(document).delegate('.item_head', 'click', function() {
			var item_num = $(this).attr("value");

			if ($('#item_content_' + item_num).css('display') != 'none') {
				$('#item_content_' + item_num).hide(200);
			} else {
				$('.item_content').hide();
				$('#item_content_' + item_num).show(200);
			}
		});
		
		/* 쪽지 보내기 */
		$(document).delegate('.btn_note', 'click', function() {
			var send_workshop = $(this).attr("value");
			console.log(send_workshop);
			window.open('/NAGAGU/noteForm.nt?workshop_name=' + send_workshop, "쪽지 보내기", "width=600 height=700");
			return false;
		});
		
		/* 낙찰하기 */
		
		$(document).delegate('.btn_bid', 'click', function() {
			var OFFER_NUM = $(this).attr('value');
			alertify.confirm("낙찰", "낙찰하시겠습니까?", function() {
				var redirect = 'estimate_detail.es?ESTIMATE_NUM=' + es_num;
				
				var params = {"OFFER_STATE" : 1, "OFFER_NUM" : OFFER_NUM, "ESTIMATE_NUM" : es_num, "redirect" : redirect }
				console.log(params);
				$.ajax ({
					url:"/NAGAGU/offer_bid.es",
					type:"POST",
					data:params,
					contentType:'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						alertify.confirm("낙찰 완료", "바로 결제창으로 이동하시겠습니까?", function() {
							location.href='mypage_estimate_checkout.my?ESTIMATE_NUM=' + es_num;
						}, function() {	
							var info_text = data.workshop_name + ' 공방의 제안이 ' + addComma(data.offer_price) + '원에 낙찰되었습니다.';
							alertify.success(info_text);
							getOfferList();
						});
					},
					error: function(data) {
						console.log(data.res);
				}
				});
			}, function() {
			});
		});
		
		/* 낙찰 취소하기 */
		
		$(document).delegate('.btn_bid_cancel', 'click', function() {
			var OFFER_NUM = $(this).attr('value');
			
			alertify.confirm("낙찰 취소", "정말 취소하시겠습니까?", function() {
				var redirect = 'estimate_detail.es?ESTIMATE_NUM=' + es_num;
				
				var params = {"OFFER_STATE" : 3, "OFFER_NUM" : OFFER_NUM, "ESTIMATE_NUM" : es_num, "redirect" : redirect }
				console.log(params);
				$.ajax ({
					url:"/NAGAGU/offer_bid.es",
					type:"POST",
					data:params,
					contentType:'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
							getOfferList();
							alertify.success('낙찰이 취소되었습니다.');
					},
					error: function(data) {
						console.log(data.res);
				}
				});
			}, function() {
			});
			
			return false;
		});
		
		/* 견적 제시 */
		$('#btn_offer').click(function() {
			var offer_price = $('#offer_price').val();
			var offer_content = $('#offer_content').val();
			var workshop_chk = $('.item_head').length;
			console.log(workshop_chk);
			console.log(login_state);
			
			if (login_state == 2 && workshop_chk > 0) {
				alert('이미 제안글을 등록하셨습니다.');
				
				return false;
			}
			
			if (!checkPrice.test(offer_price)) {
				alert("가격란은 숫자만 입력 가능합니다.");
				$('offer_price').focus();
				
				return false;
			}
			if (offer_price == "") {
				alert("가격을 입력해주십시시오.");
				$('#offer_price').focus();
				
				return false;
			}
			if (offer_content == "") {
				alert("내용을 입력해주십시오.");
				$('#offer_content').focus();
			}
			
			var params = $('#offerForm').serialize();
			$.ajax({
				url:'/NAGAGU/offer_insert.es',
				type:'POST',
				data:params,
				aync:false,
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success : function(data) {
					alert("제안글이 성공적으로 등록되었습니다.");
					location.reload();
				},
			     error:function(request,status,error){
			         alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
				
			});

		});
		
		/* 견적 수정 모달 */
		$(document).delegate('.btn_offer_modify', 'click', function() {
			
			var m_offer_num = $(this).attr('value');
			$('#modify_offer_num').val(m_offer_num);
			var m_price = $('#offer_price_' + m_offer_num).html();
			$('#modify_offer_price').val(unComma(m_price));
			var m_content = $('#offer_content_' + m_offer_num).html();
			$('#modify_offer_content').val(m_content);

			return false;
		});
		
		/* 견적 수정 신청 */
		$('#btn_modify_submit').click(function() {
			var modify_price = $('#modify_offer_price').val();
			var modify_content = $('#modify_offer_content').val();
			
			if (!checkPrice.test(modify_price)) {
				alert("가격란은 숫자만 입력 가능합니다.");
				$('#modify_offer_price').focus();
				
				return false;
			}
			if (modify_price == "") {
				alert("가격을 입력해주십시시오.");
				$('#modify_offer_price').focus();
				
				return false;
			}
			if (modify_content == "") {
				alert("내용을 입력해주십시오.");
				$('#modify_offer_content').focus();
			}
			
			var params = $('#modifyForm').serialize();
			$.ajax({
				url:'/NAGAGU/offer_modify.es',
				type:'POST',
				data:params,
				aync:false,
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				success : function(data) {
					alert("제안글이 성공적으로 수정되었습니다.");
					location.reload();
				},
			     error:function(request,status,error){
			         alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
				
			});
		});
		
		/* 견적 제안 삭제 */
		$(document).delegate('.btn_offer_delete', 'click', function() {
			if (confirm("정말로 삭제하시겠습니까?")) {
				var of_num = $(this).attr('value');
				var es_num = <%=ESTIMATE_NUM%>;
				console.log(of_num);
				console.log(es_num);
				var params = {"OFFER_NUM" : of_num, "ESTIMATE_NUM" : es_num };
				console.log(params);
				$.ajax({
					url:'/NAGAGU/offer_delete.es',
					type:'POST',
					data:params,
					aync:false,
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success : function(data) {
						alert("제안글이 성공적으로 삭제되었습니다.");
						getOfferList();
					},
				     error:function(request,status,error){
				         alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					}
					
				});
			
			}

			return false;
		});
		
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
			} <% } %>
		});
		
		getOfferList();
	});
	
	
	function addComma(inputNumber) {
		   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function unComma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}
</script>