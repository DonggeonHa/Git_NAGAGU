<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.community.PicsVO"%>
<%@ page import="com.spring.member.MemberVO"%>
<%
	System.out.println("pics_jsp start");
	System.out.println("세션에서 받은 멤버넘버 =" +session.getAttribute("MEMBER_NUM"));

	ArrayList<PicsVO> picsList = (ArrayList<PicsVO>) request.getAttribute("picsList");
	ArrayList<MemberVO> memberList = (ArrayList<MemberVO>) request.getAttribute("memberList"); 
	
	MemberVO memberVO = (MemberVO)request.getAttribute("memberDetailbyEmail");
	 
	int listcount = ((Integer) request.getAttribute("listcount")).intValue(); // (전체/카테고리)글 개수
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
	
	String PICS_CATEGORY = (String)request.getAttribute("pics_category");
	String PICS_REVIEW= (String)request.getAttribute("pics_review");
	String sort = (String)request.getAttribute("sort");
	//System.out.println("sos"+picsList.size());
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

.img:hover #output {
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
								<button class="btn btn-outline-secondary btn-md my-2 my-sm-0"
									type="submit" id="search_btn">Search</button>
							</span>
						</div>
						<!-- /input-group -->
					</div>
					<!-- /.col-lg-6 -->
				</div>
				<!-- div.row -->
			</div>
			<div class="row justify-content-end mx-0">
				<button class="btn btn-outline-dark btn-md my-2 my-sm-0"
					type="submit" onclick="location.href='community_write.cm?MEMBER_NUM=1'">글쓰기</button>
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
						<div>
							<a href="other_mypage.my"> 
								<img src=<%=member_vo.getMEMBER_PICTURE()%> alt="" class="src" 
								style="width:50px; height:auto;"><%=member_vo.getMEMBER_NICK()%> 
							</a>
						</div>
						<div>조회수<%=pics_vo.getPICS_READ()%></div>
					</div>
					<a href="${pageContext.request.contextPath}/community_detail.cm?PICS_NUM=<%=pics_vo.getPICS_NUM()%>&MEMBER_NUM=<%=member_vo.getMEMBER_NUM()%>&PICS_MEMBER=<%=pics_vo.getPICS_MEMBER()%>">
						<div class="img">
							<img src="/communityupload/image/<%=pics_vo.getPICS_FILE_1()%>" class="img" />
							<div class="hover-image" id="output">
								<a href="#"> 
									<span class="button likeBtn" id="<%=pics_vo.getPICS_NUM()%>" name="a">  
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

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/97dbc99ea1.js"
		crossorigin="anonymous"></script>
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
	<script>
		  $(document).on("click","#far",function (){
			var picsNum = $(event.target).parent().attr('id')
			var	memberNum = <%=memberVO.getMEMBER_NUM()%>
			console.log(picsNum)
		<%-- 	console.log(${memberVO.MEMBER_NUM})
			console.log(<%=memberVO.getMEMBER_NUM()%>) --%>
			
 			$.ajax({
				url: "/NAGAGU/insertPicsLike.cm",
                type: "POST",
                data: { 'memberNum' : memberNum , 'picsNum' : picsNum},
                contentType:
    				'application/x-www-form-urlencoded; charset=utf-8',
                success: function (retVal) {
		        if(retVal.res=="OK"){
		        	//$('#'+idNum).parent().empty();
		        	var output="";
					output += '<span class="button likeBtn" id='+picsNum+' name="a">'
					output += '<i class="far fa-heart fa-2x" id="far"></i>'
					output += '</span>'+retVal.picsLikeCount+''
		        	console.log('output:'+output)
		        	var idNum = $('.likeBtn').attr('id')
		        	$('#'+idNum).parent().html(output);
		        	
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
			//addClass()
/* 		    function addClass() {
			    if($("#far").attr('data-prefix') === "far"){
			      $("#far").removeClass("far fa-heart fa-2x");
				   $("#far").addClass("fas fa-heart fa-2x");
			    }else{
			      $("#far").removeClass("fas fa-heart fa-2x");
			      $("#far").addClass("far fa-heart fa-2x");
			    }
		    } */
		    
		  });
	</script>
	<script>
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
	

	
	
	/*var btn = document.getElementById('search_btn');
	 btn.addEventListener("click",function(){
		location.href='${pageContext.request.contextPath}/community.cm'
	}); */
	</script>
</body>
</html>