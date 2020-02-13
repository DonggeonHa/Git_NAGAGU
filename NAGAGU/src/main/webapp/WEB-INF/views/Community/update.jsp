<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.member.MemberVO"%>
<%@ page import="com.spring.community.PicsVO"%>
<%
	System.out.println("update start");
	//ArrayList<PicsVO> picsList = (ArrayList<PicsVO>) request.getAttribute("picsList");
	//ArrayList<MemberVO> memberList = (ArrayList<MemberVO>) request.getAttribute("memberList"); 
	
	//사진 디테일 받아오기 위해
	PicsVO picsVO= (PicsVO)request.getAttribute("picsDetail");
	//사진의 멤버 디테일 받아오기 위해
	MemberVO memberVO= (MemberVO)request.getAttribute("memberDetail");
	
	System.out.println(picsVO.getPICS_TAG());
	/*ArrayList<PicsVO> memberPicsList = (ArrayList<PicsVO>) request.getAttribute("memberPicsList");*/

%> 

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <!-- fontawesome kit -->
  <script src="https://kit.fontawesome.com/97dbc99ea1.js" crossorigin="anonymous"></script>
  <script>	  
  </script>
</head>
<style>
  .form-control{
    width:120px;
  }
  .custom-file-label{
    height: 50px;    
  }
  .tags *{
    width: 100px;
  }
  .imgs_wrap{
  margin-top: 10px;
  max-width:300px;}
  #img{
  width:100%;
  }
  .form1,.form2,.form3{
  	display: flex; 
  	flex-wrap: wrap;
  	min-height: 400px;
  }
  .form2{
  	display: none ;
  }
  .form3{ 
  	display: none ; 
  }
  .add-btn-wrap{   
  margin-bottom:15px;
  left: 50%;  
  width: 50%;   
  transform:translateX(-50%);
  }
  .submit-btn-wrap{
  	margin-right:30px !important; 
   }

  
</style>
<script>

</script>

<body>
  <!-- SECTION: content -->
  <!-- content start -->
  <div class="container category_cm">
    <div class="content">
      <div class="row mb-5">
        <h3>사진 수정하기</h3>
      </div>
      <form action="community_updateAction.cm?PICS_NUM=<%=picsVO.getPICS_NUM()%>" method="post" class="form-wrap"
      name="writeForm" enctype="multipart/form-data">
        <div class="d-flex mb-2">
         <input type="hidden" name="PICS_MEMBER" value="<%=memberVO.getMEMBER_NUM()%>">
         <input type="hidden" name="PICS_NICK" value="<%=memberVO.getMEMBER_NICK()%>">       
         <!-- Small button group -->
          <select class="form-control mr-2 col-2 " name="PICS_CATEGORY" value="(this).value" id="category_select" >
			<option value="table">책상</option>
			<option value="chair">의자</option>
			<option value="bookshelf">책장</option>
			<option value="bed">침대</option>
			<option value="drawer">서랍장</option>
			<option value="sidetable">협탁</option>
			<option value="dressing_table">화장대</option>
			<option value="others">기타</option>	     
         </select>
         <select class="form-control mr-2 col-2 " name="PICS_REVIEW" id="review_select" value="(this).value" >
           <option selected>분류</option> 
           <option value="0">일반</option>        
           <option value="1">후기</option>        
         </select> 
         <input type="text" class="form-control col-2" placeholder="공방 검색..." id="keyword" > 
         
       </div>
       <!-- div.row -->
       <div class="d-flex form1">
         <div class="custom-file col-6">
           <div>
	           <input type="file" name="PICS_FILE_1" class="input_imgs custom-file-input" id="input_imgs1"> 
	           <label class="input_imgs custom-file-label" for="customFile">사진올리기</label> 
<%-- 	           <input type="hidden" name="PICS_FILE_1" value="<%=picsVO.getPICS_FILE_1()%>" /> --%>
           </div>          
			<div class="imgs_wrap1">
<%-- 			 	<c:set var="isEmpty" value="<%=picsVO.getPICS_FILE_1()%>" /> --%>
				 <c:choose>
				 <c:when test="${isEmpty== null}">		
				  null		   
				  </c:when>
				  <c:otherwise>
					<a href="javascript:void(0);" onclick="deleteImageAction(1)" id="img_id_1">
<%-- 		            <img src="/communityupload/image/<%=picsVO.getPICS_FILE_1()%>" class='selProductFile' width='70%' height='350px;'></a> --%>
					<img id="img1" src=""/>
 				  </c:otherwise>
				</c:choose>
			</div> 
			   
         </div>
         <div class="img-text col-6">
<%--           	<c:set var="isEmpty" value="<%=picsVO.getPICS_CONTENT_1()%>" /> --%>
         	<c:choose>
		        <c:when test="${isEmpty == null}">
	            <textarea name="PICS_CONTENT_1" value="blank" cols="70" rows="10" placeholder="설명을 입력해주세요"></textarea> 
	            </c:when> 
	            <c:otherwise>
<%-- 	            <textarea name="PICS_CONTENT_1" value="" cols="70" rows="10" placeholder=""><%=picsVO.getPICS_CONTENT_1()%></textarea> --%>
	            </c:otherwise>
	        </c:choose> 
           <input type="hidden" name="PICS_TAG" id="pics_tags"  value=""/>
           
           <div class="d-flex tags">
           		<c:forTokens items="<%=picsVO.getPICS_TAG()%>" delims="," var="item">           		
	             #<input type="text" value="${item}" class="mr-3">
           	 	</c:forTokens>
           </div>             
		   
         </div>
	 
  	   <hr/> 
       </div>
       <br/>       
       <!-- form1 end -->
       
       <!-- div.row -->
       <div class=" form2">
         <div class="custom-file col-6">
           <div>
           		<input type="file" name="PICS_FILE_2" class="input_imgs custom-file-input" id="input_imgs2"> 
	           <label class="input_imgs custom-file-label" for="customFile">사진올리기</label>	
