<%@page import="com.spring.community.PicsCommentDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.member.MemberVO"%>
<%@ page import="com.spring.community.PicsVO"%>
<%
	System.out.println("detail_jsp start");
	//ArrayList<PicsVO> picsList = (ArrayList<PicsVO>) request.getAttribute("picsList");
	//ArrayList<MemberVO> memberList = (ArrayList<MemberVO>) request.getAttribute("memberList"); 
	
	//사진 디테일 받아오기 위해
	PicsVO picsVO= (PicsVO)request.getAttribute("picsDetail");
	//사진의 멤버 디테일 받아오기 위해
	MemberVO memberVO= (MemberVO)request.getAttribute("memberDetail");
	//해당 멤버가 올린 사진리스트 받아오기 위해
	ArrayList<PicsVO> memberPicsList = (ArrayList<PicsVO>) request.getAttribute("memberPicsList");
	//ArrayList<PicsCommentDB> commentList=(ArrayList<PicsCommentDB>)request.getAttribute("commentList");
	
%> 

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">

	<style>
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
	.main>.title {
	   margin-left: 0 !important;
	   margin-right: 0 !important;
	   padding: 0px auto;
	}
	.img-wrap {
	   height: auto;
	}
	.main {
	   width: 75%;
	   height: auto;
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
	/* 댓글 */
	.name {
		font-weight: bold;
	}
	.smallfont {
		font-size: 0.7em;
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
	   font-size: 1rem;
	}
	@media ( max-width : 700px) {
	   .comments_table {
	      font-size: 0.7rem;
	   }
	}
	
	.container-mypage{
	   margin: 50px 0 100px 0 ;
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
	  	width: 30px;
	    height: auto;
	    margin-right: 10px;
	}
	/* follow button */
	.follow-btn, .delete-btn, .update-btn{
		border: none;
		background: #ef900e;	
		font-size: 1rem;	 
		border-radius: 10px;
		transition:all 0.2s; 
		box-shadow: 0px 3px rgba(239,144,14,0.5); 	 
		color: white;
	}
	.follow-btn:active, .delete-btn:active, .update-btn:active{		
			transform: translateY(3px);
	}
	 *:focus { 
	 	outline:none !important; 
	 }
	 /* follow button end*/
	  .member_upload_img div img{
	    width: 100%;
	    height: 120px;
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
	</style>
<title>Mypage</title>
</head>
<body>
   <div class="container container-mypage">
      <div class="wrapper row justify-content-between">
         <div class="main pb-5">
            <div class="row justify-content-between title">
               <div class="col-10 page-tap d-inline-flex">
                  <div>
                  	<h6><a href="community.cm">COMMUNITY</a> > 상세보기 </h6>
                  </div>
                  <%if(picsVO.getPICS_MEMBER()== memberVO.getMEMBER_NUM()){
                	  
                  %>
                  <div class="btn_wrap offset-2">                  	
                  	<button class="update-btn">수정</button>
                  	<button class="delete-btn">삭제</button>
                  </div>
                  <%
                  }
                  %>
               </div> 
            </div>
            <div class="row img-wrap ">
            <%
            		if(picsVO.getPICS_FILE_1()!=null){
            			String content = picsVO.getPICS_CONTENT_1();
            			if(picsVO.getPICS_CONTENT_1()==null){               				
               				content="";
            			}
            %>
         
               <div class="col-10 pb-5">
                  <a href=""><img
                     src="/communityupload/image/<%=picsVO.getPICS_FILE_1()%>"
                     alt="" /></a>
               </div>
               <div class="col-10"><p><%=content%></p>
               </div>
            <%       
            			
              		}if(picsVO.getPICS_FILE_2()!=null){
              			String content = picsVO.getPICS_CONTENT_2();
            			if(picsVO.getPICS_CONTENT_2()==null){               				
               				content="";
            			}
               			
    		%>
         
               <div class="col-10 pb-5">
                  <a href=""><img
                     src="/communityupload/image/<%=picsVO.getPICS_FILE_2()%>"
                     alt="" /></a>
               </div>
               <div class="col-10"><p><%=content%></p>
               </div>
            <%       
               		}if(picsVO.getPICS_FILE_3()!=null){
               			String content = picsVO.getPICS_CONTENT_3();
            			if(picsVO.getPICS_CONTENT_3()==null){               				
               				content="";
            			}
            %>
                        
                        <div class="col-10 pb-5">
                           <a href=""><img
                              src="/communityupload/image/<%=picsVO.getPICS_FILE_3()%>"
                              alt="" /></a>
                        </div>
                        <div class="col-10"><p><%=content %></p>
                        </div>
            <%       
		       			 
		      		}
            %>  
            </div>
         </div>
         <!-- main end -->
         <!-- sidebar start -->
         <div class="sidebar" id="sidebar">
            <div class="row justify-content-around pb-2">
               <div class="profile-img">
                  <img src=<%=memberVO.getMEMBER_PICTURE()%> width=1rem; alt="" class="src"  /><%=memberVO.getMEMBER_NICK() %>
               </div>
               <div class="follow-btn-wrap">                  
                  <button class="follow-btn">follow</button>
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
	                  <img src="/communityupload/image/<%=memberPicsVO.getPICS_FILE_1()%>" alt="" class="img-responsive img-thumbnail" />
	               </a> 
               </div>
               <%} %>
            </div>
            
            
            <div class="d-flex justify-content-center pt-2">
               <div>
                  <i class="far fa-heart fa-2x"></i>15 
                  <i class="fas fa-share-alt-square fa-2x">   
                  </i>     
                  <span class="sociallink ml-1"> 
					  <a href="javascript:sendLinkFacebook()" title="페이스북으로 공유">
					    <i class="fab fa-facebook fa-2x"></i>
					  </a>
					</span>
					<span class="sociallink ml-1">
					  <a href="javascript:sendLinkTwitter()" title="트위터로 공유">
					    
					  </a>
					</span>
					<span class="sociallink ml-1">
					  <a href="javascript:sendLinkNaver()" title="네이버로 공유">
					    
					  </a>
					</span>
					<span class="sociallink ml-1">
					  <a href="javascript:sendLinkKakao()" id="kakao-link-btn" title="카카오톡으로 공유">
					    
					  </a>
					</span>
					
					 <div id="fb-root"></div>
					 
                  <div class="fb-share-button" 
                  data-href="http://192.168.0.37:8000/NAGAGU/community_detail.cm" 
                  data-layout="button_count" data-size="small">
                  	<a target="_blank" href="http://192.168.0.37:8000/NAGAGU/community_detail.cm" class="fb-xfbml-parse-ignore">
                  		<i class="fab fa-facebook fa-2x"></i>
                  	</a>
                  </div>          
               </div>
            </div>
         </div>
         <!-- side bar end -->
      </div>
      <!-- wrapper end -->
      <!-- 댓글 테이블 시작 -->
		<br />
		<br />
		<hr />
		<h3 >Review</h3>
		<br /><br />
		<div class="comments_table" id="output" style="color: #212529;">
			<div class="comments_reply" id="outputReply">
				
			</div>
		</div>

		<form id="insert_form" class="row justify-content-between"
			name="commentForm" action="/NAGAGU/insertComment.cm" method="post">
			<%-- <input type="hidden" name="PICS_RE_REF" value="<c:out value="${commentList.PICS_RE_PICS}"/>"> --%>
			<div class="col-1"></div>
			<div class="col-9">
				<textarea name="PICS_RE_CONTENT" id="text" 
					placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다:)" style="width: 100%" cols="80"
					rows="2"></textarea>
			</div>
			<div class="col-2 px-0">
				<button type="button" value="등록" id="input_data">등록</button>
			</div>
		</form>
		<!-- 댓글 테이블 끝 -->
   </div>
   <!-- container end -->
   <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
      integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
      crossorigin="anonymous"></script>
      <!-- fontawesome kit -->
	<script src="https://kit.fontawesome.com/97dbc99ea1.js" crossorigin="anonymous"></script>
	<script type="text/javascript" charset="utf-8">
	
	$('.delete-btn').on('click',function(){
		if(confirm('정말 삭제하시겠습니까?')){
			var url = '${pageContext.request.contextPath}/community_delete.cm'
				+ '?PICS_NUM='+<%=picsVO.getPICS_NUM()%>
			location.href=url;			
		}	
	});
	$('.update-btn').on('click',function(){
		var url = '${pageContext.request.contextPath}/community_update.cm' 
				+ '?PICS_NUM='+<%=picsVO.getPICS_NUM()%>
				+ '&MEMBER_NUM='+<%=memberVO.getMEMBER_NUM()%>
				<%-- '&PICS_MEMBER='+<%=pics_vo.getPICS_MEMBER()%>"> --%>
		location.href=url;		
	});
