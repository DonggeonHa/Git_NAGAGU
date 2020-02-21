<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.estimate.EstimateOrderVO" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.text.DecimalFormat" %>
<%
	String MEMBER_EMAIL = (String)session.getAttribute("MEMBER_EMAIL");
	String MEMBER_NAME = (String)session.getAttribute("MEMBER_NAME");
	String MEMBER_PHONE = (String)session.getAttribute("MEMBER_PHONE");

	ArrayList<EstimateOrderVO> eoList = (ArrayList<EstimateOrderVO>)request.getAttribute("esOrderList");
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd");
	DecimalFormat dfmp = new DecimalFormat("#,###원");

	/* 상태별 상품 개수 */
	
	int[] esCount = new int[7];
	for (int i=0; i<7; i++) {
 		esCount[i] = (int)request.getAttribute("esCount"+i);
	}
%>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order_list.css">
<style>
          img {
          	max-width:100%;
          }
          
	.order-body {
		font-family: '만화진흥원체', 'KOMACON', KOMACON;
		font-size: 15px;
          }
          
          /* ----------------------------------------------------------- */
          
	.container-mypage{
		margin-top: 50px ;
		margin-bottom: 50px ;				 
	}			
	.container-mypage a,.container-mypage  a:link,.container-mypage  a:hover {
		text-decoration: none;
		color: white !important;
	} 
	
    .card-hover:hover {
		transition: 1s;
		transform: scale(1.2);
		z-index: 1;
		box-shadow: 10px 15px 7px 0px #333333;
	}
	
	.card {
		background-color: #1b1b27;
		margin: 15px 15px 15px 15px;
		color: white;
	}
	.card-wrap{
		justify-content: center;
		padding-left:50px; 
	}
	
	@media screen and (max-width: 600px) {
		.card {
			width: 2.5rem;
			font-size: 0.1rem;
			margin: 2px 2px 2px 2px;
		}
		.card-header, .card-body, .card-footer {
			padding: 1px !important; 
		}
		.card-wrap{
			justify-content: start;
			padding-left: 20px; 
		} 
	}
	@media screen and (min-width: 600px) {
		.card {
			width: 4rem;
			font-size: 0.3rem;
			margin: 2px 2px 2px 2px;
		}
		.card-header, .card-body, .card-footer {
			padding: 4px !important; 
		}
	}
	@media screen and (min-width: 992px) {
		.card {
			width: 6rem;
			font-size: 0.6rem;
			margin: 2px 2px 2px 2px;
		}
		.card-header, .card-body, .card-footer {
			padding: 10px !important; 
		}
	}
	@media ( min-width : 1200px) {
		.card {
			width: 8rem !important;  
			font-size: 0.7rem; 
		}
		.card-header, .card-body, .card-footer {
			padding: 18px !important;  
		}
	} 
	
	.tab-pane .col-4 {
		padding-bottom: 50px;
	}
	li>.active {
		background-color: #1b1b27 !important;
		color: white !important;
	}
	.nav-item a {
		color: black;
	}
	img {
	width: 100%;
	height: auto;
	}
	.picOutput{
		padding-left: 0px !important;
	}
	.tab-content{
		min-height:38vh;
	}
	.tab-content img{
		max-height:200px;
	}
          
          /* ----------------------------------------------------------- */
       
    #nav-tab .nav-item {
    	color:black;
    }
    
    #nav-tab .nav-item:hover {
    	color:#737373;
    }
       
    .container {
        margin-top:30px;
    }
          
	.thumbImg {
		width:256px;
		height:256px;
		overflow:hidden;
		display:block;
		margin-right:10px;
	}
	
	.thumbImg img {
		display:block;
		min-height:100%;
		min-width:100%;
		-ms-interpolation-mode: bicubic;
	}
	
	.eo_tab {
		width:100px;
	}
	
	.eo_tab .btn {
		width:100%;
		font-size:0.8rem;
		margin-bottom:5px;
	}
	
       .no_list {   
           text-align:center;
           font-size:1.5rem;
           line-height:250px;
           width:100%;
           height:250px;
       }
         
    .item_header {
    	width:100%;
    }  