<%-- 	            <input type="hidden" name="PICS_FILE_2" value="<%=picsVO.getPICS_FILE_2()%>" /> --%>
           </div>
          
			<div class="imgs_wrap2">
<%-- 				<c:set var="isEmpty" value="<%=picsVO.getPICS_FILE_2()%>" /> --%>
				 <c:choose>
				  <c:when test="${isEmpty== null}">		
				  null		  
				  </c:when>
				  <c:otherwise>
					<a href="javascript:void(0);" onclick="deleteImageAction(2)" id="img_id_2">
<%-- 		            <img src="/communityupload/image/<%=picsVO.getPICS_FILE_2()%>" class='selProductFile' width='70%' height='350px;'></a> --%>
					<img id="img2" src=""/>
 				  </c:otherwise>
				</c:choose>
			</div>
			   
         </div>
         <div class="img-text col-6">
<%--            	<c:set var="isEmpty" value="<%=picsVO.getPICS_CONTENT_2()%>" /> --%>
         	<c:choose>
		        <c:when test="${isEmpty == null}">
	            <textarea name="PICS_CONTENT_2" value="blank" cols="70" rows="10" placeholder="설명을 입력해주세요"></textarea> 
	            </c:when> 
	            <c:otherwise>
<%-- 	            <textarea name="PICS_CONTENT_2" value="" cols="70" rows="10" placeholder=""><%=picsVO.getPICS_CONTENT_2()%></textarea> --%>
	            </c:otherwise>
	        </c:choose>
         </div>
         
	 
  	   <hr/> 
       </div>
       <br/>
       <!-- form1 end --> 
       
       <!-- div.row -->
       <div class="form3">
         <div class="custom-file col-6">
           <div>
           		<input type="file" name="PICS_FILE_3" class="input_imgs custom-file-input" id="input_imgs3"> 
	           <label class="input_imgs custom-file-label" for="customFile">사진올리기</label>
<%-- 	            <input type="hidden" name="PICS_FILE_3" value="<%=picsVO.getPICS_FILE_3()%>" /> --%>
           </div>
          
			<div class="imgs_wrap3">
<%-- 				<c:set var="imgSrc" value="<%=picsVO.getPICS_FILE_2()%>" /> --%>
				 <c:choose>
				  <c:when test="${empty imgSrc}">				  
				  </c:when>
				  <c:otherwise>
					 <a href="javascript:void(0);" onclick="deleteImageAction(3)" id="img_id_3">
<%-- 		            <img src="/communityupload/image/<%=picsVO.getPICS_FILE_3()%>" class='selProductFile' width='70%' height='350px;'></a> --%>
					<img id="img3" src=""/>
 				  </c:otherwise> 
				</c:choose>
			</div>
			   
         </div>
         <div class="img-text col-6">
<%--          	<c:set var="isEmpty" value="<%=picsVO.getPICS_CONTENT_3()%>" /> --%>
         	<c:choose>
		        <c:when test="${isEmpty == null}">
	            <textarea name="PICS_CONTENT_3" value="blank" cols="70" rows="10" placeholder="설명을 입력해주세요"></textarea> 
	            </c:when> 
	            <c:otherwise>
<%-- 	            <textarea name="PICS_CONTENT_3" value="" cols="70" rows="10" placeholder=""><%=picsVO.getPICS_CONTENT_3()%></textarea> --%>
	            </c:otherwise>
	        </c:choose>
         </div>
         

  	   <hr/>
       </div>       
       <!-- form1 end --> 
               
     <div class="add-btn-wrap col-12 align-items-end"> 
	    <div class="col-12"><button type="button" class="add-btn" onclick="show_form()" style="width:100%;">추가하기</button></div>
	 </div>	

     <div class="row justify-content-end submit-btn-wrap"> 
       <button type="button" class="submit-btn">올리기</button>
     </div> 
       
     </form>
    
   </div>
   <!-- SECTION: content  -->
 </div>  
 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script>
		//유효성 검사
		$('.submit-btn').on('click',function(){			
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
/* 			if($('#input_imgs1').val()==''){
				alert('사진을 넣어주세요');
				$('#input_imgs1').focus();
				e.preventDefault();
			} */
			addboard()
			
		});
		//폼 제출하기
		function addboard(){			
			//go_val수정 예정 ,
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
	//추가하기 누르면 폼 보여주기
	function show_form(){
		if($('.form2').css('display')=='none'){
			$('.form2').css('display','flex');
			return;
		}else if($('.form3').css('display')=='none'){
			$('.form3').css('display','flex');
			return;
		}
		
	}
	//로드할때 사진이 있으면 폼 보여주기
	$(document).ready(function(){
		function check_show_form(){
<%-- 			if(<%=picsVO.getPICS_FILE_2()!=null%>){ --%>
				$('.form2').css('display','flex');
			}
<%-- 			if(<%=picsVO.getPICS_FILE_3()!=null%>){ --%>
				$('.form3').css('display','flex');
			}
			return
		}
		check_show_form() 
	})	
	
		
	
	
	

	

</script>
</body>
</html>