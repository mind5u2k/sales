<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div id="main" role="main" style="margin-left: 0;">
	<div id="ribbon">
		<ol class="breadcrumb">
			<li>Update Password</li>
		</ol>
	</div>
	<div id="content">
		<div class="row">
			<div class="col-lg-12"
				style="padding: 17px; text-align: center; font-size: 21px;">Update
				Password</div>

			<c:if test="${not empty msg}">
				<div class="card card-login mx-auto mt-5">
					<div class="alert alert-success"
						style="position: fixed; top: 49px; z-index: 11111; width: 30%; left: 42%; text-align: center;">${msg}</div>
				</div>
			</c:if>
			<c:if test="${not empty errorMsg}">
				<div class="card card-login mx-auto mt-5">
					<div class="alert alert-danger"
						style="position: fixed; top: 49px; z-index: 11111; width: 30%; left: 42%; text-align: center;">${errorMsg}</div>
				</div>
			</c:if>

			<article class="col-md-6 col-md-offset-3 sortable-grid ui-sortable">
				<div class="jarviswidget jarviswidget-sortable" id="wid-id-8"
					data-widget-editbutton="false" data-widget-custombutton="false"
					role="widget">
					<header role="heading">
						<span class="widget-icon"> <i class="fa fa-edit"></i>
						</span>
						<h2>Update Password</h2>

						<span class="jarviswidget-loader"><i
							class="fa fa-refresh fa-spin"></i></span>
					</header>
					<div role="content">
						<div class="widget-body no-padding">
							<sf:form action="${contextRoot}/changePassword"
								modelAttribute="password" id="smart-form-register"
								cssClass="smart-form" method="post">
								<header>Update Password</header>
								<fieldset>
									<section>
										<label class="label">Old Password</label> <label class="input">
											<i class="icon-append fa fa-lock"></i> <sf:password
												path="oldPassword" placeholder="Old Password" />
										</label>
									</section>
									<section>
										<label class="label">New Password</label> <label class="input">
											<i class="icon-append fa fa-lock"></i> <sf:password
												path="password" placeholder="New Password" />
										</label>
									</section>
									<section>
										<label class="label">Confirm Password</label> <label
											class="input"> <i class="icon-append fa fa-lock"></i>
											<sf:password path="confirmPassword"
												placeholder="Confirm Password" />
										</label>
									</section>
								</fieldset>
								<footer>
									<button type="submit" class="btn btn-primary">Submit</button>
								</footer>
							</sf:form>
						</div>
					</div>
				</div>
			</article>
		</div>
	</div>
</div>

<script>
	if (!window.jQuery.ui) {
		document
				.write('<script src="${contextPath}/comDash/js/libs/jquery-ui-1.10.3.min.js"><\/script>');
	}
</script>
<script src="${js}/app.config.js"></script>
<script src="${js}/bootstrap/bootstrap.min.js"></script>
<script src="${js}/notification/SmartNotification.min.js"></script>
<script src="${js}/plugin/jquery-validate/jquery.validate.min.js"></script>
<script src="${js}/plugin/masked-input/jquery.maskedinput.min.js"></script>
<script src="${js}/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>
<script src="${js}/app.min.js"></script>
<script src="${js}/plugin/bootstrapvalidator/bootstrapValidator.min.js"></script>
<script src="${js}/plugin/jquery-form/jquery-form.min.js"></script>
<script
	src="${js}/plugin/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>

<script src="${js}/myapp.js"></script>
<script>
	$('#dob').datepicker({
		dateFormat : 'dd/mm/yy',
		prevText : '<i class="fa fa-chevron-left"></i>',
		nextText : '<i class="fa fa-chevron-right"></i>',
	});
</script>