/* 	$('.writeReply').on('click',function(){
		document.replyForm.submit();
	}); */
<%-- 	<c:forEach var="commentList" items="${commentList}"
		varStatus="status">
		<div class="row">
			<div class="col-1">
				<img
					src="${pageContext.request.contextPath}/resources/images/Community/peko.png"
					alt="" class="img-circle"
					style="width: 60%; height: 60%; margin: 0 0 0 25px;">
			</div>
			<div class="col-11">
				<div class="row">
					<div class="col-10">아아디:<c:out value="${commentList.PICS_RE_MEMBER}" /></div>
						<%=memberVO.getMEMBER_NICK() %></div>
					<div class="col-2 smallfont px-0">날짜:<c:out value="${commentList.PICS_RE_DATE}" /></div>
					<div class="row">
						<div class="col-12 comm_content">내용:
							<c:out value="${commentList.PICS_RE_CONTENT}" />
						</div>
					</div>
					<div class="row">
						<div class="col">
							<a href="#" class="smallfont">답글달기</a> <a href="#"
								class="smallfont">신고하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach> --%>
	$(document).ready(function(){
		function select(){
			var params = 'PICS_RE_PICS='+<%=picsVO.getPICS_NUM()%>;
			$('#output').empty();
			alert('리스트 ajax시작');
			$.ajax({
				url: '/NAGAGU/getCommentList.cm',
				type:'POST',
				data: params,
				dataType: "json",
				contentType:'application/x-www-form-urlencoded; charset=utf-8',
				success:function(data){
					//폼 통해 받은 값들은 여기에 
  
					$.each(data, function(index,item){
						var output='';
						output += '<div class="row"><div class="col-1"><img src=';
						output += '<%=memberVO.getMEMBER_PICTURE()%>';
						output += 'class="img-circle" style="width: 50px; height: 50px; margin: 0 20% auto;"></div>'
						output += '<div class="col-11"><div class="row reply'+item.pics_RE_NUM+'"><div class="col-10">별명:<%=memberVO.getMEMBER_NICK()%></div>'
						output += '<div class="col-2 smallfont px-0">날짜:'+item.pics_RE_DATE+'</div>	<div class="row">';
						output += '</div><div class="col-12" id="commentNum'+item.pics_RE_NUM+'">내용:'+item.pics_RE_CONTENT+'</div>'; 
						output += '<div class="d-flex"><div class="col ">';
						output += '<a href="#" class="smallfont re_reply" num='+item.pics_RE_NUM+'>답글달기</a> <a href="#" class="smallfont">신고하기</a></div></div></div></div></div>'
						//output += '<div id="commentNum'+item.pics_RE_NUM+'"><tr>';
						//output += '<td>num=' + item.pics_RE_NUM + '</td>'; 
						output+='<td><input type="button" id="deleteForm" class="delete_form" value="삭제" num='+item.pics_RE_NUM+'';
						output+='></td>'; 
						output+='<td><input type="button" class="update_form" value="수정" num='+item.pics_RE_NUM+' text='+item.pics_RE_CONTENT+' ref='+item.pics_RE_REF+'></input></td>';
						output +='</tr>'; 
						output +='</div>';
						console.log("output:" + output); 
						//console.log("pass:" + $("input#passck").val());
						$('#output').append(output);	
					});
					//$("#commentList").html(output);
				},
				error:function(){
					alert("ajax통신 실패!!");
				}
			});
		}
		$(document).on('click','.re_reply',function(event){
			alert('hi')			
			var num= $(this).attr("num");
			//var id= $(this).attr("id");
			alert(num)
			var output="";
			output += '<form class="insert_form" id="insert_form">';
			output += '<span style="font-size: 9pt">';
			output += '<td><a href="#" class="#" id="input_data" num='+num+'>저장&nbsp';	//입력 받지 않는 값
			output += '<input type="hidden" name="PICS_RE_NUM" value="'+num+'"></a>';
			//output += '<input type="hidden" name="PICS_RE_REF" value="'+num+'"></a>';
			//output += '<input type="hidden" name="id" value="'+id+'">';
			output += '<td><a href="#" class="update_cancle">취소</a></td>';
			output += '</span>';		
			output += '<div><textarea name="PICS_RE_CONTENT" id="text">';
			output += '</textarea></div>';
			output += '</form>';
			$('.reply'+num).after(output);
		}) 
 
		
	$(document).on('click','#input_data',function(event){
		alert('댓글 입력 ajax 시작')
		
		var params=$("#insert_form").serialize();
		<%-- params += '&PICS_RE_REF='+<%=picsVO.getPICS_RE_NUM()%>; --%>
		params += '&PICS_RE_PICS='+<%=picsVO.getPICS_NUM()%>;
		//나중에 세션에서 값 가져오기(멤버)ㄴ
		params += '&PICS_RE_MEMBER='+<%=memberVO.getMEMBER_NUM()%>;
		alert(params);
		jQuery.ajax({
			url: '/NAGAGU/insertComment.cm',
			type: 'POST',
			data: params,
			contentType:
				'application/x-www-form-urlencoded; charset=utf-8',
			datatype: 'json', 
			success: function(retVal){
				if(retVal.res=="OK"){
					//$('#id').val(''); 
					$('#text').val('');
					//$('#pass').val('');
				}else{
					alert("insert fail");
				}
			},
			error:function(){
				alert("ajax통신 실패!!");
			}
			
		});
		event.preventDefault();
		select();
	});

	//삭제
	$(document).on('click','#deleteForm',function(event){
		if (!confirm("삭제하시겠습니까?")) {
			return;
		} 
		var delNum = $(event.target).attr('num')
		alert(delNum);
		jQuery.ajax({
			url: '/NAGAGU/deleteComment.cm',
			type: 'POST',
			data: {'delNum': delNum},
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			dataType: 'json',
			success: function(retVal){
				alert("AAAAA");
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
	}); 
	//수정 버튼 누르면 입력창으로 바뀜
	$(document).on('click','.update_form',function(event){
			var num= $(this).attr("num");
			//var id= $(this).attr("id");
			var text= $(this).attr("text");
			var output="";
			output += '<form class="update_form" id="update_form'+num+'">';
			output += '<span style="font-size: 9pt">';
			output += '<td><a href="#" class="update_apply" num='+num+'>저장&nbsp';	//입력 받지 않는 값
			output += '<input type="hidden" name="PICS_RE_NUM" value="'+num+'"></a>';
			//output += '<input type="hidden" name="id" value="'+id+'">';
			output += '<td><a href="#" class="update_cancle">취소</a></td>';
			output += '</span>';		
			output += '<div><textarea name="PICS_RE_CONTENT" id="text">';
			output += text;
			output += '</textarea></div>';
			output += '</form>';
			$('#commentNum'+num).html(output);
			//event.preventDefault();
		});
	//취소
	$(document).on('click','.update_cancle',function(){
		select();
	})
		//수정 적용
	$(document).on('click','.update_apply',function(event){
		var num= $(this).attr("num"); 
		var params=$("#update_form"+num).serialize();
		alert(params);
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

	
	

	
	//유효성 검사
	function insertCommentSubmit(){
		var commentForm = document.commentForm;
		
/* 		if (commentForm.id.value=="") {
			alert("작성자를 입력해주세요.");
			form1.id.focus();
			return;
		} */
		if (commentForm.text.value=="") {
			alert("글 내용을 입력해주세요.");
			commentForm.text.focus();
			return;
		}
/* 		if (commentForm.pass.value=="") {
			alert("비밀번호를 입력해주세요.");
			form1.text.focus();
			return;
		} */
		commentForm.submit();	
	}
	
	
	</script>


	
</body>
</html>