// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//= require jquery
//= require jquery_ujs
//= require rails.validations
//= require_self
//= require_tree .


function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).up().insert({
    before: content.replace(regexp, new_id)
  });
}
$(document).ready(function(){
	
	$("#private-group").change(function(){      
	    $("#private-fields").toggle(this.checked);
	});
});
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

//This is the in-field label disappear magic
//
$(document).ready(function(){
 
	// Find each of our input fields
	var $fields = $('textarea, input:text, input:password');
	
	// If a field gets focus then hide the label
	// (which is the previous element in the DOM).
	$fields.focus(function(){
		$(this).prev('label[for*="lbl"]').hide();
	});
	
	 
	// If a field loses focus and nothing has
	// been entered in the field then show the label.
	$fields.blur(function(){
		if ($(this).val()=='') {
			$('label[for*="lbl"]').show();
			// if ($(this).prev().hasClass('field_with_errors'){
			// 	$(this).prev().find('label').show();
			// }
		}
		else{
			$('label[for*="lbl"]').hide();
		}
	
	});
	
	 
	// If the form is pre-populated with some values
	// then immediately hide the corresponding labels. 
	$fields.each(function(){
		if (this.value) {
			$(this).prev().hide();
		}
	});
	//  	$("input").focus(function(){
	// 	$(this).prev().hide()
	// });
	// $("input").blur(function(){
	// 	if ($(this).val()=='') {
	// 		$("label").show();
	// 		// if ($(this).prev().hasClass('field_with_errors'){
	// 		// 	$(this).prev().find('label').show();
	// 		// }
	// 	}
	// });
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
$(document).ready(function () {
	$("#new_post").validate({
		debug: true,
		rules: {
			"post[name]": {required: true, name: true},
			"post[description]": {required: true, minlength: 6},
			"post[assignments_attributes]": {required: true}
		}
	});
});
// $(document).ready(function() { 
//     // validate signup form on keyup and submit 
// 
//     var validator = $("#new_user").validate({ 
//         rules: { 
// 			"user[name]": "required",
// 			// "user[email]": "required",
// 			"user[password]": {required: true, minlength: 6}
//         }, 
//         messages: { 
//             "user[name]": "Enter your name", 
//  
//             "user[password]": { 
//                 required: "Provide a password", 
//                 rangelength: jQuery.format("Enter at least {0} characters") 
//             }// , 
//             //             email: { 
//             //                 required: "Please enter a valid email address", 
//             //                 minlength: "Please enter a valid email address", 
//             //                 remote: jQuery.format("{0} is already in use") 
//             //             } 
//         }, 
//         // the errorPlacement has to take the table layout into account 
//         // errorPlacement: function(error, element) { 
//         //     if ( element.is(":radio") ) 
//         //         error.appendTo( element.parent().next().next() ); 
//         //     else if ( element.is(":checkbox") ) 
//         //         error.appendTo ( element.next() ); 
//         //     else 
//         //         error.appendTo( element.parent().next() ); 
//         // }, 
//         // specifying a submitHandler prevents the default submit, good for the demo 
//         submitHandler: function() { 
//             alert("submitted!"); 
//         }, 
//         // set this class to error-labels to indicate valid fields 
//         success: function(label) { 
//             // set   as text for IE 
//             label.html(" ").addClass("checked"); 
//         } 
//     }); 
//      
//     // propose username by combining first- and lastname 
//     $("#username").focus(function() { 
//         var firstname = $("#firstname").val(); 
//         var lastname = $("#lastname").val(); 
//         if(firstname && lastname && !this.value) { 
//             this.value = firstname + "." + lastname; 
//         } 
//     }); 
//  
// });
$(document).ready(function(){
	$("input:checkbox[name=post[assignments_attributes]]").click(function() {
		var bol = $("input:checkbox[name=post[assignments_attributes]]:checked").length >= 3;
		var boxes = $("input:checkbox[name=post[assignments_attributes]]").not(":checked").attr("disabled",bol);
	});
});
$(document).ready(function(){
	if ($("input[value=3]").is(":checked")){
		$(".price-field").hide();
		$("#credit-fields").show();
	}
	$("input").click(function(){
		if ($("input[value=3]").is(":checked")){
			$(".price-field").hide();
			$("#credit-fields").show();
		}else{
			$(".price-field").show();
			$("#credit-fields").hide();
		};
	});
});
$(document).ready(function() {
	jQuery('body').addClass('jsenabled');
	toggleBox();
	toggleBox2();
});

