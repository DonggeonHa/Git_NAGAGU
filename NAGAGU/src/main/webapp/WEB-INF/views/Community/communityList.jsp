<%@ page language="java" contentType="text/html; charset=UTF-8"	
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.community.PicsVO"%>
<%@ page import="com.spring.member.MemberVO"%>
<%
	System.out.println("pics_jsp start");
	
	ArrayList<PicsVO> picsList = (ArrayList<PicsVO>) request.getAttribute("picsList");
	ArrayList<MemberVO> memberList = (ArrayList<MemberVO>) request.getAttribute("memberList"); 
	
	//로그인 정보 확인(멤버)
	int LOGIN_MEMBER_NUM = 0;
	MemberVO loginmemberVO = null;
	if(session.getAttribute("MEMBER_NUM")!=null){
		LOGIN_MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
	}
	
	int listcount = ((Integer) request.getAttribute("listcount")).intValue(); // (전체/카테고리)글 개수
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
	
	String PICS_CATEGORY = (String)request.getAttribute("pics_category");
	String PICS_REVIEW= (String)request.getAttribute("pics_review");
	String sort = (String)request.getAttribute("sort");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"	crossorigin="anonymous">
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

.search-tap {
	border-bottom: 1px solid #EAEAEA;
}

.caption {
	border-bottom: 1px solid #EAEAEA;
}

.main-content {
	margin: 0 0 100px 0;
}

.main-content a, .main-content a:link, .main-content a:hover {
	text-decoration: none;
	color: black;
}

img {
	width: 100%;
	height: 100%;
}

.img {
	height: 30vh;
}

.img-wrap {
	padding-top: 10px;
	padding-bottom: 15px;
}

.profile {
	display: flex;
	justify-content: space-between;
}

.caption {
	display: flex;
	justify-content: space-around;
}

.hover-image {
	transition: .5s ease;
	opacity: 0;
	position: absolute;
	top: 60%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
}

.img:hover .img {
	opacity: 0.3;
}

.img:hover .heart_output {
	opacity: 1;
}

