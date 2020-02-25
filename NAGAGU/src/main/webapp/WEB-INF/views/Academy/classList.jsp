<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "com.spring.academy.*" %>

<%
	ArrayList<ClassVO> classList = (ArrayList<ClassVO>)request.getAttribute("classList");
	int listcount = ((Integer)request.getAttribute("listcount")).intValue(); // 글개수
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
	
	
	int WORKSHOP_STATUS = 0;
	if (session.getAttribute("WORKSHOP_STATUS") == null) {
		WORKSHOP_STATUS = 0;
	} else {
		WORKSHOP_STATUS = (Integer)session.getAttribute("WORKSHOP_STATUS");
	}
	
	String CLASS_CATEGORY = (String)request.getAttribute("CLASS_CATEGORY");
	String CLASS_AREA = (String)request.getAttribute("CLASS_AREA");
%>

<style>
	.content a, .content a:link, .content a:visited {
		color: black;
		text-decoration: none;
	}
	
	.caption {
		display: flex;
		justify-content: space-around;
		border-bottom: 1px solid #EAEAEA;
		
	}
	
	.search-tap {
		border-bottom: 1px solid #EAEAEA;
		font-size: 20px;
	}
	
	.search-tap a:hover {
		color: #ef900e !important;
		transform: scale(1.2);
	}
	
	.content a, .content a:link, .content a:hover {
		text-decoration: none;
		color: black;
	}
	
	.pic {
		width: 100%;
		height: 100%;
	}
	
	.title {
		line-height: 26px;
		color: black;
		font-size: 18px;
		overflow: hidden;
		height: 1.2em;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	
	.caption a {
		color: rgba(0, 0, 0, 0.3) !important;
		font-weight: 600;
	}
	
	.caption .active {
		color: rgba(0, 0, 0, 1) !important;
	}
	.category_ac{
		margin-bottom:50px;
	}
	
	/*별 이미지 색상*/
	.fa-star {
		color: rgb(239, 144, 14);
	}	
	.grade {
		font-size: small;
		float: left;
	}
	.container_page a{
		color: black;
	}			
</style>

	
<div class="container category_ac">
	<!-- 클래스 nav -->
	<div class="content">
		<div class="search-tap">
			<div class="caption py-5">
				<a id="all_tab" href='./classlist.ac?CLASS_CATEGORY=all&CLASS_AREA=지역'>전체</a> 
				<a id="table_tab" href='./classlist.ac?CLASS_CATEGORY=table&CLASS_AREA=지역'>책상</a> 
				<a id="chair_tab"  href='./classlist.ac?CLASS_CATEGORY=chair&CLASS_AREA=지역'>의자</a> 
				<a id="bookshelf_tab" href='./classlist.ac?CLASS_CATEGORY=bookshelf&CLASS_AREA=지역'>책장</a> 
				<a id="bed_tab" href='./classlist.ac?CLASS_CATEGORY=bed&CLASS_AREA=지역'>침대</a> 
				<a id="drawer_tab" href='./classlist.ac?CLASS_CATEGORY=drawer&CLASS_AREA=지역'>서랍장</a> 
				<a id="sidetable_tab" href='./classlist.ac?CLASS_CATEGORY=sidetable&CLASS_AREA=지역'>협탁</a> 
				<a id="dressing_table_tab" href='./classlist.ac?CLASS_CATEGORY=dressing_table&CLASS_AREA=지역'>화장대</a> 
				<a id="others_tab" href='./classlist.ac?CLASS_CATEGORY=others&CLASS_AREA=지역'>기타</a>
			</div>
			<div class="d-flex bd-highlight nav-tag" style="padding: 1% 0;">
				<div class="mr-auto bd-highlight">
					<table>
						<tr>
							<td>
								<select id ="CLASS_AREA" name="CLASS_AREA" class="form-control mr-2" onchange="if(this.value) location.href=(this.value);">
									<option name="지역" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=지역' id="지역">지역</option>
									<option name="종로구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=종로구' id="종로구">종로구</option>
									<option name="중구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=중구' id="중구">중구</option>
									<option name="용산구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=용산구' id="용산구">용산구</option>
									<option name="성동구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=성동구' id="성동구">성동구</option>
									<option name="광진구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=광진구' id="광진구">광진구</option>
									<option name="동대문구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=동대문구' id="동대문구">동대문구</option>
									<option name="중랑구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=중랑구' id="중랑구">중랑구</option>
									<option name="성북구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=성북구' id="성북구">성북구</option>
									<option name="강북구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=강북구' id="강북구">강북구</option>
									<option name="도봉구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=도봉구' id="도봉구">도봉구</option>
									<option name="노원구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=노원구' id="노원구">노원구</option>
									<option name="은평구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=은평구' id="은평구">은평구</option>
									<option name="서대문구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=서대문구' id="서대문구">서대문구</option>
									<option name="마포구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=마포구' id="마포구">마포구</option>
									<option name="양천구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=양천구' id="양천구">양천구</option>
									<option name="강서구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=강서구' id="강서구">강서구</option>
									<option name="구로구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=구로구' id="구로구">구로구</option>
									<option name="금천구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=금천구' id="금천구">금천구</option>
									<option name="영등포구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=영등포구' id="영등포구">영등포구</option>
									<option name="동작구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=동작구' id="동작구">동작구</option>
									<option name="관악구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=관악구' id="관악구">관악구</option>
									<option name="서초구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=서초구' id="서초구">서초구</option>
									<option name="강남구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=강남구' id="강남구">강남구</option>
									<option name="송파구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=송파구' id="송파구">송파구</option>
									<option name="강동구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=강동구' id="강동구">강동구</option>
								</select>
							</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</div>
				<div class="bd-highlight">
					<div class="input-group d-flex justify-content-end">
						<% if(WORKSHOP_STATUS == 2){ %>
							<span class="input-group-btn">
								<a href="./classform.ac" class="btn btn-outline-dark" role="button" aria-pressed="true">글쓰기</a>
							</span>
						<% }  else { %>
							<span class="input-group-btn" style="display: none;">
								<a href="./classform.ac" class="btn btn-outline-dark" role="button" aria-pressed="true">글쓰기</a>
							</span>
						<% } %>
					</div>
					<!-- /input-group -->
				</div>
				<!-- /.col-lg-6 -->
			</div>
			<!-- div.row -->
		</div>
	</div>
	
	<div class="tab-content" id="classTabContent">
		<!-- 전체 메뉴 -->
		<div class="tab-pane fade show active row container" id="class-all" role="tabpanel" aria-labelledby="home-tab" name="all">
			<%
				if(listcount > 0) {	
			%>
					<div class="row row-cols-1 row-cols-md-4" id="rank">		
			<%
					for(int i = 0; i < classList.size(); i++) {
						ClassVO cl = (ClassVO)classList.get(i); // 캐스트 연산 필수
							if(cl.getCLASS_STATUS() == 1) {
			%>
								<div class="col mb-3 pt-3" style="height: 400px;">
									<a href="./classdetail.ac?CLASS_NUMBER=<%=cl.getCLASS_NUMBER()%>" style="text-decoration: none;">
										<div class="h-50 pic" style="background:url('/communityupload/image/<%=cl.getCLASS_IMAGE()%>') no-repeat center; background-size:cover;"></div>
										<div style="border: 1px solid #EAEAEA;">
											<div class="default" style="margin: 0 5% 3% 5%;">
												<p class="title text-center" style="font-size: 1.5rem;"><%=cl.getCLASS_NAME()%></p>
												<div class="d-flex bd-highlight" style="font-size: 0.9rem; color: #888888;">
													<span class="mr-auto bd-highlight"><%=cl.getWORKSHOP_NAME()%></span>
													<span class="bd-highlight"><%=cl.getCLASS_AREA()%></span>
												</div>
											</div>
											<hr style="margin-top: 0; margin-bottom: 0;">
											<div class="" style="font-szie: 0.8rem; color: #888888; margin: 3% 5% 3% 5%;">
												<span style="color: black; font-size: 0.9rem;"><%=cl.getCLASS_DIVISION() %></span><br>
												<span style="font-size: 0.8rem;"><%=cl.getCLASS_DATE_CONFIGURATION_1()%> ~ <%=cl.getCLASS_DATE_CONFIGURATION_2()%></span>
											</div>
											<hr style="margin-top: 0; margin-bottom: 0;">
											<div style="background-color: #F8F8F8 !important;">
												<div class="d-flex justify-content-between" style="margin: 0 5% 0 5%;">										
													<p style="color: black; margin: 3% 0 3% 0;">
														<span class="grade"><i class="fas fa-star"></i><span><%=cl.getCLASS_GRADE()%></span></span>  
													</p>
													<p style="color: #DB0000; margin: 3% 0 3% 0;">
														<fmt:formatNumber type="number" maxFractionDigits="3" value="<%=cl.getCLASS_AMOUNT()%>" />원 <!-- 3자리마다 , 찍기 -->  
													</p>
												</div>
											</div>
										</div>
									</a>
								</div>
			<%
							}
					}
			%>
					</div>
		</div>
	</div>
</div>
		<div class="container container_page">
			<!-- pagenation -->
			<nav aria-label="Page navigation example">
				<ul class="pagination d-flex justify-content-center">
				<% 
					if(nowpage <= 1) { 
				%>
						<li class="page-item disabled">
							<a class="page-link" href="#" tabindex="-1" aria-disabled="true">
								이전
							</a>
					    </li>
				<% 
					} 
					else { 
				%>
						<li class="page-item">
							<a class="page-link" href="./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&page=<%=nowpage - 1%>">
								이전
							</a>
						</li>
				<%	
					} 
				%>
					
				<%
					for(int a = startpage; a <= endpage; a++) {
						if(a == nowpage) { 
				%>
							<li class="page-item list active">
								<span class="page-link" style="border-color:#dee2e6;">
									<%=a%>
								</span>
							</li> <!-- 현재 보고있는 페이지에는 링크를 걸지 않겠다. -->
				<% 
						} else { 
				%>
							<li class="page-item">
								<a class="page-link" href="./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&page=<%=a%>">
									<%=a%>
								</a>
							</li>
				<% 
						}
					}
				%>	

				<!-- 현재 보는 페이지가 마지막 페이지 이면 -->
				<%
					if(nowpage >= maxpage) {  
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
							<a class="page-link" href="./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&page=<%=nowpage + 1%>">
								다음
							</a>
						</li>
				<%
					} 
				%>
				</ul>
			</nav>
		<%
			} else {
		%>
				<div class="text-center" style="padding-top: 50px;">
					<p> 현재 진행중인 강의가 없습니다. </p>
				</div>
		<%
			}
		%>
		</div>
		
<script>
	$(function(){ 
		$(document).on("click","#far",function addClass() {
			if($(this).attr('data-prefix') === "far"){
		    	$(this).removeClass("far fa-heart fa-2x");
				$(this).addClass("fas fa-heart fa-2x");
		    } else {
				$(this).removeClass("fas fa-heart fa-2x");
				$(this).addClass("far fa-heart fa-2x");
		    }
		});
	});
	
	//카테고리 카테고리 css활성화
	$(document).ready(function(){
		var category = '<%=CLASS_CATEGORY%>';  
		console.log(category)
		$('.caption').children().removeClass('active');
		$('#'+category+'_tab').addClass('active');
	});
	
	
	var area='<%=CLASS_AREA%>';
	switch(area) {
		case '종로구' : 
			$('#종로구').prop('selected', true);
			break;
		case '중구' :
			$('#중구').prop('selected', true);
			break;
		case '용산구' : 
			$('#용산구').prop('selected', true);
			break;
		case '성동구' :
			$('#성동구').prop('selected', true);
			break;
		case '광진구' : 
			$('#광진구').prop('selected', true);
			break;
		case '동대문구' :
			$('#동대문구').prop('selected', true);
			break;
		case '중랑구' : 
			$('#중랑구').prop('selected', true);
			break;
		case '성북구' :
			$('#성북구').prop('selected', true);
			break;
		case '강북구' : 
			$('#강북구').prop('selected', true);
			break;
		case '도봉구' :
			$('#도봉구').prop('selected', true);
			break;
		case '노원구' : 
			$('#노원구').prop('selected', true);
			break;
		case '은평구' :
			$('#은평구').prop('selected', true);
			break;
		case '서대문구' : 
			$('#서대문구').prop('selected', true);
			break;
		case '마포구' :
			$('#마포구').prop('selected', true);
			break;
		case '양천구' : 
			$('#양천구').prop('selected', true);
			break;
		case '강서구' :
			$('#강서구').prop('selected', true);
			break;
		case '구로구' : 
			$('#구로구').prop('selected', true);
			break;
		case '금천구' :
			$('#금천구').prop('selected', true);
			break;
		case '영등포구' : 
			$('#영등포구').prop('selected', true);
			break;
		case '동작구' :
			$('#동작구').prop('selected', true);
			break;
		case '관악구' :
			$('#관악구').prop('selected', true);
			break;
		case '서초구' : 
			$('#서초구').prop('selected', true);
			break;
		case '강남구' :
			$('#강남구').prop('selected', true);
			break;
		case '송파구' : 
			$('#송파구').prop('selected', true);
			break;
		case '강동구' :
			$('#강동구').prop('selected', true);
			break;
	}
</script>