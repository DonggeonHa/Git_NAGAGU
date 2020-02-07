<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String ESTIMATE_MEMBER = (String)session.getAttribute("MEMBER_EMAIL");
	String ESTIMATE_NICK = (String)session.getAttribute("MEMBER_NICK");
%>
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
			display:inline-box;
			width:600px;
			height:120px;
			border:2px solid #808080;
			border-radius:4px;
			margin:0 auto;
			overflow-y:hidden;
			overflow-x:auto;
			white-space:nowrap;
		}
		
		#dropZone #fileDragDesc {
			color:#d3d3d3;
			font-weight:700;
			font-size:1.1rem;
			line-height:120px;
			user-select:none;
			margin:0 auto;
			padding:0;
			position:relative;
		}
		
		.imageThumb {
			margin:3px;
			padding:0;
			width:110px;
			height:110px;
			float:left;
			position:relative;
			z-index:1;
			transition:opacity 0.3s;
		}
		
		.imageThumb:hover {
			opacity:0.6;
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
			z-index:3;
		}
		
		.imageThumb .close:hover {
			cursor:pointer;
		}
		
		.imageThumb .thumb_title {
			background: transparent;
			height:110px;
			width:110px;
			position:absolute;
			line-height:110px;
			text-align:center;
			user-select:none;
			color:black;
			z-index:2;
			display:none;'
		}
		
		.coat_radio {
			display:none;
		}
		
		.coat_label {
			border-radius:4px;
			padding:4px;
			margin:8px;
		}
		
		.coat_uncheck {
			color:#d3d3d3;
			transition:border 0.2s, color 0.2s, background 0.2s;
		}
		
		.coat_uncheck:hover {
			border:1px solid #000000;
			color:#000000;
			background:#d3d3d3;
			cursor:pointer;
		}
		
		.coat_checked {
			border:1px solid #000000;
			color:#ffffff;
			background:#d3d3d3;
			transition:border 0.2s, color 0.2s, background 0.2s;
		}
		
		.coat_checked:hover {
			border:1px solid #d3d3d3;
			color:#d3d3d3;
			background:#000000;
			cursor:pointer;
		}


	</style>
</head>

