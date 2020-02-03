<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원가입 폼</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="./resources/css/signup.css">
     <script src="http://code.jquery.com/jquery-3.4.1.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <style>
    	@font-face {
				font-family: 'KOMACON';
				src:
					url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')
					format('woff');
				font-weight: normal;
				font-style: normal;
		}
			
		@font-face {
				font-family: 'BBTreeGR';
				src: 
					url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGR.woff') 
					format('woff');
				font-weight: normal;
				font-style: normal;
		}
			
		.order-body {
			font-family: '만화진흥원체', 'KOMACON', KOMACON;
			font-size: 15px;
		}
		
		.input_email_local {
			width: 235px;
		}
		
		#email_chk_btn, #nick_chk_btn{
			width: 34%;
			margin-left: 5px;
    		border-radius: 4px;
    		height: 42px;
    		background: orange;
		    color: white;
		    border: 0px;
		}
		
		input#member_nick {
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
    </style>
    
    <script type="text/javascript">
    	//이메일 중복체크
    	function email_chk(){
    		var _str1 = $("#member_ema").val();
    	      /* alert(_str1); */
    	      
    	      jQuery.ajax({
    	         url : '/NAGAGU/emailChk.su',
    	         type : "post",
    	         dataType : "json",
    	         data : {
    	        	 MEMBER_EMAIL : $("#member_ema").val()
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
    	
    	function nickname_chk(){
    		var _str2 = $("#member_nick").val();
    	      /* alert(_str2); */
    	      
    	      jQuery.ajax({
    	         url : '/NAGAGU/nicknameChk.su',
    	         type : "post",
    	         dataType : "json",
    	         data : {
    	        	 MEMBER_NICK : $("#member_nick").val()
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
    </script>
</head>

<body class="order-body">
    <div class="cbody">
        <div class="signup_form">
            <h1 class="signup_title">회원가입</h1>
            <div class="singup_sns">
                <p class="signup_sns_title">SNS계정으로 가입</p>
                <ol class="signup_sns_list">
                	<li class="signup_sns_list_item">
                        <img src="${pageContext.request.contextPath}/resources/images/Main/Google_Plus.png" id="btn_google">
                    </li>
                    <li class="signup_sns_list_item">
                        <img src="${pageContext.request.contextPath}/resources/images/Main/signup_kakaoIcon.png">
                    </li>
                    <li class="signup_sns_list_item">
                        <img src="https://testkj.s3.ap-northeast-2.amazonaws.com/images/login_btn_naver.PNG" style="border-radius: 10px;">
                    </li>
                </ol>
            </div>
            <form name="signup_form" action="memberInsert.ma" method="post">
                <div class="signup_form_email">
                    <div class="signup_form_label">이메일</div>
                    <div class="signup_form_input">
                        <div class="input_email form_group">
                            <div class="input_email_local">
                                <input type="email" class="form_input" id="member_ema" name="MEMBER_EMAIL" placeholder="이메일" size="1" required>
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
                        <input type="password" id="pass1" name="MEMBER_PASS" class="form_input" placeholder="8자 이상 영문, 숫자, 특수문자를 사용하세요." required>
                    </div>
                    <div class="error_next_box" id="pass1Msg" style="display: hidden;" aria-live="assertive"></div>
                </div>
                <div class="signup_form_pass2 form_group">
                    <div class="signup_form_label">비밀번호 확인</div>
                    <div class="signup_form_input">
                        <input type="password" id="pass2" name="MEMBER_PASS_CHECK" class="form_input" required>
                    </div>
                    <div class="error_next_box" id="pass2Msg" style="display: hidden;" aria-live="assertive"></div>
                </div>
                <div class="signup_form_name form group">
                	<div class="signup_form_label">이름</div>
                    <div class="signup_form_input">
                        <input type="text" id="member_name" name="MEMBER_NAME" class="form_input" required>
                    </div>
                    <div class="error_next_box" id="nameMsg" style="display: hidden;" aria-live="assertive"></div>
                </div>
                <div class="signup_form_nickname form_group mt-4">
                    <div class="signup_form_label">별명</div>
                    <div class="signup_form_input">
                        <input type="text" id="member_nick" name="MEMBER_NICK" class="form_input" required>
                        <button type="button" id="nick_chk_btn" onclick="nickname_chk()" value="N">중복체크</button>
                    </div>
                    <div class="error_next_box" id="nickMsg" style="display: hidden;" aria-live="assertive"></div>
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
                <button id="btn_submit" class="signup_form_submit" type="button">회원가입</button>
            </form>
        </div>
    </div>



   
    <script>
        var emailFlag = false;
        var passFlag = false;
        var nickFlag = false;
        var submitFlag = false;
        var termFlag = false;
        var nameFlag = false;
        
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
                showErrorMsg(oMsg,"Caps Lock이 켜져 있습니다.");
            } else if ((myKeyCode >= 97 && myKeyCode <= 122) && myShiftKey) {
                showErrorMsg(oMsg,"Caps Lock이 켜져 있습니다.");
            } else {
                oMsg.hide();
            }
        }
        function setFocusToInputObject(obj) {
            if(submitFlag) {
                submitFlag = false;
                obj.focus();
            }
        }
        $("#member_ema").blur(function(){
            emailFlag=false;
            checkEmail1("first");
        });
        $("#member_name").blur(function(){
            nameFlag=false;
            checkName();
        });
        
        $("#pass1").blur(function(){
            passFlag=false;
            checkPass1();
        }).keyup(function(event){
            checkShiftUp(event);
        }).keypress(function(event){
            checkCapslock(event);
        }).keydown(function(event){
            checkShiftDown(event);
        });
        
        $("#pass2").blur(function(){
            passFlag=false;
            checkPass2();
        }).keyup(function(event){
            checkShiftUp(event);
        }).keypress(function(event){
            checkCapslock(event);
        }).keydown(function(event){
            checkShiftDown(event);
        }); 
        
        $("#member_nick").blur(function(){
            nickFlag=false;
            checkNick();
        });
        
        function checkEmail1(event) {
            var member_email = $("#member_ema").val();
            var oMsg = $("#emailMsg");
            var input1 = $("#member_ema");
            if (member_email=="") {
                showErrorMsg(oMsg, "필수 정보입니다.");
                return false;
            } else {
            oMsg.hide();
            return true;
            }
            emailFlag = false;
            return false;
        }
        function checkEmail2(event) {
            var email2 = $("#email2").val();
            var oMsg = $("#emailMsg");
            var input2 = $("#email2");
            
            if (email2=="") {
                showErrorMsg(oMsg, "필수 정보입니다.");
                return false;
            } else {
            oMsg.hide();
            if (member_email!="") {
                emailFlag=true;
                return true;
            }
            return true;
            }
            emailFlag = false;
            return false;
        }
        function checkPass1(event) {
            var email = $("#member_email").val();
            var pass1 = $("#pass1").val();
            var oMsg = $("#pass1Msg");
            var oInput = $("#pass1");
            
            if (pass1=="") {
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
            var email = $("#member_email").val();
            var pass1 = $("#pass1").val();
            var pass2 = $("#pass2").val();
            var oMsg = $("#pass2Msg");
            var oInput = $("#pass2");
            
            if (pass2=="") {
                showErrorMsg(oMsg, "필수 정보입니다.");
                setFocusToInputObject(oInput);
                return false;
            } else {
            oMsg.hide();
            }
            
            if (pass1 != pass2) {
                showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.");
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
        
        function checkName(event) {
        	var name = $("#member_name").val();
        	var oMsg = $("#nameMsg");
        	var oInput = $("#member_name");
        	
        	if(name == "") {
        		showErrorMsg(oMsg, "필수 정보입니다.");
        		return false;
        	} else {
        		oMsg.hide();
        		nameFlag = true;
        	}
        	
        	nameFlag = false;
            return true;
        }
        
        function checkNick(event) {
            var nick = $("#member_nick").val();
            var oMsg = $("#nickMsg");
            var oInput = $("#member_nick");
            var checkLength = /^[가-힣A-Za-z0-9_]{2,12}$/;
            
            if (nick=="") {
                showErrorMsg(oMsg, "필수 정보입니다.");
                return false;
            } else {
                oMsg.hide();
                nickFlag=true;
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
        if ($("#check_service").is(":checked") == false || $("#check_privacy").is(":checked") == false) {
            showErrorMsg(oMsg, "이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.");
            res = false;
        } else {
            oMsg.hide();
        }
        return res;
        }
        function mainSubmit() {
            if(emailFlag && passFlag && nickFlag) {
                $("#join_form").submit();
            } else {
                submitOpen();
                return false;
            }
        }
        /* function submitOpen() {
            $("#btn_submit").attr("disabled",false);
        } */
        /*-- 약관 확인 --*/
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
     if(emailcheckBtn == "N") {
        alert("이메일 중복확인 버튼을 눌러주세요.");
     }else if(nicknamecheckBtn == "Y") {
        if(nicknamecheckBtn == "N"){
           alert("닉네임 중복확인 버튼을 눌러주세요.");
        }else if(emailcheckBtn == "Y"){
           if(($('#check_privacy').prop("checked")&&$('#check_service').prop("checked"))== false) 
           {
            alert('약관에 동의해주세요.');
           } else  {
              document.signup_form.submit();
           }
        }
     }
    });
    </script>
</body>

</html>