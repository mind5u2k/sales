$(function() {
	$(window).load(function() {
		setTimeout(function() {
			$(".se-pre-con").fadeOut("slow");
		}, 500);
	});
	var token = $('meta[name="_csrf"]').attr('content');
	var header = $('meta[name="_csrf_header"]').attr('content');
	if ((token != undefined && header != undefined)
			&& (token.length > 0 && header.length > 0)) {
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
	}

	switch (menu) {
	case 'Home':
		$('#home').addClass('active');
		break;
	case 'Users':
		$('#users').addClass('active');
		break;
	case 'SalesManager':
		$("#adminUserBlock").css("display", "block");
		$('#salesManager').addClass('active');
		break;
	case 'SalesOrganizer':
		$("#adminUserBlock").css("display", "block");
		$('#salesOrganization').addClass('active');
		break;
	case 'SalesRepresentatives':
		$('#salesRepresentatives').addClass('active');
		break;
	case 'Clients':
		$('#clients').addClass('active');
		break;
	case 'Products':
		$('#products').addClass('active');
		break;
	case 'Assign Products':
		$('#assignProducts').addClass('active');
		break;
	default:
		if (menu == "Home")
			break;
		$('#listProducts').addClass('active');
		$('#a_' + menu).addClass('active');
		break;
	}

	function errorPlacement(error, element) {
		// Add the 'help-block' class to the error element
		error.addClass("help-block");

		// add the error label after the input element
		error.insertAfter(element);

		// add the has-feedback class to the
		// parent div.validate in order to add icons to inputs
		element.parents(".validate").addClass("has-feedback");

	}

	// validating the product form element
	// fetch the form element

	var $checkoutForm = $('#checkout-form').validate({
		// Rules for form validation
		rules : {
			organizationName : {
				required : true
			},
			firstName : {
				required : true
			},
			lastName : {
				required : true
			},
			productName : {
				required : true
			},
			email : {
				required : true,
				email : true
			},
			contactNumber : {
				required : true
			},
			country : {
				required : true
			},
			city : {
				required : true
			},
			code : {
				required : true,
				digits : true
			},
			address : {
				required : true
			},
			name : {
				required : true
			},
			role : {
				required : true
			},
			Gender : {
				required : true
			},
			description : {
				required : true
			}
		},

		// Messages for form validation
		messages : {
			organizationName : {
				required : 'Please enter Organization name'
			},
			firstName : {
				required : 'Please enter your first name'
			},
			lastName : {
				required : 'Please enter your last name'
			},
			productName : {
				required : 'Please enter the Product Name'
			},
			email : {
				required : 'Please enter your email address',
				email : 'Please enter a VALID email address'
			},
			contactNumber : {
				required : 'Please enter your contact number'
			},
			country : {
				required : 'Please enter your country'
			},
			city : {
				required : 'Please enter your city'
			},
			code : {
				required : 'Please enter code',
				digits : 'Digits only please'
			},
			address : {
				required : 'Please enter your full address'
			},
			name : {
				required : 'Please enter name on your card'
			},
			role : {
				required : 'Please select Role'
			},
			Gender : {
				required : 'Please select Gender'
			},
			description : {
				required : 'Please enter Description'
			}
		},

		// Do not change code below
		errorPlacement : function(error, element) {
			error.insertAfter(element.parent());
		}
	});
	/* validating the loginform */

	// validating the product form element
	// fetch the form element
	$loginForm = $('#loginForm');

	if ($loginForm.length) {

		$loginForm.validate({
			rules : {
				username : {
					required : true,
					email : true

				},
				password : {
					required : true
				}
			},
			messages : {
				username : {
					required : 'Please enter your email!',
					email : 'Please enter a valid email address!'
				},
				password : {
					required : 'Please enter your password!'
				}
			},
			errorElement : "em",
			errorPlacement : function(error, element) {
				// Add the 'help-block' class to the error element
				error.addClass("help-block");

				// add the error label after the input element
				error.insertAfter(element);
			}
		}

		);

	}

	/*------*/
	/* for fading out the alert message after 3 seconds */
	$alert = $('.alert');
	if ($alert.length) {
		setTimeout(function() {
			$alert.fadeOut('slow');
		}, 3000);
	}

	/*------*/
	/* handle refresh cart */
	$('button[name="refreshCart"]')
			.click(
					function() {
						var cartLineId = $(this).attr('value');
						var countField = $('#count_' + cartLineId);
						var originalCount = countField.attr('value');
						// do the checking only the count has changed
						if (countField.val() !== originalCount) {
							// check if the quantity is within the specified
							// range
							if (countField.val() < 1 || countField.val() > 3) {
								// set the field back to the original field
								countField.val(originalCount);
								bootbox
										.alert({
											size : 'medium',
											title : 'Error',
											message : 'Product Count should be minimum 1 and maximum 3!'
										});
							} else {
								// use the window.location.href property to send
								// the request to the server
								var updateUrl = window.contextRoot + '/cart/'
										+ cartLineId + '/update?count='
										+ countField.val();
								window.location.href = updateUrl;
							}
						}
					});
});