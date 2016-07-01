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
});