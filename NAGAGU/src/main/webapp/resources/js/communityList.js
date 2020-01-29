$(function(){
		  $(document).on("click","#far",function addClass() {
		     alert($('#far').hasClass('svg-inline--fa fa-heart fa-w-16 fa-2x'));
		    if($('#far').attr('class') === "svg-inline--fa fa-heart fa-w-16 fa-2x"){
		       $('#far').removeClass("fa fa-heart fa-2x");
		       $('#far').addClass("far fa-heart fa-2x");
		      alert('hi3');
		    }else{
		      $(this).removeClass("fas fa-heart fa-2x");
		      $(this).addClass("far fa-heart fa-2x");
		      alert('hi2');
		    }
		  });
		});