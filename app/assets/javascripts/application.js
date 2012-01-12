// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//= require jquery
//= require jquery_ujs
//= require_self
//= require_tree .

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).up().insert({
    before: content.replace(regexp, new_id)
  });
}
function toggleBox() {
  jQuery("#premium_group .input:checkbox").click(function() { 
  if (jQuery(this).attr('checked') == "checked") {
    jQuery("#credit_fields").show("fast");
    }else{
      jQuery("#credit_fields").hide("fast");
    };
  });
}

$(function() {
  $('#premium_group').click(function() {
    $('#credit_fields').toggle();
  });
});

$(document).ready(function() {
	jQuery('body').addClass('jsenabled');
	toggleBox();
});

