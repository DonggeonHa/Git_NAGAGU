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
		color: #645fab;
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
</style>

	
<div class="container category_ac">
	<!-- 클래스 nav -->
	<div class="content">
		<div class="search-tap">
			<div class="caption py-5">
				<a id="all_tab" href='./classlist.ac?CLASS_CATEGORY=all&CLASS_AREA=<%=CLASS_AREA%>'>전체</a> 
				<a id="table_tab" href='./classlist.ac?CLASS_CATEGORY=table&CLASS_AREA=<%=CLASS_AREA%>'>책상</a> 
				<a id="chair_tab"  href='./classlist.ac?CLASS_CATEGORY=chair&CLASS_AREA=<%=CLASS_AREA%>'>의자</a> 
				<a id="bookshelf_tab" href='./classlist.ac?CLASS_CATEGORY=bookshelf&CLASS_AREA=<%=CLASS_AREA%>'>책장</a> 
				<a id="bed_tab" href='./classlist.ac?CLASS_CATEGORY=bed&CLASS_AREA=<%=CLASS_AREA%>'>침대</a> 
				<a id="drawer_tab" href='./classlist.ac?CLASS_CATEGORY=drawer&CLASS_AREA=<%=CLASS_AREA%>'>서랍장</a> 
				<a id="sidetable_tab" href='./classlist.ac?CLASS_CATEGORY=sidetable&CLASS_AREA=<%=CLASS_AREA%>'>협탁</a> 
				<a id="dressing_table_tab" href='./classlist.ac?CLASS_CATEGORY=dressing_table&CLASS_AREA=<%=CLASS_AREA%>'>화장대</a> 
				<a id="others_tab" href='./classlist.ac?CLASS_CATEGORY=others&CLASS_AREA=<%=CLASS_AREA%>'>기타</a>
			</div>
			<div class="d-flex bd-highlight nav-tag" style="padding: 1% 0;">
				<div class="mr-auto bd-highlight">
					<table>
						<tr>
							<td>
								<select id ="CLASS_AREA" name="CLASS_AREA" class="form-control mr-2" onchange="if(this.value) location.href=(this.value);">
									<option name="지역" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>지역</option>
									<option name="종로구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>종로구</option>
									<option name="중구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>중구</option>
									<option name="용산구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>용산구</option>
									<option name="성동구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>성동구</option>
									<option name="광진구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>광진구</option>
									<option name="동대문구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>동대문구</option>
									<option name="중랑구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>중랑구</option>
									<option name="성북구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>성북구</option>
									<option name="강북구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>강북구</option>
									<option name="도봉구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>도봉구</option>
									<option name="노원구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>노원구</option>
									<option name="은평구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>은평구</option>
									<option name="서대문구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>서대문구</option>
									<option name="마포구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>마포구</option>
									<option name="양천구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>양천구</option>
									<option name="강서구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>강서구</option>
									<option name="구로구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>구로구</option>
									<option name="금천구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>금천구</option>
									<option name="영등포구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>영등포구</option>
									<option name="동작구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>동작구</option>
									<option name="관악구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>관악구</option>
									<option name="서초구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>서초구</option>
									<option name="강남구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>강남구</option>
									<option name="송파구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>송파구</option>
									<option name="강동구" value='./classlist.ac?CLASS_CATEGORY=<%=CLASS_CATEGORY%>&CLASS_AREA=<%=CLASS_AREA%>'>강동구</option>
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
			%>
						<div class="col mb-3" style="height: 400px;">
							<a href="./classdetail.ac?CLASS_NUMBER=<%=cl.getCLASS_NUMBER()%>">
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
										<span style="color: black; font-size: 0.9rem;">클래스 기간</span><br>
										<span style="font-size: 0.8rem;"><%=cl.getCLASS_DATE_CONFIGURATION_1()%> ~ <%=cl.getCLASS_DATE_CONFIGURATION_2()%></span>
									</div>
									<hr style="margin-top: 0; margin-bottom: 0;">
									<div style="background-color: #F8F8F8 !important;">
										<div class="d-flex justify-content-end" style="margin: 0 5% 0 5%;">
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
			%>
					</div>
					<!-- pagenation -->
					<div class="row justify-content-center">
						<% 
							if(nowpage <= 1) { 
						%>
								&laquo;&nbsp;
						<% 
							} 
							else { 
						%>
								<a href ="./classlist.ac?page=<%=nowpage-1%>">&laquo;</a>
						<%	
							} 
						%>
							
						<%
							for(int a = startpage; a <= endpage; a++) {
									if(a == nowpage) { 
						%>
										<%=a%> <!-- 현재 보고있는 페이지에는 링크를 걸지 않겠다. -->
						<% 
									} else { 
						%>
										<a href="./classlist.ac?page=<%=a%>">&nbsp;<%=a%>&nbsp;</a>
						<% 
									}
							}
						%>	
		
						<!-- 현재 보는 페이지가 마지막 페이지 이면 -->
						<%
							if(nowpage >= maxpage) {  
						%> 
								&nbsp;&raquo;
						<%	
							} else { 
						%>
								<a href="./classlist.ac?page=<%=nowpage+1%>">&raquo;</a>
						<%
							} 
						%>
					</div>
			<%
				} else {
			%>
					<div class="text-center">
						<p> 현재 진행중인 강의가 없습니다. </p>
					</div>
			<%
				}
			%>
		</div>
	</div>
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
	
	$(document).ready(function() {
		var area = "<%=CLASS_AREA%>";
		
		if(area=="종로구"){
			$("#CLASS_AREA").val("종로구").attr("selected", "selected");
		} else if(area=="중구"){
			$("#CLASS_AREA").val("중구").attr("selected", "selected");
		} else if(area=="용산구"){
			$("#CLASS_AREA").val("용산구").attr("selected", "selected");
		} else if(area=="성동구"){
			$("#CLASS_AREA").val("성동구").attr("selected", "selected");
		} else if(area=="광진구"){
			$("#CLASS_AREA").val("광진구").attr("selected", "selected");
		} else if(area=="동대문구"){
			$("#CLASS_AREA").val("동대문구").attr("selected", "selected");
		} else if(area=="중랑구"){
			$("#CLASS_AREA").val("중랑구").attr("selected", "selected");
		} else if(area=="성북구"){
			$("#CLASS_AREA").val("성북구").attr("selected", "selected");
		} else if(area=="강북구"){
			$("#CLASS_AREA").val("강북구").attr("selected", "selected");
		} else if(area=="도봉구"){
			$("#CLASS_AREA").val("도봉구").attr("selected", "selected");
		} else if(area=="노원구"){
			$("#CLASS_AREA").val("노원구").attr("selected", "selected");
		} else if(area=="은평구"){
			$("#CLASS_AREA").val("은평구").attr("selected", "selected");
		} else if(area=="서대문구"){
			$("#CLASS_AREA").val("서대문구").attr("selected", "selected");
		} else if(area=="마포구"){
			$("#CLASS_AREA").val("마포구").attr("selected", "selected");
		} else if(area=="양천구"){
			$("#CLASS_AREA").val("양천구").attr("selected", "selected");
		} else if(area=="강서구"){
			$("#CLASS_AREA").val("강서구").attr("selected", "selected");
		} else if(area=="구로구"){
			$("#CLASS_AREA").val("구로구").attr("selected", "selected");
		} else if(area=="금천구"){
			$("#CLASS_AREA").val("금천구").attr("selected", "selected");
		} else if(area=="영등포구"){
			$("#CLASS_AREA").val("영등포구").attr("selected", "selected");
		} else if(area=="동작구"){
			$("#CLASS_AREA").val("동작구").attr("selected", "selected");
		} else if(area=="관악구"){
			$("#CLASS_AREA").val("관악구").attr("selected", "selected");
		} else if(area=="서초구"){
			$("#CLASS_AREA").val("서초구").attr("selected", "selected");
		} else if(area=="강남구"){
			$("#CLASS_AREA").val("강남구").attr("selected", "selected");
		} else if(area=="송파구"){
			$("#CLASS_AREA").val("송파구").attr("selected", "selected");
		} else if(area=="강동구"){
			$("#CLASS_AREA").val("강동구").attr("selected", "selected");
		}
	});
</script>