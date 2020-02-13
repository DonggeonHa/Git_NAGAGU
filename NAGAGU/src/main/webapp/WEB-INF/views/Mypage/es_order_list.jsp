<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.estimate.EstimateOrderVO" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.text.DecimalFormat" %>
<%
	String MEMBER_EMAIL = (String)session.getAttribute("MEMBER_EMAIL");

	ArrayList<EstimateOrderVO> eoList = (ArrayList<EstimateOrderVO>)request.getAttribute("esOrderList");
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd");
	DecimalFormat dfmp = new DecimalFormat("#,###원");

	int[] esCount;
	for (int i=0; i<7; i++) {
// 		esCount[i] = (int)request.getAttribute("cnt"+i);
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.css">
        <link rel="stylesheet" href="../css/order_list.css">
		<style>
			@font-face {
				font-family: 'KOMACON';
				src:
					url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')
					format('woff');
				font-weight: normal;
				font-style: normal;
			}
            
            img {
            	max-width:100%;
            }
			
			.order-body {
				font-family: '만화진흥원체', 'KOMACON', KOMACON;
				font-size: 15px;
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
	            height:250px;
	        }
	            
		</style>
	</head>
	<body class="order-body">
		<div class="container container-mypage bg-light">
			<div class="row justify-content-center pb-3">
				<div class="card-group text-center d-inline-flex">
					<div class="card my" style="width: 10rem;">
						<a href="mypage.my">
							<div class="card-header">MY</div>
							<div class="card-body">
								<i class="far fa-user-circle fa-4x"></i>
							</div>
						<div class="card-footer bg-transparent ">Follow</div>
						</a>
					</div>
	
					<div class="card">
						<div class="card-header">ORDER</div>
						<div class="card-body">
							<i class="fas fa-truck-pickup fa-4x"></i>
						</div>
						<div class="card-footer bg-transparent ">주문 글</div>
						</a>
					</div>
				</div>
			</div>
		
			<div>
				<nav>
					<div class="nav d-flex justify-content-between shadow p-3 mb5 bg-white rounded" id="nav-tab" role="tablist">
				    	<a class="nav-item nav-link active" id="nav-waiting-tab" data-toggle="tab" href="#nav-waiting" role="tab" aria-controls="nav-home" aria-selected="true">
				    		<dl class="text-center">
				    			<dt>입금대기</dt>
				    			<dd></dd>
				    			<dd>2</dd>
				    		</dl>
				    	</a>
						<div class="text-center align-self-center">
							<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
						</div>
				    	<a class="nav-item nav-link" id="nav-finish-tab" data-toggle="tab" href="#nav-finish" role="tab" aria-controls="nav-profile" aria-selected="false">
				    		<dl class="text-center">
				    			<dt>결제완료</dt>
				    			<dd></dd>
				    			<dd>0</dd>
				    		</dl>
				    	</a>
				    	<div class="text-center align-self-center">
							<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
						</div>
				    	<a class="nav-item nav-link" id="nav-ready-tab" data-toggle="tab" href="#nav-ready" role="tab" aria-controls="nav-contact" aria-selected="false">
				    		<dl class="text-center">
				    			<dt>배송준비</dt>
				    			<dd></dd>
				    			<dd>0</dd>
				    		</dl>
				    	</a>
				    	<div class="text-center align-self-center">
							<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
						</div>
						<a class="nav-item nav-link" id="nav-shipping-tab" data-toggle="tab" href="#nav-shipping" role="tab" aria-controls="nav-contact" aria-selected="false">
							<dl class="text-center">
				    			<dt>배송중</dt>
				    			<dd></dd>
				    			<dd>0</dd>
				    		</dl>
						</a>
						<div class="text-center align-self-center">
							<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
						</div>
						<a class="nav-item nav-link" id="nav-completed-tab" data-toggle="tab" href="#nav-completed" role="tab" aria-controls="nav-contact" aria-selected="false">
							<dl class="text-center">
				    			<dt>배송완료</dt>
				    			<dd></dd>
				    			<dd>0</dd>
				    		</dl>
						</a>
						<div class="text-center align-self-center">
							<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
						</div>
						<a class="nav-item nav-link" id="nav-confirmation-tab" data-toggle="tab" href="#nav-confirmation" role="tab" aria-controls="nav-contact" aria-selected="false">
							<dl class="text-center">
				    			<dt>구매확정</dt>
				    			<dd></dd>
				    			<dd>0</dd>
				    		</dl>
						</a>
					</div>
				</nav>
				
				<%
				if (eoList.size() == 0) {
				%>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active shadow p-3 mb5 bg-white" id="nav-waiting" role="tabpanel" aria-labelledby="nav-waiting-tab" style="padding-top: 30%;">
						<div class="no_list">
						주문한 수제 가구가 없습니다.
						</div>
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
					<div class="tab-pane fade show active shadow p-3 mb5 bg-white" id="nav-waiting" role="tabpanel" aria-labelledby="nav-waiting-tab" style="padding-top: 30%;">
						<div class="row" style="padding: 0 0 0 5%;">
							<div class="col-7">
								<b><%=vo.getES_ORDER_NUM() %> | <%=df.format(vo.getES_ORDER_DATE()) %></b>	
							</div>
							<div class="col-5 d-flex justify-content-end">
								<a href="./es_order_detail.my?ES_ORDER_NUM=<%=vo.getES_ORDER_NUM()%>"><font size="2">상세보기 </font></a>
							</div>
						</div>
						<hr>
						<div style="padding: 0 0 0 5%;">
							<table class="table table-borderless">
							    <tr>
							    	<td>
							    		<div class="row">
							    			<div class="thumbImg">
							    				<img src="<%=vo.getES_ORDER_PIC() %>" style="padding: 0 3% 3% 0;">
							    			</div>
							    			<dl>	
							    				<dt><%=vo.getES_ORDER_TITLE() %></dt>
												<dd><a href=""><%=vo.getES_ORDER_WORKSHOP() %></dd>
							    			
							    			</dl>
							    		</div>
							      		
							  		</td>
							    	<td>
										<dl>
											<dd><%=dfmp.format(vo.getES_ORDER_PRICE()) %></dd>
											<dd>
												<% if (eoState == 0) { %>
												입금대기
												<% } else if (eoState == 1) { %>
												결제완료
												<% } else if (eoState == 2) { %>
												제작중
												<% } else if (eoState == 3) { %>
												배송준비
												<% } else if (eoState == 4) { %>
												배송중
												<% } else if (eoState == 5) { %>
												배송완료
												<% } else if (eoState == 6) { %>
												구매확정
												<% } %>
											</dd>
										</dl>
							    	</td>
							    	<td class="align-self-center eo_tab">
									<%  if (eoState == 0) { %>
									    <button class="btn btn-outline-dark btn_pay">결제</button>
									<%} else if (eoState < 4) { %>
										<button class="btn btn-outline-dark btn_modify">배송정보 수정</button>
									<% } 
										if (eoState < 4) {%>
									    <button class="btn btn-outline-dark btn_cancel" es_num =<%=vo.getES_ORDER_ESTIMATE() %> offer_num=<%=vo.getES_ORDER_OFFER()%>>주문취소</button>
									<% } else if (eoState >= 4) {%>
										<button class="btn btn-outline-dark btn_return">>A/S</button>
										<button class="btn btn-outline-dark btn_return">반품</button>
									<% } %>
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

		<script>
			
		$(document).delegate('.btn_cancel', 'click', function() {
			if (confirm("정말 취소하시겠습니까?")) {
				var OFFER_NUM = $(this).attr('offer_num');
				var ES_NUM = $(this).attr('es_num');
				location.href='offer_bid.es?OFFER_STATE=3&ESTIMATE_NUM=' + ES_NUM + '&OFFER_NUM=' + OFFER_NUM + '&redirect=mypage_estimate.my';
			}
			return false;
		})
		
		</script>
		
		<script src="https://kit.fontawesome.com/97dbc99ea1.js" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/b74b42490f.js" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>