</style>
	<div class="container-mypage " role="main">
		<div class="row card-wrap  text-center">
			<div class="card card-hover">
				<a href="mypage_like.my" class="href">
					<div class="card-header">Like</div>
					<div class="card-body">
						<i class="fab fa-gratipay fa-4x"></i>
					</div>
				</a>
			</div>

			<div class="card card-hover">
				<a href="mypage_pic.my" class="href">
					<div class="card-header">COMMUNITY</div>
					<div class="card-body">
						<i class="fas fa-images fa-4x"></i>
					</div>
				</a>
			</div>

			<div class=" card card-hover">
				<a href="mypage_edit.my" class="href">
					<div class="card-header">EDIT</div>
					<div class="card-body">
						<i class="fas fa-user-edit fa-4x"></i>
					</div>
				</a>
			</div>
			<div class="card card-hover">
				<a href="mypage_class.my" class="href">
					<div class="card-header">CLASS</div>
					<div class="card-body">
						<i class="fas fa-school fa-4x"></i>
					</div>
				</a>
			</div>

			<div class="card my">
				<div class="card-header">MY</div>
				<div class="card-body">
					<i class="far fa-user-circle fa-4x"></i>
				</div>
			</div>
			<div class="card card-hover">
				<a href="order_list.my" class="href">
					<div class="card-header">ORDER</div>
					<div class="card-body">
						<i class="fas fa-truck-pickup fa-4x"></i>
					</div>
				</a>
			</div>
			<div class="card card-hover ">
				<a href="mypage_reply.my" class="href">
					<div class="card-header">REPLY</div>
					<div class="card-body">
						<i class="fab fa-replyd fa-4x"></i>
					</div>
				</a>
			</div>
			<div class="card card-hover ">
				<a href="mypage_review.my" class="href">
					<div class="card-header">REVIEW</div>
					<div class="card-body">
						<i class="fas fa-keyboard fa-4x"></i>
					</div>
				</a>  
			</div>
			<div class="card card-hover ">
				<a href="mypage_estimate.my" class="href">
					<div class="card-header">견적</div>
					<div class="card-body">
						<i class="fas fa-keyboard fa-4x"></i>
					</div>
				</a>
			</div>
		</div>
	</div>
