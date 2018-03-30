<%@include file="../flows-shared/header1.jsp"%>
<body
	class="desktop-detected menu-on-top voice-command-active service-not-allowed pace-done fixed-header fixed-navigation">
	<%@include file="../flows-shared/header1.jsp"%>
	<div id="main" role="main">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="panel panel-primary"
						style="border-color: #716e6e; box-shadow: 5px 5px 5px #8b8686;">
						<div class="panel-heading"
							style="color: #fff; background-color: #5e5c5c; border-color: #313131;">
							<h4>Personal Details</h4>
						</div>
						<div class="panel-body">
							<table style="width: 100%;">
								<tr style="border-bottom: 1px solid #b9b5b5; height: 31px;">
									<td
										style="width: 112px; font-size: 16px; padding: 2px 6px 2px 30px;">Name</td>
									<td style="padding: 0 13px 0 13px; font-size: 15px;">${registerModel.user.firstName}
										${registerModel.user.lastName}</td>
								</tr>
								<tr
									style="border-bottom: 1px solid #b9b5b5; background: #f0efef; height: 31px;">
									<td
										style="width: 112px; font-size: 16px; padding: 2px 6px 2px 30px;">Email</td>
									<td style="padding: 0 13px 0 13px; font-size: 15px;">${registerModel.user.email}</td>
								</tr>
								<tr style="border-bottom: 1px solid #b9b5b5; height: 31px;">
									<td
										style="width: 112px; font-size: 16px; padding: 2px 6px 2px 30px;">Contact</td>
									<td style="padding: 0 13px 0 13px; font-size: 15px;">${registerModel.user.contactNumber}</td>
								</tr>
								<tr
									style="border-bottom: 1px solid #b9b5b5; background: #f0efef; height: 31px;">
									<td
										style="width: 112px; font-size: 16px; padding: 2px 6px 2px 30px;">Role</td>
									<td style="padding: 0 13px 0 13px; font-size: 15px;">${registerModel.user.role}</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center;"><a
										style="margin-top: 22px;"
										href="${flowExecutionUrl}&_eventId_personal"
										class="btn btn-primary">Edit</a></td>
								</tr>
							</table>
							<%-- <div class="text-center">
								<h3>
									Name : <strong>${registerModel.user.firstName}
										${registerModel.user.lastName}</strong>
								</h3>
								<h4>
									Email : <strong>${registerModel.user.email}</strong>
								</h4>
								<h4>
									Contact : <strong>${registerModel.user.contactNumber}</strong>
								</h4>
								<h4>
									Role : <strong>${registerModel.user.role}</strong>
								</h4>
								<p>
									<a href="${flowExecutionUrl}&_eventId_personal"
										class="btn btn-primary">Edit</a>
								</p>
							</div> --%>
						</div>

					</div>


				</div>

				<div class="col-sm-6">

					<div class="panel panel-primary"
						style="border-color: #716e6e; box-shadow: 5px 5px 5px #8b8686;">

						<div class="panel-heading"
							style="color: #fff; background-color: #5e5c5c; border-color: #313131;">
							<h4>Billing Address</h4>
						</div>

						<div class="panel-body">
							<div class="text-center">
								<p>${registerModel.billing.addressLineOne},</p>
								<p>${registerModel.billing.addressLineTwo},</p>
								<p>${registerModel.billing.city}-
									${registerModel.billing.postalCode},</p>
								<p>${registerModel.billing.state}</p>
								<p>${registerModel.billing.country}</p>
								<p>
									<a href="${flowExecutionUrl}&_eventId_billing"
										class="btn btn-primary">Edit</a>
								</p>
							</div>
						</div>

					</div>

				</div>

			</div>

			<div class="row">

				<div class="col-sm-4 col-sm-offset-4">

					<div class="text-center">

						<a href="${flowExecutionUrl}&_eventId_submit"
							class="btn btn-lg btn-primary">Confirm</a>

					</div>

				</div>

			</div>
		</div>
	</div>
	<%@include file="../flows-shared/footer1.jsp"%>
</body>