<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div class="container">
			<div id="ReviewSection">
				<div id="ReviewButtonSection"></div>
				<div id="ReviewWrapSection" class="pb-1">
					<div id="ReviewformSection" class="pb-2">
						<form id="ReviewForm" name="REVIEW_CONTENT" enctype="multipart/form-data"> <!-- 리뷰 작성 폼 영역 : 하나 -->
							<input type="hidden" name="MEMBER_NUM" value="=MEMBER_NUM">
							<input type="hidden" name="REVIEW_PRODUCT" value="PRODUCT_NUM">
							<div class="row justify-content-center">
								<div class="col-1 justify-content-end">
									<img src="MEMBER_PICTURE" alt="" class="rounded-circle">
								</div>
								<div class="col-11">
									<div class="row pb-1">
										<div class="col-2 justify-content-end name">MEMBER_NICK </div>
										<div class="col-8 justify-content-center"></div>
										<div class="col-2 justify-content-center smallfont"></div>
									</div>
									<div class="row pb-1"> <!-- 평점 -->
										<div class="col-3 pr-0">
											<img src="${pageContext.request.contextPath}/resources/images/star1.png" alt="" width="15px" height="15px" >
											&nbsp;
											<select name="REVIEW_GRADE" id="REVIEW_GRADE" style="width=15px;" >
												<option value="0">0</option>
												<option value="0.5">0.5</option>
												<option value="1.0">1.0</option>
												<option value="1.5">1.5</option>
												<option value="2.0">2.0</option>
												<option value="2.5">2.5</option>
												<option value="3.0">3.0</option>
												<option value="3.5">3.5</option>
												<option value="4.0">4.0</option>
												<option value="4.5">5.5</option>
												<option value="5.0">5.0</option>
											</select>											
										</div>
										<div class="9"></div>
									</div>
									
									<div class="row pb-2"> <!-- 파일 -->
										<div class="col-12">
											<div class="file_input">
											    <label>
											        사진 업로드
											        <input type="file" multiple="multiple" name="REVIEW_FILE" id="input_imgs">
											    </label>
											    <input type="text" readonly="readonly" title="File Route" value="선택된 파일이 없습니다">
											</div>			
										</div>
									</div>
									<div class="row pb-2">
										<div class="col-12 imgs_wrap">
											<img id="inputimg" >
										</div>
									</div>
									<div class="row pb-1">	<!-- 내용 textarea -->
										<div class="col-11 pr-0">
											<textarea rows="3" name="REVIEW_CONTENT" class="col-12 pl-0 pr-0" 
												id=""></textarea>
										</div>	
									</div>
									<div class="row"> <!-- 수정, 삭제 -->
										<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;"></div>
										<div class="col-8 justify-content-center"></div>
										<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;">
											<a class="insertReview" style="cursor: pointer;">작성</a> &nbsp;
											<a class="formCancel" value="reviewForm" style="cursor: pointer;">취소</a>
										</div>
									</div>
								</div>
							</div>
						</form>		
					</div>
					<div id="ReviewtableSection" class="pb-2">
						<div class="ReviewAndReplySum pb-3" id="ReviewAndReplySum0"></div> <!-- jsp로 출력해놓음: insert될 시 여기로 들어옴 -->
						<div class="ReviewAndReplySum pb-3" id="ReviewAndReplySum51"> <!-- ajax, 51번째 댓글에 대한 리뷰+리플라이 묶음 -->
							<div class="ReviewSum" id="ReviewSum51">
								<div class="ReviewList pb-3" id="ReviewList51">
									<div class="beforeModifyReview" id="beforeModifyReview51">
										<div class="row justify-content-center">
											<div class="col-1 justify-content-end">프사</div>
											<div class="col-11">
												<div class="row pb-1">
													<div class="col-2 justify-content-end name">닉네임</div>
													<div class="col-8 justify-content-center"></div>
													<div class="col-2 justify-content-center smallfont">날짜</div>
												</div>
												<div class="row pb-2">
													<div class="col-12" style="font-size:0.7em; font-weight:bold;">
														0.5 &nbsp;
														<span class='star-rating'>
															<span style ="width:10%"></span>
														</span>
													</div>
												</div>			
												<div class="row pb-2">	
													<div class="col-12">
														<img src="/productupload/image/99079bcbf4a24e5f8cddde3ca7457f1f.jpg" class="review_img">
														<img src="/productupload/image/99079bcbf4a24e5f8cddde3ca7457f1f.jpg" class="review_img">
														<img src="/productupload/image/99079bcbf4a24e5f8cddde3ca7457f1f.jpg" class="review_img">
													</div>
												</div>												
												<div class="row pb-2">
													<div class="col-11 pr-0">
														ajax로 insert될 리뷰 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 
													</div>	
												</div>	
												<div class="row"> <!-- 답글, 수정, 삭제 -->
													<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold; cursor: pointer;">
														<a class="review_replybtn" id="review_replybtn00" value="00" style="cursor: pointer;">답글</a>
													</div>
													<div class="col-8 justify-content-center"></div>
													<div class="col-2 beforeControl justify-content-center" id="beforeControl00" style="font-size:0.7em; font-weight:bold;">
														<input type="hidden" name="REVIEW_NUM" value="51">
														<a class="gomodifyReviewform" style="cursor: pointer;">수정</a> &nbsp;
														<a class="deleteReview" style="cursor: pointer;">삭제</a>
													</div>
												</div>
											</div>
										</div>		
									</div>
									<div class="afterModifyReview" id="afterModifyReview51"></div> <!-- ajax -->
								</div>
							</div>
							<div class="ReviewReplySum" id="ReviewReplySum51"> <!-- ReviewAndReplySum에 묶인 id넘버는 같다(원글번호) -->
								<div class="ReviewReplyformSection" id="ReviewReplyformSection51"> <!-- ajax --> <!-- 상품번호,멤버넘? 원글넘버 넘겨줘야함(그래야 답글 입력시 re_num입력 가능, 컨트롤러에서 답글인 것 구별 가능 -->
									<form id="ReviewReplyform" name="REVIEW_CONTENT" enctype="multipart/form-data">
										<div class="row justify-content-center">
											<div class="col-1"></div>
											<div class="col-1"><img src="=MEMBER_PICTURE %>" alt="" class="rounded-circle"></div>
											<div class="col-10">
												<div class="row">
													<div class="col-2 justify-content-end name">MEMBER_NICK</div>
													<div class="col-8 justify-content-center"></div>
													<div class="col-2 justify-content-center smallfont pl-1"></div>
												</div>
												<div class="row"> <!-- 내용 textarea -->
													<div class="col-11 pr-0">
														<textarea rows="3" name="REVIEW_CONTENT" class="col-12 pl-0 pr-0" 
															></textarea>
													</div>	
												</div>
												<div class="row"> <!-- 리뷰답글 작성, 삭제 -->
													<div class="col-2 replytext justify-content-center"></div>
													<div class="col-8 justify-content-center"></div>
													<div class="col-2 beforeControl justify-content-center pl-1">
														<input type="hidden" name="REVIEW_NUM" value="51"> <!-- 원래 review의 번호 전달해줌 -->
														<input type="hidden" name="REVIEW_NUM" value="51"> <!-- 원래 review의 번호 전달해줌 -->
														<input type="hidden" name="REVIEW_NUM" value="51"> <!-- 원래 review의 번호 전달해줌 -->
														<a class="insertReviewReply">작성</a> &nbsp;
														<a class="formCancel" value="reviewReply">취소</a>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="ReviewReplyInsertSpace" id="ReviewReplyInsertSpace51"></div>
								<div class="ReviewReplyList pb-2" id="ReviewReplyList61"> <!-- reply 출력의 넘버는 reply의 review_num -->
									<div class="row justify-content-center">
										<div class="col-1"></div>
										<div class="col-1">프사</div>
										<div class="col-10">
											<div class="row">
												<div class="col-2 justify-content-end name">닉네임</div>
												<div class="col-8 justify-content-center"></div>
												<div class="col-2 justify-content-center smallfont pl-1">날짜</div>
											</div>
											<div class="beforeModifyReviewReply" id="beforeModifyReviewReply61">	
												<div class="row">	<!-- 내용 -->
													<div class="col-11 pr-0">
														insert될 review reply 글내용 원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 
													</div>	
												</div>
											</div>
											<div class="afterModifyReviewReply" id="afterModifyReviewReply61">	<!-- hidden -->
												<form class="modifyReviewReplyForm" id="modifyReviewFormReply61">
													<div class="row">	<!-- 수정폼 대비 -->
														<div class="col-11 pr-0">
															<input type="hidden" name="REVIEW_NUM" value="61">
															<textarea rows="2" name="REVIEW_CONTENT" id="REVIEW_CONTENT61" class="col-12 pl-0 pr-0" 
																>답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 하하하하하하하하하하하하</textarea>
														
														</div>	
													</div>
												</form>	
											</div>		
											<div class="row"> <!-- ReviewReply 수정, 삭제 -->
												<div class="col-2 replytext justify-content-center"></div>
												<div class="col-8 justify-content-center"></div>
												<div class="col-2 beforeControl justify-content-center pl-1" id="beforeControl61">
													<input type="hidden" name="REVIEW_NUM" value="61">
													<a class="gomodifyReviewReplyform">수정</a> &nbsp;
													<a class="deleteReview">삭제</a>
												</div>
												<div class="col-2 afterControl justify-content-center pl-1" id="afterControl61">
													<input type="hidden" name="REVIEW_NUM" value="61">
													<a class="modifyReviewReply">수정</a> &nbsp;
													<a class="formCancel" value="reviewReplyModify">취소</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="ReviewReplyList pb-2" id="ReviewReplyList62"></div>
							</div>
						</div> <!-- ReviewCount>0일 경우 i번 돈다 -->
						<div class="ReviewAndReplySum pb-3" id="ReviewAndReplySum52">
							<div class="ReviewSum" id="ReviewSum52"></div>
							<div class="ReviewReplySum" id="ReviewReplySum52"></div>
						</div>
						<div class="ReviewAndReplySum pb-3" id="ReviewAndReplySum53"></div>
						<div class="ReviewAndReplySum pb-3" id="ReviewAndReplySum54"></div>
						<div class="ReviewAndReplySum pb-3" id="ReviewAndReplySum55"></div>
					</div>
				</div>
			</div>
		</div>
	
	</body>
</html>