<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="./resources/css/signup.css">
<!-- 우편번호 찾기 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>	
	@font-face {
			font-family: 'BBTreeGR';
			src: 
				url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGR.woff') 
				format('woff');
			font-weight: normal;
			font-style: normal;
	}

	.input_email_local {
		width: 235px;
	}
	
	#email_chk_btn, #nick_chk_btn, .zipcode_button{
		width: 34%;
		margin-left: 5px;
   		border-radius: 4px;
   		height: 42px;
   		background: orange;
	    color: white;
	    border: 0px;
	}
	
	input#WORKSHOP_NAME {
		width: 235px;
	}
	
	#btn_google {
		width: 49px;
	    height: 49px;
	    border-radius: 10px;
	}
	
	#pass1, #pass2{
		font-family: '유토이미지고딕R', 'BBTreeGR', BBTreeGR;
	}
	
	.intro {
	    resize:none;
	}
	
	.workshop_signup_form_submit {
		background:orange;
        color:#ffffff;
        width:100%;
        padding:26px 0;
        font-size:18px;
        text-align: center;
        border:none;
        border-radius:4px;
        font-weight: 700;
        transition:background 0.2s;
        margin-bottom: 50px;
	}
</style>

<div class="cbody">
    <div class="signup_form">
        <h1 class="signup_title text-center" style="margin-bottom:2.5rem;">공방회원 신청</h1>
        <form name="workshop_signup_form" action="workshopMemberInsert.ws" method="post">
            <div class="signup_form_email">
                <div class="signup_form_label">이메일</div>
                <div class="signup_form_input">
                    <div class="input_email form_group">
                        <div class="input_email_local">
                            <input type="email" class="form_input" id="WORKSHOP_EMAIL" name="WORKSHOP_EMAIL" placeholder="이메일" size="1" required>
                        </div>
                        <div class="email_chk_btn ml-3">
                        	<button type="button" id="email_chk_btn" onclick="email_chk()" value="N" >중복체크</button>
                        </div>
                    </div>
                </div>
                <div class="error_next_box" id="emailMsg" style="display: hidden;" aria-live="assertive"></div>
            </div>
            <div class="signup_form_pass1 form_group">
                <div class="signup_form_label">비밀번호</div>
                <div class="signup_form_input">
                    <input type="password" id="pass1" name="WORKSHOP_PASS" class="form_input" placeholder="영문,숫자,특수문자를 사용하세요(8~15자리 이내)" required>
                </div>
                <div class="error_next_box" id="pass1Msg" style="display: hidden;" aria-live="assertive"></div>
            </div>
            <div class="signup_form_pass2 form_group">
                <div class="signup_form_label">비밀번호 확인</div>
                <div class="signup_form_input">
                    <input type="password" id="pass2" name="WORKSHOP_PASS_CHECK" class="form_input" required>
                </div>
                <div class="error_next_box" id="pass2Msg" style="display: hidden;" aria-live="assertive"></div>
            </div>
            <div class="signup_form_nickname form_group mt-4">
                <div class="signup_form_label">공방 이름</div>
                <div class="signup_form_input">
                    <input type="text" id="WORKSHOP_NAME" name="WORKSHOP_NAME" class="form_input" placeholder = "2~15자리 이내(특수문자 불가)">
                    <button type="button" id="nick_chk_btn" onclick="name_chk()" value="N">중복체크</button>
                </div>
                <div class="error_next_box" id="nameMsg" style="display: hidden;" aria-live="assertive"></div>
            </div>
           
            <div class="signup_form_name form_group">
            	<div class="signup_form_label">대표자 명</div>
                <div class="signup_form_input">
                    <input type="text" id="WORKSHOP_CEO_NAME" name="WORKSHOP_CEO_NAME" class="form_input" required>
                </div>
                <div class="error_next_box" id="ceoNameMsg" style="display: hidden;" aria-live="assertive"></div>
            </div>
            <div class="signup_form_name form_group">
            	<div class="signup_form_label">연락처</div>
                <div class="signup_form_input">
                    <input type="text" id="WORKSHOP_PHONE" name="WORKSHOP_PHONE" class="form_input" placeholder="하이픈(-) 제외, 숫자만">
                </div>
                <div class="error_next_box" id="phoneMsg" style="display: hidden;" aria-live="assertive"></div>
            </div>
            <div class="signup_form_name form_group">
            	<div class="signup_form_label">사업자 번호</div>
                <div class="signup_form_input">
                    <input type="text" id="WORKSHOP_LICENSE" name="WORKSHOP_LICENSE" class="form_input" required>
                </div>
                <div class="error_next_box" id="licenseMsg" style="display: hidden;" aria-live="assertive"></div>
            </div>
            <div class="signup_form_name form_group">
            	<div class="signup_form_label">공방 소개</div>
                <div style=" margin: 10px 0 0; display: flex; flex: 1 0 auto;">
                	 <textarea class="form_input intro" id="WORKSHOP_INTRO" name="WORKSHOP_INTRO" style="height: 300px;"></textarea>
                </div>
                <div class="error_next_box" id="introMsg" style="display: hidden;" aria-live="assertive"></div>
            </div> 
            <div class="signup_form_nickname form_group mt-4">
                <div class="signup_form_label">우편번호</div>
                <div class="signup_form_input">
		<input type="text"  id="WORKSHOP_ZIP" name="WORKSHOP_ZIP" readonly="readonly" value="" class="form_input">
		<button type="button" id="zipcode_btn" onclick="openZipSearch()" class="zipcode_button">주소찾기</button>
                </div>
                <div class="error_next_box" id="zipcodeMsg" style="display: hidden;" aria-live="assertive"></div>
            </div>
            <div class="signup_form_name form_group">
            	<div class="signup_form_label">주소</div>
                <div class="signup_form_input">
                    <input type="text" id="WORKSHOP_ADDRESS1" name="WORKSHOP_ADDRESS1" value="" placeholder="기본주소" class="form_input" readonly>
                </div>
                <div class="error_next_box" id="addressMsg" style="display: hidden;" aria-live="assertive"></div>
            </div>
            <div class="signup_form_name form_group">
            	<div class="signup_form_label">상세주소</div>
                <div class="signup_form_input">
                    <input type="text" id="WORKSHOP_ADDRESS2" name="WORKSHOP_ADDRESS2" value="" placeholder="상세주소" class="form_input">
                </div>
                <div class="error_next_box" id="addressdetailMsg" style="display: hidden;" aria-live="assertive"></div>
            </div>
            <div class="signup_form_term form_group">   
                <div class="signup_form_label">약관 동의</div>
                <div class="signup_form_term_body">
                    <div class="form_term">
                        <div class="term_all">
                            <div class="form_check checkbox_input">
                                <label class="form_check_label">
                                    <input type="checkbox" class="form_check" id="check_all" name="CHECK_ALL">
                                    <span class="check_img"></span>
                                    <span class="term_all_text">전체동의</span>
                                </label>
                            </div>
                        </div>
                        <div class="term_list">
                            <div class="term_agree_row">
                                <div class="form_check checkbox_input">
                                    <label class="form_check_label">
                                        <input type="checkbox" class="form_check" id="check_service" name="CHECK_SERVICE">
                                        <span class="check_img"></span>
                                        <span class="term_all_text">이용약관</span>
                                    </label>
                                </div>
                            </div>
                            <div class="term_agree_row">
                                <div class="form_check checkbox_input">
                                    <label class="form_check_label">
                                        <input type="checkbox" class="form_check" id="check_privacy" name="CHECK_PRIVACY">
                                        <span class="check_img"></span>
                                        <span class="term_all_text">개인정보취급</span>
                                    </label>
                                </div>
                            </div>
                            <div class="term_agree_row">
                                <div class="form_check checkbox_input">
                                    <label class="form_check_label">
                                        <input type="checkbox" class="form_check" id="check_mailing" name="CHECK_MAILING">
                                        <span class="check_img"></span>
                                        <span class="term_all_text">이벤트, 프로모션 알림 메일 및 SMS 수신 (선택)</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="error_next_box" id="termMsg" style="display: hidden;" aria-live="assertive"></div>
            <button id="btn_submit" class="workshop_signup_form_submit" type="button">회원가입</button>
        </form>
    </div>
