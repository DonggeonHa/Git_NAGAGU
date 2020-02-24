<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.member.MemberVO"%>
<%@ page import="com.spring.community.PicsVO"%>
<%@ page import="com.spring.community.PicsCommentDB"%>

<%
	System.out.println("detail_jsp start");
	//ArrayList<PicsVO> picsList = (ArrayList<PicsVO>) request.getAttribute("picsList");
	//ArrayList<MemberVO> memberList = (ArrayList<MemberVO>) request.getAttribute("memberList"); 
	
	//사진 디테일 받아오기 위해
	PicsVO picsVO= (PicsVO)request.getAttribute("picsDetail");
	//사진 올린 멤버 디테일 받아오기 위해
	MemberVO memberVO= (MemberVO)request.getAttribute("memberDetail");
	//사진 올린 멤버가 올린 다른 사진리스트 받아오기 위해
	ArrayList<PicsVO> memberPicsList = (ArrayList<PicsVO>) request.getAttribute("memberPicsList");
	//ArrayList<PicsCommentDB> commentList=(ArrayList<PicsCommentDB>)request.getAttribute("commentList");
	
	//로그인하면 세션값 or 0
	int MEMBER_NUM = 0;
	if(session.getAttribute("MEMBER_NUM")!=null){
		MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
	}
	System.out.println(MEMBER_NUM);
%> 

<style>
	img {
	   width: 100%;
	   height: 100%;
	}
	a, a:link, a:hover {
	   text-decoration: none;
	   color: black;;
	}
	.title>div {
	   background-color: ;
	   color: rgba(0, 0, 0, 0.8);
	   font-size: 1rem !important;
	}
	.img-wrap {
        margin-top: 15px;
        height: auto;
	}
 	.detailmain { 
  	   width: 70%;  
  	   height: auto;  
 	   border-right:1px solid; 
 	   border-color:rgba(0, 0, 0, 0.1); 
 	} 
	.detailmain .title{
	   padding-bottom: 10px;
	   border-bottom: 1px solid;
	   border-color:rgba(0, 0, 0, 0.1);
	}
	.category_cm{
	    margin-top: 50px;
	} 
	.sidebar {
	   width: 25%;
	   height: 25vh;
	}
	.sidebar {
	   position: -webkit-sticky;
	   position: sticky;
	   top: 0;
	}
	.sidebar div{
		align-self: center;
	}
	/* 댓글 */
	.name {
		font-weight: bold;
	}
	.smallfont {
		font-size: 1rem;
	}
	hr {
		background-color: #EF902E;
	}
	.rep_content {
		font-size: 1.0em;
	}
	.btn_write {
		width:37px;
		padding:3%;
	    border-radius: 4px;
	    border:1px solid orangered;
	    color:orangered;
	    font-size: 14px;
	}
	.comments_table {
	   font-size: 1.2rem;
	}
	@media ( max-width : 700px) {
	   .comments_table {
	      font-size: 0.7rem;
	   }
	}
	.page-tap{
		margin-bottom: 10px;
	}
	.page-tap a{
		color: black;		 	
	}
	.page-tap a:hover{
		color: #ef900e !important;
		transform: scale(1.2);
		text-decoration: none;
	}
	.profile-img img{
		border-radius: 100px;
	    margin-right: 10px;
	}
	/* follow button */
	.follow_btn {
		border: none;
		background: rgba(0,0,0,0.3);  	
		font-size: 1rem;	 
		border-radius: 10px;
		transition:all 0.2s; 
		box-shadow: 0px 3px rgba(0,0,0,0.1); 
		color: white;
		margin-left: 5px;
	}
	.follow_btn:hover, .follow_btn:active, .flw_btn_active{
		background: #ef900e; 
		box-shadow: 0px 3px rgba(239,144,14,0.5);
	}
	 *:focus { 
	 	outline:none !important; 
	}
	/* follow button end*/
	 .member_upload_img div img{
	   width: 145px;
	   height: 145px;
	   border-radius: 7px;
	   padding: 2%;
	}	
	.member_upload_img div{
	  padding: 0 ;
	}	
	.member_upload_img{   
	 
	  padding-left: 15px;
	}
	h6{
	margin:0 auto !important;
	}
	textarea{
		width:80%;
	}
	.comments_table input{
		background-color: rgba(255,255,255,1) !important;
		border: 0px;
	}
	#output img{
		border-radius:100px; 
	}
	.reply_line *, .re_reply_line *{
		word-wrap: break-word;
	}
	.reply_line{
		border-top: 1px solid rgba(0, 0, 0, 0.1);
		padding-top: 15px ;
	}
	.re_reply_line{
		padding-top: 15px;
		padding-bottom: 15px;
	} 
	#insert_form{
		height:150px;
		margin-bottom: 20px;
	}
	textarea{
		height: 100px;
	}
	#input_data_jsp{
		background-color: rgba(0, 0, 0, 0);
		border: 0px solid;  
	}
	.heart-wrap{
		padding-bottom:5px;
		padding-left:10px;	   
	}
	.main-content a, .main-content a:link, .main-content a:hover {
		text-decoration: none;
		color: black;
	}
	.page-tap{ 
		align-self: center;
		margin-bottom: 0px !important;
	}
	.reply_container{
		margin-bottom: 100px;
	}
	.product{
		margin-top:50px;
		font-weight:800;
	}
	.product img{
		border-radius: 5px;
		width:100px;
		height:100px;
	}
	.product_text{
		border-bottom:1px solid grey;
	}
