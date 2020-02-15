<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String MEMBER_NAME = (String)session.getAttribute("MEMBER_NAME");
	String MEMBER_EMAIL = (String)session.getAttribute("MEMBER_EMAIL");
	String WORKSHOP_NAME = (String)session.getAttribute("WORKSHOP_NAME");
	String WORKSHOP_EMAIL = (String)session.getAttribute("WORKSHOP_EMAIL");
%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">

<div id="footer2" style="border-top: 4px solid #ef900e !important;">
    <div class="copyright">
        <ul class="sns">
	        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/sns1.png"></a></li>
	        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/sns2.png"></a></li>
	        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/sns3.png"></a></li>
	        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/sns4.png"></a></li>
        </ul>
        <ul>
	        <li>상호명 : <a href="./login.ad">NAGAGU</a></li>
	        <li class="line">/</li>
	        <li>대표 : 비트캠프</li>
	        <li class="line">/</li>
	        <li>전화 : 02-0000-0000</li>
	        <li class="line">/</li>
	        <li>사업자등록번호 : 516-13538-13535</li>
	        <li class="line">/</li>
	        <li>E-mail : email@mail.com</li>
	        <li class="line">/</li>
	     	<%
	     		if(WORKSHOP_EMAIL==null && MEMBER_EMAIL==null) {
	     	%>
			        <li><a href="./mypage_support.my">고객센터</a></li>
			        <li class="line">/</li>
			        <li class="copy">Copyright &copy; Design Bitcamp All rights reserved.</li>
	        <%
	        	} else if(WORKSHOP_EMAIL != null) {
	        %>
			        <li><a href="./mypage_support.my">고객센터</a></li>
			        <li class="line">/</li>
			        <li><a data-toggle="modal" data-target="#deleteMemberModal" class="btn_mypage" style="cursor: pointer;">탈퇴하기</a></li>
			        <li class="copy">Copyright &copy; Design Bitcamp All rights reserved.</li>
	        <%
	        	} else {
	        %>
			        <li><a href="./mypage_support.my">고객센터</a></li>
			        <li class="line">/</li>
			        <li><a data-toggle="modal" data-target="#deleteMemberModal" class="btn_mypage" style="cursor: pointer;">탈퇴하기</a></li>
			        <li class="copy">Copyright &copy; Design Bitcamp All rights reserved.</li>
	        <%
	        	}
	        %>
        </ul>
    </div>
</div>
		
<div class="modal fade" id="deleteMemberModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">탈퇴하기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="recipient-name" class="email">이메일</label>
						<input type="text" class="form-control" id="delet_member_email" name="delet_member_email">
					</div>
					<div class="form-group">
						<label for="message-text" class="password">비밀번호</label>
						<input type="text" class="form-control" id="delet_member_password" name="delet_member_password">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn cancel" data-dismiss="modal">취소</button>
				<button type="button" class="btn delete_member">탈퇴</button>
			</div>
		</div>
	</div>
</div>