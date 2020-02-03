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