</style>

	<div class="container category_cm">
      <div class="wrapper row justify-content-between">
         <div class="detailmain">
            <div class="d-flex justify-content-between title">  
               <div class="col-9 page-tap">  
                  <div>
                  	<h3><a href="community.cm">COMMUNITY</a> > 상세보기 </h3>
                  </div>
              </div> 
              
              <%if(picsVO.getPICS_MEMBER()== MEMBER_NUM){
              %>
              <c:set var="num" value="<%=MEMBER_NUM%>" />
				<c:if test="${num != 0}">
				    <div class="col-3 btn_wrap">
				    	<div class="text-right">                  	
	                	<button class="update-btn btn btn-outline-dark">수정</button>
	                	<button class="delete-btn btn btn-outline-dark">삭제</button>
	                	</div> 
	              </div>
				</c:if>
              <%
              }
              %>
               
            </div>
            <div class="d-flex img-wrap">
            <%
            		if(picsVO.getPICS_CONTENT()!=null){
            			String content = picsVO.getPICS_CONTENT();
            			if(picsVO.getPICS_CONTENT()==null){               				
               				content="";
            			}
            %>
            	<div class="col-12 pics_content">
            	<%=picsVO.getPICS_CONTENT()%>
            	</div>
            <%       
              		}
            %>
            </div>
         </div>
         <!-- main end -->
         <!-- sidebar start -->
         <div class="sidebar" id="sidebar" style="height: 600px;">
				<div class="d-flex justify-content-between pb-2">
					<div class="profile-img">
						<a href="memberLikePics.cm?MEMBER_NUM=<%=memberVO.getMEMBER_NUM()%>">
						<img src=<%=memberVO.getMEMBER_PICTURE()%> style="width: 50px; height: 50px;" class="src"/>
						<b><%=memberVO.getMEMBER_NICK()%></b>
						</a>
						<button class="follow_btn flw_btn<%=memberVO.getMEMBER_NUM()%>" id="<%=memberVO.getMEMBER_NUM()%>">follow</button>
					</div>
					<div>
						<a href="#" value="<%=picsVO.getPICS_NUM()%>" class="likeBtn-wrap">
						<span class="button likeBtn" id="heart_output<%=picsVO.getPICS_NUM()%>"  >  
							<i class="far fa-heart fa-2x" id="far"></i>
						</span><%=picsVO.getPICS_LIKE()%>
						</a>
					</div>
				</div>
				<div class="row member_upload_img" style="max-width:300px;">
            	<%
            	/* 사진이 4장 이상이면 4로 제한, 4장보다 작으면 size까지 for문 돌리기 */
            	int memberPicsListSize = 4;            	
            	if( memberPicsList.size()<4){
            		memberPicsListSize= memberPicsList.size();
            	}
            	for(int i=0; i<memberPicsListSize; i++){
            		PicsVO memberPicsVO= memberPicsList.get(i);	
            		
            	%>
               <div class="col-6">
	               <a href="${pageContext.request.contextPath}/community_detail.cm?PICS_NUM=<%=memberPicsVO.getPICS_NUM()%>&MEMBER_NUM=<%=memberVO.getMEMBER_NUM()%>&PICS_MEMBER=<%=picsVO.getPICS_MEMBER()%>">
	                  <img src="/communityupload/image/<%=memberPicsVO.getPICS_MAIN_IMAGE()%>" alt="" class="img-responsive" /> 
	               </a> 
               </div>
               <%} %>
            	</div>
            	<div id="product_output">
            	
            	</div>
            
            
          	  
            </div>
         </div>
         <!-- side bar end -->
      </div>
      <div class="container reply_container">
      <!-- wrapper end -->
      <!-- 댓글 테이블 시작 -->
		<br />
		<br />
		<hr />
		<h3 >REPLY</h3>
		<!-- 로그인 해야 댓글 창 보임 -->
		<form id="insert_form" class="row justify-content-between"
			name="commentForm" action="/NAGAGU/insertComment.cm" method="post">
			<div class="col-1"></div>
			<div class="col-10">
				<div class="btn_wrap">
					<textarea name="PICS_RE_CONTENT" id="text"
						placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다:)" style="width: 100%"
						cols="80" rows="2"></textarea>
				</div>
			</div>
			<div class="col-1 text-right">
				<button type="button" value="등록" id="input_data_jsp">등록</button>
			</div>
		</form>
		<!-- 댓글 테이블 끝 -->
		
		<div class="comments_table" id="output" style="color: #212529;">
			<div class="comments_reply" id="outputReply">
				
			</div>
		</div>
	</div>
   <!-- container end -->

