<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<style></style>
	</head>
	<body>
	
	<div class="ReviewAndReplySum pt-2 pb-1" id="ReviewAndReplySum'+REVIEW_NUM+'">
		<div class="ReviewSum" id="ReviewSum'+REVIEW_NUM+'">
			<div class="ReviewList pb-3" id="ReviewList'+REVIEW_NUM+'">
				<div class="beforeModifyReview" id="beforeModifyReview'+REVIEW_NUM+'">
					<div class="row justify-content-center">
						<div class="col-1 justify-content-end">
							<img src="'+MEMBER_PICTURE+'" alt="" class="rounded-circle">
						</div>
						<div class="col-11">
							<div class="row pb-1">
								<div class="col-2 justify-content-end name">'+MEMBER_NICK+'</div>
								<div class="col-8 justify-content-center"></div>
								<div class="col-2 justify-content-center smallfont">'+date+'</div>
							</div>
							<div class="row pb-2">
								<div class="col-12" style="font-size: 0.7em; font-weight: bold;">
									'+REVIEW_GRADE+' &nbsp; 
									<span class="star-rating"> 
										<span style="width: '+rate+'%"></span>
									</span>
								</div>
							</div>
							<div class="row pb-2">
								<div class="col-12">
									<img src="/productupload/image/' + reviewImgArray[k] + '" class="review_img">&nbsp;
								</div>
							</div>
							<div class="row pb-2">
								<div class="col-11 pr-0">' + REVIEW_CONTENT + '</div>
							</div>
							<div class="row">
								<div class="col-2 justify-content-center" style="font-size: 0.7em; font-weight: bold; cursor: pointer;">
									<a class="review_replybtn" id="review_replybtn' + REVIEW_NUM + '" value="' + REVIEW_NUM + '">답글</a>
								</div>
								<div class="col-8 justify-content-center"></div>

								//작성 본인만 수정,삭제버튼 보인다
								<div class="col-2 ReviewbeforeControl justify-content-center" id="ReviewbeforeControl'+REVIEW_NUM+'" style="font-size: 0.7em; font-weight: bold;">
									<input type="hidden" name="REVIEW_NUM" value="'+REVIEW_NUM+'">
									<a class="gomodifyReviewform">수정</a> &nbsp; 
									<a class="deleteReview">삭제</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="afterModifyReview" id="afterModifyReview'+REVIEW_NUM+'"></div>
			</div>
		</div>
		<div class="ReviewReplySum" id="ReviewReplySum'+REVIEW_NUM+'">
			<div class="ReviewReplyformSection"	id="ReviewReplyformSection'+REVIEW_NUM+'"></div>
<!-- 리뷰_RE_카운트가 > 0 이상일 떄 -->
			<div class="ReviewReplyList pb-2" id="ReviewReplyList'+REPLY_NUM+'">
				<div class="row justify-content-center">
					<div class="col-1"></div>
					<div class="col-1">
						<img src="'+REPLY_PICTURE+'" alt="" class="rounded-circle">
					</div>
					<div class="col-10">
						<div class="row">
							<div class="col-2 justify-content-end name">'+REPLY_NICK+'</div>
							<div class="col-8 justify-content-center"></div>
							<div class="col-2 justify-content-center smallfont pl-1">'+replydate+'</div>
						</div>
						<div class="beforeModifyReviewReply" id="beforeModifyReviewReply'+REPLY_NUM+'">
							<div class="row">
								<div class="col-11 pr-0">'+REPLY_CONTENT</div>
							</div>
						</div>
						<div class="afterModifyReviewReply"	id="afterModifyReviewReply'+REPLY_NUM+'">
							<form class="modifyReviewReplyForm" id="modifyReviewFormReply'+REPLY_NUM+'">
								<div class="row">
									<div class="col-11 pr-0">
										<input type="hidden" name="REVIEW_NUM" value="'+REPLY_NUM+'">
										<textarea rows="2" name="REVIEW_CONTENT" id="REVIEW_CONTENT'+REPLY_NUM+'" class="col-12 pl-0 pr-0">'+REPLY_CONTENT+'</textarea>
									</div>
								</div>
							</form>
						</div>
						<div class="row">
							<div class="col-2 replytext justify-content-center"></div>
							<div class="col-8 justify-content-center"></div>
		
							//작성 본인만 수정,삭제버튼 보인다
							<div class="col-2 ReviewbeforeControl justify-content-center pl-1" id="ReviewbeforeControl'+REPLY_NUM+'">
								<input type="hidden" name="REVIEW_NUM" value="'+REPLY_NUM+'">
								<a class="gomodifyReviewReplyform">수정</a> &nbsp; 
								<a class="deleteReview">삭제</a>
							</div>
							<div class="col-2 ReviewafterControl justify-content-center pl-1" id="ReviewafterControl'+REPLY_NUM+'">
								<input type="hidden" name="REVIEW_NUM" value="'+REPLY_NUM+'">
								<a class="modifyReviewReply">수정</a> &nbsp; 
								<a class="formCancel" value="reviewReplyModify">취소</a>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- 			cc -->
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		<script></script>
	</body>
</html>