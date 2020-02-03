function SetGridItemHeight() {
	var grid = document.getElementsByClassName('grid')[0];
	var rowHeight = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-auto-rows'));
	var rowGap = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-row-gap'));

	var item = grid.getElementsByClassName('item');
	for (let i = 0; i < item.length; ++i) {
		item[i].style.gridRowEnd = 'span '+ Math.floor((item[i].children[0].offsetHeight) / 25);
	}
}

window.addEventListener("load", SetGridItemHeight);
window.addEventListener("resize", SetGridItemHeight);

$(document).ready(function() {
	$(window).resize(function() {
		var Wid = $(window).width();

		if (Wid < 700) {
			$('.card-header').addClass("p-1");
			$('.card-body').addClass("p-1");
			$('.card-footer').addClass("p-1");
		} else {
			$('.card-header').removeClass("p-1");
			$('.card-body').removeClass("p-1");
			$('.card-footer').removeClass("p-1");
		}
	})

});