<script type="text/javascript" charset="utf-8">
	$(document).ready(function(){
		function getPro(){
			var pro_num = '<%=picsVO.getPICS_PRODUCT()%>'
	            if(pro_num!=null){
			 	$.ajax({
					url: '/NAGAGU/getProductInCommunity.cm',
					type:'POST',
					data: {'PRODUCT_NUM':pro_num},
					contentType:'application/x-www-form-urlencoded; charset=utf-8',
					success:function(item){
						if(item.vo==null){
							return false;
						}
						var p_output ='';
						var imgsrc=item.vo.product_IMAGE;
						p_output += '<div class="row product">';
							p_output += '<div class="col-11 text-left product_text mx-3 px-0 pb-2">관련 상품</div>';    
								p_output += '<div class="col-5 pt-2">'
								p_output += '<a href="./productdetail.pro?PRODUCT_NUM='+item.vo.product_NUM+'">'
					    		p_output += '<img src="/productupload/image/'+imgsrc+'"></a></div>';
								p_output += '<div class="row col-7 text-center">';
									p_output += '<div class="title">'+item.vo.product_TITLE+'</div>'; 
							p_output += '</div></div>';
							

						console.log(p_output)
						$('#product_output').html(p_output)
					},error:function(){
						alert("ajax통신 실패!!");
					}
				}); 
            }
		}
		getPro()
	})
	$('.delete-btn').on('click',function(){
		alertify.confirm('확인', '정말 삭제하시겠습니까?', function(){ 
			alertify.success('Ok') 
			var url = '${pageContext.request.contextPath}/community_delete.cm'
				+ '?PICS_NUM='+<%=picsVO.getPICS_NUM()%>
			location.href=url;
			}
        , function(){ 
        	alertify.error('Cancel')
        	}
        );
	})
	
	$('.update-btn').on('click',function(){
		var url = '${pageContext.request.contextPath}/community_update.cm' 
				+ '?PICS_NUM='+<%=picsVO.getPICS_NUM()%>
				+ '&MEMBER_NUM='+<%=memberVO.getMEMBER_NUM()%>
		location.href=url;		
	});
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
		
		function select(num){
			var params = 'PICS_RE_PICS='+<%=picsVO.getPICS_NUM()%>;
			$('#output').empty();
			$.ajax({
				url: '/NAGAGU/getCommentList.cm',
				type:'POST',
				data: params,
				async: false,
				dataType: "json",
				contentType:'application/x-www-form-urlencoded; charset=utf-8',
				success:function(item){
					//폼 통해 받은 값들은 여기에
					var j =0;
					for(var i=0; i<item.list.length; i++){
						var output='';
		        		var d_date = new Date(item.list[i].PICS_RE_DATE);
		        		var date = date_format(d_date);
		        		
		        		if(item.list[i].PICS_RE_REF==item.list[i].PICS_RE_NUM){
		        			var re_count = item.countList[j].RE_COUNT - 1;
		        			console.log(item.list)
							output += '<div class="row mb-3 reply_line"><div class="col-1">'
							output += '<a href="memberLikePics.cm?MEMBER_NUM='+item.list[i].MEMBER_NUM+'"><img src="'+item.list[i].MEMBER_PICTURE+'" '; 
							output += 'class="img-circle" style="width: 50px; height: 50px; margin: 0 20% auto;"></div>'
							output += '<div class="col-11"><div class="row reply'+item.list[i].PICS_RE_NUM+'"><div class="col-10"><b>'+item.list[i].MEMBER_NICK+'</b></a></div>'
							output += '<div class="col-2 smallfont px-0 text-right">'+date+'</div>	';
							output += '<div class="col-12" id="commentNum'+item.list[i].PICS_RE_NUM+'">'+item.list[i].PICS_RE_CONTENT+'</div>';
							output += '<div class="col-12"><div class="row justify-content-between"><div>';
							output += '<a href="#" class="smallfont re_reply ml-3 " num='+item.list[i].PICS_RE_NUM+'>답글달기  </a>'
							output += '<a href="#" class="smallfont show_re_reply" num='+item.list[i].PICS_RE_NUM+'>답글'+re_count+'개</a></div>'
							j++;
						}else{
							output += '<div class="row ml-5 re_reply_line re_num'+item.list[i].PICS_RE_REF+'"><div class="col-1">'
							output += '<a href="memberLikePics.cm?MEMBER_NUM='+item.list[i].MEMBER_NUM+'"><img src="'+item.list[i].MEMBER_PICTURE+'" '; 
							output += 'class="img-circle" style="width: 50px; height: 50px; margin: 0 20% auto;"></div>'
							output += '<div class="col-11"><div class="row reply'+item.list[i].PICS_RE_NUM+'"><div class="col-10"><b>'+item.list[i].MEMBER_NICK+'</b></a></div>'
							output += '<div class="col-2 smallfont px-0 text-right">'+date+'</div>';
							output += '<div class="col-12" id="commentNum'+item.list[i].PICS_RE_NUM+'">'+item.list[i].PICS_RE_CONTENT+'</div>'; 
							output += '<div class="col-12"><div class="row justify-content-end"><div>';
						}
						if(item.list[i].PICS_RE_MEMBER==<%=MEMBER_NUM%>){
							output+='<div><input type="button" id="deleteForm" class="delete_form smallfont" value="삭제" num='+item.list[i].PICS_RE_NUM+'>';
							output+='<input type="button" class="update_form smallfont" value="수정" num='+item.list[i].PICS_RE_NUM+' text='+item.list[i].PICS_RE_CONTENT+' ref='+item.list[i].PICS_RE_REF+'></input>';
							output +='</div>';
						}
						output += '</div></div></div></div></div>';
						$('#output').append(output);
						$('.re_reply_line').css('display','none') 
					}
				},
				error:function(){
					alert("ajax통신 실패!!");
				}
			});
			console.log('num'+num)
			$('.re_num'+num).css('display','flex');//입력받은 대댓글은 보이게	
		}
		
		//클릭하면  대댓글 보이기
		$(document).on('click','.show_re_reply',function(event){
			var num = $(this).attr('num')
			$('.re_num'+num).toggle('slow')
		})
		
		//답글 달기 누르기
		$(document).on('click','.re_reply',function(event){
			var	loginNum = '<%=MEMBER_NUM%>';
			if(loginNum == 0){
                alertify.alert('확인','로그인해주세요') 
				return
			}
			if($('.re_insert_form').length==1){
				return				
			}
			var num= $(this).attr("num");
			var output="";
			output += '<form class="re_insert_form" id="re_insert_form">';
			output += '<div><textarea name="PICS_RE_CONTENT" id="text">';
			output += '</textarea></div>';
			output += '<span style="font-size: 9pt">';
			output += '<td><a href="#" class="#" id="input_data" num='+num+'>저장&nbsp';	//입력 받지 않는 값
			output += '<input type="hidden" name="PICS_RE_NUM" value="'+num+'"></a>';
			output += '<input type="hidden" name="PICS_RE_REF" value="'+num+'"></a>';
			output += '<td><a href="#" class="update_cancle">취소</a></td>';
			output += '</span>';		
			output += '</form>';
			$('.reply'+num).after(output);
		}) 
 
		//대댓글 입력
		$(document).on('click','#input_data',function(event){
 			if ($(this).parent().prev().find('textarea').val()=="") {
                alertify.alert('확인',"글 내용을 입력해주세요.");
				$(this).parent().prev().find('textarea').focus();
				return;
			}
			var params=$("#re_insert_form").serialize();
			params += '&PICS_RE_PICS='+<%=picsVO.getPICS_NUM()%>;
			params += '&PICS_RE_MEMBER='+<%=MEMBER_NUM%>
			console.log(params)
			var re_num = $(this).attr('num')
			jQuery.ajax({
				url: '/NAGAGU/insertComment.cm',
				type: 'POST',
				data: params,
				contentType:
					'application/x-www-form-urlencoded; charset=utf-8',
				datatype: 'json', 
				success: function(retVal){
					if(retVal.res=="OK"){
						$('#text').val('');
						select(re_num);
					}else{
						alert("insert fail");
					}
				},
				error:function(){
					alert("ajax통신 실패!!");
				}
			});
			event.preventDefault();
		});
		//댓글 입력
		$(document).on('click','#input_data_jsp',function(event){
			var	MEMBER_NUM = '<%=MEMBER_NUM%>';
			if(MEMBER_NUM==0){
				alertify.alert('확인','로그인 하세요') 
				return				
			} 
			if ($('#text').val()=="") {
				alertify.alert('확인',"글 내용을 입력해주세요.");
				$('#text').focus();
				return;
			}			
			var params=$("#insert_form").serialize();
			params += '&PICS_RE_PICS='+<%=picsVO.getPICS_NUM()%>;
			params += '&PICS_RE_MEMBER='+<%=MEMBER_NUM%>
			jQuery.ajax({
				url: '/NAGAGU/insertComment.cm',
				type: 'POST',
				data: params,
				contentType:
					'application/x-www-form-urlencoded; charset=utf-8',
				datatype: 'json', 
				success: function(retVal){
					if(retVal.res=="OK"){
						$('#text').val('');
						select();
					}else{
						alert("insert fail");
					}
				},
				error:function(){
					alert("ajax통신 실패!!");
				}
			});
			event.preventDefault();
			
		});
	
		//삭제
		$(document).on('click','#deleteForm',function(event){
            alertify.confirm('확인', '정말 삭제하시겠습니까?', function(){
                alertify.success('Ok') 
                var delNum = $(event.target).attr('num')
                jQuery.ajax({
                    url: '/NAGAGU/deleteComment.cm',
                    type: 'POST',
                    data: {'delNum': delNum},
                    contentType: 'application/x-www-form-urlencoded; charset=utf-8',
                    dataType: 'json',
                    success: function(retVal){
                        if(retVal.res == "OK"){
                            select();
                        }
                        else{
                            alert("Delete Fail!!!");
                        }
                    },
                    error:function(){
                        alert("ajax통신 실패!!");
					}
				});
				event.preventDefault();
            }
            , function(){
                alertify.error('Cancel')
                }
            );
		}); 
		//수정 버튼 누르면 입력창으로 바뀜
		$(document).on('click','.update_form',function(event){
				var num= $(this).attr("num");
				var text= $(this).attr("text");
				var output="";
				output += '<form class="update_form" id="update_form'+num+'">';
				output += '<div><textarea name="PICS_RE_CONTENT" id="text">';
				output += text;
				output += '</textarea></div>';
				output += '<span style="font-size: 9pt">';
				output += '<td><a href="#" class="update_apply" num='+num+'>저장&nbsp';	//입력 받지 않는 값
				output += '<input type="hidden" name="PICS_RE_NUM" value="'+num+'"></a>';
				output += '<td><a href="#" class="update_cancle">취소</a></td>';
				output += '</span>';		
				output += '</form>';
				$('#commentNum'+num).html(output);
			});
		//취소
		$(document).on('click','.update_cancle',function(){
			select();
		})
		//수정 적용
		$(document).on('click','.update_apply',function(event){
			var num= $(this).attr("num"); 
			var params=$("#update_form"+num).serialize();
			jQuery.ajax({
				url: '/NAGAGU/updateComment.cm',
				type: 'POST',
				data: params,
				contentType:
					'application/x-www-form-urlencoded; charset=utf-8',
				success: function(retVal){
					if(retVal.res=="OK"){
						select();
						$('#text').val('');
					}else{
						alert("update fail");
					}
				},
				error:function(){
					alert("ajax통신 실패!!");
				}
				
			});
			event.preventDefault();
		})
		//a태그 이동방지()
		$(document).on('click', 'a[href="#"]', function(e){
			e.preventDefault();
		});
		select();
	});
	//팔로우
	$(document).ready(function(){
	//처음 로드할때 팔로우 한 멤버 팔로우 버튼 바꿔주기~
	function follow_check(){
		var	fromNum = '<%=MEMBER_NUM%>';
		if(fromNum == 0){
			return
		}
		$.ajax({
			url: "/NAGAGU/getFollowMembers.cm",
	              type: "POST",
	              data: { 'fromNum' : fromNum},
	              datatype: 'json',
	              contentType:
	  				'application/x-www-form-urlencoded; charset=utf-8',
	              success: function (retVal) {
	            	if(retVal.res=="OK"){ 
	            		//내가 팔로우 한 리스트 받아와서 일치하는 항목 찾기
	            		console.log(retVal.followMembers)
	            		var a = retVal.followMembers
	            		for(var j=0; j<retVal.followMembers.length; j++){
			        		var toNum = retVal.followMembers[j].member_NUM
	        				$('.flw_btn'+toNum).text('following');
	      	        		$('.flw_btn'+toNum).addClass('flw_btn_active')
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
	follow_check()


	//팔로우 버튼 누르기
	 $(document).on("click",".follow_btn",function (){
		 var toNum = this.id
		 var fromNum = '<%=MEMBER_NUM%>';
		 if(fromNum==0){ 
			alertify.alert('확인','로그인 하세요') 
			return				
		 }
		 if(fromNum==toNum){
			 alertify.alert('확인','본인이시네요')
			return				
		 } 
			 
		$.ajax({
		url: "/NAGAGU/followAction.cm",
             type: "POST",
             data: { 'fromNum' : fromNum , 'toNum' : toNum},
             contentType:
 				'application/x-www-form-urlencoded; charset=utf-8',
             success: function (retVal) {
		        if(retVal.res=="OK"){
		        	if(retVal.cnt==0){
		        		//팔로우 추가 하면 (멤버 넘버가 올리 사진들 모두 값 바꿔준다)
		        		$('.flw_btn'+toNum).text('following');
		        		$('.flw_btn'+toNum).addClass('flw_btn_active')
		        	}else{
		        		//팔로우 끊으면
		        		$('.flw_btn'+toNum).text('follow');
		        		$('.flw_btn'+toNum).removeClass('flw_btn_active')
		        	}
				}else{
					alert("update fail");
				} 
			},
		error:function(){
			alert("ajax통신 실패!!");
		}
		})
			event.preventDefault();
		})

	});

	//좋아요 기능
	$(document).ready(function(){
		//처음 로드되고 로그인 사용자가 누른글 하트는 검게 바꿔줌
		function heart_check(){
			var	loginNum = '<%=MEMBER_NUM%>';
			if(loginNum == 0){
				return
			}
			var category = 'like_pic'
			$.ajax({
				url: "/NAGAGU/loginMemberLikePics.cm",
		              type: "POST",
		              data: { 'category' : category},
		              datatype: 'json',
		              contentType:
		  				'application/x-www-form-urlencoded; charset=utf-8',
		              success: function (retVal) {
				        if(retVal.res=="OK"){
				        	for(var j=0; j<retVal.PicsNum.length; j++){
				        		var num = retVal.PicsNum[j].pics_NUM
		        				var target =$('#heart_output'+num) 
		        				$(target).children().removeClass('far').addClass('fas')
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
		heart_check()
	  //좋아요 누르는 기능
	  $(document).on("click","#far",function getLike(){
	    var	MEMBER_NUM = '<%=MEMBER_NUM%>';
		if(MEMBER_NUM==0){
			alertify.alert('확인','로그인 하세요') 
			return				
		} 
		var category = 'like_pic'
		var PICS_NUM = $(this).parent().parent().attr('value');
		console.log(this)
			$.ajax({
			url: "/NAGAGU/insertPicsLike.cm",
	              type: "POST",
	              data: { 'category' : category , 'PICS_NUM' : PICS_NUM},
	              contentType:
	  				'application/x-www-form-urlencoded; charset=utf-8',
	              success: function (retVal) {
			        if(retVal.res=="OK"){
			        	console.log(retVal.cnt)
			        	var output="";
							output += '<span class="button likeBtn" id="heart_output'+PICS_NUM+'">'
						if(retVal.cnt=='1'){
							output += '<i class="far fa-heart fa-2x" id="far"></i>'	
						}else{
							output += '<i class="fas fa-heart fa-2x" id="far"></i>'
						}
							output += '</span>'+retVal.picsLikeCount+''
			        	$('#heart_output'+PICS_NUM).parent().html(output);
					}else{
						alert("update fail");
					} 
				},
		error:function(){
			alert("ajax통신 실패!!");
		}
		})
			event.preventDefault();
	  });
		
		
		//이미지관련
		//$('.img-wrap').children().children().find('img').removeAttr("style").css('width','95%') 
		$('img').addClass('img-responsive');
		
	});
</script>