<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!-- Bootstrap core JavaScript-->
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/b74b42490f.js" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/74760b5c81.js" crossorigin="anonymous"></script>
	
	<!-- sidebar -->
	<script src="${pageContext.request.contextPath}/resources/js/Admin/sidebar.js"></script>
	
	<!-- WmemberList -->
	<script>
		function updateWMember(WORKSHOP_NUM) {
			location.href="updateWMember.ad?WORKSHOP_NUM=" + WORKSHOP_NUM;
		}
		
		function deleteWMember(WORKSHOP_NUM) {
			location.href="deleteWMember.ad?WORKSHOP_NUM=" + WORKSHOP_NUM;
		}
		
		$(document).ready(function() {
			$("#keyword").keyup(function() {
				var k = $(this).val();
				$("#user-table2 > tbody > tr").hide();
				var temp = $("#user-table2 > tbody > tr > td:nth-child(10n+3):contains('" + k + "')");
				
				$(temp).parent().show();					
			})
		})
	</script>
	
	<!-- MemberList -->
    <script>
		/* 사이드 바 스크립트 */
		$(function(){
            $(".sidebar-nav").mouseenter(function(){ // 마우스 들어갈때
                $(".main").find("li").stop().slideDown(300,function(){ // li가 나타남
                    $(this).mouseover(function(){
                        $(this).css("font-weight","800");
                        
                    });
                });
            });
            $(".sidebar-nav").mouseleave(function(){ // 마우스 나갈때
                $(".main").find("li").stop().slideUp(300,function(){ // li가 사라짐
                    $(this).mouseleave(function(){
                        $(this).css("font-weight","500");
                    });
                });
            });
        });
		
		$(document).ready(function() {
			// 목록
			function selectData() {
				// table 내부 내용 모두 제거(초기화)
				$('#user-table').empty();
				$.ajax({
					url: './Member.ad',
					type: 'POST',
					dataType : "json", //서버에서 보내줄 데이터 타입
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					success:function(data) {
						var title = '';
						title += '<thead class="text-center">';
						title += '<tr>';
						title += '<th scope="col">번호</th>';
						title += '<th scope="col">이메일</th>';
						title += '<th scope="col">이름</th>';
						title += '<th scope="col">닉네임</th>';
						title += '<th scope="col">핸드폰</th>';
						title += '<th scope="col">주소</th>';
						title += '<th scope="col">상세주소</th>';
						title += '<th scope="col">상태</th>';
						title += '<th scope="col">관리</th>';
						title += '</tr>';
						title += '</thead>';
						$('#user-table').append(title);
						$.each(data, function(index, item) {
							var output = '';
							output += '<tbody class="text-center">'
							output += '<tr>';
							output += '<td>' + item.member_NUM + '</td>'; // undefined ㅗ
							output += '<td>' + item.member_EMAIL + '</td>';
							output += '<td>' + item.member_NAME + '</td>';
							output += '<td>' + item.member_NICK + '</td>';
							
							if (item.member_PHONE == null) {
								output += '<td>미입력</td>';
							} else {
								output += '<td>' + item.member_PHONE + '</td>';	
							}
							
							if (item.address_ADDRESS1 == null) {
								output += '<td>미입력</td>';
							} else {
								output += '<td>' + item.address_ADDRESS1 + '</td>';	
							}
							
							if (item.address_ADDRESS2 == null) {
								output += '<td>미입력</td>';
							} else {
								output += '<td>' + item.address_ADDRESS2 + '</td>';	
							}
							
							if (item.member_STATUS == 0) {
								output += '<td>이메일 인증대기</td>';
							} else {
								output += '<td>이메일 인증완료</td>';
							}
							
							output += '<td><a href="./deleteMember.ad" class="del_data" ';
							output += 'MEMBER_NUM=' + item.member_NUM +  '><i class="fas fa-trash-alt" ></i></a></td>';
							output += '</tr>';
							output += '</tbody>'
							console.dir("output : " + output);
							$('#user-table').append(output);
						});
					},
					error: function() {
						alert("ajax list 통신 실패!");
					}
				});
			}
			
			$(document).on('click', '.del_data', function(event) {
				jQuery.ajax({
					url : $(this).attr("href"), //$(this) : //항목을 눌렀을때 그 걸 가르킴 .attr("href") 속성된 이름값중에 "href"을 통해서? 읽어온다??
					type : 'GET',
					data : {'MEMBER_NUM' : $(this).attr("member_NUM")},
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType : 'json',
					success : function (retVal) {
						alert("삭제 성공");
						if (retVal.res == "OK") {
							// 데이터 성공할 때 이벤트 작성
							selectData();
						} else {
							alert("delete Fail !!");
						}
					},
					error : function() {
						alert("ajax 삭제 통신 실패!");
					}
				});
				
				// 기본 이벤트 제거
				event.preventDefault();
			});
			
			selectData();
		});
		
		$(document).ready(function() {
			$("#keyword").keyup(function() {
				var k = $(this).val();
				$("#user-table > tbody > tr").hide();
				var temp = $("#user-table > tbody > tr > td:nth-child(10n+3):contains('" + k + "')");
				
				$(temp).parent().show();					
			})
		})
	</script>
    