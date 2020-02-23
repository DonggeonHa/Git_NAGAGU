<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		margin-top:50px;
		margin-bottom:50px; 
	}
</style>

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
								<select name="PICS_CATEGORY" id="pics_category"class="form-control">
									<option value="0">선택</option>
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
								<select name="PICS_REVIEW" id="pics_review" class="form-control">
									<option value="0">선택</option> 
									<option value="1">후기</option>
									<option value="2">일반</option>
								</select>
							</div>
					 	</div>	
					 	<div class="row search_tab justify-content-start ">
					 		<div class="search_form d-flex mr-5">
						      <input class="form-control " id="search_product" placeholder="검색..." aria-label="Search">
						      <button class="btn btn-outline-success my-2 my-sm-0">상품명</button>
						      <input type="hidden" id="product_num" value="" name="PICS_PRODUCT"></button> 
						    </div>
						    <div class="search_form d-flex">
						      <input class="form-control search_form text-center" id="search_gongbang" placeholder="공방명" aria-label="Search" readonly>
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
			</table>
			<div class="text-center">
				<input class="btn btn-outline-dark btn-lg" type="reset" value="취소하기">&nbsp;&nbsp;&nbsp;
				<input class="btn btn-outline-dark btn-lg submit-btn" type="button" value="등록하기">
			</div>
		</form>
	</div>
 <!-- SECTION: content  -->
</div>

<!-- include summernote css/js -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
	$('.submit-btn').on('click',function(){
		
		
		//유효성 검사
		if($('#pics_category').val()==0){
			alertify.alert('카테고리를 선택하세요')
			$('#pics_category').focus();
			return false;
		}
		if($('#pics_review').val()==0){
			alertify.alert('분류를 선택하세요');
			$('#pics_review').focus();
			return false;
		}
		if($('.note-editable img').length==0){
			alertify.alert('하나 이상의 사진을 넣어주세요');
			return false;
		}
		addboard()
	});
	
	function addboard(){	
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
		}
		addTags();			
		document.writeForm.submit();
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
	//후기 자동완성
	 $(function(){
 		$('#search_product').autocomplete({
			source : function(request,response){
				 $.ajax({
					 url: "/NAGAGU/getMyPaidOrder.my",
					 async: false,
		             type: "POST",
		             contentType:
		 				'application/x-www-form-urlencoded; charset=utf-8',
		             success: function (retVal){
		       			 	if(retVal.res=="OK"){
			       			 console.log(retVal.myPaidOrder)
			       			 response(
                                $.map(retVal.myPaidOrder, function(item){    //json[i] 번째 에 있는게 item 임.
                                    return {
                                        label: item.PRODUCT_TITLE,     //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
                                        number: item.PRODUCT_NUM,   //그냥 사용자 설정값?
                                        gongbang: item.PRODUCT_SHOPNAME   //그냥 사용자 설정값?
                                	}
                                })
                             )
							}else{
								alert("update fail");
							}  
						 },
					 error:function(){
						alert("ajax통신 실패!!");
					 }
				});
			},
			select: function(event, ui) {
	            console.log(ui.item);
	            $('#search_gongbang').val(ui.item.gongbang)
	            $('#product_num').val(ui.item.number)
	        },
	        focus: function(event, ui) {
	            return false;
	        }
		}) 
		//처음에 숨기고
		$('.search_tab').hide().css('margin-top','20px')
		$('.search_product').css('margin-right','20px')
		$('select[name=PICS_REVIEW]').on('change',function(){
			if($(this).val()==1){
				$('.search_tab').show()	
			}
			if($(this).val()!=1){
				$('.search_tab').hide()	
			}
		})
		 
	 });
</script>