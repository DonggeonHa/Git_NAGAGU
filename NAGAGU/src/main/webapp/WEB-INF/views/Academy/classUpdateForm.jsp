<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.spring.workshopMypage.*" %>
<%@ page import="com.spring.academy.*" %>
<%
	ClassVO classVO = (ClassVO)request.getAttribute("ClassVO");
	 
	int CLASS_NUMBER = classVO.getCLASS_NUMBER();
	String CLASS_DIVISION = classVO.getCLASS_DIVISION();
	String CLASS_NAME = classVO.getCLASS_NAME();
	String CLASS_ABRIEF = classVO.getCLASS_ABRIEF();
	int CLASS_AMOUNT = classVO.getCLASS_AMOUNT();
	String CLASS_DATE_CONFIGURATION_1 = classVO.getCLASS_DATE_CONFIGURATION_1();
	String CLASS_DATE_CONFIGURATION_2 = classVO.getCLASS_DATE_CONFIGURATION_2();
	String CLASS_AREA = classVO.getCLASS_AREA();
	String CLASS_CATEGORY = classVO.getCLASS_CATEGORY();
	String CLASS_INTRODUCTION_1 = classVO.getCLASS_INTRODUCTION_1();
	String CLASS_INTRODUCTION_2 = classVO.getCLASS_INTRODUCTION_2();
	String CLASS_INTRODUCTION_3 = classVO.getCLASS_INTRODUCTION_3();
	String CLASS_ETC = classVO.getCLASS_ETC();
	String CLASS_BANNER = classVO.getCLASS_BANNER();
	String CLASS_IMAGE = classVO.getCLASS_IMAGE();
	String CLASS_ADDRESS = classVO.getCLASS_ADDRESS();
	String CLASS_DETAIL_ADDRESS = classVO.getCLASS_DETAIL_ADDRESS();
	
%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">

<style type="text/css">
	.input_box {
		position: relative;
		float: left;
	}
	
	.noti {
		float: left;
		color: #e40000;
		font-size: 14px;
	}
</style>
		
