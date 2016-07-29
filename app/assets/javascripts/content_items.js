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

	$("#filter_button").click(function() {
		$.ajax({
		  type: 'GET',
		  url: '/content_items/filtered?' + $('form').serialize(),
		  success: function(resp) {
		  	$('#content-items').fadeOut(function() {
		  		$('#content-items').html(resp).fadeIn(function() {
		  			closeNav();

	  				$('.grid').masonry({
					  // options
					  itemSelector: '.grid-item',
					  columnWidth: '.grid-sizer',
					  percentPosition: true,
					  originLeft: false
					});	
		  		});
		  	});
		  },
		  error: function() {

		  }
		});
	});

	$("#filter_button_desktop").click(function() {
		$.ajax({
		  type: 'GET',
		  url: '/content_items/filtered?' + $('.side-bar-desktop form').serialize(),
		  success: function(resp) {
		  	$('#content-items').fadeOut(function() {
		  		$('#content-items').html(resp).fadeIn(function() {
		  			closeNav();

	  				$('.grid').masonry({
					  // options
					  itemSelector: '.grid-item',
					  columnWidth: '.grid-sizer',
					  percentPosition: true,
					  originLeft: false
					});	
		  		});
		  	});
		  },
		  error: function() {

		  }
		});
	});

	$(window).scroll(function() {
		if ($(this).scrollTop() > $('.header__nav').position().top) {  
			addStickyHeader();
	  	} else {
	  		removeStickyHeader();
	  	}
	});

	$('.grid').masonry({
	  // options
	  itemSelector: '.grid-item',
	  columnWidth: '.grid-sizer',
	  percentPosition: true,
	  originLeft: false
	});
});

function addStickyHeader() {
	$('.header__nav').addClass("header__nav--sticky");
	$('.header__padding').addClass("header__padding--display-true");
	$(".header__nav-icon").fadeIn();
}

function removeStickyHeader() {
	$('.header__nav').removeClass("header__nav--sticky");
	$('.header__padding').removeClass("header__padding--display-true");
	$(".header__nav-icon").fadeOut();
}

function openNav() {
	$("#side-nav").css('width', '250px');
	$("#cover").fadeIn();
	$("#cover").css('margin-left', '250px');
	$(".side-nav__container").fadeIn();
	$(".header__nav").fadeOut();
}

function closeNav() {
	$(".side-nav__container").fadeOut(function() {
		$("#side-nav").css('width', '0');
		$("#cover").css('margin-left', '0');
		$("#cover").fadeOut();
		$(".header__nav").fadeIn();
		removeStickyHeader();
	});
}
