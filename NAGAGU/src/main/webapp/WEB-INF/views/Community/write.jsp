<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.member.MemberVO"%>
<%@ page import="com.spring.community.PicsVO"%>
<%
	System.out.println("write start");
	//ArrayList<PicsVO> picsList = (ArrayList<PicsVO>) request.getAttribute("picsList");
	//ArrayList<MemberVO> memberList = (ArrayList<MemberVO>) request.getAttribute("memberList"); 
	//로그인 정보 확인(멤버)
	int LOGIN_MEMBER_NUM = 0;
	String LOGIN_MEMBER_NICK = null;
	//MemberVO loginmemberVO = null;
	if(session.getAttribute("MEMBER_NUM")!=null){
		//loginmemberVO = (MemberVO)request.getAttribute("memberDetailbyEmail");	
		LOGIN_MEMBER_NUM = (int)session.getAttribute("MEMBER_NUM");
		LOGIN_MEMBER_NICK= (String)session.getAttribute("MEMBER_NICK");
		
	}
	System.out.println("LOGIN_MEMBER_NICK="+LOGIN_MEMBER_NICK);
	/* PicsVO picsVO= (PicsVO)request.getAttribute("picsDetail"); */
	MemberVO memberVO= (MemberVO)request.getAttribute("memberDetail");
	/*ArrayList<PicsVO> memberPicsList = (ArrayList<PicsVO>) request.getAttribute("memberPicsList");
	
	System.out.println("memberpicslist" + memberPicsList.get(0).getPICS_ROUTE()); */
	
	
%> 

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
		<style>
		.form-control {
			width: 120px;
		}
		
		.custom-file-label {
			height: 50px;
		}
		
		.tags * {
			width: 100px;
		}
		
		.imgs_wrap {
			margin-top: 10px;
			max-width: 300px;
		}
		
		#img {
			width: 100%;
		}
		
		.form1, .form2, .form3 {
			display: flex;
			flex-wrap: wrap;
			min-height: 400px;
		}
		
		.form2 {
			display: none;
		}
		
		.form3 {
			display: none;
		}
		
		.add-btn-wrap {
			margin-bottom: 15px;
			left: 50%;
			width: 50%;
			transform: translateX(-50%);
		}
		
		.submit-btn-wrap {
			margin-right: 30px !important;
		}
		</style>
	</head>
	
	<body>
		<!-- SECTION: content -->
		<!-- content start -->
		<div class="container category_cm">
			<div class="content">
				<div class="row mb-5">
					<h3>사진 올리기</h3>
				</div>
				
				<form action="./community_writeAction.cm" method="post" class="form-wrap"	name="writeForm" enctype="multipart/form-data">
					<table class="table">
						<colgroup>
							<col style="width:20%">
							<col style="width:80%">
						</colgroup>
						<tr>
							<th>카테고리</th>
							<input type="hidden" value="<%=memberVO.getMEMBER_NICK()%>" name="PICS_NICK">
							<input type="hidden" value="<%=memberVO.getMEMBER_NUM()%>" name="PICS_MEMBER">
							<td>
								<div class="row">
									<div>
										<select name="PICS_CATEGORY" class="form-control">
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
							<th>분류</th>
							<td>
							 	<div class="row">
							 		<div>
										<select name="PICS_REVIEW" class="form-control">
											<option value="">전체보기</option>
											<option value="0">일반</option>
											<option value="1">후기</option>
										</select>
									</div>
							 	</div>	
							</td>
						</tr>
						<tr>      
		                    <th>상품 소개</th>
		                    <td>
								<div class="row">
									<textarea id="summernote1" name="PICS_CONTENT"></textarea>
								</div>
		                    </td>
		                </tr>
		                <tr>
		                	<th>해시태그</th>
		                	<td>
		                		<input type="hidden" name="PICS_TAG" id="pics_tags"  value=""/>
								<div class="d-flex tags">           		
									#<input type="text" value="" class="mr-3">
									#<input type="text" value="" class="mr-3">
									#<input type="text" value="" class="mr-3">
									#<input type="text" value="" class="mr-3">
								</div>
		                	</td>
		                </tr>
		                <tr>
							<th>대표이미지 등록</th>
							<td>
								<div class="row">
									<div class="custom-file">
										<input type="file" name="PICS_MAIN_IMAGE" id="uploadFile"> 
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
						<input class="btn btn-outline-dark btn-lg" type="button" onclick="addboard()" value="등록하기">
					</div>
				</form>
			</div>
		 <!-- SECTION: content  -->
		</div>
		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
		<!-- include summernote css/js -->
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
		<!-- fontawesome kit -->
		<script src="https://kit.fontawesome.com/97dbc99ea1.js" crossorigin="anonymous"></script>
		<script>
			$('.submit-btn').on('click',function(){
				//유효성 검사
				if($('#category_select').val()=='카테고리'){
					alert('카테고리를 선택하세요');
					$('#category_select').focus();
					e.preventDefault();
				}
				if($('#review_select').val()=='분류'){
					alert('분류를 선택하세요');
					$('#review_select').focus();
					e.preventDefault();
				}
				if($('#input_imgs1').val()==''){
					alert('사진을 넣어주세요');
					$('#input_imgs1').focus();
					e.preventDefault();
				}
				addboard()
				
			});
			
			function addboard(){
				alert('hi')
				function addTags(){				
					var	tags_value= '';
					var tags_children = $('div.tags').children();
					for (var i = 0; i < tags_children.length; i++) {
						if (i != tags_children.length - 1) {
							tags_value += tags_children[i].value + ',';
						} else {
							tags_value += tags_children[i].value;
						}
					}
					$('#pics_tags').val(tags_value);
					alert("확인!!!!!!" + $('#pics_tags').val());
				}
				addTags();			
				document.writeForm.submit();
			}
			/* $("#category_select option:selected").val(); */
		
			var sel_files = [];
			$('.input_imgs').on("change", function(e){
				var id= $(this).attr('id');
				alert(id);
				var index = 1;
				if(id=='input_imgs2'){
					alert('2왓다');
					index = 2
				}
				if(id=='input_imgs3'){
					index = 3
				}
				alert(index);
				//이미지 정보들을 담을 배열
				
				$('.imgs_wrap'+index).empty();
				var files = e.target.files;
				var filesArr = Array.prototype.slice.call(files);
				
				filesArr.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					sel_files.push(f);
					var reader = new FileReader();
					reader.onload = function(e) {
						//	var html = "CONTENT";
						var html = "<a href=\"javascript:void(0);\"	onclick=\"deleteImageAction("
								+ index
								+ ")\" id=\"img_id_"
								+ index
								+ "\"><img src=\"" + e.target.result + "\" data-file='"
								+f.name+"' class='selProductFile' title='Click to remove' width='70%' height='350px;'></a>";
						$('.imgs_wrap'+index).append(html);						
						index++;
					} 
					reader.readAsDataURL(f);				
				});			
			});
			function deleteImageAction(index){
				alert("index: "+index);
				sel_files.splice(index,1);
				var img_id="#img_id_"+index;
				$(img_id).remove();
				
			}
			function show_form(){
				if($('.form2').css('display')=='none'){
					$('.form2').css('display','flex');
					return;
				}else if($('.form3').css('display')=='none'){
					$('.form3').css('display','flex');
					return;
				}
				
			}
			
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
		</script>
	</body>
</html>