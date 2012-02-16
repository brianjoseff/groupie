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
// function toggleBox() {
//   jQuery("#premium_group .input:checkbox").click(function() { 
//   if (jQuery(this).attr('checked') == "checked") {
//     jQuery("#credit_fields").show("fast");
//     }else{
//       jQuery("#credit_fields").hide("fast");
//     };
//   });
// }
function toggleBox2() {
  jQuery("#private_group").click(function() { 
  if (jQuery(this).attr('checked') == "checked") {
    jQuery("#private_fields").show("fast");
    }else{
      jQuery("#private_fields").hide("fast");
    };
  });
}
$(document).ready(function(){
 
	// Find each of our input fields
	var $fields = $('textarea, input:text, input:password');

	// If a field gets focus then hide the label
	// (which is the previous element in the DOM).
	$fields.focus(function(){
		$(this).prev().hide();
	});

 
	// If a field loses focus and nothing has
	// been entered in the field then show the label.
	$fields.blur(function(){
		if (!this.value) {
			$(this).prev().show();
		}
	});

 
	// If the form is pre-populated with some values
	// then immediately hide the corresponding labels. 
	$fields.each(function(){
		if (this.value) {
			$(this).prev().hide();
		}
	});
 
});

// function passCheck(password){
// 	jQuery("#the_password .input:text_field").submit(function(){
// 	if (jQuery(this).attr('the_password')==password) {
// 		jQuery("")
// 	};
// 	})
// }
// $(function() {
//   $('#premium_group').click(function() {
//     $('#credit_fields').toggle();
//   });
// });

$(document).ready(function() {
	jQuery('body').addClass('jsenabled');
	toggleBox();
	toggleBox2();
});