<div class="container bg-light">
	<div>
		<nav>
			<div
				class="nav d-flex justify-content-between shadow p-3 mb5 bg-white rounded"
				id="nav-tab" role="tablist">
				<a class="nav-item nav-link active" idx=0 id="nav-waiting-tab"
					data-toggle="tab" href="#nav-waiting" role="tab"
					aria-controls="nav-home" aria-selected="true">
					<dl class="text-center">
						<dt>입금대기</dt>
						<dd></dd>
						<dd><%=esCount[0] %></dd>
					</dl>
				</a>
				<div class="text-center align-self-center">
					<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
				</div>
				<a class="nav-item nav-link" idx=1 id="nav-finish-tab"
					data-toggle="tab" href="#nav-finish" role="tab"
					aria-controls="nav-profile" aria-selected="false">
					<dl class="text-center">
						<dt>결제완료</dt>
						<dd></dd>
						<dd><%=esCount[1] %></dd>
					</dl>
				</a>
				<div class="text-center align-self-center">
					<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
				</div>
				<a class="nav-item nav-link" idx=2 id="nav-crafting-tab"
					data-toggle="tab" href="#nav-crafting" role="tab"
					aria-controls="nav-contact" aria-selected="false">
					<dl class="text-center">
						<dt>제작중</dt>
						<dd></dd>
						<dd><%=esCount[2] %></dd>
					</dl>
				</a>
				<div class="text-center align-self-center">
					<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
				</div>
				<a class="nav-item nav-link" idx=3 id="nav-ready-tab"
					data-toggle="tab" href="#nav-ready" role="tab"
					aria-controls="nav-contact" aria-selected="false">
					<dl class="text-center">
						<dt>배송준비</dt>
						<dd></dd>
						<dd><%=esCount[3] %></dd>
					</dl>
				</a>
				<div class="text-center align-self-center">
					<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
				</div>
				<a class="nav-item nav-link" idx=4 id="nav-shipping-tab"
					data-toggle="tab" href="#nav-shipping" role="tab"
					aria-controls="nav-contact" aria-selected="false">
					<dl class="text-center">
						<dt>배송중</dt>
						<dd></dd>
						<dd><%=esCount[4] %></dd>
					</dl>
				</a>
				<div class="text-center align-self-center">
					<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
				</div>
				<a class="nav-item nav-link" idx=5 id="nav-completed-tab"
					data-toggle="tab" href="#nav-completed" role="tab"
					aria-controls="nav-contact" aria-selected="false">
					<dl class="text-center">
						<dt>배송완료</dt>
						<dd></dd>
						<dd><%=esCount[5] %></dd>
					</dl>
				</a>
				<div class="text-center align-self-center">
					<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
				</div>
				<a class="nav-item nav-link" idx=6 id="nav-confirmation-tab"
					data-toggle="tab" href="#nav-confirmation" role="tab"
					aria-controls="nav-contact" aria-selected="false">
					<dl class="text-center">
						<dt>구매확정</dt>
						<dd></dd>
						<dd><%=esCount[6] %></dd>
					</dl>
				</a>
			</div>
		</nav>

		<%
		if (eoList.size() == 0) {
	%>
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active shadow p-3 mb5 bg-white"
				id="nav-waiting" role="tabpanel" aria-labelledby="nav-waiting-tab"
				style="padding-top: 30%;">
				<div class="no_list">등록된 주문이 없습니다.</div>
			</div>
		</div>
		<%
		} else {
			for (int i=0; i<eoList.size(); i++) {
				EstimateOrderVO vo = eoList.get(i);
				int eoState = vo.getES_ORDER_STATE();
				System.out.println("eoState : " + eoState);
	%>

		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active shadow p-3 mb5 bg-white"
				id="nav-waiting" role="tabpanel" aria-labelledby="nav-waiting-tab"
				style="padding-top: 30%;">
				<div class="row item_header" style="padding: 0 0 0 5%;">
					<div class="col-7">
						<b><%=vo.getES_ORDER_NUM()%> | <%=df.format(vo.getES_ORDER_DATE())%></b>
					</div>
					<div class="col-5 d-flex justify-content-end">
						<a
							href="./estimate_detail.es?ESTIMATE_NUM=<%=vo.getES_ORDER_ESTIMATE()%>"><font
							size="2">상세보기 </font></a>
					</div>
				</div>
				<br>
				<div class="row" style="padding: 0 0 0 5%;">
					<table class="table table-borderless">
						<tr>
							<td>
								<div class="row">
									<div class="thumbImg">
										<img src="<%=vo.getES_ORDER_PIC()%>"
											style="padding: 0 3% 3% 0;">
									</div>
									<dl>
										<dt><%=vo.getES_ORDER_TITLE()%></dt>
										<dd>
											<a href="workshop_page.my?ES_ORDER_WORKSHOP=<%=vo.getES_ORDER_WORKSHOP()%>"><%=vo.getES_ORDER_WORKSHOP()%>
										</dd>
									</dl>
								</div>
							</td>
							<td>
								<dl>
									<dd><%=dfmp.format(vo.getES_ORDER_PRICE())%></dd>
									<dd>
										<%
											if (eoState == 0) {
										%>
										입금대기
										<%
											} else if (eoState == 1) {
										%>
										결제완료
										<%
											} else if (eoState == 2) {
										%>
										제작중
										<%
											} else if (eoState == 3) {
										%>
										배송준비
										<%
											} else if (eoState == 4) {
										%>
										배송중
										<%
											} else if (eoState == 5) {
										%>
										배송완료
										<%
											} else if (eoState == 6) {
										%>
										구매확정
										<%
											}
										%>
									</dd>
								</dl>
							</td>
							<td class="align-self-center eo_tab">
								<%
									if (eoState == 0) {
								%>
								<button class="btn btn-outline-dark btn_pay"
									onclick="location.href='mypage_estimate_checkout.my?ES_ORDER_NUM=<%=vo.getES_ORDER_NUM()%>'">결제</button>
								<%
									} else if (eoState < 4) {
								%>
								<button class="btn btn-outline-dark btn_modify"
									onclick="location.href='mypage_estimate_updateForm.my?ES_ORDER_NUM=<%=vo.getES_ORDER_NUM()%>'">배송정보
									수정</button> 
								<button class="btn btn-outline-dark btn_modify"
									onclick="window.open('/NAGAGU/chatRoom.ch?ES_ORDER_NUM=<%=vo.getES_ORDER_NUM()%>', '1:1채팅방', 'width=400 height=740')">1:1 채팅</button> <%
 	}
 			if (eoState < 4) {
 %>
								<button class="btn btn-outline-dark btn_cancel"
									es_num=<%=vo.getES_ORDER_ESTIMATE()%>
									offer_num=<%=vo.getES_ORDER_OFFER()%>>취소</button> <%
 	} else if (eoState >= 4) {
 %>
								<button class="btn btn-outline-dark btn_return">A/S</button>
								<button class="btn btn-outline-dark btn_return">반품</button> <%
 	}
 %>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<%
			}
			}
		%>
	</div>
</div>

<script>	
	$(document).delegate('.btn_cancel', 'click', function() {
			var OFFER_NUM = $(this).attr('offer_num');
			var es_num = $(this).attr('es_num');
			alertify.confirm("낙찰 취소", "정말 취소하시겠습니까?", function() {
				var params = {"OFFER_STATE" : 3, "OFFER_NUM" : OFFER_NUM, "ESTIMATE_NUM" : es_num}
				console.log(params);
				$.ajax ({
					url:"/NAGAGU/offer_bid.es",
					type:"POST",
					data:params,
					contentType:'application/x-www-form-urlencoded; charset=utf-8',
					success: function(data) {
						location.href='mypage_estimate.my';
					},
					error: function(data) {
						console.log(data.res);
				}
				});
			}, function() {
			});
		return false;
	})
	
	$('.nav-link').click(function() {
		var ES_ORDER_STATE = $(this).attr('idx');
		
		window.location.href='mypage_estimate.my?ES_ORDER_STATE=' + ES_ORDER_STATE;  
	});
	$(document).ready(function(){
		$('.card-wrap').children().eq(8).css('background-color','#ef900e')
	})
</script>