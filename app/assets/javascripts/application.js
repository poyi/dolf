// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.purr
//= require best_in_place

$(document).ready(function() {
	$(".best_in_place").best_in_place();

	$(".best_in_place").bind("ajax:success", function(){
		location.reload();
	});

	$("#delete-all-btn").bind("ajax:success", function(){
		location.reload();
	});

	$(".task-list-check-background").find('span').html('<img class="checkbox-bk-default" src="/assets/checkbox-bk-default.png" />');
	$(".task-list-checked-background").find('span').replaceWith('<img class="checkbox-bk-completed" src="/assets/checkbox-bk-completed.png" />');
	
});
