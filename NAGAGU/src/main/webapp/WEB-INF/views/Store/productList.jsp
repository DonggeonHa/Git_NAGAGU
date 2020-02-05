<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.member.MemberVO" %>
<%@ page import="com.spring.store.ProductVO"%>
<%


	System.out.println("==============================");
	System.out.println("store_productlist jsp");
	
	/*
	//로그인 상태 체크 위한
	String MEMBER_NICK = (String)session.getAttribute("MEMBER_NICK");

	MemberVO LoginMemberVO = null;
	int MEMBER_STATUS = 5;
	if((MemberVO)request.getAttribute("LoginMemberVO") != null) {
		LoginMemberVO = (MemberVO)request.getAttribute("LoginMemberVO");
		MEMBER_STATUS = LoginMemberVO.getMEMBER_STATUS();
	}
	*/
	int WORKSHOP_NUM = 0;
	if (session.getAttribute("WORKSHOP_NUM") == null) {
		WORKSHOP_NUM = 0;
	} else {
		WORKSHOP_NUM = (Integer)session.getAttribute("WORKSHOP_NUM");
	}

	ArrayList<ProductVO> productList = (ArrayList<ProductVO>) request.getAttribute("productList");
	String PRODUCT_CATEGORY = (String)request.getAttribute("PRODUCT_CATEGORY");
	int productcount = ((Integer) request.getAttribute("productcount")).intValue(); // (전체/카테고리)글 개수
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
	String sort = (String)request.getAttribute("sort");
	String category= (String)request.getAttribute("PRODUCT_CATEGORY");
	
	int WORKSHOP_STATUS = 0;
	if (session.getAttribute("WORKSHOP_STATUS") == null) {
		WORKSHOP_STATUS = 0;
	} else {
		WORKSHOP_STATUS = (Integer)session.getAttribute("WORKSHOP_STATUS");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<title>home</title>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
		crossorigin="anonymous">	
		
	<style type="text/css">
		@font-face {
			font-family: 'KOMACON';
			src:
				url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')
				format('woff');
			font-weight: normal;
			font-style: normal;
		}
		
		.search-tap {
			border-bottom: 1px solid #EAEAEA;
		}
		.search-tap a:hover{
			color: #ef900e !important;
			transform: scale(1.2);
		}
		.nav-tag {
			padding: 15px 0 15px 0 !important;
		}
		
		.wrap {
			margin-top: 20px;
		}
		
		.site-wrap {
			margin-bottom: 100px;
		}
		
		.caption {
			border-bottom: 1px solid #EAEAEA;
			display: flex;
			justify-content: space-around;
		}
		
		.content a, .content a:link, .content a:visited {
			color: black;
			text-decoration: none;
		}
		
		.wrap  {
			border: 1px solid #EAEAEA;
		}
		
		.wrap .img-tag {
			border-bottom: 1px solid #EAEAEA;
		}
		
		.img-wrap img {
			max-width: 100%;
			height: 250px;
		}
		
		p {
			margin: 0 auto;
			width: 100%;
			text-align: left;
			margin-left: 30px;
			margin-bottom: 0 !important;
		}

		.pagination {
		  display: inline-block;
		  margin-bottom:30px;
		}
		.pagination a {
		  color: black;
		  float: left;
		  padding: 8px 16px;
		  text-decoration: none;
		}
		.pagination a:hover {
		  background-color: #ef902e;
		  color:black;
		}	
		
		
		/*0118 수정*/
		/*스토어, 커뮤니티 이미지들 사이즈*/
		.image {
			height: 300px;
			width: 100%;
			border-radius: 10px;
		}		
				
		/*스토어, 커뮤니티 이미지 들어있는 곳에 마진*/
		.store_item {
			margin: 0 15px 15px 15px;
		}
		
		.store_item_header {
			font-size: small;
			text-align: center;
		}
		
		.store_item_content {
			align-items: center;
			margin: 0 auto;
		}		
		/*평점 / 가격*/
		.price {
			font-size: small;
			float: right;
		}
		
		.grade {
			font-size: small;
			float: left;
		}
		
		.second {
			display: block;
		}
		
		/*별 이미지 색상*/
		.fa-star {
			color: rgb(239, 144, 14);
		}		
		/*더보기*/

		.second {
			padding: 0 20px 0 20px;
			height: 100px;
		}		
		
		/*hover zoom*/
		.store_item_image {
			border-radius: 10px;
			position: relative;
			overflow: hidden; /*이미지가 튀어나오면 가림*/
			transform: scale(1);
			-webkit-transform: scale(1);
			-moz-transform: scale(1);
			-ms-transform: scale(1);
			-o-transform: scale(1);
			transition: all 0.3s ease-in-out;
		}
		
		.image:hover {
			transform: scale(1.2);
			-webkit-transform: scale(1.2);
			-moz-transform: scale(1.2);
			-ms-transform: scale(1.2);
			-o-transform: scale(1.2);
			/* padding: 10px; */
			border-radius: 20px;
		}
		
		.image::after {
			display: block;
			padding-top: 100%;
		}		
		
		.itemsection {
			padding:0 8%;
		}
		.items {
			/*
			border:1px solid #EAEAEA;
			*/
		}
</style>

</head>
<body class="order-body">
	<div class="site-wrap">
		<!-- content start -->
		<div class="container">
			<div class="content">
				<div class="search-tap">
					<div class="caption py-5">
						<a href='./productlist.pro?PRODUCT_CATEGORY=all&sort=new'>전체</a> <a
							href='./productlist.pro?PRODUCT_CATEGORY=table&sort=new'>책상</a> <a
							href='./productlist.pro?PRODUCT_CATEGORY=chair&sort=new'>의자</a> <a
							href='./productlist.pro?PRODUCT_CATEGORY=bookshelf&sort=new'>책장</a> <a
							href='./productlist.pro?PRODUCT_CATEGORY=bed&sort=new'>침대</a> <a
							href='./productlist.pro?PRODUCT_CATEGORY=drawer&sort=new'>서랍장</a> <a
							href='./productlist.pro?PRODUCT_CATEGORY=sidetable&sort=new'>협탁</a> <a
							href='./productlist.pro?PRODUCT_CATEGORY=dressing_table&sort=new'>화장대</a> <a
							href='./productlist.pro?PRODUCT_CATEGORY=others&sort=new'>기타</a>
					</div>
					<div class="row nav-tag">
						<table>
							<tr>
								<td>
									<select id = "sort" class="form-control mr-2" onchange="if(this.value) location.href=(this.value);">
										<option id = "new" value='./productlist.pro?PRODUCT_CATEGORY=<%=category %>&sort=new'>최신순</option>
										<option id = "sales"  value='./productlist.pro?PRODUCT_CATEGORY=<%=category %>&sort=sales'>판매량순</option>
										<option id = "grade"  value='./productlist.pro?PRODUCT_CATEGORY=<%=category %>&sort=grade'>평점순</option>
										<option id = "read"  value='./productlist.pro?PRODUCT_CATEGORY=<%=category %>&sort=read'>조회순</option>
										<option id = "like"  value='./productlist.pro?PRODUCT_CATEGORY=<%=category %>&sort=like'>좋아요순</option>
										<option id = "price"  value='./productlist.pro?PRODUCT_CATEGORY=<%=category %>&sort=price'>가격순</option>
									</select>
								</td>
								<td>&nbsp;</td>
							</tr>
						</table>
						<div class="col-lg-3 col-sm-4 ml-auto">
							<div class="input-group">
								<input type="text" class="form-control"	placeholder="Search for...">
								<span class="input-group-btn">
									<button class="btn btn-outline-secondary btn-md my-2 my-sm-0" type="submit">Search</button>
								</span> 
							</div>
							<!-- /input-group -->
						</div>
						<!-- /.col-lg-6 -->
					</div>
					<!-- div.row -->
				</div>
			
				<div class="row justify-content-end mx-0">
					<% if(WORKSHOP_STATUS == 2){ %>
						<span class="input-group-btn">
							<a href="./product_write.pro" class="btn btn-outline-dark" role="button" aria-pressed="true">글쓰기</a>
						</span>
					<% }  else { %>
						<span class="input-group-btn" style="display: none;">
							<a href="./product_write.pro" class="btn btn-outline-dark" role="button" aria-pressed="true">글쓰기</a>
						</span>
					<% } %>	
				</div>		
					
				
				<div class="row itemsection py-5">
						<%
						
								if (productcount > 0) {
									for (int i = 0; i < productList.size(); i++) {
										ProductVO pro = productList.get(i);
						%>			
		            <div class="col-4 h-100 items">
		                <a href="./productdetail.pro?PRODUCT_NUM=<%=pro.getPRODUCT_NUM()%>&PRODUCT_CATEGORY=<%=pro.getPRODUCT_CATEGORY()%>&page=<%=nowpage%>">
						<div class="row">
		                    <div class="store_item">
		                        <div class="store_item_image ">
		                        		<img src="/productupload/image/<%=pro.getPRODUCT_IMAGE()%>" alt="" class="img-responsive image"  >
									
		                        </div>
		                    </div>
		                </div>
		                <div class="row second">
		                    <div class="store_item_content">
		                        <!--브랜드이름은 한줄로 제한, 제품이름도 2줄 제한으로(기능)-->
		                        <div class="store_item_header">
		                            <span class="store_item_header_brand"><%=pro.getPRODUCT_SHOPNAME()%></span><br>
		                            <span class="store_item_header_name"><%=pro.getPRODUCT_TITLE()%></span>
		                        </div>
		                        
		                        <div class="align-self-end row mt-2 grade_price">
		                            <div class="col-8 grade_div">		                            
		                                <span class="grade"><i class="fas fa-star"></i><span><%=pro.getPRODUCT_GRADE()%></span></span>
		                            </div>
		                            <div class="col-4">
		                                <span class="price"><%=pro.getPRODUCT_PRICE()%>&nbsp;원</span>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>	
		            </a>
					<%
									}
					%>     
				</div>		<!-- 사진 상세정보 row1 row2 끝 -->
	
			
			</div><!-- content end -->
		</div> <!-- container end -->
		<br /> <br /> 
		
		
		
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
					<a href="./productlist.pro?PRODUCT_CATEGORY=<%=PRODUCT_CATEGORY%>&page=<%=nowpage - 1%>">&laquo;</a>
			<%
				}
			%>
			
			<%
				for (int a = startpage; a <= endpage; a++) {
					if (a == nowpage) {
			%><!-- 현재 보고있는 페이지에는 링크를 걸지 않겠다. --> 
						<%=a%>
			<%
					} else { System.out.println("현재 list의 PRODUCT_CATEGORY"+PRODUCT_CATEGORY);
			%>
						<a href="./productlist.pro?PRODUCT_CATEGORY=<%=PRODUCT_CATEGORY%>&page=<%=a%>"><%=a%></a>
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
					<a href="./productlist.pro?PRODUCT_CATEGORY=<%=PRODUCT_CATEGORY%>&page=<%=nowpage + 1%>">&raquo;</a>
			<%
				}
			%>
			</div>
		</div>	<!-- pagenation 끝 -->	
		
		
			<table width="50%" border="0" cellpadding="0" cellspacing="0"
				align="center" valign="middle">
				<tr align="center" height="20">
					<td colspan="7" style="font-family: Tahoma; font-size: 10pt;">
						
					</td>
				</tr>
				<%
				}else {
				%>
				<tr align="center" valign="middle">
					<td align="right"><font size=2>등록된 상품이 없습니다.</font></td>
				</tr>
				<%
					}
				%>
			</table>
			
			
			 	<table width="555" border="1" cellspacing="0" cellpadding="0"
						bgcolor="yellow" align="center" id="output">
				</table>
			
			
		
	</div> <!-- site-wrap 끝 -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>	
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
		
	<script>
		var sort='<%=sort%>';
		switch(sort) {
		case 'new' :
			$('#new').prop('selected', true);
			break;
		case 'sales' :
			$('#sales').prop('selected', true);
			break;
 		case 'grade' :
			$('#grade').prop('selected', true);
			break;
 		case 'read' :
			$('#read').prop('selected', true);
			break;
		case 'like' :
			$('#like').prop('selected', true);
			break;
		case 'price' :
			$('#price').prop('selected', true);
			break;
		}
		
	</script>




<script>
$(document).ready(function(){
	
    $("#sort1").on("change", function(){
    	var sort = $(this).val();
        
        var url = "/NAGAGU/productlist_sort.pro?PRODUCT_CATEGORY=" + "<%=category%>" + "&sort=" + sort;
        alert('url='+url);
        
        jQuery.ajax({
            url : url,
            type : 'GET',
            contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
            dataType : "json", // 서버에서 보내줄 타입
            success: function (data) {
            	alert("success!");
            
            },
            error:function() {
               alert("ajax통신 실패!!!");
            }
         });
        
        
    });
    
    

});



</script>

</body>
</html>