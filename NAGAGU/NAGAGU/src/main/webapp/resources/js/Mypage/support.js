$(document).ready(function() {
	//nav바
	$('ul.tabs li').click(function() {
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#" + tab_id).addClass('current');
	})

	//q&a
	$(".plusIcon").on("click", function() {
		var obj = $(this);
		if (obj.hasClass("glyphicon-plus")) {
			obj.hide();
			obj.next().show();
			obj.parent().parent().next().show();
		} else {
			obj.hide();
			obj.prev().show();
			obj.parent().parent().next().hide();
		}
	})
});