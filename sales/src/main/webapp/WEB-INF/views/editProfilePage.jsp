<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div id="main" role="main" style="margin-left: 0;">
	<div id="ribbon">
		<ol class="breadcrumb">
			<li>Edit Profile</li>
		</ol>
	</div>
	<div id="content">
		<div class="row">
			<div class="col-lg-12"
				style="padding: 17px; text-align: center; font-size: 21px;">Edit
				Profile</div>

			<c:if test="${not empty addressMsg}">
				<div class="card card-login mx-auto mt-5">
					<div class="alert alert-success"
						style="position: fixed; top: 49px; z-index: 11111; width: 30%; left: 42%; text-align: center;">${addressMsg}</div>
				</div>
			</c:if>
			<c:if test="${not empty personalDeatilsMsg}">
				<div class="card card-login mx-auto mt-5">
					<div class="alert alert-success"
						style="position: fixed; top: 49px; z-index: 11111; width: 30%; left: 42%; text-align: center;">${personalDeatilsMsg}</div>
				</div>
			</c:if>

			<article class="col-md-6 sortable-grid ui-sortable">
				<div class="jarviswidget jarviswidget-sortable" id="wid-id-8"
					data-widget-editbutton="false" data-widget-custombutton="false"
					role="widget">
					<header role="heading">
						<span class="widget-icon"> <i class="fa fa-edit"></i>
						</span>
						<h2>Personal Details</h2>

						<span class="jarviswidget-loader"><i
							class="fa fa-refresh fa-spin"></i></span>
					</header>
					<div role="content">
						<div class="widget-body no-padding">
							<sf:form action="${contextRoot}/updateProfile"
								modelAttribute="client" id="smart-form-register"
								cssClass="smart-form" method="post">
								<sf:hidden path="id" />
								<header>Personal Details</header>
								<fieldset>
									<div class="row">
										<section class="col col-6">
											<label class="label">First Name</label> <label class="input">
												<i class="icon-append fa fa-user"></i> <sf:input type="text"
													path="firstName" placeholder="First Name" />
											</label>
										</section>
										<section class="col col-6">
											<label class="label">Last Name</label> <label class="input">
												<i class="icon-append fa fa-user"></i> <sf:input type="text"
													path="lastName" placeholder="Last Name" />
											</label>
										</section>
									</div>
									<div class="row">
										<section class="col col-6">
											<label class="label">Phone Number</label> <label
												class="input"> <i class="icon-append fa fa-phone"></i>
												<sf:input type="tel" path="contactNumber"
													placeholder="Contact Number" data-mask="(999) 999-9999" />
											</label>
										</section>
										<section class="col col-6">
											<label class="label">Date Of Birth</label> <label
												class="input"> <i class="icon-append fa fa-calendar"></i>
												<sf:input type="text" path="dob" placeholder="Date Of Birth"
													id="dob" />
											</label>
										</section>
									</div>
									<section>
										<label class="label">E-mail</label> <label class="input">
											<i class="icon-append fa fa-envelope-o"></i> <sf:input
												type="text" path="email" placeholder="E-mail" id="email" />
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
			<article class="col-md-6 sortable-grid ui-sortable">
				<div class="jarviswidget jarviswidget-sortable" id="wid-id-8"
					data-widget-editbutton="false" data-widget-custombutton="false"
					role="widget">
					<header role="heading">
						<span class="widget-icon"> <i class="fa fa-edit"></i>
						</span>
						<h2>Address</h2>

						<span class="jarviswidget-loader"><i
							class="fa fa-refresh fa-spin"></i></span>
					</header>
					<div role="content">
						<div class="widget-body no-padding">
							<sf:form action="${contextRoot}/updateAddress"
								modelAttribute="address" id="addressForm" cssClass="smart-form"
								method="post">
								<sf:hidden path="id" />
								<header>Address</header>
								<fieldset>
									<section>
										<label class="label">Address Line 1</label> <label
											class="input"> <sf:input type="text"
												path="addressLineOne" placeholder="Address Line 1" />
										</label>
									</section>
									<section>
										<label class="label">Address Line 2</label> <label
											class="textarea"> <sf:textarea path="addressLineTwo"
												rows="3" placeholder="Address Line 2" />
										</label>
									</section>
									<div class="row">
										<section class="col col-6">
											<label class="label">City</label> <label class="input">
												<sf:input type="text" path="city" placeholder="City" />
											</label>
										</section>
										<section class="col col-6">
											<label class="label">Postal Code</label> <label class="input">
												<sf:input type="text" path="postalCode"
													placeholder="Postal code" />
											</label>
										</section>
									</div>
									<div class="row">
										<section class="col col-6">
											<label class="label">State</label> <label class="input">
												<sf:input type="text" path="state" placeholder="State" />
											</label>
										</section>
										<section class="col col-6">
											<label class="label">Country</label> <label class="input">
												<sf:input type="text" path="country" placeholder="Country" />
											</label>
										</section>
									</div>
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
