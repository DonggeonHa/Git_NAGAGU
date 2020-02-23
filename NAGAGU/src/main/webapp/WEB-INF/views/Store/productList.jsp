<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
<style type="text/css">
	.search-tap {
		font-size: 20px;
		border-bottom: 1px solid #EAEAEA;
		font-size:20px;
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
	div.items a{
		color: black;
	}
	.caption a{ 
		color: rgba(0,0,0,0.3) !important;
		font-weight: 600;
	}
	.caption .active{
		color: rgba(0,0,0,1) !important;
	}		
	
	.page-item.active .page-link {
		background-color: #ef900e !important;
	}
</style>

<!-- content start -->
<div class="container category_st">
	<div class="content">
		<div class="search-tap">
			<div class="caption py-5">
				<a id="all_tab" href='./productlist.pro?PRODUCT_CATEGORY=all&sort=new'>전체</a> 
				<a id="table_tab" href='./productlist.pro?PRODUCT_CATEGORY=table&sort=new'>책상</a> 
				<a id="chair_tab" href='./productlist.pro?PRODUCT_CATEGORY=chair&sort=new'>의자</a> 
				<a id="bookshelf_tab" href='./productlist.pro?PRODUCT_CATEGORY=bookshelf&sort=new'>책장</a> 
				<a id="bed_tab" href='./productlist.pro?PRODUCT_CATEGORY=bed&sort=new'>침대</a> 
				<a id="drawer_tab" href='./productlist.pro?PRODUCT_CATEGORY=drawer&sort=new'>서랍장</a> 
				<a id="sidetable_tab" href='./productlist.pro?PRODUCT_CATEGORY=sidetable&sort=new'>협탁</a> 
				<a id="dressing_table_tab" href='./productlist.pro?PRODUCT_CATEGORY=dressing_table&sort=new'>화장대</a> 
				<a id="others_tab" href='./productlist.pro?PRODUCT_CATEGORY=others&sort=new'>기타</a>
			</div>
			<div class="d-flex bd-highlight nav-tag">
				<div class="mr-auto bd-highlight">
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
						</tr>
					</table>
				</div>
				<div class="col-lg-3 col-sm-4 bd-highlight" style="padding-right:0 !important; padding-left:0 !important;">
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
			<% 
				if(WORKSHOP_STATUS == 2) { 
			%>
				<span class="input-group-btn">
					<a href="./product_write.pro" class="btn btn-outline-dark" role="button" aria-pressed="true">글쓰기</a>
				</span>
			<% 
				} else { 
			%>
				<span class="input-group-btn" style="display: none;">
					<a href="./product_write.pro" class="btn btn-outline-dark" role="button" aria-pressed="true">글쓰기</a>
				</span>
			<% 
				} 
			%>	
		</div>		
	</div><!-- content end -->
		
	<%
		if (productcount > 0) {
	%>
			<div class="row itemsection py-5">
	<%
			//0 - 품절, 1 - 판매중, 2 - 판매완료
			for (int i = 0; i < productList.size(); i++) {
				ProductVO pro = productList.get(i);
					if(pro.getPRODUCT_STATUS() == 0 || pro.getPRODUCT_STATUS() == 1) {
	%>		
		            	<div class="col-4 h-100 items">
		            		<a href="./productdetail.pro?PRODUCT_NUM=<%=pro.getPRODUCT_NUM()%>&PRODUCT_CATEGORY=<%=pro.getPRODUCT_CATEGORY()%>&page=<%=nowpage%>" style="text-decoration: none;">	
								<div class="row">
				                    <div class="store_item">
				                        <div class="store_item_image ">
			                        		<img src="/productupload/image/<%=pro.getPRODUCT_IMAGE()%>" alt="" class="img-responsive image">
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
				                                <span class="price">
				                                	<% if(pro.getPRODUCT_STATUS() == 1) { %>
				                                		<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=pro.getPRODUCT_PRICE()%>" />&nbsp;원
				                                	<% } else { %>
				                                		<span style="color:red;">품절</span>
				                                	<% } %>
				                                </span>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				        	</a>        
						</div>	
	<%
					}
			}
	%>     
			</div>		<!-- 사진 상세정보 row1 row2 끝 -->
	
			<!-- pagenation -->
			<nav aria-label="Page navigation example">
				<ul class="pagination d-flex justify-content-center">
			<%
				if (nowpage <= 1) {
			%>			
					<li class="page-item disabled">
						<a class="page-link" href="#" tabindex="-1" aria-disabled="true">
							이전
						</a>
				    </li>
			<%
				} else {
			%>
					<li class="page-item">
						<a class="page-link" href="./productlist.pro?PRODUCT_CATEGORY=<%=PRODUCT_CATEGORY%>&page=<%=nowpage - 1%>">
							이전
						</a>
					</li>
			<%
				}
			
				for (int a = startpage; a <= endpage; a++) {
					if (a == nowpage) {
			%><!-- 현재 보고있는 페이지에는 링크를 걸지 않겠다. --> 
						<li class="page-item list active">
							<span class="page-link" style="border-color:#dee2e6;">
								<%=a%>
							</span>
						</li>
			<%
					} else {
			%>
						<li class="page-item">
							<a class="page-link" href="./productlist.pro?PRODUCT_CATEGORY=<%=PRODUCT_CATEGORY%>&page=<%=a%>">
								<%=a%>
							</a>
						</li>
			<%
					}
				}
			%><!-- 현재 보는 페이지가 마지막 페이지 이면 -->
			<%
				if (nowpage >= maxpage) {
			%>
					<li class="page-item disabled">
						<a class="page-link" href="#" tabindex="-1" aria-disabled="true">
							다음
						</a>
				    </li>
			<%
				} else {
			%>			
					<li class="page-item">
						<a class="page-link" href="./productlist.pro?PRODUCT_CATEGORY=<%=PRODUCT_CATEGORY%>&page=<%=nowpage + 1%>">
							다음
						</a>
				    </li>
			<%
				}
			%>
				</ul>
			</nav>
			<!-- pagenation 끝 -->
	<%
		} else {
	%>
			<div class="text-center" style="padding-top: 50px;">등록된 상품이 없습니다.</div>
	<%
		}
	%>
</div> <!-- site-wrap 끝 -->

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
	
	//카테고리 카테고리 css활성화
	$(document).ready(function(){
		var category = '<%=PRODUCT_CATEGORY%>';  
		$('.caption').children().removeClass('active');
		$('#'+category+'_tab').addClass('active');
	});
</script>
