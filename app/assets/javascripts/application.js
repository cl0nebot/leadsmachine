// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs


//= require semantic-ui/form
//= require semantic-ui/checkbox
//= require semantic-ui/dimmer
//= require semantic-ui/dropdown
//= require semantic-ui/modal
//= require semantic-ui/transition

//= require semantic-ui/embed
//= require semantic-ui/tab


//= require semantic-ui/api
//= require semantic-ui/colorize
//= require semantic-ui/state
//= require semantic-ui/visibility
//= require semantic-ui/visit
//= require semantic-ui/site
//= require semantic-ui/accordion
//= require semantic-ui/nag
//= require semantic-ui/popup
//= require semantic-ui/progress
//= require semantic-ui/rating
//= require semantic-ui/search
//= require semantic-ui/shape
//= require semantic-ui/sidebar
//= require semantic-ui/sticky
//= require semantic-ui/video

//= require_tree .
//= require turbolinks

$(function(){

  $('.menu .item').tab();

  $('.ui.dropdown').dropdown();

  $('.url.example .ui.embed').embed();

  $("#comingsoon").click(function(){
    $('.ui.modal')
    .modal({
      blurring: true,
      inverted: true
    })
    .modal('show');
  });

	$("#gomodalgo").click(function(){
		$('.ui.modal')
		.modal({
    	blurring: true
  	})
		.modal('show');
	});

	$('.message .close')
  .on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade')
    ;
  })
;
})