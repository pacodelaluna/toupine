$(document).ready(function() {



	/*
	          __                                 
	         /\ \                   __           
	  ___    \_\ \     __   __  __ /\_\     __   
	 / __`\  /'_` \  /'__`\/\ \/\ \\/\ \  /'__`\ 
	/\ \L\ \/\ \L\ \/\  __/\ \ \_/ |\ \ \/\  __/ 
	\ \____/\ \___,_\ \____\\ \___/  \ \_\ \____\
	 \/___/  \/__,_ /\/____/ \/__/    \/_/\/____/

	odevie.org
	Web agency
	*/
	
	$('.strech').anystretch();

	if ($('.home_selection h2 span').length){
		var len = ($('.home_selection h2 span').html().length * 12.5);
		$('.home_selection h2 span').css('left', ($(window).width()/2) - (len/2));
		$(window).resize(function(){
			$('.home_selection h2 span').css('left', ($(window).width()/2) - (len/2));
		});	
	}

	if ($('.produit_selection h2 span').length){
		var len = ($('.produit_selection h2 span').html().length * 12.5);
		$('.produit_selection h2 span').css('left', ($('.produit_avant_croisee').width()/2) - (len/2));
		$(window).resize(function(){
			$('.produit_selection h2 span').css('left', ($('.produit_avant_croisee').width()/2) - (len/2));
		});
	}

	$('#toggle_command').click(function (e) {
  		$('body').toggleClass('active');
  		e.preventDefault();
	});

	$('.taxons-list').tinyNav();

	$(window).scroll(function(){
		if ($(window).scrollTop() > 10){
			$('.sml_logo').css('display', 'block');
		}else{
			$('.sml_logo').css('display', 'none');
		}
	});

	$.ajax({
        url: Spree.pathFor("cart_link"),
        success: function(data) {
          $('#link-to-cart').html(data);
        }
    });
});