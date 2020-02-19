<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.spring.workshopMypage.*" %>
<%@ page import="com.spring.store.*" %>
<%
	ProductVO productVO = (ProductVO)request.getAttribute("productVO");
	//,로 이어진 사이즈, 색상 정보 가져오기
	String[] sizeArr = productVO.getPRODUCT_SIZE().split(",");
	String[] colorArr = productVO.getPRODUCT_COLOR().split(",");
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
	<h3>상품페이지 등록</h3>
	<p>상품을 등록하실 수 있습니다. 해당 항목에 내용을 입력해주세요</p>
	<p>주의: 반드시 저작권 및 상표권에 문제가 없는 이미지를 사용해 주세요.</p>
	<form action="./updateProduct.mywork" method="post" enctype="multipart/form-data">
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
							<select name="PRODUCT_CATEGORY" id="PRODUCT_CATEGORY" class="form-control">
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
				<th>상품명</th>
				<td>
				 	<div class="row">
				 		<div class="input_box" style="width:670px">
				 			<input class="form-control" type="text" name="PRODUCT_TITLE" placeholder="" value="<%=productVO.getPRODUCT_TITLE()%>">		
				 		</div>
				 	</div>	
				</td>
			</tr>
			<tr>
				<th>상품 간단소개</th>
				<td>
				 	<div class="row">
				 		<div class="input_box" style="width:670px">
				 			<input class="form-control" type="text" id="lec_intro" name="PRODUCT_BRIEF" placeholder="" value="<%=productVO.getPRODUCT_BRIEF()%>" maxlength="50" >		
				 		</div>
				 	</div>	
				</td>
			</tr>
			<tr>
				<th>상품 금액</th>
				<td>
				 	<div class="row">
				 		<div class="input_box" style="margin-right: 10px;">
				 			<input class="form-control" type="text" name="PRODUCT_PRICE" placeholder="" value="<%=productVO.getPRODUCT_PRICE()%>" style="text-align: right;">		
				 		</div>
				 		<div class="d-flex align-items-center">
                   				&nbsp;원&nbsp;
                   		</div>
				 	</div>	
				</td>
			</tr>
			<tr>
				<th>재고</th>
				<td>
				 	<div class="row">
				 		<div class="input_box" style="margin-right: 10px;">
				 			<input class="form-control" type="text" name="PRODUCT_STOCK" placeholder="" value="<%=productVO.getPRODUCT_STOCK()%>" style="text-align: right;">		
				 		</div>
				 		<div class="d-flex align-items-center">
                   				&nbsp;개&nbsp;
                   		</div>
				 	</div>	
				</td>
			</tr>
			<tr>
				<th>사이즈
                  		<input class="btn btn-outline-dark btn-sm ml-3" type="button" value="추가" onclick="addSize();">
                  		<input class="btn btn-outline-dark btn-sm ml-3" type="button" value="삭제" onclick="deleteSize();">
				</th>
				<td>
				 	<div class="row pb-2" id="sizeappend">
				 	<%
				 		for(int i=0; i<sizeArr.length; i++) {
				 	%>
				 		<div class="input_box" style="margin-right: 10px;" >
				 			<input class="form-control" type="text" name="PRODUCT_SIZE" placeholder="" value="<%=sizeArr[i] %>" style="text-align: right;">		
				 		</div>
				 		<div class="d-flex align-items-center" style="margin-right: 10px;">
                   				&nbsp;cm&nbsp;
                   		</div>
                   	<%
				 		}
                   	%>	
                   	</div>							 	
				</td>
			</tr>
               <tr>
               	<th>색상
               		<input class="btn btn-outline-dark btn-sm ml-3" type="button" value="추가" onclick="addColor();">
                  		<input class="btn btn-outline-dark btn-sm ml-3" type="button" value="삭제" onclick="deleteColor();">
               	</th>
				<td>
					<div class="row pb-2" id="colorappend" >
					<%
				 		for(int i=0; i<colorArr.length; i++) {
				 	%>
				 		<div class="input_box" style="margin-right: 10px;">
				 			<input class="form-control" type="text" name="PRODUCT_COLOR" value="<%=colorArr[i] %>" style="text-align: right;">		
				 		</div>
				 	<%
				 		}
                   	%>	
                   	</div>                   		
				</td>
			</tr>
			<tr>      
				<th>상품 소개</th>
				<td>
					<div class="row">
						<textarea id="summernote1" name="PRODUCT_INFO"><%=productVO.getPRODUCT_INFO()%></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<th>배송비</th>
				<td>
				 	<div class="row">
				 		<div class="input_box" style="margin-right: 10px;">
				 			<input class="form-control" type="text" name="PRODUCT_SHIP_PRICE" placeholder="" value="<%=productVO.getPRODUCT_SHIP_PRICE()%>" style="text-align: right;">		
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
				 			<input class="form-control" type="text" name="PRODUCT_SHIP_COMPANY" placeholder="" value="<%=productVO.getPRODUCT_SHIP_COMPANY()%>" style="text-align: right;">		
				 		</div>
				 	</div>	
				</td>
			</tr>
			<tr>
				<th>환불 배송비</th>
				<td>
				 	<div class="row">
				 		<div class="input_box" style="margin-right: 10px;">
				 			<input class="form-control" type="text" name="PRODUCT_SHIP_RETURN_PRICE" placeholder="" value="<%=productVO.getPRODUCT_SHIP_RETURN_PRICE()%>" style="text-align: right;">		
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
				 			<input class="form-control" type="text" name="PRODUCT_SHIP_CHANGE_PRICE" placeholder="" value="<%=productVO.getPRODUCT_SHIP_CHANGE_PRICE()%>" style="text-align: right;">		
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
				 			<input class="form-control" type="text" name="PRODUCT_SHIP_DAYS" placeholder="" value="<%=productVO.getPRODUCT_SHIP_DAYS()%>" style="text-align: right;">		
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
				 			<input class="form-control" type="text" name="PRODUCT_SHIP_RETURN_PLACE" placeholder="" value="<%=productVO.getPRODUCT_SHIP_RETURN_PLACE()%>">		
				 		</div>
				 	</div>	
				</td>	
			</tr>	                
               <tr>      
                   <th>배송 정보</th>
                   <td>
					<div class="row">
						<textarea id="summernote2" name="PRODUCT_SHIP_INFO"><%=productVO.getPRODUCT_SHIP_INFO()%></textarea>
					</div>
                   </td>
               </tr>
               <tr>      
                   <th>A/S 규정</th>
                   <td>
					<div class="row">
						<textarea id="summernote3" name="PRODUCT_AS_INFO"><%=productVO.getPRODUCT_AS_INFO()%></textarea>
					</div>
                   </td>
               </tr>
               <tr>      
               	<th>환불규정</th>
               	<td>
               		<div class="row">
						<textarea id="summernote4" name="PRODUCT_RETURN_INFO"><%=productVO.getPRODUCT_RETURN_INFO()%></textarea>
					</div>
               	</td>
               </tr>
               <tr>
				<th>스토어 소개</th>
				<td>
               		<div class="row">
						<textarea id="summernote5" name="PRODUCT_STORE_INFO"><%=productVO.getPRODUCT_STORE_INFO()%></textarea>
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
                    	<p class="noti">* 새로운 이미지를 등록하세요.</p>
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
						<p class="noti">* 새로운 이미지를 등록하세요.</p>
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

	
	$(document).ready(function() {
		var category = "<%=productVO.getPRODUCT_CATEGORY()%>";
		if(category=="table") {
			$("#PRODUCT_CATEGORY").val("table").attr("selected", "selected");
		} else if(category=="chair") {
			$("#PRODUCT_CATEGORY").val("chair").attr("selected", "selected");
		} else if(category=="bookshelf") {
			$("#PRODUCT_CATEGORY").val("bookshelf").attr("selected", "selected");
		} else if(category=="bed") {
			$("#PRODUCT_CATEGORY").val("bed").attr("selected", "selected");
		} else if(category=="drawer") {
			$("#PRODUCT_CATEGORY").val("drawer").attr("selected", "selected");
		} else if(category=="sidetable") {
			$("#PRODUCT_CATEGORY").val("sidetable").attr("selected", "selected");
		} else if(category=="dressing_table") {
			$("#PRODUCT_CATEGORY").val("dressing_table").attr("selected", "selected");
		} else if(category=="others") {
			$("#PRODUCT_CATEGORY").val("others").attr("selected", "selected");
		}
	});
	

	/* 썸머노트 부분 */
	$(document).ready(function() {
		$('#summernote1').summernote({
			width: 670,
			height: 300,
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
			height: 300,
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
			height: 300,
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
			height: 300,
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
			height: 300,
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
	
	
	
	/*size, color, option 추가*/
	function addSize() {
		var txt = '<div class="input_box addsize1" style="margin-right: 10px;" >';
		txt += '<input class="form-control" type="text" name="PRODUCT_SIZE" placeholder="예시) 1000*50*70" value="" style="text-align: right;">';
		txt += '</div><div class="d-flex align-items-center addsize2" style="margin-right: 10px;">&nbsp;cm&nbsp;</div>';
		
		$('#sizeappend').append(txt);
		
	}
	function deleteSize() {
		$('.addsize1:last').attr( 'id', 'lastaddsize1' );
		$('.addsize2:last').attr( 'id', 'lastaddsize2' );
		$('#lastaddsize1').remove();
		$('#lastaddsize2').remove();            
	}
	
	function addColor() {
		var txt = '<div class="input_box addcolor" style="margin-right: 10px;">';
		txt += '<input class="form-control" type="text" name="PRODUCT_COLOR" value="" style="text-align: right;"></div>';
		
		$('#colorappend').append(txt);
	}
	function deleteColor() {
		$('.addcolor:last').attr( 'id', 'lastaddcolor' );
		$('#lastaddcolor').remove();       
	}


	function deleteOption() {
		$('.addoption:last').attr( 'id', 'lastaddoption' );
		$('#lastaddoption').remove();       
	}
	
	
	
	
	
	
</script>