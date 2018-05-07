<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/shopping/css" />
<spring:url var="js" value="/resources/shopping/js" />
<spring:url var="images" value="/resources/shopping/img" />
<spring:url var="fonts" value="/resources/shopping/fonts" />
<spring:url var="img" value="/resources/images" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Online Shopping Website Using Spring MVC and Hibernate">
<meta name="author" content="Khozema Nullwala">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>Online Shopping - ${title}</title>

<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}'
</script>

<link rel="stylesheet" type="text/css" media="screen"
	href="${css}/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${css}/font-awesome.min.css">

<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
<link rel="stylesheet" type="text/css" media="screen"
	href="${css}/smartadmin-production-plugins.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${css}/smartadmin-production.min.css">
<script src="${js}/libs/jquery-2.1.1.min.js"></script>
<script src="${js}/libs/jquery-ui-1.10.3.min.js"></script>
</head>
<body
	class="desktop-detected voice-command-active service-not-allowed pace-done fixed-header fixed-navigation">
	<%@include file="./shared/header.jsp"%>
	<div id="main" role="main">
		<c:if test="${userClickProfilePage == true }">
			<%@include file="editProfilePage.jsp"%>
		</c:if>
		<c:if test="${userClickUpdatePassword == true }">
			<%@include file="updatePassword.jsp"%>
		</c:if>
		<c:if test="${userClickSuperAdminHome == true }">
			<%@include file="superAdminHome.jsp"%>
		</c:if>
		<c:if test="${userClickAdminHome == true }">
			<%@include file="adminHome.jsp"%>
		</c:if>
		<c:if test="${userClickSalesManagerHome == true }">
			<%@include file="salesManagerHome.jsp"%>
		</c:if>
		<c:if test="${userClickSalesOrganizerHome == true }">
			<%@include file="salesOrganizerHome.jsp"%>
		</c:if>
		<c:if test="${userClickSalesRepresentativeHome == true }">
			<%@include file="salesRepresentativeHome.jsp"%>
		</c:if>
		<c:if test="${userClickClientHome == true }">
			<%@include file="clientHome.jsp"%>
		</c:if>
		<c:if test="${userClickClientActiveHome == true }">
			<%@include file="clientActiveHome.jsp"%>
		</c:if>
		<c:if test="${userClinkClinetHomeAssigned == true }">
			<%@include file="clientHomeAssigned.jsp"%>
		</c:if>
		<c:if test="${userClickClientTrialOver == true }">
			<%@include file="clientTrialOver.jsp"%>
		</c:if>
		<c:if test="${userClickClientOverDue == true }">
			<%@include file="clientDueDateOver.jsp"%>
		</c:if>
		<c:if test="${userClickUserManagement == true }">
			<%@include file="user.jsp"%>
		</c:if>
		<c:if test="${userClickSaledManagerManagement == true }">
			<%@include file="salesManager.jsp"%>
		</c:if>
		<c:if test="${userClickSaledOrganizerManagement == true }">
			<%@include file="salesOrganizer.jsp"%>
		</c:if>
		<c:if test="${userClickSaledRepresentativeManagement == true }">
			<%@include file="salesRepresentatives.jsp"%>
		</c:if>
		<c:if test="${userClickAssignProductManagementHome == true }">
			<%@include file="assignProducts.jsp"%>
		</c:if>
		<c:if test="${userClickClientsManagement == true }">
			<%@include file="clients.jsp"%>
		</c:if>
		<c:if test="${userClickProductManagement == true }">
			<%@include file="products.jsp"%>
		</c:if>
		<c:if test="${userClickClientPaymentDetails == true }">
			<%@include file="paymentDeatils.jsp"%>
		</c:if>
		<c:if test="${userClickClientPaymentConfirmation == true }">
			<%@include file="paymentConfirmation.jsp"%>
		</c:if>
		<c:if test="${userClickClientCheckoutform == true }">
			<%@include file="checkout.jsp"%>
		</c:if>
		<c:if test="${userClickClientCheckoutConfirmationform == true }">
			<%@include file="checkoutConfirmation.jsp"%>
		</c:if>
		<c:if test="${userClickPaymentHistory == true }">
			<%@include file="paymentHistoryClient.jsp"%>
		</c:if>
	</div>
	<%@include file="./shared/footer.jsp"%>

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
	<script src="${js}/myapp.js"></script>
</body>
</html>