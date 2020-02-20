<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%//날짜 포맷 형식
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	//로그인 정보 확인(멤버)
	int LOGIN_MEMBER_NUM = 0;
	if(session.getAttribute("MEMBER_NUM")!=null){
		LOGIN_MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
	}
%>
<style type="text/css">
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
		background-color: #1b1b27 !important;
		margin: 15px 15px 15px 15px;
		color: white;
	}
	.my {
		background-color: #ef900e !important;
	}
	.card-wrap{
		justify-content: center;
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
			width: 7.6rem !important;  
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
	.tab-content .tab-pane.active {
		display: flex;
	}
	.nav-item a {
		color: black;
	}
	.replyOutput img {
		width: 50px;
		height: 50px;
	}
	.replyOutput div{
		margin-bottom:3px; 
	}
	/* --------------------------------- */
	.reply-content {
		width: 100%;
	}
	.container_reply .nav-item{ 
		font-weight:800 !important;  
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

<div class="container container_reply">
	<div class="row" style="margin-left: 0px;">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active" id="picTab"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
				aria-selected="true">PIC</a></li>
			<li class="nav-item"><a class="nav-link" id="storeTab"
				data-toggle="tab" href="#profile" role="tab"
				aria-controls="profile" aria-selected="false">STORE</a></li>
		</ul>
	</div>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active row" id=""
			role="tabpanel" aria-labelledby="picTab">
			<!-- 댓글 뿌려지는 장소 -->
			<div class="row mx-0 my-2 reply-content replyOutput">
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
		//사진 댓글  가져오기 함수 정의
		function getPics(event){
			var loginNum = '<%=session.getAttribute("MEMBER_NUM")%>'; 
			var category = 'reply_pic'
			if(loginNum == 0){
				return
			}
			$.ajax({
				  url: "/NAGAGU/loginMemberReply.cm",
	              type: "POST",
	              data: { 'category' : category},
	              contentType:
	  				'application/x-www-form-urlencoded; charset=utf-8',
	              success: function (retVal) {
	        		if(retVal.res=="OK"){
	        			var output="";
	        			console.log(retVal.PicsNum)
			        	for(var j=0; j<retVal.PicsNum.length; j++){
			        		var imgsrc = retVal.PicsNum[j].MEMBER_PICTURE
			        		var content = retVal.PicsNum[j].PICS_RE_CONTENT
			        		var nickname = retVal.PicsNum[j].PICS_NICK

			        		var d_date = new Date(retVal.PicsNum[j].PICS_RE_DATE);
			        		var date = date_format(d_date);
				    		output += '<div class="col-1">'
				    			output += '<a href="./community_detail.cm?PICS_NUM='+retVal.PicsNum[j].PICS_NUM+'&MEMBER_NUM='+retVal.PicsNum[j].MEMBER_NUM+'&PICS_MEMBER='+retVal.PicsNum[j].PICS_MEMBER+'">'
				    			output += '<img src='+imgsrc+'></a></div>'
				    		output += '<div class="col-11"><div class="row justify-content-between"><div class="name">'+nickname+'에게 단 댓글</div>'
				    		output += '<div class="smallfont">'+date+'</div></div><div class="row">'
				    		output += '<div class="comm_content">'+content+'</div></div></div>'
			        	}
			        	$('.replyOutput').html(output)
					}else{
						alert("update fail");
					}  
				 },
				error:function(){
					alert("ajax통신 실패!!");
				}
			})
		} 
		//누르면 사진댓글 가져오기
		$(document).on('click','#picTab',function(){
			getPics()
		}) 
		
		//누르면 상품댓글 가져오기
		$(document).on('click','#storeTab',function(){
			var loginNum = '<%=session.getAttribute("MEMBER_NUM")%>'; 
			var category = 'reply_store'
			if(loginNum == 0){
				return
			}
			$.ajax({
				  url: "/NAGAGU/loginMemberReply.cm",
	              type: "POST",
	              data: { 'category' : category},
	              contentType:
	  				'application/x-www-form-urlencoded; charset=utf-8',
	              success: function (retVal) {
	        		if(retVal.res=="OK"){
	        			var output="";
	        			console.log(retVal.PicsNum)
			        	for(var j=0; j<retVal.PicsNum.length; j++){
			        		var imgsrc = retVal.PicsNum[j].PRODUCT_IMAGE
			        		var content = retVal.PicsNum[j].REVIEW_CONTENT
			        		var title = retVal.PicsNum[j].PRODUCT_TITLE
			        		var d_date = new Date(retVal.PicsNum[j].PRODUCT_DATE);
			        		var date = date_format(d_date);
			        		console.log(imgsrc)
				    		output += '<div class="col-1">'
			    				output += '<a href="./productdetail.pro?PRODUCT_NUM='+retVal.PicsNum[j].PRODUCT_NUM+'">'
					    		output += '<img src="/productupload/image/'+imgsrc+'"></a></div>'
				    		output += '<div class="col-11"><div class="row justify-content-between"><div class="name">'+title+'</div>'
				    		output += '<div class="smallfont">'+date+'</div></div><div class="row">'
				    		output += '<div class="comm_content">→'+content+'</div></div></div>'
			        	}
			        	$('.replyOutput').html(output)
					}else{
						alert("update fail");
					}  
				 },
				error:function(){
					alert("ajax통신 실패!!");
				}
			})
		}) 
		//처음 로드하고 사진 가져오기 호출
		getPics();
		$('.card-wrap').children().eq(6).find('div.card-body').css('color','#ef900e')
	})
</script>