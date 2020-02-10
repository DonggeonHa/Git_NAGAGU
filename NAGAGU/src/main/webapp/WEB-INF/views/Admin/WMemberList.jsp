<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.workshop.*" %>
<%
	List<WorkShopMemberVO> wmemberList = (ArrayList<WorkShopMemberVO>)request.getAttribute("wmemberList");

	int listcount = ((Integer)request.getAttribute("listcount")).intValue(); // 글 개수
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int startrow = ((Integer)request.getAttribute("startrow")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
	
%>
<!-- 본문 -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<h1 class="text-center">공방회원관리</h1>
		<br><br>
		
		<div class="input-group justify-content-end mb-3" style="width: 300px !important;">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default"><i class="fas fa-search"></i></span>
			</div>
			<input type="text" class="form-control" aria-describedby="inputGroup-sizing-default" placeholder="공방명을 입력하세요" id="keyword">
		</div>
		<table class="table table-hover tableCSS" id="user-table2">
			<thead class="text-center">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">이메일</th>
					<th scope="col">공방명</th>
					<th scope="col">대표자</th>
					<th scope="col">핸드폰</th>
					<th scope="col">사업자번호</th>
					<th scope="col">주소</th>
					<th scope="col">상세주소</th>
					<th scope="col">상태</th>
					<th scope="col">관리</th>
				</tr>
			</thead>
			<tbody class="text-center">
			<%
				if(listcount > 0) {
					for (int i = 0; i < wmemberList.size(); i++) {
						WorkShopMemberVO member = wmemberList.get(i);
			%>
					<tr>
						<th scope="col"><%=startrow%></th>
						<td><%=member.getWORKSHOP_EMAIL()%></td>
						<td><%=member.getWORKSHOP_NAME()%></td>
						<td><%=member.getWORKSHOP_CEO_NAME()%></td>
						<td><%=member.getWORKSHOP_PHONE()%></td>
						<td><%=member.getWORKSHOP_LICENSE()%></td>
						<td><%=member.getWORKSHOP_ADDRESS1()%></td>
						<td><%=member.getWORKSHOP_ADDRESS2()%></td>
					
			<%
						if(member.getWORKSHOP_STATUS() != 2) {
			%>
							<td>승인대기중</td>
							<td>
								<a href="javascript:updateWMember('<%=member.getWORKSHOP_NUM()%>')">
									<i class="fas fa-arrow-up"></i>
								</a> &nbsp;&nbsp;
								<a href="javascript:deleteWMember('<%=member.getWORKSHOP_NUM()%>')">
									<i class="fas fa-trash-alt" ></i>
								</a>
							</td>
			<%
						} else {
			%>
							<td>승인완료</td>
							<td>
								<a href="javascript:deleteWMember('<%=member.getWORKSHOP_NUM()%>')">
									<i class="fas fa-trash-alt" ></i>
								</a>
							</td>
			<%
						}
			%>
					</tr>
			<%
						startrow ++; // 번호 증가 ++
					}
				} else {
			%>
					<tr>
						<td colspan="10">신청된 게시글이 없습니다.</td>
					</tr>
			<%  } %>
			</tbody>
		</table>
		<nav aria-label="Page navigation example">
			<ul class="pagination pagination-lg justify-content-center">
				<%
					if(nowpage <= 1) { 
				%>
						<li class="page-item disabled">
							<a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a>
						</li>
				<%	
					} else { 
				%>
						<li class="page-item">
							<a class="page-link" href="./WMemberList.ad?page=<%=nowpage-1%>">이전 </a>
						</li>
				<% 
					} 
				%>
				
				<%
					for(int a = startpage; a <= endpage; a++) {
						if(a == nowpage) { 
				%>
							<li class="page-item disabled">
								<a class="page-link" href="#" tabindex="-1" aria-disabled="true"><%=a%></a>
							</li> <!-- 현재 보고있는 페이지에는 링크를 걸지 않겠다. -->
				<% 	
						} else { 
				%>
							<li class="page-item">
								<a class="page-link" href="./WMemberList.ad?page=<%=a%>"><%=a%></a>
							</li>
				<% 	
						}
					}
				%>	
				
				<%
					if(nowpage >= maxpage) { 
				%> 
						<li class="page-item disabled">
							<a class="page-link" href="#" tabindex="-1" aria-disabled="true">다음</a>
						</li> <!-- 현재 보는 페이지가 마지막 페이지 이면 -->
				<%
					} else { 
				%>
						<li class="page-item">
							<a class="page-link" href="./WMemberList.ad?page=<%=nowpage+1%>">다음</a>
						</li>
				<%
					} 
				%>
			</ul>
		</nav>
	</div>
</div>
<!-- /본문 -->