<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		System.out.println("estimateDetail 로그인 회원 : " + member_mail);
		login_state = 1;
	}
	else {
		if (session.getAttribute("WORKSHOP_NAME") != null) {
			workshop_name = (String)session.getAttribute("WORKSHOP_NAME");
			login_state = 2;
		}
	}
	
	int ESTIMATE_NUM = (int)request.getAttribute("ESTIMATE_NUM");
	String mailChk = vo.getESTIMATE_MEMBER();
	
	int nowpage = 1;
	if (request.getAttribute("page")!=null) {
		nowpage = Integer.parseInt((String)request.getAttribute("page"));
	}
	
	
	if ((String)session.getAttribute("WORKSHOP_NAME")!="") {
		workshop_name = (String)session.getAttribute("WORKSHOP_NAME");
	}
	
	String images = vo.getESTIMATE_FILE();
	System.out.println(images);
	String[] imgArr = images.split(",");
%>

    
<!DOCTYPE html>
<html>
	<head>
	<title>견적문의 상세</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Store/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Store/slick/slick-theme.css"/>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	
	
	<style type="text/css">
		@font-face {
			font-family: 'KOMACON';
			src:
				url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')
				format('woff');
			font-weight: normal;
			font-style: normal;
		}
		
		.order-body {
			font-family: '만화진흥원체', 'KOMACON', KOMACON;
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
			width:65%;
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
		
		.bt-xs {
			width:20px;
			height:14px;
			font-size:12px;
		}

	</style>
	</head>
	
	
	<body class="order-body">
		<!-- content start -->
		<div class="container">
			<br />
			<br />
			<br />
			<div class="row justify-content-between title">
				<div class="col-10 page-tap">
					<h6><a href="estmate.es">STORE 견적 문의</a> > 상세보기 </h6>
				</div>
			</div>			
			<div class="row justify-content-center pb-3">
				<div class="slider-for"></div>
				<div class="slider-nav">
				<%
					for (int i=0; i<imgArr.length; i++) {
				%>
					<div><img src=<%=imgArr[i] %>></div>
				<% 
					} 
				%>
				</div>
			</div>
			<br/><br/>
				<div class="row text-center pt-1 pb-1 ">
					<div class="col-md-3 d-flex justify-content-end title">제품 종류</div>
					<div class="col-md-9 d-flex justify-content-start">
						<%=vo.getESTIMATE_CATEGORY() %>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-3 d-flex justify-content-end title">소재</div>
					<div class="col-md-9 d-flex justify-content-start">
						<%=vo.getESTIMATE_SOURCE() %>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-3 d-flex justify-content-end title">색상(염색)</div>
					<div class="col-md-9 d-flex justify-content-start">
						<%=vo.getESTIMATE_COLOR() %>
					</div>
				</div>
				<div class="row text-center pt-1 pb-1">
					<div class="col-md-3 d-flex justify-content-end title">코팅</div>
					<div class="col-md-9 d-flex justify-content-start">
						<%=vo.getESTIMATE_COAT() %>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-3 d-flex justify-content-end title">규격</div>
					<div class="col-md-9 d-flex justify-content-start">
						<%=vo.getESTIMATE_SIZE() %>
					</div>
				</div>
				<div class="row text-center pt-1 pb-1">
					<div class="es_content justify-content-center">
						<%=vo.getESTIMATE_CONTENT() %>
					</div>
				</div>
	
				<div class="row justify-content-center pt-5 pl-1 ml-1">
				<% if (login_state==2) { %>
					<button class="btn btn-dark btn-md" alt="" data-toggle="modal" data-target="#offerFormModal" aria-haspopup="true" aria-expanded="false">
					입찰하기</button>&nbsp;&nbsp;&nbsp;
				<% } %>
					<button class="btn btn-dark btn-md" onclick="location.href='estimate.es?page=<%=nowpage%>'">목록보기</button>
				</div>
			<br/><br/>
		
		<br/><br/>
		<form id="offer_data">
			<input type="hidden" name="ESTIMATE_NUM" value=<%=ESTIMATE_NUM%>>
			<input type="hidden" id="OFFER_PAGE" name="OFFER_PAGE" value=1>
		</form>
		<div id="offerWrap" class ="offer_wrap row justify-content-center">
			<div id="offerTable">
				<table id="offerList">
					<thead>
						<tr>
							<th width="10%">번호</th>
							<th width="20%">공방 이름</th>
							<th width="15%">제시 가격</th>
							<th width="15%">문의</th>				
							<th width="15%">낙찰</th>
						<tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		
		<!--  modal -->
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
						<input type="hidden" name="OFFER_ESTIMATE" value="<%=vo.getESTIMATE_NUM() %>">
						<input type="hidden" name="OFFER_WORKSHOP" value="<%=workshop_name %>">
							<label class="modalLabel" for="OFFER_PRICE">제시 가격</label>
							<input class="modalInput" type="text" name="OFFER_PRICE"><br>
							<label class="modalLabel" for="OFFER_CONTENT">내용</label>
							<textarea class="modalInput" name="OFFER_CONTENT"></textarea>
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
	var login_state = <%=login_state%>
	
		$(document).ready(function (){
			
			function getOfferList () {
				if ('<%=member_mail%>' != '<%=mailChk%>') {
					var output='';
					output += '<tr><td class="list_caution" colspan="5">제안글은 <b><font color="#f2400">작성자</font></b>만 열람 가능합니다</td></tr>';
					
					$('#offerList > tbody').html(output);
					
					return false;
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
						var output = '';
						var pagination = '';
						
						var offer_page = data.offer_page;
						var max_page = data.offer_maxpage;
						var ol = data.offerList;
						var rnum = data.offer_rnum;
						
						if (data.offerCount == 0) {
							output += '<tr><td colspan="5" class="list_caution">등록된 제안이 없습니다</td><tr>';
						}
						
						else {
							/* 댓글 리스트 작성*/
							$.each(ol, function(index, item) {
								var offerPrice = addComma(item.offer_PRICE);
								
								output += '<tr value="' + index + '" class="item_head">';
								output += '<td>' + rnum + '</td>';
								output += '<td><b>' + item.offer_WORKSHOP + '</b></td>';
								output += '<td>' + offerPrice + '</td>';
								output += '<td><button value="' + item.offer_WORKSHOP + '" class="btn_note btn btn-outline-dark btn-sm">쪽지보내기</button></td>';
								output += '<td><button value="' + item.offer_NUM + '" class="btn_bid btn btn-outline-dark btn-xs">낙찰하기</button></td>';
								output += '</tr>';
								output += '<tr id="item_content_'+ index + '" class="item_content">';
								output += '<td colspan="5">';
								output += '<div class="item_content_body">' + item.offer_CONTENT+ '</div>';
								output += '</td></tr>';
								rnum--;
							});
							
							/* 댓글 페이지네이션 */
							
							if (offer_page == max_page && offer_page > 5) {
								pagination += '<div class="pageNum pageNum pagelink" value="' + Number(offer_page-5) + '">&laqua;</div>';
								pagination += '<div class="pageNum pageNum pagelink" value="' + Number(offer_page-4) + '">' + Number(offer_page-4) + '</a></div>';
								pagination += '<div class="pageNum pageNum pagelink" value="' + Number(offer_page-3) + '">' + Number(offer_page-3) + '</a></div>';
							}
							else if (offer_page == max_page-1 && offer_page > 4) {
								pagination += '<div class="pageNum pageNum pagelink" value="' + Number(offer_page-4) + '">&laqua;</div>';
								pagination += '<div class="pageNum pageNum pagelink" value="' + Number(offer_page-3) + '">' + Number(offer_page-3) + '</a></div>';
							}
							else {
								if (offer_page > 3) {
									pagination += '<div class="pageNum pagelink" value="' + Number(offer_page-3) + '">&laqua;</div>';
								}
							} 
							
							if (offer_page > 2) {
								pagination += '<div class="pageNum pagelink" value="' + Number(offer_page-2) + '">' + Number(offer_page-2) + '</a></div>';
							}
							if (offer_page > 1) {
								pagination += '<div class="pageNum pagelink" value="' + Number(offer_page-1) + '">' + Number(offer_page-1) + '</a></div>';
							}
								pagination += '<div class="pageNum currentpage">' + offer_page + '</div>';
							if (max_page > offer_page) {
								pagination += '<div class="pageNum pagelink" value="' + Number(offer_page+1) + '">' + Number(offer_page+1) + '</a></div>';
							}
							if (max_page > offer_page+1) {
								pagination += '<div class="pageNum pagelink" value="' + Number(offer_page+2) + '">' + Number(offer_page+2) + '</a></div>';
							}
							
							if (offer_page == 1 && max_page > 5) {
								pagination += '<div class="pageNum pagelink" value="' + Number(offer_page+3) + '">' + Number(offer_page+3) + '</a></div>';
								pagination += '<div class="pageNum pagelink" value="' + Number(offer_page+4) + '">' + Number(offer_page+4) + '</a></div>';
								pagination += '<div class="pageNum pagelink" value="' + Number(offer_page+5) + '">&raqua;</div>';
							}
							else if (offer_page == 2 && max_page > 6) {
								pagination += '<div class="pageNum pagelink" value="' + Number(offer_page+3) + '">' + Number(offer_page+3) + '</a></div>';
								pagination += '<div class="pageNum pagelink" value="' + Number(offer_page+4) + '">&raqua;</div>';
							}
							else {
								if (max_page > offer_page+2) {
									pagination += '<div class="pageNum pagelink" value="' + Number(offer_page+3) + '">&raqua;</div>';
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
				window.open('/NAGAGU/noteForm.nt?workshop_name=' + send_workshop, "쪽지 보내기", "width=600 height=800");
				return false;
			});
			
			/* 페이지 이동 */
			$(document).delegate('.pagelink', 'click', function(){
				$('#OFFER_PAGE').val($(this).attr("value"));
				console.log($('#OFFER_PAGE').val());
				getOfferList();
			});
			
			/* 견적 제시 */
			$('#btn_offer').click(function() {
				var params = $('#offerForm').serialize();
				$.ajax({
					url:'/NAGAGU/offer_insert.es',
					type:'POST',
					data:params,
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					dataType : false,
					success : function(data) {
						alert(data);
					},
					error : function(data) {
						alert('ajax 통신 실패!');
					}
					
				});
				event.preventDefault();
			});
			
			getOfferList();
		});
		
		function addComma(inputNumber) {
			   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	</script>
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

	</body>
</html>