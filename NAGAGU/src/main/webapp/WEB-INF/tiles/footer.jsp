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
	        <li>사업자등록번호 : 119-86-91245</li>
	        <li class="line">/</li>
	        <li>E-mail : email@mail.com</li>
	        <li class="line">/</li>
	     	<%
	     		if(WORKSHOP_EMAIL==null && MEMBER_EMAIL==null) {
	     	%>
			        <li><a href="./mypage_support.my">고객센터</a></li>
			        <li class="copy">Copyright &copy; Design Bitcamp All rights reserved.</li>
	        <%
	        	} else if(WORKSHOP_EMAIL != null) {
	        %>
			        <li><a href="./mypage_support.my">고객센터</a></li>
			        <li class="line">/</li>
			        <li><a data-toggle="modal" data-target="#deleteMemberModal" class="btn_mypage" style="cursor: pointer;">공방탈퇴</a></li>
			        <li class="copy">Copyright &copy; Design Bitcamp All rights reserved.</li>
	        <%
	        	} else {
	        %>
			        <li><a href="./mypage_support.my">고객센터</a></li>
			        <li class="line">/</li>
			        <li><a data-toggle="modal" data-target="#deleteMemberModal" class="btn_mypage" style="cursor: pointer;">회원탈퇴</a></li>
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
		<%
			if(WORKSHOP_EMAIL == null && MEMBER_EMAIL == null) {
				System.out.println("이걸 들어올 수 있을까?");
			} else if (WORKSHOP_EMAIL != null) {
		%>
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">공방회원 탈퇴하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="./deleteWMember.ma" method="post">
					<div class="modal-body">
						<p> 이용해주셔서 감사합니다. 항상 노력하는 NAGAGU가 되겠습니다. </p>
						<p> <h4>회원탈퇴 후 회원정보 보존기간</h4></p>
						<p> - 회원님의 재가입 여부 판단을 이유로 30일간 최소 정보 아이디, </p>
						<p>&nbsp;&nbsp;&nbsp;이름을 제외하고 모두 삭제되며, 31일 이후 자동 삭제됩니다. </p>
						<p> - 전자상거래법에 따라 아이디 및 구매정보에 대한 기록은 5년간 보관되며, </p>
						<p>&nbsp;&nbsp;&nbsp;이후 자동 삭제됩니다. </p>
						<p> - 단, 회원님의 탈퇴요청 접수 후 데이터 처리상 48시간 이내</p> 
						<p>&nbsp;&nbsp;&nbsp;e-mail/SMS 발송이 중지 됩니다.</p>
						<p> <h4>회원탈퇴 후 재가입 안내</h4></p>
						<p> - 기존에 사용하시던 아이디로는 재가입이 불가능합니다. </p>
						<p>&nbsp;&nbsp;&nbsp;신규 아이디로 재가입해주세요. </p>
						<div class="form-group">
							<label for="recipient-name" class="email">이메일</label>
							<input type="text" class="form-control" value="<%=WORKSHOP_EMAIL%>" name="WORKSHOP_EMAIL" readonly>
						</div>
						<div class="form-group">
							<label for="message-text" class="password">비밀번호</label>
							<input type="password" class="form-control" id="WORKSHOP_PASS" name="WORKSHOP_PASS">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-dark cancel" data-dismiss="modal">취소</button>
						<input type="submit" class="btn btn-outline-dark delete_member" value="탈퇴">
					</div>
				</form>
		<%
			} else {
		%>
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">회원 탈퇴하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="./deleteMember.ma" method="post">
					<div class="modal-body">
						<p> 이용해주셔서 감사합니다. 항상 노력하는 NAGAGU가 되겠습니다. </p>
						<p> <h4>회원탈퇴 후 회원정보 보존기간</h4></p>
						<p> - 회원님의 재가입 여부 판단을 이유로 30일간 최소 정보 아이디, </p>
						<p>&nbsp;&nbsp;&nbsp;이름을 제외하고 모두 삭제되며, 31일 이후 자동 삭제됩니다. </p>
						<p> - 전자상거래법에 따라 아이디 및 구매정보에 대한 기록은 5년간 보관되며, </p>
						<p>&nbsp;&nbsp;&nbsp;이후 자동 삭제됩니다. </p>
						<p> - 단, 회원님의 탈퇴요청 접수 후 데이터 처리상 48시간 이내</p> 
						<p>&nbsp;&nbsp;&nbsp;e-mail/SMS 발송이 중지 됩니다.</p>
						<p> <h4>회원탈퇴 후 재가입 안내</h4></p>
						<p> - 기존에 사용하시던 아이디로는 재가입이 불가능합니다. </p>
						<p>&nbsp;&nbsp;&nbsp;신규 아이디로 재가입해주세요. </p>
						<div class="form-group">
							<label for="recipient-name" class="email">이메일</label>
							<input type="text" class="form-control" id="MEMBER_EMAIL" name="MEMBER_EMAIL">
						</div>
						<div class="form-group">
							<label for="message-text" class="password">비밀번호</label>
							<input type="password" class="form-control" id="MEMBER_PASS" name="MEMBER_PASS">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-dark cancel" data-dismiss="modal">취소</button>
						<input type="submit" class="btn btn-outline-dark delete_member" value="탈퇴">
					</div>
				</form>
		<%
			}
		%>
		</div>
	</div>
</div>