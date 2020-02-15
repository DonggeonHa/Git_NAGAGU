<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Mypage/support.css">
		
<div class="container">
	<div class="container_first">
		<article id="customer-center" class="customer-center">
			<h1 class="customer-center_title">고객센터</h1>
			<div class="row">
				<section class="col-12 col-md-8 customer-center_contact">
					<address>
						운영시간 : 평일 10:00~17:00 (점심시간 12:00~13:00 / 주말&공휴일 제외) <br>
						이메일 : <a href="mailto:hadongddak@diydiy.com?Subject=문의드립니다."
							style="text-decoration: underline;">hadonggeon@diydiy.com</a>
						<button class="custmoer-center_contact_btb_copy_email"
							type="button">주소 복사</button>
						<br> 전화 : 02-1234-2356
					</address>
					<button	class="btn btn-md btn-priority customer-center_contact_btn-inquiry start-one-on-one-inquiry--channelio"	type="button">1:1 문의하기</button>
				</section>
			</div>
		</article>
	</div>
</div>
	
<div class="container">
	<div class="container_second">

		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">전체</li>
			<li class="tab-link" data-tab="tab-2">주문/결제</li>
			<li class="tab-link" data-tab="tab-3">배송 관련</li>
			<li class="tab-link" data-tab="tab-4">반품/교환</li>
			<li class="tab-link" data-tab="tab-5">서비스/기타</li>
		</ul>
		
		<div id="tab-1" class="tab-content current">
			<table class="table table-bordered">
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 주문 내역은 어떻게 확인할 수 있나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 주문 내역은 어떻게 확인할 수 있나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 우측 상단 마이페이지를 클릭 후 [ORDER]을 통해 확인 가능합니다</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 비회원주문 및 전화주문이 가능한가요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 비회원주문 및 전화주문이 가능한가요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 전화주문은 준비중에 있습니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;비회원 주문은 가능하지만 일부 상품에 한해 제한되어있습니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 신용카드 무이자 할부가 되나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 신용카드 무이자 할부가 되나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 각 카드사 별로 상이하며, 카드사를 통해 확인 가능합니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 가상 계좌 은행을 변경 할 수 있나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 가상 계좌 은행을 변경 할 수 있나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 한번 발급 받은 계좌번호는 변경이 불가능합니다. 재주문을 통해 새로운 계좌를 발급 받으신 후 입금 부탁드립니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 주문 후 결제 방법을 변경하고 싶은데 어떻게 해야 하나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 주문 후 결제 방법을 변경하고 싶은데 어떻게 해야 하나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 결제 후 결제 정보 변경은 불가능 합니다. 단, 입금 대기 및 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 신용카드 무이자 할부가 되나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 신용카드 무이자 할부가 되나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 각 카드사 별로 상이하며, 카드사를 통해 확인 가능합니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 결제 시 에러 메시지가 나오는 경우 해야하나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 결제 시 에러 메시지가 나오는 경우 해야하나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 우측 상단 마이페이지를 클릭 후 [CS > 1:1 문의하기]를 통해 문의 부탁드립니다.</td>
				</tr>
			</table>
		</div>
		<div id="tab-2" class="tab-content">
			<table class="table table-bordered">
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 주문 내역은 어떻게 확인할 수 있나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 주문 내역은 어떻게 확인할 수 있나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 우측 상단 마이페이지를 클릭 후 [ORDER]을 통해 확인 가능합니다</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 비회원주문 및 전화주문이 가능한가요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 비회원주문 및 전화주문이 가능한가요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 전화주문은 준비중에 있습니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;비회원 주문은 가능하지만 일부 상품에 한해 제한되어있습니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 신용카드 무이자 할부가 되나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 신용카드 무이자 할부가 되나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 각 카드사 별로 상이하며, 카드사를 통해 확인 가능합니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 가상 계좌 은행을 변경 할 수 있나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 가상 계좌 은행을 변경 할 수 있나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 한번 발급 받은 계좌번호는 변경이 불가능합니다. 재주문을 통해 새로운 계좌를 발급 받으신 후 입금 부탁드립니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 주문 후 결제 방법을 변경하고 싶은데 어떻게 해야 하나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 주문 후 결제 방법을 변경하고 싶은데 어떻게 해야 하나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 결제 후 결제 정보 변경은 불가능 합니다. 단, 입금 대기 및 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 신용카드 무이자 할부가 되나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 신용카드 무이자 할부가 되나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 각 카드사 별로 상이하며, 카드사를 통해 확인 가능합니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 결제 시 에러 메시지가 나오는 경우 해야하나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 결제 시 에러 메시지가 나오는 경우 해야하나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 우측 상단 마이페이지를 클릭 후 [CS > 1:1 문의하기]를 통해 문의 부탁드립니다.</td>
				</tr>
			</table>
		</div>
		<div id="tab-3" class="tab-content">
			<table class="table table-bordered">
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 주문 내역은 어떻게 확인할 수 있나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 주문 내역은 어떻게 확인할 수 있나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 우측 상단 마이페이지를 클릭 후 [ORDER]을 통해 확인 가능합니다</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 비회원주문 및 전화주문이 가능한가요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 비회원주문 및 전화주문이 가능한가요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 전화주문은 준비중에 있습니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;비회원 주문은 가능하지만 일부 상품에 한해 제한되어있습니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 신용카드 무이자 할부가 되나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 신용카드 무이자 할부가 되나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 각 카드사 별로 상이하며, 카드사를 통해 확인 가능합니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 가상 계좌 은행을 변경 할 수 있나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 가상 계좌 은행을 변경 할 수 있나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 한번 발급 받은 계좌번호는 변경이 불가능합니다. 재주문을 통해 새로운 계좌를 발급 받으신 후 입금 부탁드립니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 주문 후 결제 방법을 변경하고 싶은데 어떻게 해야 하나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 주문 후 결제 방법을 변경하고 싶은데 어떻게 해야 하나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 결제 후 결제 정보 변경은 불가능 합니다. 단, 입금 대기 및 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 신용카드 무이자 할부가 되나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 신용카드 무이자 할부가 되나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 각 카드사 별로 상이하며, 카드사를 통해 확인 가능합니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 결제 시 에러 메시지가 나오는 경우 해야하나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 결제 시 에러 메시지가 나오는 경우 해야하나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 우측 상단 마이페이지를 클릭 후 [CS > 1:1 문의하기]를 통해 문의 부탁드립니다.</td>
				</tr>
			</table>
		</div>
		<div id="tab-4" class="tab-content">
			<table class="table table-bordered">
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 주문 내역은 어떻게 확인할 수 있나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 주문 내역은 어떻게 확인할 수 있나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 우측 상단 마이페이지를 클릭 후 [ORDER]을 통해 확인 가능합니다</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 비회원주문 및 전화주문이 가능한가요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 비회원주문 및 전화주문이 가능한가요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 전화주문은 준비중에 있습니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;비회원 주문은 가능하지만 일부 상품에 한해 제한되어있습니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 신용카드 무이자 할부가 되나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 신용카드 무이자 할부가 되나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 각 카드사 별로 상이하며, 카드사를 통해 확인 가능합니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 가상 계좌 은행을 변경 할 수 있나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 가상 계좌 은행을 변경 할 수 있나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 한번 발급 받은 계좌번호는 변경이 불가능합니다. 재주문을 통해 새로운 계좌를 발급 받으신 후 입금 부탁드립니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 주문 후 결제 방법을 변경하고 싶은데 어떻게 해야 하나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 주문 후 결제 방법을 변경하고 싶은데 어떻게 해야 하나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 결제 후 결제 정보 변경은 불가능 합니다. 단, 입금 대기 및 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 신용카드 무이자 할부가 되나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 신용카드 무이자 할부가 되나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 각 카드사 별로 상이하며, 카드사를 통해 확인 가능합니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 결제 시 에러 메시지가 나오는 경우 해야하나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 결제 시 에러 메시지가 나오는 경우 해야하나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 우측 상단 마이페이지를 클릭 후 [CS > 1:1 문의하기]를 통해 문의 부탁드립니다.</td>
				</tr>
			</table>
		</div>
		<div id="tab-5" class="tab-content">
			<table class="table table-bordered">
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 주문 내역은 어떻게 확인할 수 있나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 주문 내역은 어떻게 확인할 수 있나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 우측 상단 마이페이지를 클릭 후 [ORDER]을 통해 확인 가능합니다</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 비회원주문 및 전화주문이 가능한가요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 비회원주문 및 전화주문이 가능한가요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 전화주문은 준비중에 있습니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;비회원 주문은 가능하지만 일부 상품에 한해 제한되어있습니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 신용카드 무이자 할부가 되나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 신용카드 무이자 할부가 되나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 각 카드사 별로 상이하며, 카드사를 통해 확인 가능합니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 가상 계좌 은행을 변경 할 수 있나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 가상 계좌 은행을 변경 할 수 있나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 한번 발급 받은 계좌번호는 변경이 불가능합니다. 재주문을 통해 새로운 계좌를 발급 받으신 후 입금 부탁드립니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 주문 후 결제 방법을 변경하고 싶은데 어떻게 해야 하나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 주문 후 결제 방법을 변경하고 싶은데 어떻게 해야 하나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 결제 후 결제 정보 변경은 불가능 합니다. 단, 입금 대기 및 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 신용카드 무이자 할부가 되나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 신용카드 무이자 할부가 되나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 각 카드사 별로 상이하며, 카드사를 통해 확인 가능합니다.</td>
				</tr>
				
				<tr class="table-bordered_tr">
					<td class="table-bordered_td">
						<span class="glyphicon glyphicon-plus plusIcon">Q 결제 시 에러 메시지가 나오는 경우 해야하나요?</span>
						<span class="glyphicon glyphicon-minus plusIcon" style="display: none">Q 결제 시 에러 메시지가 나오는 경우 해야하나요?</span>
					</td>
				</tr>
				<tr style="display: none" class="table-bordered_second_tr">
					<td class="table-bordered_td">A 우측 상단 마이페이지를 클릭 후 [CS > 1:1 문의하기]를 통해 문의 부탁드립니다.</td>
				</tr>
			</table>
		</div>
	</div>
</div>
		
<script src="<c:url value="/resources/js/Mypage/support.js"/>"></script>