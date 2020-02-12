function isBuy(goodsform) {
	if (document.goodsform.size.value == "") {
		alert("사이즈를 선택해주세요.")
		return;
	} else if (document.goodsform.color.value == "") {
		alert("색상을 선택해주세요.")
		return;
	}

	var amount = document.goodsform.amount.value;
	var size = document.goodsform.size.value;
	var type = document.goodsform.color.value;

	var isbuy = confirm("구매하시겠습니까?");
	if (isbuy == true) {
		goodsform.action = "OrderStart.or";
		goodsform.submit();
	} else {
		return;
	}
}

function isBasket(basketform) {
	if (document.goodsform.size.value == "") {
		alert("사이즈를 선택해주세요.")
		return;
	} else if (document.goodsform.color.value == "") {
		alert("색상을 선택해주세요.")
		return;
	}
	var amount = document.goodsform.amount.value;
	var size = document.goodsform.size.value;
	var type = document.goodsform.color.value;

	var isbuy = confirm("장바구니에 저장하시겠습니까?");

	if (isbuy == true) {
		basketform.action = "BasketAdd.ba";
		basketform.submit();
	} else {
		return;
	}
}
function count_change(temp) {
	var test = document.goodsform.amount.value;
	if (temp == 0) {
		test++;
	} else if (temp == 1) {
		if (test > 1)
			test--;
	}
	document.goodsform.amount.value = test;
}
//-----------------------------------review insert
//다중이미지 업로드
$('#input_imgs').on("change", handleImgFileSelect);
/*다중 이미지 업로드*/
//이미지 정보들을 담을 배열
var sel_files= [];   

function handleImgFileSelect(e) {
	alert('a');
	//이미지 정보들을 초기화
	sel_files = [];
	$('.imgs_wrap').empty();
	
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	var index = 0;
	filesArr.forEach(function(f) {
		if(!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		
		sel_files.push(f);
		
		var reader = new FileReader();
		reader.onload = function(e) {
			var html="<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove' width='100' height='100'></a>";
			$(".imgs_wrap").append(html);
			index++;
		}
		reader.readAsDataURL(f);
		});
}      

//파일 선택 후 클릭해서 삭제 가능
/*특정 이미지 삭제*/
function deleteImageAction(index) {
   var delete_confirm = confirm("삭제하시겠습니까?");
   if(delete_confirm) {
      console.log("index : " + index);
      sel_files.splice(index, 1);
      
      var img_id = "#img_id_" + index;
      console.log("img_id : " + img_id);
      $(img_id).remove();
      
      console.log("sel_files : " + sel_files);            
   } 
}