var emailFlag = false;
var passFlag = false;
var nickFlag = false;
var submitFlag = false;
var termFlag = false;

function showErrorMsg(obj, msg) {
	obj.attr("class", "error_next_box");
	obj.html(msg);
	obj.show();
}

var isShift = false;

function checkShiftUp(e) {
	if (e.which && e.which == 16) {
		isShift = false;
	}
}

function checkShiftDown(e) {
	if (e.which && e.which == 16) {
		isShift = true;
	}
}

function checkCapslock(e) {
	var myKeyCode = 0;
	var myShiftKey = false;

	if (window.event) { // IE
		myKeyCode = e.keyCode;
		myShiftKey = e.shiftKey;
	} else if (e.which) { // netscape ff opera
		myKeyCode = e.which;
		myShiftKey = isShift;
	}
	var oMsg = $("#pswd1Msg");

	if ((myKeyCode >= 65 && myKeyCode <= 90) && !myShiftKey) {
		showErrorMsg(oMsg, "Caps Lock이 켜져 있습니다.");
	} else if ((myKeyCode >= 97 && myKeyCode <= 122) && myShiftKey) {
		showErrorMsg(oMsg, "Caps Lock이 켜져 있습니다.");
	} else {
		oMsg.hide();
	}
}

function setFocusToInputObject(obj) {
	if (submitFlag) {
		submitFlag = false;
		obj.focus();
	}
}

$("#selector").change(function() {
	var state = $("#selector option:selected").val();
	$("#email2").val(state);

	if (state == "_manual") {
		$("#selector").hide();
		$("#email2").val("");
		$("#email2").attr("type", "text");
		$("#btn_hide").show();
	}
});

$("#btn_hide").click(function() {
	$("#selector").val("선택해주세요");
	$("#selector").show();
	$("#email2").val("");
	$("#email2").attr("type", "hidden");
	$("#btn_hide").hide();
});

$("#email1").blur(function() {
	emailFlag = false;
	checkEmail1("first");
});

$("#email2").blur(function() {
	emailFlag = false;
	checkEmail2("first");
});

$("#pass1").blur(function() {
	passFlag = false;
	checkPass1();
}).keyup(function(event) {
	checkShiftUp(event);
}).keypress(function(event) {
	checkCapslock(event);
}).keydown(function(event) {
	checkShiftDown(event);
});

$("#pass2").blur(function() {
	passFlag = false;
	checkPass2();
}).keyup(function(event) {
	checkShiftUp(event);
}).keypress(function(event) {
	checkCapslock(event);
}).keydown(function(event) {
	checkShiftDown(event);
});

$("#nickname").blur(function() {
	nickFlag = false;
	checkNick();
});

function checkEmail1(event) {
	var email1 = $("#email1").val();
	var email2 = $("#email2").val();
	var oMsg = $("#emailMsg");
	var input1 = $("#email1");

	if (email1 == "") {
		input1.css("border", "1px solid red;");
		showErrorMsg(oMsg, "필수 정보입니다.");
		return false;
	}

	if (email1 != "" && email2 != "") {
		oMsg.hide();
		emailFlag = true;
		return true;

	}

	emailFlag = false;

	return false;
}

function checkEmail2(event) {
	var email1 = $("#email1").val();
	var email2 = $("#email2").val();
	var oMsg = $("#emailMsg");
	var input2 = $("#email2");

	if (email2 == "") {
		showErrorMsg(oMsg, "필수 정보입니다.");
		return false;
	}

	if (email1 != "" && email2 != "") {
		oMsg.hide();
		emailFlag = true;
		return true;
	}

	emailFlag = false;

	return false;
}

function checkPass1(event) {
	var email = $("#email1").val() + "@" + $("#selector").val();
	var pass1 = $("#pass1").val();
	var oMsg = $("#pass1Msg");
	var oInput = $("#pass1");

	if (pass1 == "") {
		showErrorMsg(oMsg, "필수 정보입니다.");
		setFocusToInputObject(oInput);
		return false;
	} else {
		oMsg.hide();
		return true;
	}

	passFlag = false;

	return true;
}

function checkPass2(event) {
	var email = $("#email1").val() + "@" + $("#selector").val();
	var pass1 = $("#pass1").val();
	var pass2 = $("#pass2").val();
	var oMsg = $("#pass2Msg");
	var oInput = $("#pass2");

	if (pass2 == "") {
		showErrorMsg(oMsg, "필수 정보입니다.");
		setFocusToInputObject(oInput);
		return false;
	} else {
		oMsg.hide();
	}

	if (pass1 != pass2) {
		showErrorMsg(oMsg, "비밀번호가 일치하지 않습니다.");
		setFocusToInputObject(oInput);
		return false;
	} else {
		oMsg.hide();
		passFlag = true;
		return true;
	}
	passFlag = false;

	return true;
}

function checkNick(event) {
	var nick = $("#nickname").val();
	var oMsg = $("#nickMsg");
	var oInput = $("#nickname");
	var checkLength = /^[가-힣A-Za-z0-9_]{2,12}$/;

	if (nick == "") {
		showErrorMsg(oMsg, "필수 정보입니다.");
		return false;
	} else {
		oMsg.hide();
		nickFlag = true;
	}

	if (!checkLength.test(nick)) {
		showErrorMsg(oMsg, "별명은 최소 2자, 최대 12자 까지 입력가능 합니다.[특수문자 불가]");
		setFocusToInputObject(oInput);
		return false;
	} else {
		oMsg.hide();
		return true;
	}

	nickFlag = false;

	return false;
}

function checkterm() {
	var res = true;
	var oMsg = $("#termMsg");

	if ($("#check_service").is(":checked") == false
			|| $("#check_privacy").is(":checked") == false) {
		showErrorMsg(oMsg, "이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.");
		res = false;
	} else {
		oMsg.hide();
	}

	return res;
}

$("#btn_submit").click(function(event) {
	if (emailFlag && passFlag && nickFlag) {
		if (checkterm() == true) {
			alert("완료");
			mainSubmit();
		} else {
			setFocusToInputObject("#check_service");
			return false;
		}
	} else {
		return false;
	}
});

function mainSubmit() {

	if (emailFlag && passFlag && nickFlag) {
		$("#join_form").submit();
	} else {
		submitOpen();
		return false;
	}
}

function submitOpen() {
	$("#btn_submit").attr("disabled", false);
}

/*-- 약관 확인 --*/
//약관 전체 승인
function setTerms() {
	if ($("#check_all").is(":checked")) {
		$("#check_service").prop("checked", true);
		$("#check_privacy").prop("checked", true);
		$("#check_mailing").prop("checked", true);
	} else {
		$("#check_service").prop("checked", false);
		$("#check_privacy").prop("checked", false);
		$("#check_mailing").prop("checked", false);
	}
}
function viewterm_() {

	if (!$("#check_service").is(":checked")
			|| !$("#check_privacy").is(":checked")
			|| !$("#check_mailing").is(":checked")) {
		$("#check_all").prop("checked", false);
	}

	if ($("#check_service").is(":checked")
			&& $("#check_privacy").is(":checked")
			&& $("#check_mailing").is(":checked")) {
		$("#check_all").prop("checked", true);
	}

	return true;
}

$(document).ready(function() {
	$("#selector").val("선택해주세요");
	$("#check_all").prop("checked", false);
	setTerms();

	$("#check_all").click(function() {
		setTerms();
	})

	$("#check_service").click(function() {

		viewterm_();
	})

	$("#check_privacy").click(function() {
		viewterm_();
	})

	$("#check_mailing").click(function() {
		viewterm_();
	})

});