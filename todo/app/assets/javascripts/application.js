// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require_self
//= require jquery-latest
//= require bootstrap.min
//= require bootstrap-datepicker
//= require bootstrap-datepicker/locales/bootstrap-datepicker.fr
//= require best_in_place
//= require jquery-ui
//= require jquery_ujs
//= require_tree .

$('#form').live('ajax:beforeSend', function(evt, xhr, settings){
  // prevent double submit
  $(':submit', this).click(function() {
    return false;
  });
});

$(document).on("focus", "[data-behaviour~='datepicker']", function(e){
    $(this).datepicker({dateFormat: 'dd-mm-yy'}); 
});

jQuery(function($){
  $.datepicker.setDefaults({ dateFormat: 'dd-mm-yy' }); 
}); 

function filter_by_category(category) {
  $.get("/tasks/filter_by_category", { 'category': category, "format": "js" });
}

function done(task) {
  $.post("/tasks/"+task+"/done", { "format": "js" });
}

function remove(task) {
  $.post("/tasks/"+task, { _method: 'delete' }, null, "script");
}

$(function() {
	$('#task_category_id').autocomplete({
		source: '/tasks/index.js'
	});
});

$('#select-all').click(function (event) {
  var selected = this.checked;
  $(':checkbox').each(function () {    this.checked = selected; });
});

