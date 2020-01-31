<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<title>견적문의 폼</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
	<!-- 
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/Store/estimateform.css">
		-->

<!-- GOOGLE FONT -->

	<style>
		@font-face {
			font-family: 'KOMACON';
			src:
				url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')
				format('woff');
			font-weight: normal;
			font-style: normal;
		}
		
		.order-body {
			font-family: '만화진흥원체', 'KOMACON', KOMACON;
		}
		
		.store_estimateform {
			width:100%;
			font-size: 1.1em;
			margin: 0 auto;
		}
		
		input[id="checkbox"] {
			position: relative;
			top: 1.5px;
		}
		
		img {
			max-width: 100%;
		}
		
		.title {
			font-weight:bold;
		}		
		
		.row {
			padding-bottom:3px;
		}
		
		#dropZone {
			width:580px;
			height:400px;
			border:3px solid #808080;
			border-radius:10px;
			margin:0 auto;
		}
		
		#dropZone #fileDragDesc {
			color:#d3d3d3;
			font-weight:700;
			font-size:1.1rem;
			padding-top:180px;
			user-select:none;
			padding:0;
		}
		
		#fileList {
			display:inline-box;
			width:580px;
			height:120px;
			border:2px solid #808080;
			border-radius:4px;
			margin:0 auto;
			overflow-y:hidden;
			overflow-x:auto;
			white-space:nowrap;
		}
		
		.imageThumb {
			margin:3px;
			padding:0;
			width:110px;
			height:110px;
			float:left;
			position:relative;
		}
		
		.imageThumb .thumbItem {
			width:110px;
			height:110px;
			position:relative;
		}
		
		.imageThumb .close {
			float:right;
			top:5px;
			right:5px;
			position:absolute;
			z-index:2;
		}


	</style>
</head>

