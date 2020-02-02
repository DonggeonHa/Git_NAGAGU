<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%
	/*
	//productForm은 공방 회원만 들어올 수 있다(MEMBER_STATUS = 2)
	String MEMBER_NICK = (String)session.getAttribute("MEMBER_NICK");
	int MEMBER_STATUS = 5;
	if (request.getAttribute("MEMBER_STATUS") != null) {
		MEMBER_STATUS = ((Integer)request.getAttribute("MEMBER_STATUS")).intValue();
	} 
	
	if((MEMBER_NICK == null) || (MEMBER_STATUS != 2)) {
	      out.println("<script>");
	      out.println("alert('로그인 해주세요!');");
	      out.println("location.href='./productlist.pro'");
	      out.println("</script>");	
	}
	//여기까지는 확인해봐야함
	*/	

%>       
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
			
			.addoption {
				display:none;
			}
		</style>
	</head>
	<body>
		<div class="container" style="padding: 3% 0;">
			<h3>상품페이지 등록</h3>
			<p>상품을 등록하실 수 있습니다. 해당 항목에 내용을 입력해주세요</p>
			<p>주의: 반드시 저작권 및 상표권에 문제가 없는 이미지를 사용해 주세요.</p>
			<form action="./addproduct.pro" method="post" enctype="multipart/form-data">
				<table class="table">
					<colgroup>
						<col style="width:20%">
						<col style="width:80%">
					</colgroup>
					<tr>
						<th>카테고리</th>
						<td>
							<div class="row">
								<div>
									<select name="PRODUCT_CATEGORY" class="form-control">
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
						<th>상품명</th>
						<td>
						 	<div class="row">
						 		<div class="input_box" style="width:670px">
						 			<input class="form-control" type="text" name="PRODUCT_TITLE" placeholder="" value="">		
						 		</div>
						 	</div>	
						</td>
					</tr>
					<tr>
						<th>상품 간단소개</th>
						<td>
						 	<div class="row">
						 		<div class="input_box" style="width:670px">
						 			<input class="form-control" type="text" id="lec_intro" name="PRODUCT_BRIEF" placeholder="" value="" maxlength="50">		
						 		</div>
						 	</div>	
						</td>
					</tr>
					<tr>
						<th>상품 금액</th>
						<td>
						 	<div class="row">
						 		<div class="input_box" style="margin-right: 10px;">
						 			<input class="form-control" type="text" name="PRODUCT_PRICE" placeholder="" value="" style="text-align: right;">		
						 		</div>
						 		<div class="d-flex align-items-center">
	                    				&nbsp;원&nbsp;
	                    		</div>
						 	</div>	
						</td>
					</tr>
					<tr>
						<th>사이즈
                    		<input class="btn btn-outline-dark btn-sm ml-3" type="reset" value="추가" onclick="addSizeInput();">
                    		<input class="btn btn-outline-dark btn-sm ml-3" type="reset" value="삭제" onclick="deleteSizeInput();">
						</th>
						<td>
						 	<div class="row pb-2" id="sizeparah">
						 		<div class="input_box" style="margin-right: 10px;" >
						 			<input class="form-control" type="text" name="PRODUCT_SIZE" placeholder="예시) 1000*50*70" value="" style="text-align: right;">		
						 		</div>
						 		<div class="d-flex align-items-center" style="margin-right: 10px;">
	                    				&nbsp;cm&nbsp;
	                    		</div>
	                    	</div>							 	
						</td>
					</tr>
	                <tr>
	                	<th>색상
	                		<input class="btn btn-outline-dark btn-sm ml-3" type="reset" value="추가" onclick="addColorInput();">
                    		<input class="btn btn-outline-dark btn-sm ml-3" type="reset" value="삭제" onclick="deleteColorInput();">
	                	</th>
						<td>
							<div class="row pb-2" id="colorparah" >
						 		<div class="input_box" style="margin-right: 10px;">
						 			<input class="form-control" type="text" name="PRODUCT_COLOR" value="" style="text-align: right;">		
						 		</div>
	                    	</div>                   		
						</td>
					</tr>
					<tr>
						<th>옵션</th>
						<td>
							<div class="row">
								<div class="option-control option-radio" style="margin-right: 2%">
									<input type="radio" value="없음" class="option-control-input" id="optionControlValidation2" name="PRODUCT_OPTION" onchange="setDisplay()" required>
									<label class="option-control-label"	for="optionControlValidation2">없음</label>
								</div>
								<div class="option-control option-radio" style="margin-left: 2%">
									<input type="radio" value="추가구매" class="option-control-input" id="optionControlValidation3" name="PRODUCT_OPTION_INVALIDATE" onchange="setDisplay()" required>
									<label class="option-control-label"	for="optionControlValidation3">추가구매</label>
								</div>
							</div>
						</td>
					</tr>
					<tr class="addoption">
						<th>추가구매
							<input class="btn btn-outline-dark btn-sm ml-3" type="reset" value="추가" onclick="addOptionInput();">
                    		<input class="btn btn-outline-dark btn-sm ml-3" type="reset" value="삭제" onclick="deleteOptionInput();">
						</th>
						<td>
							<div class="row mr-1"  id="optionparah" >
								<div>
									<select name="PRODUCT_OPTION" class=" form-control" id="" style="margin-left: 2%">
										<option value="선택" selected>선택</option>
										<option value="원목테이블">원목테이블</option>
										<option value="중구">중구</option>
										<option value="용산구">용산구</option>
										<option value="성동구">성동구</option>
									</select>
								</div>
							</div>
						</td>
					</tr>					
					<tr>      
	                    <th>상품 소개</th>
	                    <td>
							<div class="row">
								<textarea id="summernote1" name="PRODUCT_INFO"></textarea>
							</div>
	                    </td>
	                </tr>
					<tr>
						<th>배송비</th>
						<td>
						 	<div class="row">
						 		<div class="input_box" style="margin-right: 10px;">
						 			<input class="form-control" type="text" name="PRODUCT_SHIP_PRICE" placeholder="" value="" style="text-align: right;">		
						 		</div>
						 		<div class="d-flex align-items-center">
	                    				&nbsp;원&nbsp;
	                    		</div>
						 	</div>	
						</td>
					</tr>
					<tr>
						<th>배송업체</th>
						<td>
						 	<div class="row">
						 		<div class="input_box" style="margin-right: 10px;">
						 			<input class="form-control" type="text" name="PRODUCT_SHIP_COMPANY" placeholder="" value="" style="text-align: right;">		
						 		</div>
						 	</div>	
						</td>
					</tr>
					<tr>
						<th>환불 배송비</th>
						<td>
						 	<div class="row">
						 		<div class="input_box" style="margin-right: 10px;">
						 			<input class="form-control" type="text" name="PRODUCT_SHIP_RETURN_PRICE" placeholder="" value="" style="text-align: right;">		
						 		</div>
						 		<div class="d-flex align-items-center">
	                    				&nbsp;원&nbsp;
	                    		</div>
						 	</div>	
						</td>
					</tr>
					<tr>
						<th>교환 배송비</th>
						<td>
						 	<div class="row">
						 		<div class="input_box" style="margin-right: 10px;">
						 			<input class="form-control" type="text" name="PRODUCT_SHIP_CHANGE_PRICE" placeholder="" value="" style="text-align: right;">		
						 		</div>
						 		<div class="d-flex align-items-center">
	                    				&nbsp;원&nbsp;
	                    		</div>
						 	</div>	
						</td>
					</tr>
					<tr>
						<th>배송 기간</th>
						<td>
						 	<div class="row">
						 		<div class="input_box" style="margin-right: 10px;">
						 			<input class="form-control" type="text" name="PRODUCT_SHIP_DAYS" placeholder="" value="" style="text-align: right;">		
						 		</div>
						 		<div class="d-flex align-items-center">
	                    				&nbsp;일&nbsp;
	                    		</div>
						 	</div>	
						</td>
					</tr>
					<tr>
						<th>교환/반품 배송지</th>
						<td>
						 	<div class="row">
						 		<div class="input_box" style="width:670px">
						 			<input class="form-control" type="text" name="PRODUCT_SHIP_RETURN_PLACE" placeholder="" value="">		
						 		</div>
						 	</div>	
						</td>	
					</tr>	                
	                <tr>      
	                    <th>배송 정보</th>
	                    <td>
							<div class="row">
								<textarea id="summernote2" name="PRODUCT_SHIP_INFO"></textarea>
							</div>
	                    </td>
	                </tr>
	                <tr>      
	                    <th>A/S 규정</th>
	                    <td>
							<div class="row">
								<textarea id="summernote3" name="PRODUCT_AS_INFO"></textarea>
							</div>
	                    </td>
	                </tr>
	                <tr>      
	                	<th>환불규정</th>
	                	<td>
	                		<div class="row">
								<textarea id="summernote4" name="PRODUCT_RETURN_INFO"></textarea>
							</div>
	                	</td>
	                </tr>
	                <tr>
						<th>스토어 소개</th>
						<td>
	                		<div class="row">
								<textarea id="summernote5" name="PRODUCT_STORE_INFO"></textarea>
							</div>
	                	</td>
	                </tr>
	                <tr>
	                	<th>상단배너 등록</th>
	                	<td>
	                		<div class="row" style="width:670px">
								<div class="custom-file">
									<input type="file" name="PRODUCT_BANNER" id="uploadFile" multiple> 
								</div>
							</div>
							<div>
								<div class="preview"></div>
		                    	<p class="noti">* 가로가 긴 이미지 추천, 최대 네 장까지 업로드 가능</p>
		                    </div>
						</td>
					</tr>
					<tr>
						<th>대표이미지 등록</th>
						<td>
							<div class="row">
								<div class="custom-file">
									<input type="file" name="PRODUCT_IMAGE" id="uploadFile"> 
								</div>
							</div>
							<div>
								<p class="noti">* 정사각형 이미지 추천</p>
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
		<!-- include summernote css/js -->
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>

		<script>
			
			/* 라디오 부분 */
			function setDisplay(){
				if($('input:radio[id=optionControlValidation2]').is(':checked')) {
					$('.addoption').hide();
				}
	
				if($('input:radio[id=optionControlValidation3]').is(':checked')) {
					$('.addoption').show();
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

			$(document).ready(function() {
				$('#summernote4').summernote({
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
							 $('#summernote4').summernote('editor.insertImage', url);
							 
						 },
					 	 error: function() {
							 console.log("Fail");
					 	 }
					  });
				  }
			});

			$(document).ready(function() {
				$('#summernote5').summernote({
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
							 $('#summernote5').summernote('editor.insertImage', url);
							 
						 },
					 	 error: function() {
							 console.log("Fail");
					 	 }
					  });
				  }
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
			
			
			/*size, color 추가*/
			//size
			var arrSizeInput = new Array(0);
			var arrSizeInputValue = new Array(0);
			 
			function addSizeInput() {
				alert('a1');
				arrSizeInput.push(arrSizeInput.length);
				alert('a2');
				arrSizeInputValue.push("");
				alert('a3');
				sizedisplay();
			}
			function sizedisplay() {
				alert('a4');
				document.getElementById('sizeparah').innerHTML="";
				alert('a5');
				for (intI=0;intI<arrSizeInput.length;intI++) {
					document.getElementById('sizeparah').innerHTML+=createSizeInput();
				}
				alert('a6');
			}
			
			function createSizeInput() {
				alert('a7');
				var txt = '';
				txt += '<div class="input_box" style="margin-right: 10px;">';
				txt += '<input class="form-control" type="text" name="PRODUCT_SIZE" placeholder="예시) 1000*50*70" value="" style="text-align: right;"></div>';
				txt += '<div class="d-flex align-items-center" style="text-align: right;">&nbsp;cm&nbsp;&nbsp;&nbsp;</div>';
				return txt;
			}	
			function deleteSizeInput() {
				if (arrSizeInput.length > 0) {
					arrSizeInput.pop();
					arrSizeInputValue.pop();
				}
				sizedisplay(); 
			}			
			
			//color
			var arrColorInput = new Array(0);
			var arrColorInputValue = new Array(0);
			 
			function addColorInput() {
				arrColorInput.push(arrColorInput.length);
				arrColorInputValue.push("");
				colordisplay();
			}
			function colordisplay() {
				document.getElementById('colorparah').innerHTML="";
				for (intI=0;intI<arrColorInput.length;intI++) {
					document.getElementById('colorparah').innerHTML+=createColorInput();
				}
			}
			function createColorInput() {
				var txt = '';
				txt += '<div class="input_box" style="margin-right: 10px;">';
				txt += '<input class="form-control" type="text" name="PRODUCT_COLOR" value="" style="text-align: right;"></div>';
				txt += '<div class="d-flex align-items-center" style="text-align: right;"></div>';
				return txt;
			}
			function deleteColorInput() {
				if (arrColorInput.length > 0) {
					arrColorInput.pop();
					arrColorInputValue.pop();
				}
				colordisplay(); 
			}					

			//option
			var arrOptionInput = new Array(0);
			var arrOptionInputValue = new Array(0);
			 
			function addOptionInput() {
				arrOptionInput.push(arrOptionInput.length);
				arrOptionInputValue.push("");
				optiondisplay();
			}
			function optiondisplay() {
				document.getElementById('optionparah').innerHTML="";
				for (intI=0;intI<arrOptionInput.length;intI++) {
					document.getElementById('optionparah').innerHTML+=createOptionInput();
				}
			}
			function createOptionInput() {
				var txt = '';
				txt += '<div><select name="PRODUCT_OPTION" class=" form-control" id="" style="margin-left: 2%">';
				txt += '<option value="선택" selected>선택</option>';
				txt += '<option value="원목테이블">원목테이블</option></select></div>';
				return txt;
			}
			function deleteOptionInput() {
				if (arrOptionInput.length > 0) {
					arrOptionInput.pop();
					arrOptionInputValue.pop();
				}
				optiondisplay(); 
			}		
			
		
		
			
		</script>
	</body>
</html>