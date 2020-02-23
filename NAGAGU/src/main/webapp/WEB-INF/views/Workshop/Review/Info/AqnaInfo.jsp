<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.spring.academy.Class_qnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	HashMap<String, Object> qnaVO = (HashMap<String, Object>)request.getAttribute("qnaVOmap");
	String CLASS_NAME = (String)qnaVO.get("CLASS_NAME");
	int CLASS_NUMBER = (int)qnaVO.get("CLASS_NUMBER");
	String MEMBER_NICK = (String)qnaVO.get("MEMBER_NICK");
	String MEMBER_PICTURE = (String)qnaVO.get("MEMBER_PICTURE");
	String QNA_DATE = sdf.format((Date)qnaVO.get("QNA_DATE"));
	String QNA_CONTENT = (String)qnaVO.get("QNA_CONTENT");
	int QNA_STATUS = (int)qnaVO.get("QNA_STATUS");
	int QNA_NUM = (int)qnaVO.get("QNA_NUM");
	
	Class_qnaVO replyVO = null;
	String replyQna = null;
	int QNA_RE_NUM = 0;
	if(request.getAttribute("replyVO") != null) {
		replyVO = (Class_qnaVO)request.getAttribute("replyVO");
		replyQna = replyVO.getQNA_CONTENT();
		QNA_RE_NUM = replyVO.getQNA_NUM();
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<style>
			a {
				color: black; 
			}			
			a:hover { 
				color: black; 
				font-weight: bold;
				text-decoration: none;
			}

			.btn_write {
				margin-left:10px;
				margin-top:10px;
			}
			.btn_modify {
				margin-left:10px;
				margin-top:10px;
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
					<th colspan="4" scope="colgroup" class="bgcolor2">강의 문의 상세</th>
				</tr>
				<tr>
					<th scope="col">작성자</th>
					<td scope="col"><%=MEMBER_NICK %></td>
					<th scope="col">작성 날짜</th>
					<td scope="col"><%=QNA_DATE %></td>
				</tr>	
				<tr>
					<th scope="col">강의명</th>
					<td scope="col"><a href="classdetail.ac?CLASS_NUMBER=<%=CLASS_NUMBER %>" target="_blank"><%=CLASS_NAME %></a></td>
					<th scope="col">답변상태</th>
					<td scope="col">
						<% if(QNA_STATUS == 0) { %>답변 대기
						<% } else { %>답변 완료 <% } %>
					</td>
				</tr>
				<tr>
					<th scope="col">문의 내용</th>
					<td colspan="3" scope="colgroup"><%=QNA_CONTENT %></td>
				</tr>
				<tr>
					<th scope="col">
						답변 내용 
						<% if(replyVO != null) { %>
						<button class="btn_modifyform">수정</button>
					</th>
					<td colspan="3" rowspan="2" class="replySection"><%=replyQna %>
						<% } else { %>
						<button class="btn_write">작성</button>
					</th>
					<td colspan="3" rowspan="2" class="replySection">답변 내역이 없습니다.
						<%
							}
						%>
					</td>
				</tr>
			</table>
			<div class="d-flex justify-content-center">
				<button type="button" class="btn btn-outline-dark btn-lg" onclick="closePopup();">닫기</button>
			</div>	
		</div>					
		
		<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		<script>		
		$(document).on("click",".btn_write",function(event){
			$('.replySection').html('<textarea class="replyContent" rows="3" style="width:100%;"></textarea>');
			$('.btn_write').addClass('btn_insert');
			$('.btn_write').removeClass('btn_write');
			$('.btn_insert').text('등록');
		});
		$(document).on("click",".btn_insert",function(event){
			var QNA_NUM = <%=QNA_NUM%>;
			var CLASS_NUMBER = <%=CLASS_NUMBER%>;
			var QNA_CONTENT = $('.replyContent').val();
			$.ajax({
				url : "/NAGAGU/insertQna.acdo", 
				data : {'QNA_RE' : QNA_NUM,
						'CLASS_NUMBER' : CLASS_NUMBER,
						'QNA_CONTENT' : QNA_CONTENT},
				datatype: 'json',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				type : 'POST',				
				success:function(retVal) {
					if(retVal.res == "OK") {
						location.href='./AqnaInfo.my?QNA_NUM='+QNA_NUM;
					} else {
						alertify.alert('확인',"답변 등록 실패!!!");
					}
				},
				error:function() {
					alertify.alert('확인',"qna reply ajax통신 실패!!!");
				}
			});			
		});
		
		$(document).on("click",".btn_modifyform",function(event){
			var content = $('.replySection').html().trim();
			$('.replySection').html('<textarea class="replyContent" value="<%=QNA_RE_NUM%>" rows="3" style="width:100%;">'+content+'</textarea>');
			$('.btn_modifyform').addClass('btn_modify');
			$('.btn_modify').removeClass('btn_modifyform');
			$('.btn_modify').text('등록');
		})
 		
		$(document).on("click",".btn_modify",function(event){
			var QNA_NUM = <%=QNA_NUM%>;	//원글번호(수정 후 페이지 다시 실행시키기 위해 필요)
			var QNA_RE_NUM = $('.replyContent').attr('value');	//수정할 qna 번호
			var QNA_CONTENT = $('.replyContent').val();
			$.ajax({
				url : "/NAGAGU/modifyQna.acdo", 
				data : {'QNA_NUM' : QNA_RE_NUM,
						'QNA_CONTENT' : QNA_CONTENT},
				datatype: 'json',
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				type : 'POST',				
				success:function(retVal) {
					if(retVal.res == "OK") {
						location.href='./AqnaInfo.my?QNA_NUM='+QNA_NUM;
					} else {
						alertify.alert('확인',"답변 등록 실패!!!");
					}
				},
				error:function() {
					alertify.alert('확인',"qna reply ajax통신 실패!!!");
				}
			});			
		});
	
		//부모페이지 reload
		function closePopup() {
			console.log("실행")
			opener.parent.location.reload();
			window.close();
		}
		
		</script>
	</body>
</html>