<body class="order-body">
	<!-- content start -->
	<div class="container">
		<form id="estimate" name="store_estimateform" class="store_estimateform"
			action="./estimate_input.es" method="post"
			enctype="multipart/form-data">
		<input type="hidden" id="ESTIMATE_FILE" NAME="ESTIMATE_FILE">
		<br />
		<br />
		<br />
		<input type="file" id="input_file" multiple="multiple" name="ESTIMATE_FILE" style="display:none">
		<div id="dropZone" class="row justify-content-center pb-3">
			<div id="fileDragDesc">파일을 드래그 해주세요.</div>
		</div>
		<br/><br/>
		<div id="fileList" class="row">
		</div>
			<div class="row">
				<div class="col-md-4  justify-content-end"></div>
				<div class="col-md-8 justify-content-start">
					<div class="selectedimgs" style="width: 70%;">
						<div class="row p-0 m-0">
							<div class="col-3 p-0 m-0">
								<img
									src="${pageContext.request.contextPath}/resources/images/Store/table.jpg"
									width="100" height="100">
							</div>
							<div class="col-3 p-0 m-0">
								<img
									src="${pageContext.request.contextPath}/resources/images/Store/table.jpg"
									width="100" height="100">
							</div>
							<div class="col-3 p-0 m-0">
								<img
									src="${pageContext.request.contextPath}/resources/images/Store/table.jpg"
									width="100" height="100">
							</div>
							<div class="col-3 p-0 m-0">
								<img
									src="${pageContext.request.contextPath}/resources/images/Store/table.jpg"
									width="100" height="100">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row text-center pt-1 pb-1 ">
				<div class="col-md-4 d-flex justify-content-end title">제품 종류</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="text" name="ESTIMATE_CATEGORY" size="65"
						placeholder="ex)침대, 서랍장, 의자.. ">
				</div>
			</div>
			<div class="row text-center">
				<div class="col-md-4 d-flex justify-content-end title">소재1</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="text" name="ESTIMATE_SOURCE1" size="65"
						placeholder="ex)편백나무 원목(상판)">
				</div>
			</div>
			<div class="row text-center pt-1 pb-1">
				<div class="col-md-4 d-flex justify-content-end title">소재2</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="text" name="ESTIMATE_SOURCE2" size="65"
						placeholder="ex)소나무 원목(하부)">
				</div>
			</div>
			<div class="row text-center">
				<div class="col-md-4 d-flex justify-content-end title">색상(염색)</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="text" name="ESTIMATE_COLOR" size="65"
						placeholder="ex)투명, 블루..">
				</div>
			</div>
			<div class="row text-center pt-1 pb-1">
				<div class="col-md-4 d-flex justify-content-end title">코팅</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="checkbox" id="checkbox" name="ESTIMATE_COAT"
						onclick="oneCheckbox(this)" value="코팅"> 원함 &nbsp;&nbsp; <input
						type="checkbox" id="checkbox" name="ESTIMATE_COAT"
						onclick="oneCheckbox(this)" value="코팅 안함"> 원하지 않음
				</div>
			</div>
			<div class="row text-center">
				<div class="col-md-4 d-flex justify-content-end title">규격</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="text" name="ESTIMATE_SIZE" size="65"
						placeholder="ex)가로100*세로150*높이200 ">
				</div>
			</div>
			<div class="row text-center pt-1 pb-1">
				<div class="col-md-4 d-flex justify-content-end title">기타</div>
				<div class="col-md-8 d-flex justify-content-start">
					<textarea name="ESTIMATE_CONTENT" placeholder="기타 설명" cols="69"
						rows="15"></textarea>
				</div>
			</div>

			<div class="row justify-content-center pt-5 pl-5 ml-5">
				<button type="button" id="btn_estimate" class="btn btn-outline-dark btn-md">신청하기</button>
			</div>
	
			
		</form>
		<br/><br/>
	</div>
	
	
	<script>
	$(document).ready(function() {
        $("#input_file").bind('change', function() {
            selectFile(this.files);
            //this.files[0].size gets the size of your file.
            //alert(this.files[0].size);
        });
    });
    // 파일 리스트
    var fileList = new Array();
    var fileUrlList = new Array();

    $(function() {
        // 파일 드롭 다운
        fileDropDown();
    });

    // 파일 드롭 다운
    function fileDropDown() {
        var dropZone = $("#dropZone");
        //Drag기능 
        dropZone.on('dragenter', function(e) {
        	console.log('dragenter');
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color', '#E3F2FC');
            dropZone.css('cursor', 'url(${pageContext.request.contextPath}/resources/images/Estimate/cursor.cur)');
        });
        dropZone.on('dragleave', function(e) {
        	console.log('dragleave');
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color', '#FFFFFF');
        });
        dropZone.on('dragover', function(e) {
        	console.log('dragover');
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color', '#E3F2FC');
            dropZone.css('cursor', 'url(${pageContext.request.contextPath}/resources/images/Estimate/cursor.cur)');
        });
        dropZone.on('drop', function(e) {
        	console.log('drop');
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color', '#FFFFFF');

            var files = e.originalEvent.dataTransfer.files;
            if (files != null) {
                if (files.length < 1) {
                    /* alert("폴더 업로드 불가"); */
                    console.log("폴더 업로드 불가");
                    return;
                } else {
                	
                	for(var i = 0; i < files.length; i++) {
                        var fileName = files[i].name;
                        var fileNameArr = fileName.split("\.");
                        // 확장자
                        var ext = fileNameArr[fileNameArr.length - 1];
                        var fileSize = files[i].size;
                        
                        if (fileSize <= 0) {
                            console.log("0kb file return");
                            return;
                        }
                		
                		if (!files[0].type.match('image.*')) {
                            alert("등록이 불가능한 파일 입니다.("+fileName+")");
                        } else {
	                		var file = files[i];
	                		var size = fileList.push(file); //업로드 목록에 추가
	                		preview(file, size - 1); //미리보기 만들기
                        }
                	}
                	}
            } else {
                alert("ERROR");
            }
        });
    }
    
    function preview(file, idx) {
    	  var reader = new FileReader();
    	  reader.onload = (function(f, idx) {
    	    return function(e) {
    	      var div = '<div class="imageThumb"><div class="thumbItem"><img src="' + e.target.result + '" title="' + escape(f.name) + '" width="110" height="110"/></div><div class="close" data-idx="' + idx + '">X</div></div>';
    	      $("#fileList").append(div);	
    	    };
    	  })(file, idx);
    	  reader.readAsDataURL(file);
    	}

    // 업로드 파일 목록 생성
    $("#imageThumb").on("click", ".close", function(e) {
		var $target = $(e.target);
		var idx = $target.attr('data-idx');
		fileList[idx].upload = 'disable'; //삭제된 항목은 업로드하지 않기 위해 플래그 생성
		$target.parent().remove(); //프리뷰 삭제
	});
    
    $('#btn_estimate').click(function(e) {
    	var ESTIMATE_FILE = $('#ESTIMATE_FILE');
	
		if (fileList != null) {
			for (var i = 0; i < fileList.length; i++) {
                console.log(fileList[i]);
                var formData = new FormData();
                	
                formData.append('file', fileList[i]);
                	
                $.ajax({
                        url : "/NAGAGU/estimate_file.es",
                        data : formData,
                        type : 'POST',
                        enctype : 'multipart/form-data',
                        processData : false,
                        contentType : false,
                        cache : false,
                        success : function(result) {
                            if (result.length > 0) {
                                alert("성공");
                                if (i==fileList.length) {
                                    fileUrlList += result;
                                }
                                else {
                                    fileUrlList += result + ', ';
                                }
                                
                                
                            } else {
                                alert("실패");
                            }
                        }
               });
           }

           ESTIMATE_FILE.val(fileUrlList);
		}
        else {
            alert("ERROR");
        }
		
		
		
		
		
		
		
		$('#estimate').submit();
    });
/*
    // 파일 등록
    function uploadFile() {
        // 등록할 파일 리스트
        var uploadFileList = Object.keys(fileList);

        // 파일이 있는지 체크
        if (uploadFileList.length == 0) {
            // 파일등록 경고창
            alert("파일이 없습니다.");
            return;
        }

        // 용량을 500MB를 넘을 경우 업로드 불가
        if (totalFileSize > maxUploadSize) {
            // 파일 사이즈 초과 경고창
            alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
            return;
        }

        if (confirm("등록 하시겠습니까?")) {
            // 등록할 파일 리스트를 formData로 데이터 입력
            var form = $('#uploadForm');
            var formData = new FormData(form);
            for (var i = 0; i < uploadFileList.length; i++) {
                formData.append('ESTIMATE_FILE', fileList[uploadFileList[i]]);
            }

            $.ajax({
                url : "업로드 경로",
                data : formData,
                type : 'POST',
                enctype : 'multipart/form-data',
                processData : false,
                contentType : false,
                dataType : 'json',
                cache : false,
                success : function(result) {
                    if (result.data.length > 0) {
                        alert("성공");
                        location.reload();
                    } else {
                        alert("실패");
                        location.reload();
                    }
                }
            });
        }
    }
*/
	</script>
	
	<!-- content 끝 -->
	<script src="<c:url value="/resources/js/Store/estimateform.js"/>"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
</html>