<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- include libraries(jQuery, bootstrap) -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<!-- include summernote css/js -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
		<!-- Tempus Dominus v5.0.1 -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
		<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />

	    <!-- 공방관리 기본 스타일 -->
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/workshop_my.css">
	    <!-- 페이지 고유 스타일 -->
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/Workshop/workshop_my_index.css">
		<style type="text/css">
			.input_box {
				position: relative;
    			float: left;
			}

			.noti {
				float: left;
			    height: 50px;
			    line-height: 50px;
			    color: #e40000;
			    font-size: 14px;
			}

			.attatch {position:relative;}

			.attatch .btn_attatch {
			    width: 117px !important;
			}
			
			.attatch .btn_attatch, .btn_search_address {
				display:block; 
				float:left; 
				margin:0 10px; 
				width:118px; 
				height:48px; 
				line-height:48px; 
				color:#fff; 
				font-size:14px; 
				font-weight:normal; 
				text-align:center; 
				border:1px solid #474747; 
				background:#6e6e6e; 
				cursor:pointer;
			}
			
			.attatch input[type="file"] {position:absolute; top:0; left:-9999px;}
		</style>
		
	</head>
	<body>
	<div class="container">
	<%@ include file="../../sidebar.jsp" %>
	
		<h3 style="padding-top: 5%;">클래스등록</h3>
		<p>클래스를 등록하실 수 있습니다. 해당 항목에 내용을 입력해주세요</p>
		<p>주의: 반드시 저작권 및 상표권에 문제가 없는 이미지를 사용해 주세요.</p>
		<form>
			<table class="table">
				<colgroup>
					<col style="width: 18%">
					<col style="width: 82%">
				</colgroup>
				<tr>
					<th>클래스 구분</th>
					<td>
						<div class="row">
							<div class="radios clear_fix">
								<input type="radio" id="class_type1" name="lec_type" value="1"
									onclick="" checked> <label for="class_type1">정규클래스</label>
								<input type="radio" id="class_type2" name="lec_type" value="2"
									onclick=""> <label for="class_type2">원데이클래스</label>
							</div>
						</div>
					</td>

				</tr>
				<tr>
					<th>클래스 이름</th>
					<td>
						<div class="row">
							<div class="input_box" style="width: 670px">
								<input class="form-control" type="text" id="lec_title"
									placeholder="예시) 내 손으로 직접 만드는 의자 클래스" value="">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>클래스 간단소개</th>
					<td>
						<div class="row">
							<div class="input_box" style="width: 670px">
								<input class="form-control" type="text" id="lec_intro"
									name="lec_intro"
									placeholder="예시) 누가 앉든 편안한 의자를 만들어보아요~(50자 이내)" value=""
									maxlength="50">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>클래스 금액</th>
					<td>
						<div class="row">
							<div class="input_box" style="margin-right: 10px;">
								<input class="" type="text" id="lec_pay"
									placeholder="1인당 금액을 입력해주세요" value=""
									style="text-align: right;">
							</div>
							<div class="checks">
								<input type="checkbox" id="price_free" name="price_free"
									onchange="priceFree()"> <label for="price_free">무료
									클래스</label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>클래스 날짜구성</th>
					<td>
						<div class="row">
							<div class="form-group">
								<div class="input-group date" id="datetimepicker1"
									data-target-input="nearest">
									<input type="text" class="form-control datetimepicker-input"
										data-target="#datetimepicker1" value="">
									<div class="input-group-append" data-target="#datetimepicker1"
										data-toggle="datetimepicker">
										<div class="input-group-text">
											<i class="fa fa-calendar"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="d-flex align-items-center">
								<p>부터</p>
							</div>
							<div class="form-group">
								<div class="input-group date" id="datetimepicker2"
									data-target-input="nearest">
									<input type="text" class="form-control datetimepicker-input"
										data-target="#datetimepicker2" value="">
									<div class="input-group-append" data-target="#datetimepicker2"
										data-toggle="datetimepicker">
										<div class="input-group-text">
											<i class="fa fa-calendar"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="d-flex align-items-center">
								<p>까지</p>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>지역정보</th>
					<td>
						<div class="row">
							<div>
								<select class="">
									<option selected>지역</option>
									<option>종로구</option>
									<option>중구</option>
									<option>용산구</option>
									<option>성동구</option>
									<option>광진구</option>
									<option>동대문구</option>
									<option>중랑구</option>
									<option>성북구</option>
									<option>강북구</option>
									<option>도봉구</option>
									<option>노원구</option>
									<option>은평구</option>
									<option>서대문구</option>
									<option>마포구</option>
									<option>양천구</option>
									<option>강서구</option>
									<option>구로구</option>
									<option>금천구</option>
									<option>영등포구</option>
									<option>동작구</option>
									<option>관악구</option>
									<option>서초구</option>
									<option>강남구</option>
									<option>송파구</option>
									<option>강동구</option>
								</select>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<div class="row">
							<div>
								<select class="">
									<option selected>전체</option>
									<option>책상</option>
									<option>의자</option>
									<option>책장</option>
									<option>침대</option>
									<option>서랍장</option>
									<option>협탁</option>
									<option>화장대</option>
									<option>기타</option>
								</select>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>클래스를 소개해요</th>
					<td>
						<div class="row">
							<div id="summernote1"></div>
						</div>
					</td>
				</tr>
				<tr>
					<th>이렇게 진행해요</th>
					<td>
						<div class="row">
							<div id="summernote2"></div>
						</div>
					</td>
				</tr>
				<tr>
					<th>함께하고 싶어요</th>
					<td>
						<div class="row">
							<div id="summernote3"></div>
						</div>
					</td>
				</tr>
				<tr>
					<th>환불규정</th>
					<td style="min-height: 330px">
						<div class="row"
							style="width: 690px; font-size: 12pt; line-height: 16pt;">
							<p>NAGAGU의 결제 취소 및 환불 규정은 관련 법령인 &lt;학원의 설립ㆍ운영 및 과외교습에 관한 법률
								시행령 [별표4] [시행 2017.3.21.]&gt;의 &lt;교습비 등 반환기준(제18조 제3항 관련)&gt;을
								준수합니다.</p>
							<p>
								<br>
							</p>
							<p>
								<strong>1. 클래스 수업 기간이 1개월 이내인 경우 환불 기준</strong>&nbsp;
							</p>
							<p>① 클래스 시작 전 - 이미 납부한 교습비 등의 전액&nbsp;</p>
							<p>② 총 클래스 수업시간의 1/3 경과 전 - 이미 납부한 교습비 등의 2/3에 해당하는 금액&nbsp;</p>
							<p>③ 총 클래스 수업시간의 1/2 경과 전 - 이미 납부한 교습비 등의 1/2에 해당하는 금액&nbsp;</p>
							<p>④ 총 클래스 수업시간의 1/2 경과 후 - 반환하지 않음&nbsp;</p>
							<p>
								<br>
							</p>
							<p>
								<strong>2. 클래스 수업 기간이 1개월을 초과하는 경우</strong>&nbsp;
							</p>
							<p>① 클래스 수업 시작 전 - 이미 납부한 교습비 등의 전액&nbsp;</p>
							<p>② 클래스 수업 시작 후 - 환불사유가 발생한 해당 월의 환불 대상 교습비 등 (클래스 수업 기간이</p>
							<p>1개월 이내인 경우의 기준에 따라 산출한 금액을 말한다)과 나머지 월의 교습비 등의 전액을 합산한
								금액&nbsp;</p>
							<p>
								<br>
							</p>
							<p>단 클래스의 특성상 사전 준비(수업재료 준비, 장소 및 식사 사전예약 등)과정에서 불가피하게 손해비용 및
								위약금 발생이 예상되는 경우, 마스터는 법령에서 제시한 내용 외에 별도의 환불규정을 수강생에게 고지할 수 있고,
								수강생은 마스터가 고지한 환불수수료를 제외한 금액을 환불받을 수 있습니다.</p>
						</div>
					</td>
				</tr>
				<tr>
					<th>기타사항</th>
					<td>
						<div class="row">
							<div class="input_box" style="width: 670px">
								<input class="form-control" type="text" id="lec_title"
									placeholder="기타사항을 입력해주세요" value="">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>상단배너 등록</th>
					<td>
						<div class="row">
							<div id="attatchs">
								<div class="attatch" id="attatch0">
									<input type="hidden" id="attatch_photo_text_org0"
										name="attatch_photo_text_org0" value=""> <input
										type="file" id="attatch_photo0" name="attatch_photo0"
										onchange="$('#attatch_photo_text_org0').val('');readURL(this,0);"
										accept="image/*">
									<div class="input_box" style="width: 290px;">
										<input type="text" id="attatch_photo_text0"
											name="attatch_photo_text0"
											placeholder="클래스 상단배너 이미지를 등록해주세요." value="">
									</div>
									<label for="attatch_photo0" class="btn_attatch">사진찾기</label> <span
										id="att_btn_add_0"><a href="javascript:attatchAdd();"
										class="row_btn add"></a></span>
								</div>
							</div>
							<div id="attatchAdd" style="margin-top: -4px;"></div>
							<input type="hidden" name="attatchAddCount" id="attatchAddCount"
								value=0>

							<div>
								<p class="noti">* 가로가 긴 이미지 추천</p>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>대표이미지 등록</th>
					<td>
						<div class="row">
							<div class="attatch">
								<input type="hidden" id="attatch_photo200_text_org"
									name="attatch_photo200_text_org" value=""> <input
									type="file" id="attatch_photo200" name="attatch_photo200"
									onchange="$('#attatch_photo200_text_org').val('');readURL(this,200)"
									accept="image/*">
								<div class="input_box" style="width: 290px;">
									<input type="text" id="attatch_photo200_text"
										name="attatch_photo200_text" placeholder="클래스 목록 이미지를 등록해주세요."
										value="" readonly>
								</div>
								<label for="attatch_photo200" class="btn_attatch">사진찾기</label>
							</div>
						</div>
						<div>
							<p class="noti">* 정사각형 이미지 추천</p>
						</div>
					</td>
				</tr>
				<tr id="class_where">
					<th>클래스 장소</th>
					<td>
						<div class="row">
							<div class="input_box" style="width: 290px;">
								<input type="text" id="lec_address1" name="lec_address1"
									placeholder="주소검색을 해주세요." onclick="postalOn()" disabled
									value="">
							</div>
							<a href="javascript:postalOn();" class="btn_search_address">주소검색</a>
							<div class="input_box" style="width: 430px;">
								<input type="text" id="lec_address2" name="lec_address2"
									placeholder="나머지 주소를 입력해주세요." value="">
							</div>
						</div>
					</td>
				</tr>
			</table>
			<div class="text-center">
				<input class="btn btn-warning btn-lg" type="reset" value="취소하기">&nbsp;&nbsp;&nbsp;
				<input class="btn btn-warning btn-lg" type="submit" value="등록하기">
			</div>
		</form>
	</div>

	<script type="text/javascript">
			$(document).ready(function() {
				$('#summernote1').summernote({
					width: 670,
					height: 300,
					minHeight: null,
					maxHeight: null,
					lang: 'UTF-8',
					onImageUpload: function(files, editor, welEditable) {
						sendFile(files[0], editor, welEditable);
					}
				});
			});

			$(document).ready(function() {
				$('#summernote2').summernote({
					width: 670,
					height: 300,
					minHeight: null,
					maxHeight: null,
					lang: 'UTF-8',
					onImageUpload: function(files, editor, welEditable) {
						sendFile(files[0], editor, welEditable);
					}
				});
			});

			$(document).ready(function() {
				$('#summernote3').summernote({
					width: 670,
					height: 300,
					minHeight: null,
					maxHeight: null,
					lang: 'UTF-8',
					onImageUpload: function(files, editor, welEditable) {
						sendFile(files[0], editor, welEditable);
					}
				});
			});

			$(function () {
				$('#datetimepicker1').datetimepicker({ format: 'L'});
				$('#datetimepicker2').datetimepicker({
					format: 'L',
					useCurrent: false
				});
				$("#datetimepicker1").on("change.datetimepicker", function (e) {
					$('#datetimepicker2').datetimepicker('minDate', e.date);
				});
				$("#datetimepicker2").on("change.datetimepicker", function (e) {
					$('#datetimepicker1').datetimepicker('maxDate', e.date);
				});
			});
		</script>
	</body>
</html>