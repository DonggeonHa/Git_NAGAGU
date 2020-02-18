<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.css">
<style>
	.container{
		margin-bottom: 100px;
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
		background-color: #1b1b27 !important;
		margin: 15px 15px 15px 15px;
		color: white;
	}
	.my {
		background-color: #ef900e !important;
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
	/* --------------------------------------------- */
	.tab-pane .col-4 {
		padding-bottom: 50px;
	}
	li>.active {
		background-color: #1b1b27 !important;
		color: white !important;
	}
	/* .tab-content .tab-pane.active {
		display: flex;
	} */
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
	.basket-size {
	width: 100px;
	height: 100px;
	}
	.imgsize {
		width: 120px;
		height: 120px;
	}
	.card, .card a:link, .card a:visited, .card.my a {
		color: white;
		text-decoration: none;
	}
	
	.container-mypage{
		margin-top: 50px ;
		margin-bottom: 50px ;				 
	}		
	/* kt */
	a dl.text-center { 
		color: black;
	}
	.each-row{
		margin-top:5px;  	 
	}
	.output b{
		margin-left:15px;
	}
	.brief{
		margin-top:15px;
	}
	.main-output img{
		width : 100%;
		height: auto;
	}
	.main-output {
		font-weight: 700;
		margin-top: 15px;
	}
	.each-row {
		margin-bottom: 15px;
		border-bottom: 1px solid grey;
		border-color: rgba(0, 0, 0, 0.2);
	}
	.each-row img {
		width: 100px;
		height: 100px;
	}
	.output a, .output a:link, .output a:hover {
		text-decoration: none !important;
		color: black !important;
	}
    .category *{
        align-self: center;
        text-align: center;
        color: rgb(0, 0, 0, 0.6);  
    }
	 .basic_price, .shipPrice, .chongprice {
		margin-bottom: 0;
		margin-top: 10px;
	}
	.category{
/* 		padding-bottom: 10px;
		padding-top: 10px; */
		/* background-color: rgba(239,144,14,0.3); */
		border-bottom: 1px solid rgba(239,144,14,0.3);
		border-top: 1px solid rgba(239,144,14,0.3);
		color: rgb(0, 0, 0, 0.2) !important;
	}.category *{
		align-items: baseline;
		text-align: center;
	}
	.values *{
		margin-top: 10px;
		text-align: center;
	}
	.amount,.basic_price{
		margin-top: 0;
	}
	.totalShipPrice,.totalPayPrice,.totalPrice{
		padding-right:25px !important;
	}
	.font_change{
		font-size:1.2rem !important; 
	}
	.values b{
		margin: 0 auto;
	}
	.order_tab{
		margin-top: 50px;
		margin-left: 0px;
		padding-left: 0px;
		/* border-top: 1px solid rgb(0,0,0,1); */ 
	} 
    .price_wrap div{
    	margin-top: 0px;
    }.end{
    	/* background-color: rgba(239,144,14,0.3);
    	border-top: 2px solid rgb(0,0,0,1); */ 
    }
</style>

<div class="container-mypage" role="main">
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
	<nav>
		<div class="nav d-flex justify-content-between shadow p-3 mb5 bg-white rounded" id="nav-tab" role="tablist">
 	        <a href="./mypage_order.my" class="nav-item nav-link" status="0" id="unfinish" role="tab" aria-controls="nav-profile" aria-selected="false"> 
                <dl class="text-center">
                    <dt class="unpaid">결제미완료</dt>
                    <dd></dd>
                    <dd class="count_unpaid"></dd>
                </dl>
            </a>
            <div class="text-center align-self-center">
                <i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
            </div>
	    	<a class="nav-item nav-link" status="0" id="nav-finish-tab" data-toggle="tab" href="#nav-finish" role="tab" aria-controls="nav-profile" aria-selected="false">
	    		<dl class="text-center">
	    			<dt>결제완료</dt>
	    			<dd></dd>
	    			<dd class="count_paid"></dd>
	    		</dl>
	    	</a>
	    	<div class="text-center align-self-center">
				<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
			</div>
	    	<a class="nav-item nav-link" status="1" id="nav-ready-tab" data-toggle="tab" href="#nav-ready" role="tab" aria-controls="nav-contact" aria-selected="false">
	    		<dl class="text-center count_ready">
	    			<dt>배송준비</dt>
	    			<dd></dd>
	    		</dl>
	    	</a>
	    	<div class="text-center align-self-center">
				<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
			</div>
			<a class="nav-item nav-link" status="2" id="nav-shipping-tab" data-toggle="tab" href="#nav-shipping" role="tab" aria-controls="nav-contact" aria-selected="false">
				<dl class="text-center">
	    			<dt>배송중</dt>
	    			<dd></dd>
	    			<dd class="count_ing"></dd>
	    		</dl>
			</a>
			<div class="text-center align-self-center">
				<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
			</div>
			<a class="nav-item nav-link" status="3" id="nav-completed-tab" data-toggle="tab" href="#nav-completed" role="tab" aria-controls="nav-contact" aria-selected="false">
				<dl class="text-center">
	    			<dt>배송완료</dt>
	    			<dd></dd>
	    			<dd class="count_ok"></dd>
	    		</dl>
			</a>
			<div class="text-center align-self-center">
				<i class="far fa-arrow-alt-circle-right" style="font-size: 30px;"></i>
			</div>
			<a class="nav-item nav-link" status="4" id="nav-confirmation-tab" data-toggle="tab" href="#nav-confirmation" role="tab" aria-controls="nav-contact" aria-selected="false">
				<dl class="text-center">
	    			<dt>구매확정</dt>
	    			<dd></dd>
	    			<dd class="count_done"></dd>
	    		</dl>
			</a>
		</div>
	</nav>
	
	<div class="tab-content main-output" id="nav-tabContent">
		<div class="tab-pane fade show active shadow p-3 mb5 bg-white rounded" id="nav-waiting" role="tabpanel" aria-labelledby="nav-waiting-tab" style="padding-top: 30%;">
			<div class="row output">
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(){
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
		$(document).on('click','.nav-item',function(){
			var status = $(this).attr('status');
			getBasket(status)
		})
		
		//사진 가져오기 함수 정의
		function getBasket(status){ 
			var category = 'count'
			$.ajax({
				  url: "/NAGAGU/getMyPaidOrder.my",
	              type: "POST",
	              async: false,
	              contentType:
	  				'application/x-www-form-urlencoded; charset=utf-8',
	  				success: function (retVal) {
	  					if(retVal.res=="OK"){
  							//카운트(오더 목록을 받아서)
  							console.log(retVal.getCount)
	                        console.log(retVal.orderList)
	                        /* if(retVal.orderList.length!=0){
	                            $('.count_unpaid').html(''+retVal.orderList.length+'건')
	                        }
  							if(retVal.getCount.length!=0){
  								$('.count_paid').html(''+retVal.getCount.length+'건')
  							} */
  							//오더마다 안에 들어있는 리스트 받아서
  							for(var i=0; i<retVal.getCount.length; i++){
  								var ORDER_AMOUNT= retVal.getCount[i].ORDER_AMOUNT
  								var d_date = new Date(retVal.myPaidOrder[i].ORDER_DATE); 
			        			var date = date_format(d_date);
  								$.ajax({
	  	  							url: "/NAGAGU/getPaidDetail.my",
	  	  				            type: "POST",
	  	  				            data: {'ORDER_AMOUNT':ORDER_AMOUNT},
	  	  				        async: false,
  	  				            contentType:
  	  				  			'application/x-www-form-urlencoded; charset=utf-8',
 	  				            	success: function (retVal) {
 	  				            		if(retVal.res=="OK"){
  	  				            		console.log(retVal.myPaidOrder)
  	  				            		var paidPrice=0;
  	  				            		var url = './productdetail.pro?PRODUCT_NUM='
  	  				            		var output ='';
  	  				            		//헤드
  	  	  								output += '<div class="col-12 row justify-content-between order_tab">'
 	    				        			output += '<div><b>주문번호 '+ORDER_AMOUNT+' | 주문 날짜 '+date+'</b></div>'
 	    				        			output += '<div><a href="./order_detail.my?order_amount='+ORDER_AMOUNT+'">상세보기</a></div></div>'
  	  				            				
  	  				            		for(var j=0; j<retVal.myPaidOrder.length; j++){
  	  				            			console.log('내부for문')
  	  				            		var price = retVal.myPaidOrder[j].PRODUCT_PRICE.toLocaleString();
						        		var ship = retVal.myPaidOrder[j].PRODUCT_SHIP_PRICE.toLocaleString();
						        		var chong = retVal.myPaidOrder[j].PRODUCT_PRICE+retVal.myPaidOrder[j].PRODUCT_SHIP_PRICE;
						        		var amount = retVal.myPaidOrder[j].BASKET_AMOUNT;
						        		var	total = chong*amount*1
						        			paidPrice += total;
						        		//본문
						        		output += '<div class="col-12 d-flex each-row" id="'+retVal.myPaidOrder[j].PRODUCT_NUM+'" bNum='+retVal.myPaidOrder[j].BASKET_NUM+'>'
				    					output += '<div class="col-2 text-center"><a href="'+url+retVal.myPaidOrder[j].PRODUCT_NUM+'">'
							    		output += '<img src="/productupload/image/'+retVal.myPaidOrder[j].PRODUCT_IMAGE+'"></a></div>'
							    		output += '<div class="col-10">'
						    				output += '<div class="row category">'
						    					output += '<div class="col-2">상품명</div>'
					    						output += '<div class="col-2">배송</div>'
						    					output += '<div class="col-2">사이즈</div>'
					    						output += '<div class="col-1">컬러</div>'
				    							output += '<div class="col-1">수량</div>'
			    								output += '<div class="col-2">상태</div>' 
			    								output += '<div class="col-2 text-right">금액</div>'   
			                                output += '</div>'
			                              	output += '<div class="row values">' 
			  			    					output += '<a href="'+url+retVal.myPaidOrder[j].PRODUCT_NUM+'">'
			  			    					output += '<div class="col-2"><b>'+retVal.myPaidOrder[j].PRODUCT_TITLE+'</b>'
			  				    					 output += '<p>'+retVal.myPaidOrder[j].PRODUCT_BRIEF+'</p></a></div>'
			  				    				output += '<div class="col-2">'+retVal.myPaidOrder[j].PRODUCT_SHIP_COMPANY+'</div>'
			  				    				output += '<div class="col-2">'+retVal.myPaidOrder[j].BASKET_SIZE+'</div>'
			  				    				output += '<div class="col-1">'+retVal.myPaidOrder[j].BASKET_COLOR+'</div>'
			  				    				output += '<div class="price col-1" value="'+retVal.myPaidOrder[j].BASKET_AMOUNT+'">'+retVal.myPaidOrder[j].BASKET_AMOUNT+'</div>'
			  				    				output += '<div class="col-2">배송준비중</div>'
			  				    				output += '<div class="price_wrap text-right col-2">'
								    				output += '<div class="chongprice text-right">총가격</div><span>'+total.toLocaleString()+'원</span></b>'   
								    			output += '</div>'
						    				output += '</div></div></div>'
 	  				            		}
  	  	  								output += '<div class="end col-12"></div></div>' 
  	  				            		console.log(output) 
	  	  					        	$('.output').append(output)  
	  	  					        	/* if(retVal.getCount.length!=0){
	  	  					        		$('.count_paid').text(retVal.getCount.length+'건').css('color','rgba(239,144,14,1)')	
	  	  					        	}
		  	  		        			$('.chongprice').css('color','rgba(239,144,14,1)');
		  	  	        				$('.chongprice').next().css('color','rgba(239,144,14,1)'); */
  	  				            	}
  	  				            }
	  	  				        
  								});
  								
  							}
		  				}else{ 
							alert("update fail"); 
						}  
					},
					error:function(){
						alert("ajax통신 실패!!");
					}
			})
		}
		getBasket()
	});
</script>