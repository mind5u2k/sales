<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/shopping/css" />
<spring:url var="js" value="/resources/shopping/js" />
<spring:url var="images" value="/resources/shopping/img" />
<spring:url var="fonts" value="/resources/shopping/fonts" />

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
<style>
.help-block {
	display: block;
	margin-top: 5px;
	margin-bottom: 10px;
	color: #c91818;
}
</style>
</head>

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Online Shopping - Membership</title>

<script>
	window.contextRoot = '${contextRoot}'
</script>

<!-- Bootstrap Core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Readable Theme -->
<link href="${css}/bootstrap-readable-theme.css" rel="stylesheet">


<!-- Bootstrap DataTables -->
<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">


<!-- Custom CSS -->
<link href="${css}/myapp.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head> --%>

<body
	class="desktop-detected menu-on-top voice-command-active service-not-allowed pace-done fixed-header fixed-navigation">
	<header id="header" style="background: #313131 !important;">
		<div id="logo-group">
			<span id="logo"> <img style="width: 64px; cursor: pointer;"
				onclick="window.location.href='${contextRoot}/home'"
				src="${images}/ibmlogo.png" alt="SmartAdmin">
			</span>
		</div>
		<div class="hidden-xs" style="border-left: 1px solid #000;"></div>
		<div class="pull-right">
			<ul id="mobile-profile-img"
				class="header-dropdown-list hidden-xs padding-5">
				<li class=""><a href="#"
					class="dropdown-toggle no-margin userdropdown"
					data-toggle="dropdown"> </a>
					<ul class="dropdown-menu pull-right">
						<li><a href="javascript:void(0);"
							class="padding-10 padding-top-0 padding-bottom-0"><i
								class="fa fa-cog"></i> Setting</a></li>
						<li class="divider"></li>
						<li><a href="profile.html"
							class="padding-10 padding-top-0 padding-bottom-0"> <i
								class="fa fa-user"></i> <u>P</u>rofile
						</a></li>
						<li class="divider"></li>
						<li><a href="javascript:void(0);"
							class="padding-10 padding-top-0 padding-bottom-0"
							data-action="toggleShortcut"><i class="fa fa-arrow-down"></i>
								<u>S</u>hortcut</a></li>
						<li class="divider"></li>
						<li><a href="javascript:void(0);"
							class="padding-10 padding-top-0 padding-bottom-0"
							data-action="launchFullscreen"><i class="fa fa-arrows-alt"></i>
								Full <u>S</u>creen</a></li>
						<li class="divider"></li>
						<li><a href="${contextPath}/logout"
							class="padding-10 padding-top-5 padding-bottom-5"
							data-action="userLogout"><i class="fa fa-sign-out fa-lg"></i>
								<strong><u>L</u>ogout</strong></a></li>
					</ul></li>
			</ul>

			<div id="hide-menu" class="btn-header pull-right">
				<span> <a href="javascript:void(0);" data-action="toggleMenu"
					title="Collapse Menu"><i class="fa fa-reorder"></i></a>
				</span>
			</div>

			<!-- logout button -->
			<div id="logout" class="btn-header transparent pull-right">
				<span> <a href="${contextPath}/logout.jsp" title="Sign Out"
					data-action="userLogout"
					data-logout-msg="You can improve your security further after logging out by closing this opened browser"><i
						class="fa fa-sign-out"></i></a>
				</span>
			</div>
			<div id="fullscreen" class="pull-right">
				<span> <a href="${contextRoot}/login" title="Full Screen"><span
						id="logo"
						style="color: #fff; font-size: 16px; width: auto; margin-top: 10px;">Login</span></a>
				</span>
			</div>
			<div id="fullscreen" class="pull-right">
				<span> <span id="logo"
					style="color: #fff; font-size: 13px; width: auto; border-right: 1px solid #fff; padding-right: 12px;">Already
						Registered ?</span>
				</span>
			</div>
		</div>
	</header>

	<div id="main" role="main" style="margin-top: 24px !important;">
		<div class="container" style="min-height: 650px;">
			<div class="alert alert-success" style="text-align: center;">
				!! Your Order is Confirmed !!</div>
			<div class="row" style="padding: 10px; background: #fff;">
				<div class="col-xs-12">
					<div class="row"
						style="border-bottom: 1px solid #ccc; margin-bottom: 17px;">
						<div class="col-xs-6">
							<span class="font-400">invoice</span>
						</div>
						<div class="col-xs-6">
							<span class="pull-right"
								style="font-size: 22px; padding-top: 28px;">Invoice No. #
								${orderDetail.id}</span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6">
							<address>
								<strong>Billed To:</strong><br>
								${orderDetail.user.firstName} ${orderDetail.user.lastName}<br>
								${orderDetail.billing.addressLineOne}<br>
								${orderDetail.billing.addressLineTwo}<br>
								${orderDetail.billing.city} - ${orderDetail.billing.postalCode}<br>
								${orderDetail.billing.state} - ${orderDetail.billing.country}
							</address>
						</div>
						<div class="col-xs-6 text-right">
							<address>
								<strong>Shipped To:</strong><br>
								${orderDetail.user.firstName} ${orderDetail.user.lastName}<br>
								${orderDetail.shipping.addressLineOne}<br>
								${orderDetail.shipping.addressLineTwo}<br>
								${orderDetail.shipping.city} -
								${orderDetail.shipping.postalCode}<br>
								${orderDetail.shipping.state} - ${orderDetail.shipping.country}
							</address>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6">
							<address>
								<strong>Payment Method:</strong><br> Card Payment <br>
								${orderDetail.user.email}
							</address>
						</div>
						<div class="col-xs-6 text-right">
							<address>
								<strong>Order Date:</strong><br> ${orderDetail.orderDate}<br>
								<br>
							</address>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="panel panel-default" style="border: 0;">
						<div class="panel-body no-padding">
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th class="text-center">QTY</th>
											<th>ITEM</th>
											<th>DESCRIPTION</th>
											<th>PRICE</th>
											<th>SUBTOTAL</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${orderDetail.orderItems}" var="orderItem">
											<tr>
												<td class="text-center"><strong>${orderItem.productCount}</strong></td>
												<td><a href="javascript:void(0);">${orderItem.product.name}</a></td>
												<td>${orderItem.product.name}</td>
												<td><i class="fa fa-rupee text-success"></i>
													${orderItem.product.unitPrice}</td>
												<td><i class="fa fa-rupee"></i> ${orderItem.total}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<%-- <div class="invoice-sum-total pull-right">
								<h3>
									<strong>Total: <span class="text-success"><i
											class="fa fa-rupee"></i> ${orderDetail.orderTotal} USD</span></strong>
								</h3>
							</div> --%>
						</div>
					</div>
				</div>

				<div class="row">

					<div class="col-sm-7">
						<div class="payment-methods">
							<h5>Payment Methods</h5>
							<img src="${images}/invoice/paypal.png" width="64" height="64"
								alt="paypal"> <img
								src="${images}/invoice/americanexpress.png" width="64"
								height="64" alt="american express"> <img
								src="${images}/invoice/mastercard.png" width="64" height="64"
								alt="mastercard"> <img src="${images}/invoice/visa.png"
								width="64" height="64" alt="visa">
						</div>
					</div>
					<div class="col-sm-5">
						<div class="invoice-sum-total pull-right">
							<h3>
								<strong>Total: <span class="text-success"><i
										class="fa fa-rupee"></i> ${orderDetail.orderTotal} USD</span></strong>
							</h3>
						</div>
					</div>

				</div>
			</div>
			<div class="text-center" style="padding: 32px;">
				<a href="${contextRoot}/show/all/products"
					class="btn btn-lg btn-warning">Continue Shopping</a>
			</div>
		</div>
		<%@include file="../../flows-shared/footer1.jsp"%>
	</div>
	<script src="${js}/app.config.js"></script>
	<script src="${js}/bootstrap/bootstrap.min.js"></script>
	<script src="${js}/notification/SmartNotification.min.js"></script>
	<script src="${js}/plugin/jquery-validate/jquery.validate.min.js"></script>
	<script src="${js}/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>
	<script src="${js}/app.min.js"></script>
	<script src="${js}/plugin/bootstrapvalidator/bootstrapValidator.min.js"></script>
	<script src="${contextPath}/comDash/complianceDashMyApp.js"></script>
	<script src="${js}/myapp.js"></script>
</body>
</html>