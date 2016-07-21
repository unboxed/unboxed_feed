$(document).ready(function() {
	$(".edit").click(function() {
		$("#" + this.id + ".item-image").hide();
		$("#" + this.id + ".edit-form").slideDown();
	});

	$(".close").click(function() {
		$("#" + this.id + ".edit-form").slideUp(function() {
			$("#" + this.id + ".item-image").fadeIn();
		});
	});

	var nav = $('.header__nav');
	var padding = $('.header__padding'); 

	$(window).scroll(function() {
		if ($(this).scrollTop() > 300) {  
	    	nav.addClass("header__nav--sticky");
	    	padding.addClass("header__padding--display-true");
	  	} else {
	    	nav.removeClass("header__nav--sticky");
	    	padding.removeClass("header__padding--display-true");
	  	}
	});
});
