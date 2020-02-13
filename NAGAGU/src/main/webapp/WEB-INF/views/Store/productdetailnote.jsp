<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
//다중이미지 업로드
$('.input_imgs').on("change", handleImgFileSelect);

//이미지 정보들을 담을 배열
var sel_files= [];
function handleImgFileSelect(e) {
	$('.imgs_wrap').css('display','block');
	//이미지 정보들을 초기화
	sel_files = [];
	$('.imgs_wrap').empty();
	
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	var index = 0;
	filesArr.forEach(function(f) {
		if(!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
  
		sel_files.push(f);
		
		var reader = new FileReader();
		reader.onload = function(e) {
			var html="<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove' width='100' height='100'></a> &nbsp;&nbsp;&nbsp;";
			
			$(".imgs_wrap").append(html);
			index++;
		}
		reader.readAsDataURL(f);          
	});
}      

//파일 선택 후 클릭해서 삭제 가능
/*특정 이미지 삭제*/
function deleteImageAction(index) {
	var delete_confirm = confirm("삭제하시겠습니까?");
	if(delete_confirm) {
		console.log("index : " + index);
		sel_files.splice(index, 1);
		
		var img_id = "#img_id_" + index;
		console.log("img_id : " + img_id);
		$(img_id).remove();
		
		console.log("sel_files : " + sel_files);            
	} 
}



</script>

									<!-- ajax로 뿌려줄 리스트들(ReviewList_Sum) -->
									<div id = "ajaxReviewList">
										<!-- List로 반복 시작 -->
										<!-- ReviewList_Sum id값 주기 -->
										<div class="ReviewList_Sum" id="ReviewList_Sum1" style="border-bottom:1px solid gray;"> <!--ReviewList_Sum: 리뷰(하나)+리뷰 답글(여러개)이 묶여서 반복되는 영역 (1)-->
											<!-- ReviewList id값 주기 -->
											<div class="ReviewList pb-3" style="padding-top:8px; padding-bottom:8px;"> <!-- 반복되는 리뷰영역 : 반복 --><!-- 리뷰영역 1 -->
												<div class="row justify-content-center">
													<div class="col-1 justify-content-end">
														프사
													</div>
													<div class="col-11">
														<div class="row pb-1">
															<div class="col-2 justify-content-end name">닉네임</div>
															<div class="col-8 justify-content-center"></div>
															<div class="col-2 justify-content-center smallfont">날짜</div>
														</div>
														<div class="row pb-2" id="beforeGrade13"> <!-- 수정 전 평점(원래 평점) -->
															<div class="col-12" style="font-size:0.7em; font-weight:bold;">
																0.5 &nbsp;
																<span class='star-rating'>
																	<span style ="width:10%"></span>
																</span>
															</div>
														</div>					
														<div class="row afterGrade pb-2" id="afterGrade13" style="display:none;"> <!-- 수정 후 평점 (수정할 평점) -->
															<div class="col-3 pr-0">
																<img src="${pageContext.request.contextPath}/resources/images/star1.png" alt="" width="15px" height="15px" >
																&nbsp;
																<select name="REVIEW_GRADE" id="REVIEW_GRADE13" style="width=15px;" >
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
														<div class="row pb-2"> <!-- 사진 -->
															<div class="col-12">														       
																<img src="/productupload/image/2b9b8321164b4ce9aaf0f3c7cbf00ee3.jpg" class="review_img">   &nbsp;&nbsp; 
																<img src="/productupload/image/2b9b8321164b4ce9aaf0f3c7cbf00ee3.jpg" class="review_img">   &nbsp;&nbsp; 
																<img src="/productupload/image/2b9b8321164b4ce9aaf0f3c7cbf00ee3.jpg" class="review_img">   &nbsp;&nbsp; 
															</div>
														</div>     													
														<div class="row pb-2" id="beforeContent13">	<!-- 내용 -->
															<div class="col-11 pr-0">
																얘는 답글이 없음 ㅎㅎㅎㅎ 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 
															</div>	
														</div>
														<div class="row afterContent" id="afterContent13" style="display:none;">	<!-- 수정폼 대비 -->
															<div class="col-11 pr-0">
																<input type="hidden" name="REVIEW_NUM" value="1">
																<textarea rows="2" name="REVIEW_CONTENT" id="REVIEW_CONTENT1" class="col-12 pl-0 pr-0" 
																	>답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 하하하하하하하하하하하하</textarea>
															</div>	
														</div>
														<div class="row"> <!-- 답글, 수정, 삭제 -->
															<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold; cursor: pointer;">
																<a class="review_replybtn" id="review_replybtn1" value="1" style="cursor: pointer;">답글</a>
															</div>
															<div class="col-8 justify-content-center"></div>
															<div class="col-2 beforeControl justify-content-center" id="beforeControl1" style="font-size:0.7em; font-weight:bold;">
																<input type="hidden" name="REVIEW_NUM" value="1">
																<a class="modifyReviewform" value="" style="cursor: pointer;">수정</a> &nbsp;
																<a class="deleteReview" value="" style="cursor: pointer;">삭제</a>
															</div>
															<div class="col-2 afterControl justify-content-center" id="afterControl1" style="font-size:0.7em; font-weight:bold;">
																<input type="hidden" name="REVIEW_NUM" value="1">
																<a class="modifyReview" value="" style="cursor: pointer;">수정</a> &nbsp;
																<a class="formCancel" value="reviewModify" style="cursor: pointer;">취소</a>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="Review_ReplyList_Sum" id="Review_ReplyList_Sum1" style=""> <!--Review_ReplyList_Sum: 리뷰 답글 묶는 영역 (하나)-->
												<!-- 답글 누르면 답글폼 나타남-->
												<form id="review_replyForm1" name="REVIEW_CONTENT" enctype="multipart/form-data"> <!-- 리뷰 답글 작성 폼 영역 : 하나 -->
													<div class="Review_replyformSection" style="padding:8px 0;">
														<div class="row justify-content-center">
															<div class="col-1"></div>
															<div class="col-1"><img src="<%=MEMBER_PICTURE %>" alt="" class="rounded-circle"></div>
															<div class="col-10">
																<div class="row">
																	<div class="col-2 justify-content-end name"><%=MEMBER_NICK %></div>
																	<div class="col-8 justify-content-center"></div>
																	<div class="col-2 justify-content-center smallfont pl-1"></div>
																</div>
																<div class="row"> <!-- 내용 textarea -->
																	<div class="col-11 pr-0">
																		<textarea rows="3" name="REVIEW_CONTENT" class="col-12 pl-0 pr-0" 
																			></textarea>
																	</div>	
																</div>
																<div class="row"> <!-- 답글, 수정, 삭제 -->
																	<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;"></div>
																	<div class="col-8 justify-content-center"></div>
																	<div class="col-2 beforeControl justify-content-center pl-1" style="font-size:0.7em; font-weight:bold;">
																		<input type="hidden" name="REVIEW_NUM" value="1"> <!-- 원래 review의 번호 전달해줌 -->
																		<a class="insertReview" style="cursor: pointer;">작성</a> &nbsp;
																		<a class="formCancel" value="reviewReply" style="cursor: pointer;">취소</a>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</form>														
												<!-- 답글 누르면 답글폼 끝 -->
												<div class="review_ReplyInsertSpace pb-2" > <!-- 리뷰 답글 들어오는 영역(review_reply) -->
													<!-- ajax로 insert될 코드 -->
														<div class="row justify-content-center">
															<div class="col-1"></div>
															<div class="col-1">프사</div>
															<div class="col-10">
																<div class="row">
																	<div class="col-2 justify-content-end name">닉네임</div>
																	<div class="col-8 justify-content-center"></div>
																	<div class="col-2 justify-content-center smallfont pl-1">날짜</div>
																</div>
																<div class="row" id="beforeContent51">	<!-- 내용 -->
																	<div class="col-11 pr-0">
																		insert될 review reply 글내용 원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 
																	</div>	
																</div>
																<div class="row afterContent" id="afterContent51" style="display:none;">	<!-- 수정폼 대비 -->
																	<div class="col-11 pr-0">
																		<input type="hidden" name="REVIEW_NUM" value="51">
																		<textarea rows="2" name="REVIEW_CONTENT" id="REVIEW_CONTENT51" class="col-12 pl-0 pr-0" 
																			>답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 하하하하하하하하하하하하</textarea>
																	
																	</div>	
																</div>
																<div class="row"> <!-- 답글, 수정, 삭제 -->
																	<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;"></div>
																	<div class="col-8 justify-content-center"></div>
																	<div class="col-2 beforeControl justify-content-center pl-1" id="beforeControl51" style="font-size:0.7em; font-weight:bold;">
																		<input type="hidden" name="REVIEW_NUM" value="51">
																		<a class="modifyReviewform" value="" style="cursor: pointer;">수정</a> &nbsp;
																		<a class="deleteReview" value="" style="cursor: pointer;">삭제</a>
																	</div>
																	<div class="col-2 afterControl justify-content-center pl-1" id="afterControl51" style="font-size:0.7em; font-weight:bold;">
																		<input type="hidden" name="REVIEW_NUM" value="51">
																		<a class="modifyReview" value="" style="cursor: pointer;">수정</a> &nbsp;
																		<a class="formCancel" value="reviewModify" style="cursor: pointer;">취소</a>
																	</div>
																</div>
															</div>
														</div>
													<!-- ajax로 insert될 코드 끝-->											
												</div>
												<div class="Review_ReplyList pb-2"> <!-- 리뷰 답글이 반복되는 영역(review_reply) --> <!-- reply번호 사용 --> <!-- 반복 -->
													<div class="row justify-content-center">
														<div class="col-1"></div>
														<div class="col-1">프사</div>
														<div class="col-10">
															<div class="row">
																<div class="col-2 justify-content-end name">닉네임</div>
																<div class="col-8 justify-content-center"></div>
																<div class="col-2 justify-content-center smallfont pl-1">날짜</div>
															</div>
															<div class="row" id="beforeContent51">	<!-- 내용 -->
																<div class="col-11 pr-0">
																	원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 원래 답글내용 
																</div>	
															</div>
															<form id="review_reply_modify_form"> <!-- $('#review_reply_modify_form') 에 수정폼 뿌려줌-->
																<div class="row afterContent" id="afterContent51" style="display:none;">	<!-- 수정폼 대비 -->
																	<div class="col-11 pr-0">
																		<input type="hidden" name="REVIEW_NUM" value="51">
																		<textarea rows="2" name="REVIEW_CONTENT" id="REVIEW_CONTENT51" class="col-12 pl-0 pr-0" 
																			>답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 하하하하하하하하하하하하</textarea>
																	
																	</div>	
																</div>
															</form>
															<div class="row"> <!-- 답글, 수정, 삭제 -->
																<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;"></div>
																<div class="col-8 justify-content-center"></div>
																<div class="col-2 beforeControl justify-content-center pl-1" id="beforeControl51" style="font-size:0.7em; font-weight:bold;">
																	<input type="hidden" name="REVIEW_NUM" value="51">
																	<a class="modifyReviewform" value="" style="cursor: pointer;">수정</a> &nbsp;
																	<a class="deleteReview" value="" style="cursor: pointer;">삭제</a>
																</div>
																<div class="col-2 afterControl justify-content-center pl-1" id="afterControl51" style="font-size:0.7em; font-weight:bold;">
																	<input type="hidden" name="REVIEW_NUM" value="51">
																	<a class="modifyReview" value="" style="cursor: pointer;">수정</a> &nbsp;
																	<a class="formCancel" value="reviewModify" style="cursor: pointer;">취소</a>
																</div>
															</div>
														</div>
													</div>
												</div>											
											</div>
										</div>	<!-- ReviewList_Sum 1 end -->
										<!-- 선 -->
									
										<div class="ReviewList_Sum" id="ReviewList_Sum2" style="border-bottom:1px solid gray;"> <!--ReviewList_Sum: 리뷰(하나)+리뷰 답글(여러개)이 묶여서 반복되는 영역(2) -->
											<div class="ReviewList pb-3" style="padding-top:8px; padding-bottom:8px;"> <!-- 리뷰영역 2 -->
												<div class="row justify-content-center">
													<div class="col-1 justify-content-end">
														프사
													</div>
													<div class="col-11">
														<div class="row pb-1">
															<div class="col-2 justify-content-end name">닉네임</div>
															<div class="col-8 justify-content-center"></div>
															<div class="col-2 justify-content-center smallfont">날짜</div>
														</div>
														<div class="row pb-2"> <!-- 평점 -->
															<div class="col-12 " style="font-size:0.7em; font-weight:bold;">
																평점
															</div>
														</div>
														<div class="row pb-2"> <!-- 평점 hidden -->
															<div class="col-12 " style="font-size:0.7em; font-weight:bold;">
																평점 수정
															</div>
														</div>
														<div class="row pb-2">	<!-- 내용 -->
															<div class="col-11 pr-0">
																얘는 답글이 없음 ㅎㅎㅎㅎ 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 리스트 출력-내용1 
															</div>	
														</div>
														<div class="row">	<!-- 수정폼 대비 -->
															<div class="col-11 pr-0">
																<textarea rows="2" name="REVIEW_CONTENT" class="col-12 pl-0 pr-0" 
																	id="qna_re_content">답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 답글폼 만들기 하하하하하하하하하하하하</textarea>
															</div>	
														</div>
														<div class="row"> <!-- 답글, 수정, 삭제 -->
															<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;">답글</div>
															<div class="col-8 justify-content-center"></div>
															<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;">
																<a class="">수정</a> &nbsp;
																<a class="">삭제</a>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="Review_ReplyList"> <!-- 리뷰 답글 영역 -->
												<div class="Review_ReplyList pb-2"> <!-- 리뷰 답글이 반복되는 영역(review_re) -->
													<div class="row justify-content-center">
														<div class="col-1"></div>
														<div class="col-1">프사</div>
														<div class="col-10">
															<div class="row">
																<div class="col-2 justify-content-end name">닉네임</div>
																<div class="col-8 justify-content-center"></div>
																<div class="col-2 justify-content-center smallfont pl-1">날짜</div>
															</div>
															<div class="row">	<!-- 내용 -->
																<div class="col">
																	답글내용
																</div>	
															</div>
															<div class="row"> <!-- 답글, 수정, 삭제 -->
																<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;"></div>
																<div class="col-8 justify-content-center"></div>
																<div class="col-2 justify-content-center pl-1" style="font-size:0.7em; font-weight:bold;">
																	<a class="">수정</a> &nbsp;
																	<a class="">삭제</a>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="Review_ReplyList pb-2"> <!-- 리뷰 답글이 반복되는 영역(review_re) 2-->
													<div class="row justify-content-center">
														<div class="col-1"></div>
														<div class="col-1">프사</div>
														<div class="col-10">
															<div class="row">
																<div class="col-2 justify-content-end name">닉네임</div>
																<div class="col-8 justify-content-center"></div>
																<div class="col-2 justify-content-center smallfont pl-1">날짜</div>
															</div>
															<div class="row"> <!-- 평점 -->
																<div class="col-12 " style="font-size:0.7em; font-weight:bold;">
																	
																</div>
															</div>
															<div class="row">	<!-- 내용 -->
																<div class="col">
																	답글내용
																</div>	
															</div>
															<div class="row"> <!-- 답글, 수정, 삭제 -->
																<div class="col-2 justify-content-center" style="font-size:0.7em; font-weight:bold;"></div>
																<div class="col-8 justify-content-center"></div>
																<div class="col-2 justify-content-center pl-1" style="font-size:0.7em; font-weight:bold;">
																	<a class="">수정</a> &nbsp;
																	<a class="">삭제</a>
																</div>
															</div>
														</div>
													</div>
												</div>												
													
											</div>
										</div>
									</div> <!-- ajax로 뿌려줄 리스트들(ReviewList_Sum) 끝-->
									
									
									
									
									

</body>
</html>