<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.css">
<style>

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
		margin-top:15px;  	 
	}
	.each-row div{
		color: black;
	}
	.output b{
		margin-left:15px;
	}
	.brief{
		margin-top:15px;
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
	
	<div class="tab-content" id="nav-tabContent">
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
	              contentType:
	  				'application/x-www-form-urlencoded; charset=utf-8',
	  			  dataType : "json",
	              success: function (retVal) {
	        		if(retVal.res=="OK"){
	        			console.log(retVal.getCount)
	        			console.log(retVal.myPaidOrder)
	        			var url = './productdetail.pro?PRODUCT_NUM='
        				var paidPrice=0;
	        			var d_date = new Date(retVal.myPaidOrder[0].ORDER_DATE); 
		        		var date = date_format(d_date);
		        		var j=0;
		/*        		console.log('status'+status)
		        		if(status=!0 || status==null){
		        			var output ='';
		        			output += '<div>준비중인 상품이 없습니다</div>'
		        			$('.output').append(output)
		        			return
		        		} */
		        		//i=주문개수 j는 상품 수
	        			for(var i=0; i<retVal.getCount.length; i++){
	        				var output ='';
		        			output += '<div class="col-12"><b>주문번호 '+retVal.myPaidOrder[i].ORDER_AMOUNT+' | 주문 날짜 '+date+'</b><a href="./order_detail.my?order_amount='+retVal.myPaidOrder[i].ORDER_AMOUNT+'">상세보기</a>';
				        	for(var x=0; x<retVal.getCount[i].COUNT; j++){
					    		output += '<div class="col-11 row each-row" id="'+retVal.myPaidOrder[j].PRODUCT_NUM+'" bNum='+retVal.myPaidOrder[j].BASKET_NUM+'><div class="col-2"><a href="'+url+retVal.myPaidOrder[j].PRODUCT_NUM+'">'
					    		output += '<img src="/productupload/image/'+retVal.myPaidOrder[j].PRODUCT_IMAGE+'"></a></div>'
					    		output += '<div class="col-10"><div class="d-flex justify-content-between"><a href="'+url+retVal.myPaidOrder[j].PRODUCT_NUM+'"><div>'+retVal.myPaidOrder[j].PRODUCT_TITLE+'</div></a>'
					    		output += '<div></div></div><font size="1">일반택배</font>'
					    		output += '<div class="d-flex justify-content-between brief"><div>'+retVal.myPaidOrder[j].PRODUCT_BRIEF+'</div>'
					    		output += '<div class="price text-right" value="'+retVal.myPaidOrder[j].BASKET_AMOUNT+'">수량'+retVal.myPaidOrder[j].BASKET_AMOUNT+''
					    		output += '<div class="basic_price" value='+retVal.myPaidOrder[j].PRODUCT_PRICE+'>가격 :<span>'+retVal.myPaidOrder[j].PRODUCT_PRICE+'</span></div></div></div></div><div class="col-12 d-flex justify-content-between"><div>'
				    			output += '<div>사이즈 :'+retVal.myPaidOrder[j].BASKET_SIZE+'</div>'
			    				output += '<div>컬러 :'+retVal.myPaidOrder[j].BASKET_COLOR+'</div>'
			    				output += '<div>배송업체 :'+retVal.myPaidOrder[j].PRODUCT_SHIP_COMPANY+'</div>'
					    		output += '</div><div style="align-self: flex-end;"><div class="shipPrice">+배송비 :<span>'+retVal.myPaidOrder[j].PRODUCT_SHIP_PRICE+'</span></div>'
					    		output += '<span class="chongprice"></span></div></div></div><hr>'
					    		//결제금액
				    			paidPrice += retVal.myPaidOrder[j].PRODUCT_PRICE + retVal.myPaidOrder[j].PRODUCT_SHIP_PRICE;
					    		x++;
				        	}
				        	output += '</div><hr>'   
				        	$('.output').append(output)
		        			}
		        			$('.count_paid').text(retVal.getCount.length)
			        	
					}else{ 
						alert("update fail"); 
					}  
				 },
				error:function(){
					alert("ajax통신 실패!!");
				}
			}) 
		} 
		//처음 로드하고 사진 가져오기 호출
		getBasket()
	});
</script>