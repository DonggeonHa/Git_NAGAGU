<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.spring.store.Product_qnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	HashMap<String, Object> reviewVO = (HashMap<String, Object>)request.getAttribute("reviewVOmap");
	String PRODUCT_TITLE = (String)reviewVO.get("PRODUCT_TITLE");
	String PRODUCT_CATEGORY = (String)reviewVO.get("PRODUCT_CATEGORY");
	int PRODUCT_NUM = (int)reviewVO.get("PRODUCT_NUM");
	String MEMBER_NICK = (String)reviewVO.get("MEMBER_NICK");
	String MEMBER_PICTURE = (String)reviewVO.get("MEMBER_PICTURE");
	String REVIEW_DATE = sdf.format((Date)reviewVO.get("REVIEW_DATE"));
	String REVIEW_CONTENT = (String)reviewVO.get("REVIEW_CONTENT");
	String REVIEW_FILE = (String)reviewVO.get("REVIEW_FILE");
	Double REVIEW_GRADE = (Double)reviewVO.get("REVIEW_GRADE");
	int REVIEW_RE = (int)reviewVO.get("REVIEW_RE");
	
	String imagesExist = "N";
	String[] imgArr = REVIEW_FILE.split(",");
	int size = 0;
	if(!REVIEW_FILE.equals("#")) {
		imagesExist = "Y";
		size = imgArr.length;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<style>
			img {
			   padding-right:2px;
			}
			a {
				color: black; 
			}			
			a:hover { 
				color: black; 
				font-weight: bold;
				text-decoration: none;
			}
			.bgcolor {
				background-color:#F2F2F2;
			}			
			.bgcolor2 {
				background-color:#1B1B27;
				color:white;
			}
			
		</style>
	</head>
	<body>
		<div>
			<table class="table bgcolor">
  				<colgroup>
					<col style="width:15%">
					<col style="width:35%">
					<col style="width:15%">
					<col style="width:35%">
				</colgroup>
				<tr>
					<th colspan="4" scope="colgroup" class="bgcolor2">상품 후기 상세</th>
				</tr>
				<tr>
					<th scope="col">작성자</th>
					<td scope="col"><%=MEMBER_NICK %></td>
					<th scope="col">작성 날짜</th>
					<td scope="col"><%=REVIEW_DATE %></td>
				</tr>			
				<tr>
					<th scope="col">상품명</th>
					<td scope="col"><a href="productdetail.pro?PRODUCT_NUM=<%=PRODUCT_NUM %>&PRODUCT_CATEGORY=<%=PRODUCT_CATEGORY%>" target="_blank"><%=PRODUCT_TITLE %></a></td>
					<th scope="col">평점</th>
					<td scope="col">
					<%
						if(REVIEW_GRADE == 7) { 
					%>
							없음(답글)					
					<%
						} else {
					%>
							<%=REVIEW_GRADE%>				
					<%
						}
					%>
					</td>
				</tr>
				<tr>
					<th scope="col">후기 내용</th>
					<td colspan="3" scope="colgroup"><%=REVIEW_CONTENT %></td>
				</tr>
				<%
				if(REVIEW_RE == 0) {
				%>
					<tr>
						<th scope="col" rowspan="2">이미지</th>
						<td colspan="3" scope="colgroup">
							<%
								if(imagesExist.equals("Y")) {
									for(int i=0;i<size;i++) {
							%>
								<img src="/productupload/image/<%=imgArr[i] %>" class="thumbItem" thumb-idx=<%=i %> width="100px" height="100px" class="thumbImg" alt="" data-toggle="modal" data-target="#imgModal" aria-haspopup="true" aria-expanded="false">
							<%
									}
								} else {
							%>
									없음
							<%
								}
							%>
	
						</td>
					</tr>
				<%
				}
				%>
				
			</table>
			<div class="d-flex justify-content-center">
				<button type="button" class="btn btn-outline-dark btn-lg" onclick="window.close();">닫기</button>
			</div>	
		</div>			
		
		<!--  이미지 클릭 modal -->
		<div class="modal fade" id="imgModal" tabindex="-1" role="dialog"
			aria-labelledby="offerFormLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<img src='' id="thumbLarge">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	        		</button>
				</div>
			</div>
		</div>	
		<script>

		$(document).delegate('.thumbItem', 'click', function() {
			var idx = $(this).attr('thumb-idx');
			var targetImg = '';
			if (idx == 0) {
				targetImg = '/productupload/image/' + '<%=imgArr[0]%>';
			} <% if (imgArr.length > 1) { %> else if (idx == 1) {
				targetImg = '/productupload/image/' + '<%=imgArr[1]%>';
			} <% } if (imgArr.length > 2) { %> else if (idx == 2) {
				targetImg = '/productupload/image/' + '<%=imgArr[2]%>';
			} <% } if (imgArr.length > 3) { %> else if (idx == 3) {
				targetImg = '/productupload/image/' + '<%=imgArr[3]%>';
			} <% } if (imgArr.length > 4) { %> else {
				targetImg = '/productupload/image/' + '<%=imgArr[4]%>';
			} <% } %>
			console.log(targetImg);

			$('#thumbLarge').attr('src', targetImg);
		});
		</script>	
		
		<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>