.pagination {
	display: inline-block;
	margin-bottom: 30px;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a:hover {
	background-color: #ef902e;
	color: black;
}

.search-tap a:hover {
	color: #ef900e !important;
	transform: scale(1.2);
}
.profile_children{
	display:flex;
}
 .follow_btn_wrap, .follow_readcount{
    align-self: center;
 }
.follow_readcount{
	flex-direction:row
}
/* follow button */
.follow_btn {
	border: none;
	/* background: #ef900e; */	
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
.follow_btn:active{		
	transform: translateY(3px);
}
 *:focus { 
 	outline:none !important; 
 }
 /* follow button end*/

</style>
</head>

<body>
	<!-- SECTION: content -->
	<!-- content start -->
	<div class="container main-content">
		<div class="content">
			<div class="search-tap">
				<div class="caption py-5">
					<a href="./community.cm?PICS_CATEGORY=all&PICS_REVIEW=<%=PICS_REVIEW%>&sort=<%=sort%>">ALL</a> 
					<a href="./community.cm?PICS_CATEGORY=table&PICS_REVIEW=<%=PICS_REVIEW%>&sort=<%=sort%>">책상</a> 
					<a href="./community.cm?PICS_CATEGORY=chair&PICS_REVIEW=<%=PICS_REVIEW%>&sort=<%=sort%>">의자</a> 
					<a href="./community.cm?PICS_CATEGORY=bookshelf&PICS_REVIEW=<%=PICS_REVIEW%>&sort=<%=sort%>">책장</a>
					<a href="./community.cm?PICS_CATEGORY=bed&PICS_REVIEW=<%=PICS_REVIEW%>&sort=<%=sort%>">침대</a> 
					<a href="./community.cm?PICS_CATEGORY=drawer&PICS_REVIEW=<%=PICS_REVIEW%>&sort=<%=sort%>">서랍장</a> 
					<a href="./community.cm?PICS_CATEGORY=sidetable&PICS_REVIEW=<%=PICS_REVIEW%>&sort=<%=sort%>">협탁</a> 
					<a href="./community.cm?PICS_CATEGORY=dressing_table&PICS_REVIEW=<%=PICS_REVIEW%>&sort=<%=sort%>">화장대</a>
					<a href="./community.cm?PICS_CATEGORY=others&PICS_REVIEW=<%=PICS_REVIEW%>&sort=<%=sort%>">기타</a>					
				</div>
				<div class="row m-0 my-2">
					<table>
						<tr>
							<td><select id = "sort" class="form-control mr-2" onchange="location.href=(this.value);">									
									<option value="./community.cm?PICS_CATEGORY=<%=PICS_CATEGORY%>&PICS_REVIEW=<%=PICS_REVIEW%>&sort=new" id="new">최신순</option>
									<option value="./community.cm?PICS_CATEGORY=<%=PICS_CATEGORY%>&PICS_REVIEW=<%=PICS_REVIEW%>&sort=read" id="read">조회순</option>
									<option value="./community.cm?PICS_CATEGORY=<%=PICS_CATEGORY%>&PICS_REVIEW=<%=PICS_REVIEW%>&sort=like" id="like">인기순</option>
							</select></td>
							<td>&nbsp;</td>
							<td><select id = "sort" class="form-control" onchange="location.href=(this.value);">
									<option value="./community.cm?PICS_CATEGORY=<%=PICS_CATEGORY%>&PICS_REVIEW=0&sort=<%=sort%>" id="all">모두보기</option>
									<option value="./community.cm?PICS_CATEGORY=<%=PICS_CATEGORY%>&PICS_REVIEW=1&sort=<%=sort%>" id="review">후기</option>									
							</select></td>
						</tr>
					</table>
					
					<div class="col-lg-3 col-sm-4 ml-auto">
						<div><select id = "search_option" class="form-control mr-2" onchange="">									
									<option value="tag" id="tag">태그</option>
									<option value="write" id="write">글쓴이</option>
									<option value="content" id="content">내용</option>
							</select></div>
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for..." id="keyword" > <span
								class="input-group-btn ml-3">
								<button class="btn btn-outline-secondary btn-md my-2 my-sm-0" type="submit" id="search_btn">Search</button>
							</span>
						</div>
						<!-- /input-group -->
					</div>
					<!-- /.col-lg-6 -->
				</div>
				<!-- div.row -->
			</div>
			<div class="row justify-content-end mx-0">
				<c:set var="name" value="<%=LOGIN_MEMBER_NUM%>" />
				<c:if test="${name != 0}">
				    <button class="btn btn-outline-dark btn-md my-2 my-sm-0"
					type="submit" onclick="location.href='community_write.cm?MEMBER_NUM=<%=LOGIN_MEMBER_NUM%>'">글쓰기</button>
				</c:if>
				<c:if test="${name == 0}">
				    <button class="btn btn-outline-dark btn-md my-2 my-sm-0"
					type="submit" onclick="alert('로그인 해주세요')">글쓰기</button>
				</c:if>
			</div>
			<!-- images start -->
			<div class="row pt-2 mt-4">
					<%
						
						if (listcount > 0) {							
							for (int i = 0; i < picsList.size(); i++) {								
								PicsVO pics_vo = picsList.get(i);								
								MemberVO member_vo=memberList.get(i);
					%>
				<div class="col-md-4 img-wrap">
					<div class="profile">
						<div class="profile_children" >
							<div>
							<a href="memberLikePics.cm?MEMBER_NUM=<%=member_vo.getMEMBER_NUM()%>"> 
								<img src=<%=member_vo.getMEMBER_PICTURE()%>	style="width:50px; height:auto;"><%=member_vo.getMEMBER_NICK()%> 
							</a>
							</div >
							<div id="output<%=member_vo.getMEMBER_NUM()%>" class="follow_btn_wrap">
								<button type="button" class="follow_btn flw_btn<%=member_vo.getMEMBER_NUM()%>" id="<%=member_vo.getMEMBER_NUM()%>">follow</button>
							</div>
						</div>
						<div class="follow_readcount">
							<div>조회수<%=pics_vo.getPICS_READ()%></div>
						</div> 
					</div>
					<a href="${pageContext.request.contextPath}/community_detail.cm?PICS_NUM=<%=pics_vo.getPICS_NUM()%>&MEMBER_NUM=<%=member_vo.getMEMBER_NUM()%>&PICS_MEMBER=<%=pics_vo.getPICS_MEMBER()%>">
						<div class="img">
							<img src="/communityupload/image/<%=pics_vo.getPICS_FILE_1()%>" class="img" />
							<div class="hover-image heart_output" id="<%=pics_vo.getPICS_NUM()%>" name="picnum<%=pics_vo.getPICS_NUM()%>">
								<a href="#"> 
									<span class="button likeBtn" id="heart_output<%=pics_vo.getPICS_NUM()%>"  >  
										<i class="far fa-heart fa-2x" id="far"></i>
									</span><%=pics_vo.getPICS_LIKE()%>
								</a> 
									<a href=""><i class="far fa-share-square fa-2x"></i>
								</a>
							</div>
						</div>
					</a>
					<div class="img-tag">
						<%	if(pics_vo.getPICS_TAG().length()>0){
							String tags[]  = pics_vo.getPICS_TAG().split(",");
							for(int j=0; j<tags.length; j++){
						%>
							<a href="#"><span class=img-tags>#<%=tags[j]%></span></a>
							<%
							} 
							%>
						<%
							}
						%>
							<br />
					</div>
				</div>
				<!-- images end -->
				<%
					} 
				%>
			</div>
		</div>
		<!-- pagenation -->
		<div class="row justify-content-center">
			<div class="pagination">
				<%
				if (nowpage <= 1) {
			%>
				&laquo;
				<%
				} else {
			%>
				<a href="./community.cm?page=<%=nowpage - 1%>&PICS_CATEGORY=<%=PICS_CATEGORY%>">&laquo;</a>
				<%
				}
			%>
				<%
				for (int a = startpage; a <= endpage; a++) {
					if (a == nowpage) {
			%><!-- 현재 보고있는 페이지에는 링크를 걸지 않겠다. -->
				<%=a%>
				<%
					} else {
			%>
				<a href="./community.cm?page=<%=a%>&PICS_CATEGORY=<%=PICS_CATEGORY%>&sort=<%=sort%>"><%=a%></a>
				<%
					}
				}
			%><!-- 현재 보는 페이지가 마지막 페이지 이면 -->
				<%
				if (nowpage >= maxpage) {
			%>
				&raquo;
				<%
				} else {
			%>
				<a href="./community.cm?page=<%=nowpage + 1%>&PICS_CATEGORY=<%=PICS_CATEGORY%>">&raquo;</a>
				<%
				}
			%>
			</div>
		</div>
		<!-- pagenation 끝 -->
		<!-- SECTION: content  -->
		<% 
				}else{
			%>
		<div class="col-md-4">등록된 상품이 없습니다.</div>
		<%
				}
			%>
	</div>
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="	crossorigin="anonymous"></script>
	<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"	crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"  integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"   crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/97dbc99ea1.js"	crossorigin="anonymous"></script>
	<script>
	//좋아요 기능
	$(document).ready(function(){
		//처음 로드되고 로그인 사용자가 누른글 하트는 검게 바꿔줌
		function heart_check(){
			var	loginNum = '<%=LOGIN_MEMBER_NUM%>';
			if(loginNum == 0){
				return
			}
			$.ajax({
				url: "/NAGAGU/loginMemberLikePics.cm",
		              type: "POST",
		              data: { 'loginNum' : loginNum},
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
	    var	MEMBER_NUM = '<%=LOGIN_MEMBER_NUM%>';
		if(MEMBER_NUM==0){
			alert('로그인 하세요') 
			return				
		} 
		var PICS_NUM = $(this).parent().attr('id').substring(12)
			$.ajax({
			url: "/NAGAGU/insertPicsLike.cm",
	              type: "POST",
	              data: { 'MEMBER_NUM' : MEMBER_NUM , 'PICS_NUM' : PICS_NUM},
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
		
	});
	
	
	$(document).ready(function(){
		//처음 로드할때 팔로우 한 멤버 팔로우 버튼 바꿔주기~
		function follow_check(){
			var	fromNum = '<%=LOGIN_MEMBER_NUM%>';
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
		      				alert("성공");
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
		 var fromNum = '<%=LOGIN_MEMBER_NUM%>';
		 if(fromNum==0){ 
			alert('로그인 하세요') 
			return				
		 }
		 if(fromNum==toNum){
			alert('본인이네요') 
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
				alert("성공");
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
	})
	//정렬 옵션 선택
	var sort='<%=sort%>';
	var review='<%=PICS_REVIEW%>';
	var category='<%=PICS_CATEGORY%>';
	switch(sort) {	
	case 'new' :
		$('#new').prop('selected', true);
		break;
	case 'read' :
		$('#read').prop('selected', true);
		break;
	case 'like' :
		$('#like').prop('selected', true);
		break;
	}	 
	switch(review) {		
	case '0' :
		$('#all').prop('selected', true);
		break;
	case '1' :
		$('#review').prop('selected', true);
		break;
	}
	
	//검색어 유효성 검사, 검색하기
	var $keyword = $('#keyword');
	var $search_option = $('#search_option');
	$('#search_btn').on('click',function(){
		var keywordVal= $keyword.val();
		var search_option = $('#search_option').val();
		alert(keywordVal);
		if(!keywordVal){
			alert('검색어를 입력하세요');
			$('#keyword').focus();
			return
		}
		var url = '${pageContext.request.contextPath}/community.cm'
				+ '?keyword='+keywordVal
				+ '&search_option='+search_option;
		location.href=url;
	})
	/* 태그눌러서 검색 */ 
	$('.img-tags').on('click',function(){
		var text = $(this).text();
		var search_text = text.substring(1,text.length);
		alert(search_text);
		var url = '${pageContext.request.contextPath}/community.cm'
			+ '?keyword='+search_text
			+ '&search_option=tag';
			
		location.href=url;
	})
	//a태그 이동방지()
	$(document).on('click', 'a[href="#"]', function(e){
		e.preventDefault();
	});
	
	</script>
</body>
</html>