</div>
   
<script>
	//이메일 중복체크
	function email_chk(){
		var _str1 = $("#WORKSHOP_EMAIL").val();
		
		if(_str1==""){
			alert("이메일을 입력하세요.");
			
			return false;
		}
	      
	      jQuery.ajax({
	         url : '/NAGAGU/workshopEmailChk.ws',
	         type : "post",
	         dataType : "json",
	         data : {
	        	 WORKSHOP_EMAIL : $("#WORKSHOP_EMAIL").val()
	         },
	         contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	
	         success : function(retVal) {
	            if (retVal.res == "OK") {
	            	$("#email_chk_btn").attr("value", "Y");
	               alert("사용가능한 이메일입니다.");
	            } else { // 실패했다면
	               alert("중복된 이메일입니다.");
	            }
	         },
	         error : function() {
	            alert("ajax통신 실패!!!");
	         }
	
	      });	
	}
	
	function name_chk(){
		var _str2 = $("#WORKSHOP_NAME").val();
	      /* alert(_str2); */
	      
	      jQuery.ajax({
	         url : '/NAGAGU/workshopNicknameChk.ws',
	         type : "post",
	         dataType : "json",
	         data : {
	        	 WORKSHOP_NAME : $("#WORKSHOP_NAME").val()
	         },
	         contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	
	         success : function(retVal) {
	            if (retVal.res == "OK") {
	               $("#nick_chk_btn").attr("value", "Y");
	               alert("사용가능한 별명입니다.");
	            } else { // 실패했다면
	               alert("중복된 별명입니다.");
	            }
	         },
	         error : function() {
	            alert("ajax통신 (별명) 실패!!!");
	         }
	
	      });	
	}
	
	// 우편번호 주소검색
	function openZipSearch() {
	   new daum.Postcode({
	      oncomplete: function(data) {
	         $('[name=WORKSHOP_ZIP]').val(data.zonecode); // 우편번호 (5자리)
	         $('[name=WORKSHOP_ADDRESS1]').val(data.address);   // 기본주소
	         $('[name=WORKSHOP_ADDRESS2]').val(data.buildingName);   // 상세주소
	         $('[name=WORKSHOP_ADDRESS2]').focus();
	         console.log(data);
	      }
	   }).open();
	}

 	// 비밀번호 정규식(특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식)
	var pwJ = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	// 이메일 검사 정규식
	var mailJ = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
	// 휴대폰 번호 정규식
	var phoneJ = /^\d{3}\d{3,4}\d{4}$/;
	// 별명 정규식
	var nickJ = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]{2,15}$/;
	// 숫자 정규식
	var num = /^[0-9]{5}$/;
	
	//submit확인
	var sub_email = false;
	var sub_pw1 = false;
	var sub_pw2 = false;
	var sub_name = false;
	var sub_ceo_name = false;
	var sub_phone = false;
	var sub_license = false;
	var sub_intro = false;
	var sub_add2 = false;
	
	function showErrorMsg(obj, msg) {
        obj.attr("class", "error_next_box");
        obj.html(msg);
        obj.show();
    }
    
    $('#WORKSHOP_EMAIL').blur(function() {
    	var email = $("#WORKSHOP_EMAIL").val();
    	var oMsg = $("#emailMsg");
    	var emailfocus = $("#WORKSHOP_EMAIL");
    	
    	if(email == "") {
    		showErrorMsg(oMsg, "필수 정보입니다.");
    		
    		return false;
            
    	} else if(!mailJ.test(email)) {
			showErrorMsg(oMsg, "이메일 형식을 확인하고 다시 입력해주세요.");
			emailfocus.focus();
			
			return false;
    		
		} else {
			oMsg.hide();
			sub_email = true;
			
            return true;
		}
    });
    
    $('#pass1').blur(function() {
    	var password1 = $('#pass1').val();
    	var oMsg = $('#pass1Msg');
    	var pw1 = $('#pass1');
    	
    	if(password1 == "") {
			showErrorMsg(oMsg, "필수 정보입니다.");
            
    		return false;
    	} else if(!pwJ.test(password1)) {
			showErrorMsg(oMsg, "8자 이상 영문+숫자+하나 이상의 특수문자를 사용하세요.");
			pw1.focus();
			
			return false;
    	} else {
			oMsg.hide();
			sub_pw1 = true;
			
            return true;
    	}
    });
    
    $('#pass2').blur(function() {
        var email = $("#WORKSHOP_EMAIL").val();
        var pass1 = $("#pass1").val();
        var pass2 = $("#pass2").val();
        var oMsg = $("#pass2Msg");
        var oInput = $("#pass2");
        
        if (pass2=="") {
            showErrorMsg(oMsg, "필수 정보입니다.");
            
            return false;
        } else {
        	oMsg.hide();
        }
        
        if (pass1 != pass2) {
            showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.");
            
            return false;
        } else {
            oMsg.hide();
            sub_pw2 = true;
            
            return true;
        }
        
        return true;
    });
    
    $('#pass1').keyup(function (){
    	var pass1 = $("#pass1").val();
        var pass2 = $("#pass2").val();
        var oMsg = $("#pass2Msg");
        
    	if(pass1 != pass2){
    		 showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.");
    		 sub_pw1 = false;
    		 
             return false;
    	}
    });
    
    
    $('#WORKSHOP_NAME').blur(function() {
    	var nick = $("#WORKSHOP_NAME").val();
    	var oMsg = $("#nameMsg");
    	var nickfocus = $("#WORKSHOP_NAME");
    	
    	if(nick == "") {
    		showErrorMsg(oMsg, "필수 정보입니다.");
    		
    		return false;
            
    	} else if(!nickJ.test(nick)) {
			showErrorMsg(oMsg, "한,영,숫자만 가능");
			nickfocus.focus();
			
			return false;
    		
		} else {
			oMsg.hide();
			sub_name = true;
			
            return true;
		}
    });
    
    $('#WORKSHOP_CEO_NAME').blur(function() {
    	var name = $("#WORKSHOP_CEO_NAME").val();
    	var oMsg = $("#ceoNameMsg");
    	var namefocus = $("#WORKSHOP_CEO_NAME");
    	
    	if(name == "") {
    		showErrorMsg(oMsg, "필수 정보입니다.");
    		
    		return false;
            
    	} else if(!nameJ.test(name)) {
			showErrorMsg(oMsg, "올바른 이름을 입력하세요.");
			namefocus.focus();
			
			return false;
    		
		} else {
			oMsg.hide();
			sub_ceo_name = true;
			
            return true;
		}
    });
    
    $('#WORKSHOP_PHONE').blur(function() {
    	var phone = $("#WORKSHOP_PHONE").val();
    	var oMsg = $("#phoneMsg");
    	var phonefocus = $("#WORKSHOP_PHONE");
    	
    	if(phone == "") {
    		showErrorMsg(oMsg, "필수 정보입니다.");
    		
    		return false;
            
    	} else if(!phoneJ.test(phone)) {
			showErrorMsg(oMsg, "올바른 번호를 입력하세요.");
			phonefocus.focus();
			return false;
    		
		} else {
			oMsg.hide();
			sub_phone = true;
			
            return true;
		}
    });
    
    $('#WORKSHOP_LICENSE').blur(function() {
    	var license = $("#WORKSHOP_LICENSE").val();
    	var oMsg = $("#licenseMsg");
    	var licensefocus = $("#WORKSHOP_LICENSE");
    	
    	if(license == "") {
    		showErrorMsg(oMsg, "필수 정보입니다.");
    		
    		return false;
            
    	} else {
    		// license는 숫자만 10자리로 해서 문자열로 넘긴다. 
    	    var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1); 
    	    var tmplicense, i, chkSum=0, c2, remander; 
    	    license = license.replace(/-/gi,''); 

    	    for (i=0; i<=7; i++) chkSum += checkID[i] * license.charAt(i); 
    	    c2 = "0" + (checkID[8] * license.charAt(8)); 
    	    c2 = c2.substring(c2.length - 2, c2.length); 
    	    chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1)); 
    	    remander = (10 - (chkSum % 10)) % 10 ; 

    	    if (Math.floor(license.charAt(9)) == remander) {
    	    	oMsg.hide();
    			sub_license = true;
    	    	
    	    	return true ; // OK! 
    	    }
    	    
			showErrorMsg(oMsg, "올바른 사업자 번호를 입력하세요.");
			licensefocus.focus();
			
    	    return false; 
    		
		}
    });
    
    $('#WORKSHOP_INTRO').blur(function() {
    	var intro = $("#WORKSHOP_INTRO").val();
    	var oMsg = $("#introMsg");
    	
    	if(intro == "") {
    		showErrorMsg(oMsg, "필수 정보입니다.");
    		
    		return false;
            
    	} else {
			oMsg.hide();
			sub_intro = true;
			
            return true;
		}
    });
    
    $('#WORKSHOP_ADDRESS2').blur(function() {
    	var address2 = $("#WORKSHOP_ADDRESS2").val();
    	var oMsg = $("#addressdetailMsg");
    	var address2focus = $("#WORKSHOP_ADDRESS2");
    	
    	if(address2 == "") {
    		showErrorMsg(oMsg, "필수 정보입니다.");
    		address2focus.focus();
    		
    		return false;
            
    	} else {
			oMsg.hide();
			sub_add2 = true;
			
            return true;
		}
    });
    
  //약관 전체 승인
    function setTerms() {
        if ($("#check_all").is(":checked")) {
            $("#check_service").prop("checked",true);
            $("#check_privacy").prop("checked",true);
            $("#check_mailing").prop("checked",true);
        } else {
            $("#check_service").prop("checked",false);
            $("#check_privacy").prop("checked",false);
            $("#check_mailing").prop("checked",false);
        }
    }
    function viewterm_() {
    if( !$("#check_service").is(":checked") || !$("#check_privacy").is(":checked") || !$("#check_mailing").is(":checked")) {
        $("#check_all").prop("checked",false);
    }
    if( $("#check_service").is(":checked") && $("#check_privacy").is(":checked") && $("#check_mailing").is(":checked")) {
        $("#check_all").prop("checked",true);
    }
    return true;
    }
    
	$(document).ready(function(){
	    $("#check_all").prop("checked",false);
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
    
    /*중복확인 버튼, 약관동의*/
    $('#btn_submit').click(function(){
      
     var nicknamecheckBtn = $("#nick_chk_btn").val();
     var emailcheckBtn = $("#email_chk_btn").val();
     var zipcode = $('#WORKSHOP_ZIP').val();
     var address1 = $('#WORKSHOP_ADDRESS1').val();
     var address2 = $('#WORKSHOP_ADDRESS2').val();
     
     if(emailcheckBtn == "N") {
        alert("이메일 중복확인 버튼을 눌러주세요.");
        $(".WORKSHOP_EMAIL").focus();
        
        return false;
     } else if(emailcheckBtn == "Y") {
        if(nicknamecheckBtn == "N"){
           alert("닉네임 중복확인 버튼을 눌러주세요.");
           $(".WORKSHOP_NAME").focus();
           
           return false;
     } else if(emailcheckBtn == "Y") {
	        if(sub_email==false || sub_pw1==false || sub_pw2==false || sub_ceo_name==false || sub_phone==false || sub_license==false || sub_intro==false) {
	        	alert('하나도 빠짐없이 입력해주세요.');
	        } else if(zipcode == "" || address1 == "" || address2 == "") {
	        	alert('주소를 입력하세요.');
	        } else if(($('#check_privacy').prop("checked")&&$('#check_service').prop("checked"))== false) {
	        	alert('약관에 동의해주세요.');
	        } else {
	          	document.workshop_signup_form.submit();
           	}
        }
     }
	});
</script>