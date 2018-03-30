$(function() {
	switch (menu) {
	case 'HomePage':
		$("#home").addClass("active");
		break;
	case 'AllUsers':
		$("#home").addClass("active");
		$("#home").addClass("open");
		$("#users").addClass("active");
		$("#homeBlock").css("display", "block");
		break;
	case 'Roles':
		$("#home").addClass("active");
		$("#home").addClass("open");
		$("#roles").addClass("active");
		$("#homeBlock").css("display", "block");
		break;
	case 'AllAccountMasters':
		$("#home").addClass("active");
		$("#home").addClass("open");
		$("#accounts").addClass("active");
		$("#homeBlock").css("display", "block");
		break;
	case 'FormCategory':
		$("#home").addClass("active");
		$("#home").addClass("open");
		$("#categories").addClass("active");
		$("#homeBlock").css("display", "block");
		break;
	case 'FormParameters':
		$("#home").addClass("active");
		$("#home").addClass("open");
		$("#parameters").addClass("active");
		$("#homeBlock").css("display", "block");
		break;
	case 'EscMatrixDatabase':
		$("#home").addClass("active");
		$("#home").addClass("open");
		$("#escMatrix").addClass("active");
		$("#homeBlock").css("display", "block");
		break;
	case 'EscMatrixDetails':
		$("#home").addClass("active");
		$("#home").addClass("open");
		$("#escMatrix").addClass("active");
		$("#homeBlock").css("display", "block");
		break;
	case 'FormByAccount':
		$("#FormByAccount").addClass("active");
		break;
	case 'LeadershipDashboard':
		$("#leadershipDashboard").addClass("active");
		break;
	case 'ComplianceSocrecard':
		$("#ComplianceSocrecard").addClass("active");
		break;
	case 'ComplianceMails':
		$("#ComplianceMail").addClass("active");
		break;
	case 'Report':
		$("#Report").addClass("active");
		break;
	case 'EscMatrixUser':
		$("#EscMatrixUser").addClass("active");
		break;
	case 'EscMatrixDetailsUserSdl':
		$("#EscMatrixUser").addClass("active");
		break;
	case 'EscMatrixDetailsUserDpe':
		$("#EscMatrixUser").addClass("active");
		break;
	case 'EscMatrixDetailsUserPe':
		$("#EscMatrixUser").addClass("active");
		break;
	case 'EscMatrixDetailsUserSpoc':
		$("#EscMatrixUser").addClass("active");
		break;
	default:
		break;
	}

	var $alert = $(".alert");
	if ($alert.length) {
		setTimeout(function() {
			$alert.fadeOut('slow');
		}, 3000)
	}

	var $categoryForm = $("#profileForm");
	if ($categoryForm.length) {
		$categoryForm.bootstrapValidator({
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				name : {
					validators : {
						notEmpty : {
							message : 'Name is required'
						}
					}
				}
			}
		});
	}

	var $formParamter = $("#formParamter");
	if ($formParamter.length) {
		$formParamter.bootstrapValidator({
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				name : {
					validators : {
						notEmpty : {
							message : 'Name is required'
						}
					}
				}
			}
		});
	}
});