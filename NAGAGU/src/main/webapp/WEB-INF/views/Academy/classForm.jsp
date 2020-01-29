<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
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
	</head>
	<body>
		<div class="container" style="padding: 3% 0;">
			<h3>클래스등록</h3>
			<p>클래스를 등록하실 수 있습니다. 해당 항목에 내용을 입력해주세요</p>
			<p>주의: 반드시 저작권 및 상표권에 문제가 없는 이미지를 사용해 주세요.</p>
			<form action="./addclass.ac" method="post" enctype="multipart/form-data">
				<table class="table">
					<colgroup>
						<col style="width:20%">
						<col style="width:80%">
					</colgroup>
					<tr>
						<th>클래스 구분</th>
						<td>
							<div class="row">
								<div class="custom-control custom-radio" style="margin-right: 2%">
									<input type="radio" value="정규클래스" class="custom-control-input" id="customControlValidation2" name="CLASS_DIVISION" onchange="setDisplay()" required>
									<label class="custom-control-label"	for="customControlValidation2">정규클래스</label>
								</div>
								<div class="custom-control custom-radio" style="margin-left: 2%">
									<input type="radio" value="원데이클래스" class="custom-control-input" id="customControlValidation3" name="CLASS_DIVISION" onchange="setDisplay()" required>
									<label class="custom-control-label"	for="customControlValidation3">원데이클래스</label>
								</div>
							</div>
						</td>
						
					</tr>
					<tr>
						<th>클래스 이름</th>
						<td>
						 	<div class="row">
						 		<div class="input_box" style="width:670px">
						 			<input class="form-control" type="text" name="CLASS_NAME" placeholder="예시) 내 손으로 직접 만드는 의자 클래스" value="">		
						 		</div>
						 	</div>	
						</td>
					</tr>
					<tr>
						<th>클래스 간단소개</th>
						<td>
						 	<div class="row">
						 		<div class="input_box" style="width:670px">
						 			<input class="form-control" type="text" id="lec_intro" name="CLASS_ABRIEF" placeholder="예시) 누가 앉든 편안한 의자를 만들어보아요~(50자 이내)" value="" maxlength="50">		
						 		</div>
						 	</div>	
						</td>
					</tr>
					<tr>
						<th>클래스 금액</th>
						<td>
						 	<div class="row">
						 		<div class="input_box" style="margin-right: 10px;">
						 			<input class="form-control" type="text" name="CLASS_AMOUNT" placeholder="1인당 금액을 입력해주세요" value="" style="text-align: right;">		
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
	                    	<div class="row" id="Default" style="color: #EF900E">
	                    		클래스를 선택해주세요
	                    	</div>
                    		<!-- 정규클래스 -->
                    		<div id="Regular" style="display: none;">
                    			<div class="row">
			                    	<div style="margin: 0 1% 0 0;">
										<div class="form-group" style="margin-bottom: 0;">
											<div class="input-group date" id="datetimepicker1" data-target-input="nearest">
												<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" name="CLASS_DATE_CONFIGURATION_1"/>
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
												<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker2" name="CLASS_DATE_CONFIGURATION_2"/>
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
                    			
                   			<!-- 원데이 클래스 -->
                   			<div id="Oneday" style="display: none;">
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
	                    </td>
	                </tr>
	                <tr>
	                	<th>지역정보</th>
						<td>
							<div class="row">
								<div>
									<select name="CLASS_AREA" class="form-control">
										<option value="지역"selected>지역</option>
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
									<select name="CLASS_CATEGORY" class="form-control">
										<option name="all" selected>전체</option>
										<option name="table">책상</option>
										<option name="chair">의자</option>
										<option name="bookshelf">책장</option>
										<option name="bed">침대</option>
										<option name="drawer">서랍장</option>
										<option name="sidetable">협탁</option>
										<option name="dressing_table">화장대</option>
										<option name="others">기타</option>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr>      
	                    <th>공방을 소개해요</th>
	                    <td>
							<div class="row">
								<div id="summernote1" name="CLASS_INTRODUCTION_1"></div>
							</div>
	                    </td>
	                </tr>
	                <tr>      
	                    <th>이렇게 진행해요</th>
	                    <td>
							<div class="row">
								<div id="summernote2" name="CLASS_INTRODUCTION_2"></div>
							</div>
	                    </td>
	                </tr>
	                <tr>      
	                    <th>함께하고 싶어요</th>
	                    <td>
							<div class="row">
								<div id="summernote3" name="CLASS_INTRODUCTION_3"></div>
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
						 			<input class="form-control" type="text" id="lec_title" placeholder="기타사항을 입력해주세요" name="CLASS_ETC">
						 		</div>
						 	</div>	
						</td>
	                </tr>
	                <tr>
	                	<th>상단배너 등록</th>
	                	<td>
	                		<div class="row" style="width:670px">
								<div class="custom-file">
									<input type="file" name="CLASS_BANNER" id="uploadFile" multiple> 
								</div>
							</div>
							<div>
								<div class="preview"></div>
		                    	<p class="noti">* 가로가 긴 이미지 추천</p>
		                    </div>
						</td>
					</tr>
					<tr>
						<th>대표이미지 등록</th>
						<td>
							<div class="row">
								<div class="custom-file">
									<input type="file" name="CLASS_IMAGE" id="uploadFile"> 
								</div>
							</div>
							<div>
								<p class="noti">* 정사각형 이미지 추천</p>
							</div>
						</td>
					</tr>
					<tr>
						<th>클래스 장소</th>
						<td>
							<div class="row">
								<div class="d-flex bd-highlight">
									<input id = "address" class = "txtInp form-control flex-fill bd-highlight" type = "text" name = "CLASS_ADDRESS" style = "width: 350px;" readonly/> &nbsp;
		                            <input type = "button" onclick="execDaumPostcode()" value = "주소검색" class="flex-fill bd-highlight">
		                            <input id= "detailAddress" class = "txtInp form-control flex-fill bd-highlight" type = "text" name = "CLASS_DETAIL_ADDRESS" placeholder = "상세 주소를 입력해주세요." style = "width: 250px;"/>
		                            <input id="extraAddress" type="hidden" placeholder="참고항목">
	                            </div>
                            </div>
                        </td>
					</tr>
				</table>
				<div class="text-center">
					<input class="btn btn-outline-dark btn-lg" type="reset" value="취소하기">&nbsp;&nbsp;&nbsp;
					<input class="btn btn-outline-dark btn-lg" type="submit" value="등록하기">
				</div>
			</form>
		</div>	
		
		<!-- include libraries(jQuery, bootstrap) -->
		<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		<!-- Tempus Dominus v5.0.1 -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
		<!-- include summernote css/js -->
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
		<!-- 우편번호 API -->
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		<script>
			/* 달력 부분 */
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
		        $('#datetimepicker3').datetimepicker({ format: 'YYYY-MM-DD'});
		        $('#datetimepicker4').datetimepicker({
		        	format: 'YYYY-MM-DD',
		            useCurrent: false
		        });
		        $("#datetimepicker3").on("change.datetimepicker", function (e) {
		            $('#datetimepicker4').datetimepicker('minDate', e.date);
		        });
		        $("#datetimepicker4").on("change.datetimepicker", function (e) {
		            $('#datetimepicker3').datetimepicker('maxDate', e.date);
		        });
		    });
			
			/* 라디오 부분 */
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
					minHeight: null,
					maxHeight: null,
					lang: 'ko-KR',
					onImageUpload: function(files, editor, welEditable) {
						sendFile(files[0], editor, welEditable);
					}
				});
			});

			$(document).ready(function() {
				$('#summernote2').summernote({
					width: 670,
					height: 600,
					minHeight: null,
					maxHeight: null,
					lang: 'ko-KR',
					onImageUpload: function(files, editor, welEditable) {
						sendFile(files[0], editor, welEditable);
					}
				});
			});

			$(document).ready(function() {
				$('#summernote3').summernote({
					width: 670,
					height: 600,
					minHeight: null,
					maxHeight: null,
					lang: 'ko-KR',
					onImageUpload: function(files, editor, welEditable) {
						sendFile(files[0], editor, welEditable);
					}
				});
			});
			
			/* File 부분(미리보기) */
			$(document).ready(function (e){
			    $("input[type='file']").change(function(e){
			
			      //div 내용 비워주기
			      $('#preview').empty();
			
			      var files = e.target.files;
			      var arr =Array.prototype.slice.call(files);
			      
			      //업로드 가능 파일인지 체크
			      for(var i=0;i<files.length;i++){
			        if(!checkExtension(files[i].name,files[i].size)){
			          return false;
			        }
			      }
			      
			      preview(arr);
			      
			      
			    });//file change
			    
			    function checkExtension(fileName,fileSize){
			
			      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			      var maxSize = 20971520;  //20MB
			      
			      if(fileSize >= maxSize){
			        alert('파일 사이즈 초과');
			        $("input[type='file']").val("");  //파일 초기화
			        return false;
			      }
			      
			      if(regex.test(fileName)){
			        alert('업로드 불가능한 파일이 있습니다.');
			        $("input[type='file']").val("");  //파일 초기화
			        return false;
			      }
			      return true;
			    }
			    
			    function preview(arr){
			      arr.forEach(function(f){
			        
			        //파일명이 길면 파일명...으로 처리
			        var fileName = f.name;
			        if(fileName.length > 10){
			          fileName = fileName.substring(0,7)+"...";
			        }
			        
			        //div에 이미지 추가
			        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
			        str += '<span>'+fileName+'</span><br>';
			        
			        //이미지 파일 미리보기
			        if(f.type.match('image.*')){
			          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
			          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
			            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
			            str += '</li></div>';
			            $(str).appendTo('#preview');
			          } 
			          reader.readAsDataURL(f);
			        }else{
			          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
			          $(str).appendTo('#preview');
			        }
			      });//arr.forEach
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
	</body>
</html>