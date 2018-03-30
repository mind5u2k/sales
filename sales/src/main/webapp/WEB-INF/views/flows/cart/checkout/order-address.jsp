<%@include file="../../flows-shared/header1.jsp"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<style>
.addr {
	margin: 10px;
	padding: 7px;
}

.addr:hover {
	box-shadow: 3px 3px 3px #757373;
}
</style>
<div id="main" role="main">
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<div class="pull-left">
					<span
						style="font-size: 20px; border-bottom: 1px solid #313131; padding: 11px;">Select
						Shopping Address</span>
					<c:forEach items="${addresses}" var="address">
						<div class="addr">
							<address style="margin: 0px 0px 7px 0px;">
								<br> <strong>${address.addressLineOne}<br>${address.addressLineTwo}</strong>
								<br> ${address.city} - ${address.postalCode},<br>
								${address.state}-${address.country}
							</address>
							<div>
								<a
									href="${flowExecutionUrl}&_eventId_addressSelection&shippingId=${address.id}"
									class="btn btn-primary">Select</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-7">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Sign Up - Address</h4>
					</div>
					<div class="panel-body">
						<sf:form method="POST" modelAttribute="shipping"
							class="form-horizontal" id="billingForm">
							<div class="form-group">
								<label class="control-label col-md-4" for="addressLineOne">Address
									Line One</label>
								<div class="col-md-8">
									<sf:input type="text" path="addressLineOne"
										class="form-control" placeholder="Enter Address Line One" />
									<sf:errors path="addressLineOne" cssClass="help-block"
										element="em" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-4" for="addressLineTwo">Address
									Line Two</label>
								<div class="col-md-8">
									<sf:input type="text" path="addressLineTwo"
										class="form-control" placeholder="Enter Address Line Two" />
									<sf:errors path="addressLineTwo" cssClass="help-block"
										element="em" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-4" for="city">City</label>
								<div class="col-md-8">
									<sf:input type="text" path="city" class="form-control"
										placeholder="Enter City Name" />
									<sf:errors path="city" cssClass="help-block" element="em" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-4" for="postalCode">Postal
									Code</label>
								<div class="col-md-8">
									<sf:input type="text" path="postalCode" class="form-control"
										placeholder="XXXXXX" />
									<sf:errors path="postalCode" cssClass="help-block" element="em" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-4" for="state">State</label>
								<div class="col-md-8">
									<sf:input type="text" path="state" class="form-control"
										placeholder="Enter State Name" />
									<sf:errors path="state" cssClass="help-block" element="em" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-4" for="country">Country</label>
								<div class="col-md-8">
									<sf:input type="text" path="country" class="form-control"
										placeholder="Enter Country Name" />
									<sf:errors path="country" cssClass="help-block" element="em" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<button type="submit" name="_eventId_saveAddress"
										class="btn btn-primary">
										<span class="glyphicon glyphicon-plus"></span> Add Address
									</button>
								</div>
							</div>
						</sf:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../../flows-shared/footer1.jsp"%>
