<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.member.MemberVO"%>
<%@ page import="com.spring.community.PicsVO"%>
<%	
	MemberVO memberVO= (MemberVO)request.getAttribute("memberDetail");
		
%> 

<script>
		
	$('#input_imgs').on("change", handleImgFileSelect);
	
	//이미지 정보들을 담을 배열
	var sel_files= [];
	
	function handleImgFileSelect(e) {
		//이미지 정보들을 초기화
		sel_files = [];
		$('.imgs_wrap').empty();
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		var index = 0;
		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_files.push(f);
			var reader = new FileReader();
			reader.onload=function(e){
				$("#img").attr("src",e.target.result);				
			}
			reader.readAsDataURL(f);
/* 			reader.onload = function(e) {
				//	var html = "CONTENT";
				var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
						+ index
						+ ")\" id=\"img_id_"
						+ index
						+ "\"><img src=\"" + e.target.result + "\" data-file='"
						+f.name+"' class='selProductFile' title='Click to remove' width='100' height='100'></a>";
				$(".imgs_wrap").append(html);
				index++;
			} */
			
		});
	}
</script>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <!-- fontawesome kit -->
  <script src="https://kit.fontawesome.com/97dbc99ea1.js" crossorigin="anonymous"></script>
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
</style>
<body>
	<div class="review_file_upload">
		<div class="row pt-2 pb-2">
			<div class="input_wrap">
				<input multiple="multiple" type="file" name="REVIEW_FILE" id="input_imgs">
			</div>
		</div>
		<div>
			<div class="imgs_wrap">
				<img id="img">
			</div>
		</div>
	</div>
	<!-- SECTION: content -->
  <!-- content start -->
  <div class="container">
    <div class="content">
      <div class="row mb-5">
        <h3>사진 올리기</h3>
      </div>
      <form action="community_writeAction.cm" method="post" class="form-wrap"
      name="writeForm" enctype="multipart/form-data">
        <div class="row mb-2">
         <input type="hidden" name="PICS_MEMBER" value="<%=memberVO.getMEMBER_NUM()%>">
         <input type="hidden" name="PICS_NICK" value="<%=memberVO.getMEMBER_NICK()%>">       
         <!-- Small button group -->
          <select class="form-control mr-2 col-2" name="PICS_CATEGORY" value="(this).value" id="category_select">
           <option selected>카테고리</option>   
           <option value="table">책상</option>       
           <option value="chair">의자</option>       
           <option value="bookshelf">책장</option>       
           <option value="bed">침대</option>       
           <option value="drawer">서랍장</option>       
           <option value="sidetable">협탁</option>       
           <option value="dressing_table">화장대</option>       
           <option value="other">기타</option>       
         </select>
         <select class="form-control col-2" name="PICS_REVIEW" id="review_select" value="(this).value">
           <option selected>분류</option> 
           <option value="0">일반</option>        
           <option value="1">후기</option>        
         </select> 
       </div>
       <!-- div.row -->
       <div class="row">
         <div class="custom-file col-6">
           <input type="file" name="PICS_FILE" class="custom-file-input" id="customFile">
           
           <label class="custom-file-label" for="customFile">사진올리기</label>
           <%-- <img src="/communityupload/image/<%=pics_vo.getPICS_FILE()%>" class="img" /> --%>
         </div>
         <div class="img-text col-6">
            <textarea name="PICS_CONTENT" id="" cols="70" rows="10" placeholder="설명을 입력해주세요"></textarea> 
           <input type="hidden" name="PICS_TAG" id="pics_tags"  value=""/>
           <div class="d-flex tags">           		
             #<input type="text" value="" class="mr-3">
             #<input type="text" value="" class="mr-3">
             #<input type="text" value="" class="mr-3">
             #<input type="text" value="" class="mr-3">
           </div>
         </div>
       </div>
       
        <div class="row">
       <button class="add-btn">추가하기</button>
     </div>
     <hr/>
     <div class="row justify-content-end">

       <button onclick="addboard()" class="submit-btn">올리기</button>

     </div>
       
     </form>
    
   </div>
   <!-- SECTION: content  -->
 </div>  
 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script>
		function addboard(){	
			function go_val(){				
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
			go_val();			
			document.writeForm.submit();
		}
		/* $("#category_select option:selected").val(); */

		

		
		
</script>
</body>
</html>