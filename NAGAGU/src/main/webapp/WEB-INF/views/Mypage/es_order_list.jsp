<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			
			.order-body {
				font-family: '만화진흥원체', 'KOMACON', KOMACON;
				font-size: 15px;
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
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active shadow p-3 mb5 bg-white rounded" id="nav-waiting" role="tabpanel" aria-labelledby="nav-waiting-tab" style="padding-top: 30%;">
						<div class="row" style="padding: 0 0 0 5%;">
							<div class="col-7">
								<b>13077406 | 2020.01.10</b>	
							</div>
							<div class="col-5 d-flex justify-content-end">
								<a href="./order_detail.my"><font size="2">상세보기 ></font></a>
							</div>
						</div>
						<hr>
						<div style="padding: 0 0 0 5%;">
							<table class="table table-borderless">
							    <tr>
							    	<td>
							    		<div class="row">
							    			<img class="basket-size" src="${pageContext.request.contextPath}/resources/images/Mypage/basket.jpg" style="padding: 0 3% 3% 0;">
							    			<dl>	
							    				<dt>모던 트롤리 스윙 빨래바구니 2단/3단</dt>
							    			
							    			</dl>
							    		</div>
							      		
							  		</td>
							    	<td>
										<dl>
											<dd>★반짝특가★ 03_모던 트롤리 뉴 스윙 2단 빨래바구니</dd>
											<dd>23,900원 | 1개</dd>
											<dd><font color="orange"><b>입금대기 | 일반택배배송</b></font></dd>
										</dl>
							    	</td>
							    	<td class="align-self-center">
							    		무료배송
							    	</td>
							    </tr>
							    <tr>
							    	<td>
							    		<div class="row">
							    			<img class="basket-size" src="${pageContext.request.contextPath}/resources/images/Mypage/basket.jpg" style="padding: 0 3% 3% 0;">
							    			<dl>	
							    				<dt>모던 트롤리 스윙 빨래바구니 2단/3단</dt>
							    			</dl>
							    		</div>
							      		
							  		</td>
							    	<td>
										<dl>
											<dd>★반짝특가★ 03_모던 트롤리 뉴 스윙 2단 빨래바구니</dd>
											<dd>23,900원 | 1개</dd>
											<dd><font color="orange"><b>입금대기 | 일반택배배송</b></font></dd>
										</dl>
							    	</td>
							    	<td class="align-self-center">
							    		무료배송
							    	</td>
							    </tr>
							</table>
						</div>
					</div>
                </div>
                
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active shadow p-3 mb5 bg-white rounded" id="nav-waiting" role="tabpanel" aria-labelledby="nav-waiting-tab" style="padding-top: 30%;">
						<div class="row" style="padding: 0 0 0 5%;">
							<div class="col-7">
								<b>13077406 | 2020.01.10</b>	
							</div>
							<div class="col-5 d-flex justify-content-end">
								<a href="./order_detail.my"><font size="2">상세보기 ></font></a>
							</div>
						</div>
						<hr>
						<div style="padding: 0 0 0 5%;">
							<table class="table table-borderless">
							    <tr>
							    	<td>
							    		<div class="row">
							    			<img class="basket-size" src="${pageContext.request.contextPath}/resources/images/Mypage/basket.jpg" style="padding: 0 3% 3% 0;">
							    			<dl>	
							    				<dt>모던 트롤리 스윙 빨래바구니 2단/3단</dt>
							    			
							    			</dl>
							    		</div>
							      		
							  		</td>
							    	<td>
										<dl>
											<dd>★반짝특가★ 03_모던 트롤리 뉴 스윙 2단 빨래바구니</dd>
											<dd>23,900원 | 1개</dd>
											<dd><font color="orange"><b>입금대기 | 일반택배배송</b></font></dd>
										</dl>
							    	</td>
							    	<td class="align-self-center">
							    		무료배송
							    	</td>
							    </tr>
							    <tr>
							    	<td>
							    		<div class="row">
							    			<img class="basket-size" src="${pageContext.request.contextPath}/resources/images/Mypage/basket.jpg" style="padding: 0 3% 3% 0;">
							    			<dl>	
							    				<dt>모던 트롤리 스윙 빨래바구니 2단/3단</dt>
							    			</dl>
							    		</div>
							      		
							  		</td>
							    	<td>
										<dl>
											<dd>★반짝특가★ 03_모던 트롤리 뉴 스윙 2단 빨래바구니</dd>
											<dd>23,900원 | 1개</dd>
											<dd><font color="orange"><b>입금대기 | 일반택배배송</b></font></dd>
										</dl>
							    	</td>
							    	<td class="align-self-center">
							    		무료배송
							    	</td>
							    </tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			
		</div>

		<script src="https://kit.fontawesome.com/97dbc99ea1.js" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/b74b42490f.js" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>