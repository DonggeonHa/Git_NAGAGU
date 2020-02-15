<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<style>
	.sidebar {
		width: 25%;
	}
	
	.sidebar {
		position: -webkit-sticky;
		position: sticky;
		top: 10;
	}
	
	@font-face {
		font-family: 'KOMACON';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')
			format('woff');
		font-weight: normal;
		font-style: normal;
	}
	
	body {
		font-family: '만화진흥원체', 'KOMACON', KOMACON !important;
		font-size: 15px;
	}
	
	.basketmain {
		width: 75%;
		height: auto;
		margin-top: 30px;
		min-height: 65vh;
	}
	
	.main-output {
		margin-top: 15px;
	}
	
	.each-row {
		margin-bottom: 15px;
		border-bottom: 1px solid black;
		border-color: rgba(0, 0, 0, 0.2);
	}
	
	.each-row img {
		width: 100px;
		height: 100px;
	}
	
	.each-row a, .each-row a:link, .each-row a:hover {
		text-decoration: none !important;
		color: black !important;
	}
	
	.sidebarOutput {
		margin-top: 25px;
		font-size: 1.5rem;
		min-height: 25vh;
	}
	
	.btn_check_all {
		margin-right: 40px;
	}
	
	.option span {
		color: rgba(0, 0, 0, 0.5);
	}
	
	.sidebar {
		margin-top: 30px;
		background-color: rgba(0, 0, 0, 0.1);
		height: 30vh;
	}
	
	.category *{
		color: rgb(0, 0, 0, 0.6);  
	}
	
	 .basic_price, .shipPrice, .chongprice {
		margin-bottom: 0;
		margin-top: 10px;
	}
	
	.category{
		border-bottom: 1px solid #ef900e;
		padding-bottom: 10px;  
		/* background-color: rgba(0, 0, 0, 0.1); */
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
	/*
	.category p{
		margin-top: 10px; 
	}.category div{
		margin: 0 auto;
		padding: 10px 0px !important;  
	} */
</style>

<div class="container">
	<div class="wrapper row justify-content-between">
		<div class="basketmain">
			<div class="d-flex">
				<div class="btn-group-toggle" data-toggle="buttons">
					<label
						class="btn btn-sm btn-outline-warning text-white radius btn_check_all">
						<i class="fas fa-check"></i> <input type="checkbox"
						id="check_all" style="align-self: center;">
					</label>
				</div>
				<span><i>전체선택</i></span> <span></span>
			</div>
			<div class="row img-wrap main-output">
				<div class="col-12">배송업체</div>
				<hr>
				<div class="col-1"></div>
				<div class="col-11 row">
					<div class="col-2">
						<img src="">
					</div>
					<div class="col-10">
						<div class="d-flex justify-content-between">
							<div>title</div>
							<div>
								<i class="fas fa-times"></i>
							</div>
						</div>
						<font size="1">일반택배</font>
						<div class="d-flex justify-content-between">
							<div>brief</div>
							<div>
								수량 <select>
									<option selected>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
								</select> 23000
							</div>
						</div>
					</div>
					<div class="col-12 d-flex justify-content-between">
						<div>
							옵션 <select>
								<option selected>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
							</select>
						</div>
						<div>총가격 55555</div>
					</div>
				</div>
			</div>
		</div>
		<!-- main end -->


		<!-- sidebar start -->
		<div class="sidebar" id="sidebar">
			<div class="row justify-content-around text-right sidebarOutput">
				<div class="col-6">상품금액</div>
				<div class="col-6 totalPrice"></div>
				<div class="col-6">+배송비</div>
				<div class="col-6 totalShipPrice">+</div>
				<div class="col-6">결제금액</div>
				<div class="col-6 totalPayPrice"></div>
				<div class="">
					<a href="#" class="btn btn-warning text-white btn_commit">구매하기</a>
				</div>
			</div>
			<!-- side bar end -->
		</div>
		<!-- wrapper end -->
	</div>
</div>


<script>
	$(document).ready(function(){
		//사진 가져오기 함수 정의
		function getBasket(event){
			var loginNum = '<%=session.getAttribute("MEMBER_NUM")%>'; 
			var category = 'count'
			if(loginNum == 0){
				return
			}
			$.ajax({
				  url: "/NAGAGU/getMyBasket.my",
	              type: "POST",
	              contentType:
	  				'application/x-www-form-urlencoded; charset=utf-8',
	              success: function (retVal) {
	        		if(retVal.res=="OK"){
	        			console.log(retVal.getbasketList)
	        			console.log(retVal.countBasket)
	        			var output="";
	        			var countOutput= '전체선택 '+retVal.countBasket+'개';
	        			var url = './productdetail.pro?PRODUCT_NUM='
			        	for(var j=0; j<retVal.getbasketList.length; j++){
			        		var amount = retVal.getbasketList[j].BASKET_AMOUNT;
			        		output += '<div class="col-1 btn-group-toggle" data-toggle="buttons">'
							output +=	'<label class="btn btn-sm btn-outline-warning text-white radius btn_check">' 
								output += '<i class="fas fa-check"></i>'
								output += '<input class="checkbox" type="checkbox" bNum="'+retVal.getbasketList[j].BASKET_NUM+'">'							
							output +=	'</label></div>'		
				    		output += '<div class="col-11 row each-row" id="'+retVal.getbasketList[j].PRODUCT_NUM+'" bNum='+retVal.getbasketList[j].BASKET_NUM+'>'
				    			output += '<div class="col-2"><a href="'+url+retVal.getbasketList[j].PRODUCT_NUM+'">'
				    			output += '<img src="/productupload/image/'+retVal.getbasketList[j].PRODUCT_IMAGE+'"></a></div>'
				    			output += '<div class="col-10">'
				    				output += '<div class="row category">'
				    					output += '<div class="col-2">상품명</div>'
			    						output += '<div class="col-2">배송</div>'
				    					output += '<div class="col-2">사이즈</div>'
			    						output += '<div class="col-2">컬러</div>'
		    							output += '<div class="col-2">수량</div>'  
					    				output += '<div class="col-2">삭제&nbsp;&nbsp;<i class="fas fa-times"></i></div></div>' 
					    				
					    				output += '<div class="row values">' 
				    					output += '<a href="'+url+retVal.getbasketList[j].PRODUCT_NUM+'">'
				    					output += '<div class="col-2"><b>'+retVal.getbasketList[j].PRODUCT_TITLE+'</b></p>'
					    					 output += '<p>'+retVal.getbasketList[j].PRODUCT_BRIEF+'</a></div>'
					    					 
					    				output += '<div class="col-2">'+retVal.getbasketList[j].PRODUCT_SHIP_COMPANY+'</div>'
					    				output += '<div class="col-2">'+retVal.getbasketList[j].BASKET_SIZE+'</div>'
					    				output += '<div class="col-2">'+retVal.getbasketList[j].BASKET_COLOR+'</div>'
					    				output += '<div class="price col-2" value="수량">'
						    				switch(amount){
							    			case 1:
							    				output += '<select class="amount forTotal"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select></div>'
							    				break;
							    			case 2:
							    				output += '<select class="amount forTotal"><option>1</option><option selected>2</option><option>3</option><option>4</option><option>5</option></select></div>'
							    				break;
							    			case 3:
							    				output += '<select class="amount forTotal"><option>1</option><option>2</option><option selected>3</option><option>4</option><option>5</option></select></div>'
							    				break;
							    			case 4:
							    				output += '<select class="amount forTotal"><option>1</option><option>2</option><option>3</option><option selected>4</option><option>5</option></select></div>'
							    				break;
							    			case 5:
							    				output += '<select class="amount forTotal"><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></div>'
							    		}
					    				output += '<div class="price_wrap text-right col-2">'
							    			output += '<div class="basic_price text-right" value='+retVal.getbasketList[j].PRODUCT_PRICE+'>가격</div><span>'+retVal.getbasketList[j].PRODUCT_PRICE+'</span>'
							    			output += '<div class="shipPrice text-right" value='+retVal.getbasketList[j].PRODUCT_SHIP_PRICE+'>+배송비</div><span>'+retVal.getbasketList[j].PRODUCT_SHIP_PRICE+'</span>'
						    				output += '<div class="chongprice text-right"><b>총가격</div><span></span></b>' 
						    			output += '</div>'
						    				
					    				output += '</div></div></div>' 
				    		
					    				//output += '<p>배송업체 : <span>'+retVal.getbasketList[j].PRODUCT_SHIP_COMPANY+'</span></p>'
					    			//</div></div>'
			        	}  
	        			console.log(output)
	        			$('#check_all').next().text(countOutput).css('margin-left','15px')
			        	$('.main-output').html(output) 
			        	
			        	changePrice() 
					}else{ 
						alert("update fail"); 
					}  
				 },
				error:function(){
					alert("ajax통신 실패!!");
				}
			}) 
		}
	    
		//수량 변경시 가격 변경(update)
		$(document).on('change','.amount',function(){
			var num = $(this).parent().parent().parent().parent().attr('bNum')
			console.log(num)
			var amount = $(this).val()
			var category = 'updateAmount'
	 		$.ajax({
				  url: "/NAGAGU/updateAmount.my",
	              type: "POST",
	              data: { 'BASKET_NUM' : num, 'BASKET_AMOUNT' : amount, 'category' : category},
	              contentType:
	  				'application/x-www-form-urlencoded; charset=utf-8',
	              success: function (retVal) {
	        		if(retVal.res=="OK"){
						alert('수량 변경성공')
					}else{
						alert("update fail");
					}  
				 },
				error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
			changePrice(this);
		}) 
		//가격변화
		function changePrice(data){
			if(data!=null){
				var amount =  $(data).val() 
				var price =  $(data).parent().next().find('.basic_price').attr('value')
				var shipPrice = $(data).parent().next().find('.shipPrice').attr('value')
				//선택 수량 x 가격
				var changedPrice= amount*(price*1+shipPrice*1)
				$(data).parent().next().find('.chongprice').next().text(changedPrice)
			}
			//처음에?
			else{
				$('.amount').each(function (index,item){
					var amount =  $(this).val() 
					var price =  $(this).parent().next().find('.basic_price').attr('value')
					var shipPrice = $(this).parent().next().find('.shipPrice').attr('value')
					//선택 수량 x 가격 
					var changedPrice= amount*(price*1+shipPrice*1)
					$(this).parent().next().find('.chongprice').next().text(changedPrice)
				}) 
			}  
			//가격+배송비 구해서 총가격에 뿌리기
			getTotalPrice()
		};
	 	function getTotalPrice(){
			var sum_price=0;
			var sum_shipPrice=0;
			var sum_PayPrice=0;
			$('.forTotal').each(function (index,item){
				var amount =  $(item).val()
				var price = $(item).parent().next().find('.basic_price').attr('value')
				var shipPrice = $(item).parent().next().find('.shipPrice').attr('value')
				sum_price     += price*1*amount;
				sum_shipPrice += shipPrice*1*amount;
			}) 
			sum_PayPrice= sum_price*1+sum_shipPrice*1;
			$('.totalPrice').text(sum_price)
			$('.totalShipPrice').text(sum_shipPrice)
			$('.totalPayPrice').text(sum_PayPrice)
	 	}
		//전체선택
		$(document).on('click','#check_all',function(){
			var chk = $(this).is(":checked");//.attr('checked');
			console.log('sdf'+chk)
	        if(chk){
	        	$(".checkbox").prop('checked', true);
	        	$('.checkbox').parent().parent().next().find('select').addClass('forTotal')
	        	$('.checkbox').parent().addClass('active')
	        }else{
	        	$(".checkbox").prop('checked', false);
	        	$('.checkbox').parent().parent().next().find('select').removeClass('forTotal')
	        	$('.checkbox').parent().removeClass('active')
	        }
	        getTotalPrice()
		});
		//부분선택
	 	$(document).on('click','.checkbox',function(){
	 		//체크하면 나머지 체크박스에서 클래스 지우고 셀렉트한 것만 클래스 추가
			$('.checkbox').each(function (index,item){
				var chk = $(item).is(":checked");
				if(chk){
					console.log(item)
					$(item).parent().parent().next().find('select').addClass('forTotal')
				}else{
					$(item).parent().parent().next().find('select').removeClass('forTotal')
				}
			})
			getTotalPrice()
		}); 
		//누르면 장바구니에서 삭제
		$(document).on('click','.fa-times',function(){
			var num = $(this).parent().parent().parent().parent().attr('bnum')
			$.ajax({
				  url: "/NAGAGU/deleteBasket.my",
	              type: "POST",
	              data: { 'BASKET_NUM' : num},
	              contentType:
	  				'application/x-www-form-urlencoded; charset=utf-8',
	              success: function (retVal) {
	        		if(retVal.res=="OK"){
						alert('삭제성공')
						getBasket()
						changePrice()
					}else{
						alert("update fail");
					}  
				 },
				error:function(){
					alert("ajax통신 실패!!");
				}
			})
		});
		//셀렉트 한 값만 넘기기(구매하기 버튼)
	 	$(document).on('click','.btn_commit',function(){
	 		if(!$('.checkbox').is(":checked")){
	 			alert('하나 이상 선택해주세요')
	 			return
	 		}
			var arrChecked = new Array();
			$('.checkbox').each(function (index,item){
				var chk = $(item).is(":checked")
				var num = $(item).attr('bNum')
				if(chk){
					arrChecked.push(num)
				}
			});
				var category='order'
				var Data = { "arr": arrChecked,"category":category}; 
				$.ajax({ 
					type: "post", 
					url: "/NAGAGU/updateCheck.my",
					dataType: "json", 
					data: Data, 
					success: function (data) { 
						alert('성공')
						var url = '/NAGAGU/mypage_order.my'
						location.href = url
					},
					error:function(){
						alert("ajax통신 실패!!");
					} 
				});
			});
		//처음 로드하고 사진 가져오기 호출
		getBasket();
	})
</script>
