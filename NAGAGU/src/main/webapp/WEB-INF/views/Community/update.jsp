<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.member.MemberVO"%>
<%@ page import="com.spring.community.PicsVO"%>
<%
	System.out.println("update start");
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
	/*ArrayList<PicsVO> memberPicsList = (ArrayList<PicsVO>) request.getAttribute("memberPicsList");
	
	System.out.println("memberpicslist" + memberPicsList.get(0).getPICS_ROUTE()); */
	
	//사진 디테일 받아오기 위해
	PicsVO picsVO= (PicsVO)request.getAttribute("picsDetail");
	//사진의 멤버 디테일 받아오기 위해
	MemberVO memberVO= (MemberVO)request.getAttribute("memberDetail");
	String category = picsVO.getPICS_CATEGORY();
	String review = picsVO.getPICS_REVIEW();
	String tags = picsVO.getPICS_TAG();
	
%> 
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
	.category_cm{
		margin-top: 50px;
		margin-bottom: 50px;
	}
</style>
		
<div class="container category_cm">
	<div class="content">
		<div class="row mb-5">
			<h3>사진 올리기</h3>
		</div>
		
		<form action="./community_updateAction.cm?PICS_NUM=<%=picsVO.getPICS_NUM()%>" method="post" class="form-wrap"	name="writeForm" enctype="multipart/form-data">
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
							<textarea id="summernote1" name="PICS_CONTENT">
							<%=picsVO.getPICS_CONTENT()%>
							</textarea>
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
		
<!-- include summernote css/js -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
		
<script>
	$(document).ready(function() {
		//값 채우기
		$('select[name=PICS_CATEGORY]').val('<%=category%>'); 	
		$('select[name=PICS_REVIEW]').val('<%=review%>')
		$('select[name=PICS_REVIEW]').val('<%=review%>')
		
		var tags = '<%=tags%>';
		var after_tags = tags.split(',');
		$('.tags').children().eq(0).val(after_tags[0]);
		$('.tags').children().eq(1).val(after_tags[1]);
		$('.tags').children().eq(2).val(after_tags[2]);
		$('.tags').children().eq(3).val(after_tags[3]);
	})
	
	
	
		
	function addboard(){
		if($('#uploadFile').val()==''){
			alert('사진을 넣어주세요');
			return
		}
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
		
	/* 썸머노트 부분 */
	 $(document).ready(function() {
		$('#summernote1').summernote({
			width: 670,
			height: 700,
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