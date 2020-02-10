/* 사이드 바 스크립트 */
$(function() {
	$(".sidebar-nav").mouseenter(function() { // 마우스 들어갈때
		$(".main").find("li").stop().slideDown(300, function() { // li가 나타남
			$(this).mouseover(function() {
				$(this).css("font-weight", "800");

			});
		});
	});
	$(".sidebar-nav").mouseleave(function() { // 마우스 나갈때
		$(".main").find("li").stop().slideUp(300, function() { // li가 사라짐
			$(this).mouseleave(function() {
				$(this).css("font-weight", "500");
			});
		});
	});
});