<body class="order-body">
	<!-- content start -->
	<div class="container">
		<form id="estimate" name="store_estimateform" class="store_estimateform"
			action="./estimate_input.es" method="post"
			enctype="multipart/form-data">
		<input type="hidden" name="ESTIMATE_MEMBER" value=<%=ESTIMATE_MEMBER%>>
		<input type="hidden" name="ESTIMATE_NICK" value=<%=ESTIMATE_NICK%>>
		<input type="hidden" id="ESTIMATE_FILE" NAME="ESTIMATE_FILE">
		<br />
		<br />
		<br />
		<input type="file" id="input_file" multiple="multiple" name="ESTIMATE_FILE" style="display:none">
		<br/><br/>
		<div id="dropZone" class="row">
			<div id="fileDragDesc">클릭 또는 파일을 드래그 해주세요.</div>
		</div>
			<div class="row text-center pt-1 pb-1 ">
				<div class="col-md-4 d-flex justify-content-end title">제목</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="text" id="ESTIMATE_TITLE" name="ESTIMATE_TITLE" size="50" maxlength="30"
						placeholder="제목을 입력하세요 ">
				</div>
			</div>
			<div class="row text-center pt-1 pb-1 ">
				<div class="col-md-4 d-flex justify-content-end title">제품 종류</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="text" id="ESTIMATE_CATEGORY" name="ESTIMATE_CATEGORY" size="50" maxlength="15"
						placeholder="ex)침대, 서랍장, 의자.. ">
				</div>
			</div>
			<div class="row text-center">
				<div class="col-md-4 d-flex justify-content-end title">소재</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="text" id="ESTIMATE_SOURCE" name="ESTIMATE_SOURCE" size="50" maxlength="20"
						placeholder="ex)편백나무 원목(상판), 소나무 (하부)">
				</div>
			</div>
			<div class="row text-center">
				<div class="col-md-4 d-flex justify-content-end title">색상(염색)</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="text" id="ESTIMATE_COLOR" name="ESTIMATE_COLOR" size="50" maxlength="20"
						placeholder="ex)투명, 블루..">
				</div>
			</div>
			<div class="row text-center pt-1 pb-1">
				<div class="col-md-4 d-flex justify-content-end title">코팅</div>
				<div class="col-md-8 d-flex justify-content-start">
					<label id="coat_yes" class="coat_label coat_uncheck" for="check_yes"><input type="radio" id="check_yes" class="coat_radio" name="ESTIMATE_COAT" value="코팅"> 원함</label> &nbsp;&nbsp; 
					<label id="coat_no" class="coat_label coat_uncheck" for="check_no"><input type="radio" id="check_no" class="coat_radio" name="ESTIMATE_COAT" value="코팅 안함"> 원하지 않음</label>
				</div>
			</div>
			<div class="row text-center">
				<div class="col-md-4 d-flex justify-content-end title">규격</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="text" id="ESTIMATE_SIZE" name="ESTIMATE_SIZE" size="50" maxlength="50"
						placeholder="ex)가로100*세로150*높이200 ">
				</div>
			</div>
			<div class="row text-center">
				<div class="col-md-4 d-flex justify-content-end title">결제 방법</div>
				<div class="col-md-8 d-flex justify-content-start">
					<input type="checkbox" id="ESTIMATE_PAY" name="ESTIMATE_PAY" value="신용카드">신용카드
				</div>
			</div>
			<div class="row text-center pt-1 pb-1">
				<div class="col-md-4 d-flex justify-content-end title">기타</div>
				<div class="col-md-8 d-flex justify-content-start">
					<textarea name="ESTIMATE_CONTENT" placeholder="기타 설명 (500자 까지)" cols="54" maxlength="500"
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

    // 파일 리스트
    var fileList = new Array();
    var fileUrlList = new Array();
    var uploadCnt = 0;

    $(document).ready(function() {
        $("#input_file").bind('change', function() {
            selectFile(this.files);
            //this.files[0].size gets the size of your file.
            //alert(this.files[0].size);
        });
        
        $(document).on('mouseenter', '.imageThumb', function() {
        	console.log("hey");
       		var test = $(this).find('div.thumb_title').attr('idx');
       		console.log(test);
        	$(this).find('div.thumb_title').show(200);
        });
        
        $(document).on('mouseleave', '.imageThumb', function() {
        	$(this).find('div.thumb_title').hide(200);
        });
    });
    
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
            dropZone.css('cursor', 'url("${pageContext.request.contextPath}/resources/images/Estimate/cursor.cur")');
        });
        dropZone.on('drop', function(e) {
        	console.log('drop');
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color', '#FFFFFF');

            var files = e.originalEvent.dataTransfer.files;
			
            selectFile(files);
        });
    }
    $(document).on('click', '#dropZone', function() {
    	$("#input_file").click();
    });
    
    function selectFile(files) {
    	
    	if (files != null) {
            if (files.length < 1) {
                console.log("폴더 업로드 불가");
                return;
            } else {
            	
            	for(var i = 0; i < files.length; i++) {
                    var fileName = files[i].name;
                    console.log(fileName);
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
                		console.log(size);
                		preview(file, size-1); //미리보기 만들기
                    	
                    	uploadCnt++;
                    }
            	}
            	$("#fileDragDesc").hide();
            }
        } else {
            alert("ERROR");
        }
    }
    
    // 업로드 파일 목록 생성
    function preview(file, idx) {
    	  var reader = new FileReader();
    	  reader.onload = (function(f, idx) {
    	    return function(e) {
    	      var div = '<div class="imageThumb"><div class="thumbItem"><div class="thumb_title" idx="' + idx + '">' + escape(f.name) + '</div><img src="' + e.target.result + '" title="' + escape(f.name) + '" width="110" height="110"/></div><div class="close" data-idx="' + idx + '">X</div></div>';
    	      $("#dropZone").append(div);	
    	    };
    	  })(file, idx);
    	  reader.readAsDataURL(file);
    	}

    $(document).on('click', '.close', function(e) {
		e.stopPropagation();
    	console.log("test");
		var $target = $(e.target);
		var idx = $target.attr('data-idx');
		fileList[idx].upload = 'disable'; //삭제된 항목은 업로드하지 않기 위해 플래그 생성
		$target.parent().remove(); //프리뷰 삭제

    	uploadCnt--;
		if (uploadCnt == 0) {
			$("#fileDragDesc").show();
		}
	});

    /* ---------------------------- 체크박스 스타일 ------------------------------*/
    
    $("#coat_yes").click(function() {
    	$(this).attr('class', 'coat_label coat_checked');
    	$("#coat_no").attr('class', 'coat_label coat_uncheck');
    	$("#check_no").checked = false;
    });
    
    $("#coat_no").click(function() {
    	$(this).attr('class', 'coat_label coat_checked');
    	$("#coat_yes").attr('class', 'coat_label coat_uncheck');
    	$("#check_yes").checked = false;
    });
    
    
    /* --------------------------- submit 실행부  ----------------------------*/
    function checkList() {
    	if ($("#ESTIMATE_TITLE").val() == "") {
    		alert("제목을 입력해주십시오.");
    		$("#ESTIMATE_TITLE").focus();
    		return false;
    	}
    	if ($("#ESTIMATE_CATEGORY").val() == "") {
    		alert("제품 종류를 입력해주십시오.");
    		$("#ESTIMATE_CATEGORY").focus();
    		return false;
    	}
    	if ($("#ESTIMATE_SOURCE").val() == "") {
    		alert("소재를 입력해주십시오.");
    		$("#ESTIMATE_SOURCE").focus();
    		return false;
    	}
    	if ($("#ESTIMATE_COLOR").val() == "") {
    		alert("색상을 입력해주십시오.");
    		$("#ESTIMATE_COLOR").focus();
    		return false;
    	}
    	if ($("input:checkbox[class='coat_radio']:checked").length < 1) {
    		alert("코팅 여부를 선택해 주십시오.");
    		$("#coat_yes").focus();
    		return false;
    	}
    	if ($("#ESTIMATE_SIZE").val() == "") {
    		alert("희망 규격을 입력해주십시오.");
    		$("#ESTIMATE_SIZE").focus();
    		return false;
    	}
    	if ($("#ESTIMATE_PAY").val() == "") {
    		alert("결제 방법을 선택해주십시오.");
    		$("#ESTIMATE_PAY").focus();
    		return false;
    	}
    }
    
    $('#btn_estimate').click(function(e) {
    	
    	if(!checkList()) return false;
	
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
                        async: false,
                        processData : false,
                        contentType : false,
                        cache : false,
                        success : function(result) {
                            if (result.length > 0) {
                                if (i==fileList.length-1) {
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
			$('#ESTIMATE_FILE').val(fileUrlList);
		}
        else {
            alert("ERROR");
        }
		
		$('#estimate').submit();
    });
	</script>
	
	<!-- content 끝 -->
	<script src="<c:url value="/resources/js/Store/estimateform.js"/>"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>