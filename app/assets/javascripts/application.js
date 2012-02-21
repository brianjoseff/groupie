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
// function toggleBox2() {
//   jQuery("#private-group").click(function() { 
//   if (jQuery(this).attr('checked') == "checked") {
//     jQuery("#private-fields").show("fast");
//     }else{
//       jQuery("#private-fields").hide("fast");
//     };
//   });
// }
$(document).ready(function(){
	$("#private-group").change(function(){      
	    $("#private-fields").toggle(this.checked);
	});
});
// $(document).ready(function(){
//   // do your checks of the radio buttons here and show/hide what you want to
//   // $("#Jobs_Internships_3").hide();
//   // if ($("#Jobs_Internships_3:checked").length > 0){ $("#price").hide(); };
// 
//   // add functionality for the onclicks here
//   $("#Jobs_Internships_3:checked").click(function() {
//     $("#price").hide();
//   });
//   // 
//   // $("#answerNo").click(function() {
//   //   $("#subQuestion").hide();
//   // });
// });

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
// $(document).ready(function KeepCount() {
// 
// 	var checkCount=0
// 
// 	//maximum number of allowed checked boxes
// 	var maxChecks=3
// 
// 	function setChecks(obj){
// 	//increment/decrement checkCount
// 	if(obj.checked){
// 	checkCount=checkCount+1
// 	}else{
// 	checkCount=checkCount-1
// 	}
// 	//if they checked a 4th box, uncheck the box, then decrement checkcount and pop alert
// 	if (checkCount>maxChecks){
// 	obj.checked=false
// 	checkCount=checkCount-1
// 	alert('you may only choose up to '+maxChecks+' options')
// 	}
// 
// });
$(document).ready(function(){
	$("input:checkbox[name=post[assignments_attributes]]").click(function() {
		var bol = $("input:checkbox[name=post[assignments_attributes]]:checked").length >= 3;
		var boxes = $("input:checkbox[name=post[assignments_attributes]]").not(":checked").attr("disabled",bol);
	});
});
$(document).ready(function(){
	$("#post_product_id_3").click(function(){
		if ($('input[id=post_product_id_3]:checked').val()=="3"){
			$('.price-field').hide();
		}else{
			$('.price-field').show();
		};
	});
});
$(document).ready(function() {
	jQuery('body').addClass('jsenabled');
	toggleBox();
	toggleBox2();
});

