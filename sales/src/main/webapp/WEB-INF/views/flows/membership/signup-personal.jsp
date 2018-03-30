<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<%-- <%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%> --%>


<%@include file="../flows-shared/header1.jsp"%>
<div id="main" role="main">

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-primary"
					style="border-color: #716e6e; box-shadow: 5px 5px 5px #8b8686;">
					<div class="panel-heading"
						style="color: #fff; background-color: #5e5c5c; border-color: #313131;">
						<h4>Sign Up - Personal</h4>
					</div>

					<div class="panel-body">

						<sf:form method="POST" modelAttribute="user"
							class="form-horizontal" id="registerForm">


							<div class="form-group">
								<label class="control-label col-md-4">First Name</label>
								<div class="col-md-8">
									<sf:input type="text" path="firstName" class="form-control"
										placeholder="First Name" />
									<sf:errors path="firstName" cssClass="help-block" element="em" />
								</div>
							</div>


							<div class="form-group">
								<label class="control-label col-md-4">Last Name</label>
								<div class="col-md-8">
									<sf:input type="text" path="lastName" class="form-control"
										placeholder="Last Name" />
									<sf:errors path="lastName" cssClass="help-block" element="em" />
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4">Email</label>
								<div class="col-md-8">
									<sf:input type="text" path="email" class="form-control"
										placeholder="abc@zyx.com" />
									<sf:errors path="email" cssClass="help-block" element="em" />
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4">Contact Number</label>
								<div class="col-md-8">
									<sf:input type="text" path="contactNumber" class="form-control"
										placeholder="XXXXXXXXXX" maxlength="10" />
									<sf:errors path="contactNumber" cssClass="help-block"
										element="em" />
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4">Password</label>
								<div class="col-md-8">
									<sf:input type="password" path="password" class="form-control"
										placeholder="Password" />
									<sf:errors path="password" cssClass="help-block" element="em" />
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4">Confirm Password</label>
								<div class="col-md-8">
									<sf:input type="password" path="confirmPassword"
										class="form-control" placeholder="Re-type password" />
									<sf:errors path="confirmPassword" cssClass="help-block"
										element="em" />
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4">Select Role</label>
								<div class="col-md-8">
									<label class="radio-inline"> <sf:radiobutton
											path="role" value="USER" checked="checked" /> User
									</label> <label class="radio-inline"> <sf:radiobutton
											path="role" value="SUPPLIER" /> Supplier
									</label>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<button type="submit" name="_eventId_billing"
										class="btn btn-primary">
										Next - Billing <span class="glyphicon glyphicon-chevron-right"></span>
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
<%@include file="../flows-shared/footer1.jsp"%>
</body>