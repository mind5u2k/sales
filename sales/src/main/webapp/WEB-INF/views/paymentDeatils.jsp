<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div id="ribbon">
	<ol class="breadcrumb">
		<li>Client Home</li>
	</ol>
</div>
<div id="content">
	<div class="row">
		<article class="col-lg-12 sortable-grid ui-sortable">
			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget jarviswidget-sortable" id="wid-id-0"
				role="widget">
				<header role="heading">
					<h2>
						<strong>Payment Details</strong>
					</h2>
				</header>
				<div role="content">
					<div class="widget-body no-padding">
						<div class="row">
							<div class="col-lg-6">
								<h1 style="text-align: center;">Product Details</h1>
								<div class="padding-10">
									<table class="table table-hover"
										style="border: 1px solid #9a8e8e; box-shadow: 4px 4px 4px #464545;">
										<tbody>
											<tr>
												<td style="border: 0;"><strong>product</strong></td>
												<td style="border: 0;"><a href="javascript:void(0);">Print
														and Web Logo Design</a></td>

											</tr>
											<tr>
												<td><strong>Description</strong></td>
												<td>Perspiciatis unde omnis iste natus error sit
													voluptatem accusantium doloremque laudantium totam rem
													aperiam xplicabo.</td>
											</tr>
											<tr>
												<td><strong>Patment Duration</strong></td>
												<td><form id="checkout-form"
														class="smart-form pull-left" novalidate="novalidate">
														<label class="select"> <select name="country">
																<option value="0" selected="" disabled="">Country</option>
																<option value="244">Aaland Islands</option>
																<option value="1">Afghanistan</option>
																<option value="2">Albania</option>
																<option value="3">Algeria</option>
																<option value="4">American Samoa</option>
																<option value="5">Andorra</option>
																<option value="6">Angola</option>
														</select> <i></i>
														</label>
													</form>
													<button class="btn btn-default" style="margin-left: 10px;">Update</button></td>
											</tr>
											<tr>
												<td><strong>Start Date</strong></td>
												<td></td>
											</tr>
											<tr>
												<td><strong>End Date</strong></td>
												<td></td>
											</tr>
											<tr>
												<td><strong>Price</strong></td>
												<td><strong>$4,400.00</strong></td>
											</tr>
											<tr>
												<td><strong>HST/GST</strong></td>
												<td><strong>13%</strong></td>
											</tr>
										</tbody>
									</table>


								</div>
							</div>
							<div class="col-lg-6">
								<h1 style="text-align: center;">Client Details</h1>
								<div class="padding-10">
									<table class="table table-hover"
										style="border: 1px solid #9a8e8e; box-shadow: 4px 4px 4px #464545;">
										<tbody>
											<tr>
												<td style="border: 0;"><strong>Company</strong></td>
												<td style="border: 0;"><a href="javascript:void(0);">Print
														and Web Logo Design</a></td>

											</tr>
											<tr>
												<td><strong>Person</strong></td>
												<td>Anurag Ghosh</td>
											</tr>
											<tr>
												<td><strong>Contact</strong></td>
												<td>+91 8171908867</td>
											</tr>
											<tr>
												<td><strong>Email</strong></td>
												<td>anurag.ghosh.1014@gmail.com</td>
											</tr>
											<tr>
												<td><strong>Address</strong></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="invoice-footer">
							<div class="row">
								<div class="col-sm-12">
									<div class="invoice-sum-total" style="text-align: center;">
										<h3>
											<strong>Total Due: <span class="text-success">$4,972
													USD</span></strong>
										</h3>
									</div>
								</div>
							</div>
						</div>
						<div class="text-center" style="padding: 32px;">
							<a href="${contextRoot}/cl/clientPaymentConfirmation"
								class="btn btn-primary">Continue</a> <a
								href="${contextRoot}/cl/home" class="btn btn-danger">Cancel</a>
						</div>
					</div>

				</div>
			</div>
		</article>
	</div>
</div>