<div class="container" style="padding: 3% 0;">
	<h3>클래스등록</h3>
	<p>클래스를 등록하실 수 있습니다. 해당 항목에 내용을 입력해주세요</p>
	<p>주의: 반드시 저작권 및 상표권에 문제가 없는 이미지를 사용해 주세요.</p>
	<form action="./updateClass.mywork" method="post" enctype="multipart/form-data">
	<input type="hidden" name="CLASS_NUMBER" id="CLASS_NUMBER" value="<%=CLASS_NUMBER%>">
		<table class="table">
			<colgroup>
				<col style="width:20%">
				<col style="width:80%">
			</colgroup>
			<tr>
				<th>클래스 구분</th>
				<td>
					<div class="row">
					<%
					if(CLASS_DIVISION.equals("정규클래스")) {
						
					%>
						<div class="custom-control custom-radio" style="margin-right: 2%">
							<input type="radio" value="정규클래스" class="custom-control-input" id="customControlValidation2" name="CLASS_DIVISION" checked>
							<label class="custom-control-label"	for="customControlValidation2">정규클래스</label>
						</div>
					<%
					} else { %>
						<div class="custom-control custom-radio" style="margin-right: 2%">
							<input type="radio" value="원데이클래스" class="custom-control-input" id="customControlValidation3" name="CLASS_DIVISION" checked>
							<label class="custom-control-label"	for="customControlValidation3">원데이클래스</label>
						</div>
					<%} %>
					</div>
				</td>
				
			</tr>
			<tr>
				<th>클래스 이름</th>
				<td>
				 	<div class="row">
				 		<div class="input_box" style="width:670px">
				 			<input class="form-control" type="text" name="CLASS_NAME" placeholder="예시) 내 손으로 직접 만드는 의자 클래스" value="<%=CLASS_NAME%>">		
				 		</div>
				 	</div>	
				</td>
			</tr>
			<tr>
				<th>클래스 간단소개</th>
				<td>
				 	<div class="row">
				 		<div class="input_box" style="width:670px">
				 			<input class="form-control" type="text" id="lec_intro" name="CLASS_ABRIEF" placeholder="예시) 누가 앉든 편안한 의자를 만들어보아요~(50자 이내)" value="<%=CLASS_ABRIEF %>" maxlength="50">		
				 		</div>
				 	</div>	
				</td>
			</tr>
			<tr>
				<th>클래스 금액</th>
				<td>
				 	<div class="row">
				 		<div class="input_box" style="margin-right: 10px;">
				 			<input class="form-control" type="text" name="CLASS_AMOUNT" placeholder="1인당 금액을 입력해주세요" value="<%=CLASS_AMOUNT %>" style="text-align: right;">		
				 		</div>
				 		<div class="d-flex align-items-center">
                   				&nbsp;원&nbsp;
                   		</div>
				 	</div>	
				</td>
			</tr>
			<tr>      
                   <th>클래스 날짜구성</th>
                   <td>
                   	
                  		<%
                  		if(CLASS_DIVISION.equals("정규클래스")) {
                  		%>
                  		<!-- 정규클래스 -->
                  		<div id="Regular" style="display: block;">
                  			<div class="row">
	                    	<div style="margin: 0 1% 0 0;">
								<div class="form-group" style="margin-bottom: 0;">
									<div class="input-group date" id="datetimepicker1" data-target-input="nearest">
										<input type="text" class="form-control datetimepicker-input" value="<%=CLASS_DATE_CONFIGURATION_1 %>" data-target="#datetimepicker1" name="CLASS_DATE_CONFIGURATION_1"/>
										<div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
											<div class="input-group-text">
												<i class="fa fa-calendar"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="d-flex align-items-center">
                   				&nbsp;부터&nbsp;
                   			</div>
                   			<div style="margin: 0 1% 0 1%;">
								<div class="form-group" style="margin-bottom: 0;">
									<div class="input-group date" id="datetimepicker2" data-target-input="nearest">
										<input type="text" class="form-control datetimepicker-input" value="<%=CLASS_DATE_CONFIGURATION_2 %>" data-target="#datetimepicker2" name="CLASS_DATE_CONFIGURATION_2"/>
										<div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
											<div class="input-group-text">
												<i class="fa fa-calendar"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="d-flex align-items-center">
                   				&nbsp;까지&nbsp;
                   			</div>
                  			</div>
                 			</div>
                  		<%} else{ %>	
                 			<!-- 원데이 클래스 -->
                 			<div id="Oneday" style="display: block;">
                 				<div class="row">
	                    	<div style="margin: 0 1% 0 0;">
								<div class="form-group" style="margin-bottom: 0;">
									<div class="input-group date" id="datetimepicker3" data-target-input="nearest">
										<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker3" name="CLASS_DATE_CONFIGURATION_1"/>
										<div class="input-group-append" data-target="#datetimepicker3" data-toggle="datetimepicker">
											<div class="input-group-text">
												<i class="fa fa-calendar"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="d-flex align-items-center">
                   				&nbsp;부터&nbsp;
                   			</div>
                   			<div style="margin: 0 1% 0 1%;">
								<div class="form-group" style="margin-bottom: 0;">
									<div class="input-group date" id="datetimepicker4" data-target-input="nearest">
										<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker4" name="CLASS_DATE_CONFIGURATION_2"/>
										<div class="input-group-append" data-target="#datetimepicker4" data-toggle="datetimepicker">
											<div class="input-group-text">
												<i class="fa fa-calendar"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="d-flex align-items-center">
                   				&nbsp;까지&nbsp; 입니다
                   			</div>
                  			</div>
                 			</div>
                 			<%} %>
                   </td>
               </tr>
               <tr>
               	<th>지역정보</th>
				<td>
					<div class="row">
						<div>
							<select name="CLASS_AREA" id="CLASS_AREA" class="form-control">
								<option value="지역">지역</option>
								<option value="종로구">종로구</option>
								<option value="중구">중구</option>
								<option value="용산구">용산구</option>
								<option value="성동구">성동구</option>
								<option value="광진구">광진구</option>
								<option value="동대문구">동대문구</option>
								<option value="중랑구">중랑구</option>
								<option value="성북구">성북구</option>
								<option value="강북구">강북구</option>
								<option value="도봉구">도봉구</option>
								<option value="노원구">노원구</option>
								<option value="은평구">은평구</option>
								<option value="서대문구">서대문구</option>
								<option value="마포구">마포구</option>
								<option value="양천구">양천구</option>
								<option value="강서구">강서구</option>
								<option value="구로구">구로구</option>
								<option value="금천구">금천구</option>
								<option value="영등포구">영등포구</option>
								<option value="동작구">동작구</option>
								<option value="관악구">관악구</option>
								<option value="서초구">서초구</option>
								<option value="강남구">강남구</option>
								<option value="송파구">송파구</option>
								<option value="강동구">강동구</option>
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
							<select name="CLASS_CATEGORY" id="CLASS_CATEGORY" class="form-control">
								<option value="all">전체</option>
								<option value="table">책상</option>
								<option value="chair">의자</option>
								<option value="bookshelf">책장</option>
								<option value="bed">침대</option>
								<option value="drawer">서랍장</option>
								<option value="sidetable">협탁</option>
								<option value="dressing_table">화장대</option>
								<option value="others">기타</option>
							</select>
						</div>
					</div>
				</td>
			</tr>
			<tr>      
                   <th>공방을 소개해요</th>
                   <td>
					<div class="row">
						<textarea id="summernote1" name="CLASS_INTRODUCTION_1"><%=CLASS_INTRODUCTION_1 %></textarea>
					</div>
                   </td>
               </tr>
               <tr>      
                   <th>이렇게 진행해요</th>
                   <td>
					<div class="row">
						<textarea id="summernote2" name="CLASS_INTRODUCTION_2"><%=CLASS_INTRODUCTION_2 %></textarea>
					</div>
                   </td>
               </tr>
               <tr>      
                   <th>함께하고 싶어요</th>
                   <td>
					<div class="row">
						<textarea id="summernote3" name="CLASS_INTRODUCTION_3"><%=CLASS_INTRODUCTION_3 %></textarea>
					</div>
                   </td>
               </tr>
               <tr>      
               	<th>환불규정</th>
               	<td style="min-height:330px">
               		<div class="row" style="width:690px; font-size:12pt;line-height:16pt;">
               			<p>NAGAGU의 결제 취소 및 환불 규정은 관련 법령인 &lt;학원의 설립ㆍ운영 및 과외교습에 관한 법률 시행령 [별표4] [시행 2017.3.21.]&gt;의 &lt;교습비 등 반환기준(제18조 제3항 관련)&gt;을 준수합니다.</p>
               			<p>
               				<br>
               			</p>
               			<p><strong>1. 클래스 수업 기간이 1개월 이내인 경우 환불 기준</strong>&nbsp;</p>
               			<p>① 클래스 시작 전 - 이미 납부한 교습비 등의 전액&nbsp;</p>
               			<p>② 총 클래스 수업시간의 1/3 경과 전 - 이미 납부한 교습비 등의 2/3에 해당하는 금액&nbsp;</p>
               			<p>③ 총 클래스 수업시간의 1/2 경과 전 - 이미 납부한 교습비 등의 1/2에 해당하는 금액&nbsp;</p>
               			<p>④ 총 클래스 수업시간의 1/2 경과 후 - 반환하지 않음&nbsp;</p>
               			<p>
               				<br>
               			</p>
               			<p><strong>2. 클래스 수업 기간이 1개월을 초과하는 경우</strong>&nbsp;</p>
               			<p>① 클래스 수업 시작 전 - 이미 납부한 교습비 등의 전액&nbsp;</p>
               			<p>② 클래스 수업 시작 후 - 환불사유가 발생한 해당 월의 환불 대상 교습비 등 (클래스 수업 기간이</p>
               			<p>1개월 이내인 경우의 기준에 따라 산출한 금액을 말한다)과 나머지 월의 교습비 등의 전액을 합산한 금액&nbsp;</p>
               			<p>
               				<br>
               			</p>
               			<p>단 클래스의 특성상 사전 준비(수업재료 준비, 장소 및 식사 사전예약 등)과정에서 불가피하게 손해비용 및 위약금 발생이 예상되는 경우, 마스터는 법령에서 제시한 내용 외에 별도의 환불규정을 수강생에게 고지할 수 있고, 수강생은 마스터가 고지한 환불수수료를 제외한 금액을 환불받을 수 있습니다.</p>
               		</div>
               	</td>
               </tr>
               <tr>
				<th>기타사항</th>
				<td>
					<div class="row">
				 		<div class="input_box" style="width:670px">
				 			<input class="form-control" type="text" id="lec_title" placeholder="기타사항을 입력해주세요" name="CLASS_ETC" value="<%=CLASS_ETC %>">
				 		</div>
				 	</div>	
				</td>
               </tr>
               <tr>
               	<th>상단배너 등록</th>
               	<td>
               		<div class="row" style="width:670px">
						<div class="custom-file">
							<input type="file" name="CLASS_BANNER" id="uploadFile" value="<%=CLASS_BANNER %>" multiple> 
						</div>
					</div>
					<div>
						<div class="preview"></div>
                    	<p class="noti">* 새로운 이미지를 등록하세요.</p>
                    </div>
				</td>
			</tr>
			<tr>
				<th>대표이미지 등록</th>
				<td>
					<div class="row">
						<div class="custom-file">
							<input type="file" name="CLASS_IMAGE" id="uploadFile" value="">
						</div>
					</div>
					<div>
						<p class="noti">* 새로운 이미지를 등록하세요.</p>
					</div>
				</td>
			</tr>
			<tr>
				<th>클래스 장소</th>
				<td>
					<div class="row">
						<div class="d-flex bd-highlight">
							<input id = "address" class = "txtInp form-control flex-fill bd-highlight" type = "text" name = "CLASS_ADDRESS" style = "width: 350px;" readonly value="<%=CLASS_ADDRESS %>"/> &nbsp;
                            <input type = "button" onclick="execDaumPostcode()" value = "주소검색" class="flex-fill bd-highlight">
                            <input id= "detailAddress" class = "txtInp form-control flex-fill bd-highlight" type = "text" name = "CLASS_DETAIL_ADDRESS" placeholder = "상세 주소를 입력해주세요." value="<%=CLASS_DETAIL_ADDRESS %>" style = "width: 250px;"/>
                            <input id="extraAddress" type="hidden" placeholder="참고항목">
                           </div>
                          </div>
                      </td>
			</tr>
		</table>
		<div class="text-center">
			<input class="btn btn-outline-dark btn-lg" type="reset" value="취소하기">&nbsp;&nbsp;&nbsp;
			<input class="btn btn-outline-dark btn-lg" type="submit" value="수정하기">
		</div>
	</form>
