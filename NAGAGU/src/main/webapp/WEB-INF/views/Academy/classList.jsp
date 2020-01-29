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
	String category = (String)request.getAttribute("CLASS_CATEGORY");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Academy/classlist_.css">
		<style>
			@font-face {
				font-family: 'KOMACON';
				src:
					url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')
					format('woff');
				font-weight: normal;
				font-style: normal;
			}
			
			.order-body {
				font-family: '만화진흥원체', 'KOMACON', KOMACON;
				font-size: 15px;
			}
			
			a.nav-link.active {
				background-color: #1B1B27 !important;
				color: white !important;
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
			}
			.search-tap a:hover{
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
			.title {line-height:26px; color:#645fab; font-size:18px; overflow: hidden; height:1.2em; text-overflow: ellipsis; white-space:nowrap;}
		</style>
	</head>
	<body class="order-body">	
		<div class="container">
			<!-- 클래스 nav -->
			<div class="content">
				<div class="search-tap">
					<div class="caption py-5">
						<a href='./classlist.ac?CLASS_CATEGORY=all&sort=new'>ALL</a> 
						<a href='./classlist.ac?CLASS_CATEGORY=table&sort=new'>책상</a> 
						<a href='./classlist.ac?CLASS_CATEGORY=chair&sort=new'>의자</a> 
						<a href='./classlist.ac?CLASS_CATEGORY=bookshelf&sort=new'>책장</a> 
						<a href='./classlist.ac?CLASS_CATEGORY=bed&sort=new'>침대</a> 
						<a href='./classlist.ac?CLASS_CATEGORY=drawer&sort=new'>서랍장</a> 
						<a href='./classlist.ac?CLASS_CATEGORY=sidetable&sort=new'>협탁</a> 
						<a href='./classlist.ac?CLASS_CATEGORY=dressing_table&sort=new'>화장대</a> 
						<a href='./classlist.ac?CLASS_CATEGORY=others&sort=new'>기타</a>
					</div>
					<div class="d-flex bd-highlight nav-tag" style="padding: 1% 0;">
						<div class="mr-auto bd-highlight">
							<table>
								<tr>
									<td>
										<select id ="sort" name="CLASS_AREA" class="form-control mr-2" onchange="if(this.value) location.href=(this.value);">
											<option name="지역" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Area' selected>지역</option>
											<option name="종로구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Jongno'>종로구</option>
											<option name="중구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Jung'>중구</option>
											<option name="용산구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Yongsan'>용산구</option>
											<option name="성동구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Seongdong'>성동구</option>
											<option name="광진구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Gwangjin'>광진구</option>
											<option name="동대문구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Dongdaemun'>동대문구</option>
											<option name="중랑구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Jungnang'>중랑구</option>
											<option name="성북구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Seongbuk'>성북구</option>
											<option name="강북구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Gangbuk'>강북구</option>
											<option name="도봉구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Dobong'>도봉구</option>
											<option name="노원구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Nowon'>노원구</option>
											<option name="은평구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Eunpyeong'>은평구</option>
											<option name="서대문구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Seodaemun'>서대문구</option>
											<option name="마포구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Mapo'>마포구</option>
											<option name="양천구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Yangcheon'>양천구</option>
											<option name="강서구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Gangseo'>강서구</option>
											<option name="구로구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Guro'>구로구</option>
											<option name="금천구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Geumcheon'>금천구</option>
											<option name="영등포구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Yeongdeungpo'>영등포구</option>
											<option name="동작구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Dongjak'>동작구</option>
											<option name="관악구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Gwanak'>관악구</option>
											<option name="서초구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Seocho'>서초구</option>
											<option name="강남구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Gangnam'>강남구</option>
											<option name="송파구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Songpa'>송파구</option>
											<option name="강동구" value='./classlist.ac?CLASS_CATEGORY=<%=category%>&CLASS_AREA=Gangdong'>강동구</option>
										</select>
									</td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</div>
						<div class="bd-highlight">
							<div class="input-group d-flex justify-content-end">
								<span class="input-group-btn">
									<a href="./classform.ac" class="btn btn-outline-dark" role="button" aria-pressed="true">등록하기</a>
								</span> 
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
				<div class="tab-pane fade show active row" id="class-all" role="tabpanel" aria-labelledby="home-tab" name="all">
					<%
						if(listcount > 0) {	
					%>
							<div class="row row-cols-1 row-cols-md-4" id="rank">		
					<%
							for(int i = 0; i < classList.size(); i++) {
								ClassVO cl = (ClassVO)classList.get(i); // 캐스트 연산 필수
					%>
					
								<div class="col mb-3" style="height: 400px;">
									<a href="./classdetail.ac?CLASS_NUMBER=<%=cl.getCLASS_NUMBER()%>&CLASS_CATEGORY=<%=cl.getCLASS_CATEGORY()%>&page=<%=nowpage%>">
										<div class="h-50 pic" style="background:url('<%=cl.getCLASS_BANNER()%>') no-repeat center; background-size:cover;"></div>
										<div style="border: 1px solid #EAEAEA;">
											<div class="default" style="margin: 0 5% 3% 5%;">
												<p class="title text-center" style="font-size: 1.5rem;"><%=cl.getCLASS_NAME()%></p>
												<div class="d-flex bd-highlight" style="font-size: 0.8rem; color: #888888;">
													<span class="mr-auto bd-highlight">공방이름</span>
													<span class="bd-highlight"><%=cl.getCLASS_AREA()%></span>
												</div>
											</div>
											<hr style="margin-top: 0; margin-bottom: 0;">
											<div class="" style="font-szie: 0.8rem; color: #888888; margin: 3% 5% 3% 5%;">
												<span style="color: black; font-size: 0.8rem;">클래스 기간</span><br>
												<span><%=cl.getCLASS_DATE_CONFIGURATION_1()%> ~ <%=cl.getCLASS_DATE_CONFIGURATION_2()%></span>
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
					<%
						} else {
					%>
						<div class="text-center">
							<p> 현재 진행중인 강의가 없습니다. </p>
						</div>
					<%
						}
					%>
					
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
				</div>
			</div>
		</div>
		<!-- fontawesome kit -->
      	<script src="https://kit.fontawesome.com/97dbc99ea1.js" crossorigin="anonymous"></script>
		<!-- js -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script>
		$(function(){ 
			  $(document).on("click","#far",function addClass() {
			    if($(this).attr('data-prefix') === "far"){
			      $(this).removeClass("far fa-heart fa-2x");
				   $(this).addClass("fas fa-heart fa-2x");
			    }else{
			      $(this).removeClass("fas fa-heart fa-2x");
			      $(this).addClass("far fa-heart fa-2x");
			    }
			  });
			});
		</script>
	
	</body>
</html>