</div>	
		
<!-- Tempus Dominus v5.0.1 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- include summernote css/js -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
<!-- 우편번호 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	/* 달력 부분 ========== 현재 적용되지 않음 */
	$(document).ready(function() {
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
	
	$(document).ready(function() {
		$('#datetimepicker3').datetimepicker({ format: 'L'});
		$('#datetimepicker4').datetimepicker({
			format: 'L',
		    useCurrent: false
		});
		$("#datetimepicker3").on("change.datetimepicker", function (e) {
			$('#datetimepicker4').datetimepicker('minDate', e.date);
		});
		$("#datetimepicker4").on("change.datetimepicker", function (e) {
			$('#datetimepicker3').datetimepicker('maxDate', e.date);
		});
    });
	
	$(document).ready(function() {
		var area = "<%=CLASS_AREA%>";
		var category = "<%=CLASS_CATEGORY%>";
		
		if(area=="종로구"){
			$("#CLASS_AREA").val("종로구").attr("selected", "selected");
		} else if(area=="중구"){
			$("#CLASS_AREA").val("중구").attr("selected", "selected");
		} else if(area=="용산구"){
			$("#CLASS_AREA").val("용산구").attr("selected", "selected");
		} else if(area=="성동구"){
			$("#CLASS_AREA").val("성동구").attr("selected", "selected");
		} else if(area=="광진구"){
			$("#CLASS_AREA").val("광진구").attr("selected", "selected");
		} else if(area=="동대문구"){
			$("#CLASS_AREA").val("동대문구").attr("selected", "selected");
		} else if(area=="중랑구"){
			$("#CLASS_AREA").val("중랑구").attr("selected", "selected");
		} else if(area=="성북구"){
			$("#CLASS_AREA").val("성북구").attr("selected", "selected");
		} else if(area=="강북구"){
			$("#CLASS_AREA").val("강북구").attr("selected", "selected");
		} else if(area=="도봉구"){
			$("#CLASS_AREA").val("도봉구").attr("selected", "selected");
		} else if(area=="노원구"){
			$("#CLASS_AREA").val("노원구").attr("selected", "selected");
		} else if(area=="은평구"){
			$("#CLASS_AREA").val("은평구").attr("selected", "selected");
		} else if(area=="서대문구"){
			$("#CLASS_AREA").val("서대문구").attr("selected", "selected");
		} else if(area=="마포구"){
			$("#CLASS_AREA").val("마포구").attr("selected", "selected");
		} else if(area=="양천구"){
			$("#CLASS_AREA").val("양천구").attr("selected", "selected");
		} else if(area=="강서구"){
			$("#CLASS_AREA").val("강서구").attr("selected", "selected");
		} else if(area=="구로구"){
			$("#CLASS_AREA").val("구로구").attr("selected", "selected");
		} else if(area=="금천구"){
			$("#CLASS_AREA").val("금천구").attr("selected", "selected");
		} else if(area=="영등포구"){
			$("#CLASS_AREA").val("영등포구").attr("selected", "selected");
		} else if(area=="동작구"){
			$("#CLASS_AREA").val("동작구").attr("selected", "selected");
		} else if(area=="관악구"){
			$("#CLASS_AREA").val("관악구").attr("selected", "selected");
		} else if(area=="서초구"){
			$("#CLASS_AREA").val("서초구").attr("selected", "selected");
		} else if(area=="강남구"){
			$("#CLASS_AREA").val("강남구").attr("selected", "selected");
		} else if(area=="송파구"){
			$("#CLASS_AREA").val("송파구").attr("selected", "selected");
		} else if(area=="강동구"){
			$("#CLASS_AREA").val("강동구").attr("selected", "selected");
		}
		
		if(category=="table") {
			$("#CLASS_CATEGORY").val("table").attr("selected", "selected");
		} else if(category=="table") {
			$("#CLASS_CATEGORY").val("table").attr("selected", "selected");
		} else if(category=="chair") {
			$("#CLASS_CATEGORY").val("chair").attr("selected", "selected");
		} else if(category=="bookshelf") {
			$("#CLASS_CATEGORY").val("bookshelf").attr("selected", "selected");
		} else if(category=="bed") {
			$("#CLASS_CATEGORY").val("bed").attr("selected", "selected");
		} else if(category=="drawer") {
			$("#CLASS_CATEGORY").val("drawer").attr("selected", "selected");
		} else if(category=="sidetable") {
			$("#CLASS_CATEGORY").val("sidetable").attr("selected", "selected");
		} else if(category=="dressing_table") {
			$("#CLASS_CATEGORY").val("dressing_table").attr("selected", "selected");
		} else if(category=="others") {
			$("#CLASS_CATEGORY").val("others").attr("selected", "selected");
		}
	});
	
	/* 라디오 부분 */
	function regularClass() {
		$('input:radio[id=customControlValidation2]').prop('checked', true);
		$('#Regular').show();
		$('#Default').hide();
	}
	
	function setDisplay(){
		if($('input:radio[id=customControlValidation2]').is(':checked')) {
			$('#Regular').show();
			$('#Default').hide();
		}
		else {
			$('#Regular').hide();
		}

		if($('input:radio[id=customControlValidation3]').is(':checked')) {
			$('#Oneday').show();
			$('#Default').hide();
		}
		else {
			$('#Oneday').hide();
		}
	}
	
	/* 썸머노트 부분 */
	 $(document).ready(function() {
		$('#summernote1').summernote({
			width: 670,
			height: 600,
			lang: 'ko-KR',
			callbacks: {
				  onImageUpload: function(files) {
					  console.log(files);
					  sendFile(files[0]);
				  }
			  }
		});
		
		function sendFile(file) {
			  var form_data = new FormData();
			  form_data.append('file', file);
			  $.ajax({
				 data:form_data,
				 type:"POST",
				 url:'./summernote.ma',
				 cache: false,
				 contentType: false,
				 enctype: 'multitype/form-data',
				 processData: false,
				 success: function(url) {
					 console.log("Success");
					 console.log(url);
					 $('#summernote1').summernote('editor.insertImage', url);
					 
				 },
			 	 error: function() {
					 console.log("Fail");
			 	 }
			  });
		  }
	});

	$(document).ready(function() {
		$('#summernote2').summernote({
			width: 670,
			height: 600,
			lang: 'ko-KR',
			callbacks: {
				  onImageUpload: function(files) {
					  console.log(files);
					  sendFile(files[0]);
				  }
			  }
		});
		
		function sendFile(file) {
			  var form_data = new FormData();
			  form_data.append('file', file);
			  $.ajax({
				 data:form_data,
				 type:"POST",
				 url:'./summernote.ma',
				 cache: false,
				 contentType: false,
				 enctype: 'multitype/form-data',
				 processData: false,
				 success: function(url) {
					 console.log("Success");
					 console.log(url);
					 $('#summernote2').summernote('editor.insertImage', url);
					 
				 },
			 	 error: function() {
					 console.log("Fail");
			 	 }
			  });
		  }
	});

	$(document).ready(function() {
		$('#summernote3').summernote({
			width: 670,
			height: 600,
			lang: 'ko-KR',
			callbacks: {
				  onImageUpload: function(files) {
					  console.log(files);
					  sendFile(files[0]);
				  }
			  }
		});
		
		function sendFile(file) {
			  var form_data = new FormData();
			  form_data.append('file', file);
			  $.ajax({
				 data:form_data,
				 type:"POST",
				 url:'./summernote.ma',
				 cache: false,
				 contentType: false,
				 enctype: 'multitype/form-data',
				 processData: false,
				 success: function(url) {
					 console.log("Success");
					 console.log(url);
					 $('#summernote3').summernote('editor.insertImage', url);
					 
				 },
			 	 error: function() {
					 console.log("Fail");
			 	 }
			  });
		  }
	});
	
	/* 우편번호 api */
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				var themeObj = {
					//bgColor: "", //바탕 배경색
					searchBgColor : "#3498DB", //검색창 배경색
					//contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
					//pageBgColor: "", //페이지 배경색
					//textColor: "", //기본 글자색
					queryTextColor : "#FFFFFF" //검색창 글자색
				//postcodeTextColor: "", //우편번호 글자색
				//emphTextColor: "", //강조 글자색
				//outlineColor: "", //테두리
				};

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
							&& /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName
								: data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("extraAddress").value = extraAddr;

				} else {
					document.getElementById("extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				// document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress")
				.focus();
			}
		}).open();
	}
</script>