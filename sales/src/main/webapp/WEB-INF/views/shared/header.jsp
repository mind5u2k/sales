<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<style>
.login-info {
	display: block;
	font-size: 12px;
	height: 140px;
	color: #fff;
	border: solid transparent;
	border-width: 1px 0;
	box-shadow: inset 1px 1px 0 rgba(0, 0, 0, .1), inset 0 -1px 0
		rgba(0, 0, 0, .07);
	width: 100%;
	margin: 0 !important;
	border-bottom: 1px solid #525151;
}

.minified .login-info {
	height: 38px;
	border-bottom: 1px solid #181818;
	visibility: hidden;
}

.minified .login-info>div {
	display: none;
}
</style>
<header id="header" style="background: #313131 !important;">
	<div id="logo-group">
		<!-- PLACE YOUR LOGO HERE -->
		<span style="color: #fff; font-size: 24px; padding: 10px 0px 0px 9px;"><span
			style="cursor: pointer;"
			onclick="window.location.href='${contextRoot}/home'"
			class="glyphicon glyphicon-book"></span> </span>
		<%-- <span id="logo"> <img style="width: 64px; cursor: pointer;"
			onclick="window.location.href='${contextRoot}/home'"
			src="${images}/ibmlogo.png" alt="SmartAdmin">
		</span> --%>
		<!-- <span id="activity" class="activity-dropdown" style="color: #313131;">
		<i class="fa fa-user"></i>
	</span> -->
		<%-- <div class="ajax-dropdown" style="display: none; height: auto;">
		<div class="btn-group btn-group-justified" data-toggle="buttons">
			<label class="btn btn-default"> <input type="radio"
				name="activity" id="ajax/notify/mail.html">User Info
			</label>
		</div>
		<div class=" "></div>
		<table style="display: table; width: 100%;">
			<tbody>
				<tr style="border-bottom: 1px solid #ccc; background: #eaeaea;">
					<td style="padding: 4px 0px 4px 14px;">Name</td>
					<td style="padding: 4px"><%=session.getAttribute("UserName")%></td>
				</tr>
				<tr style="border-bottom: 1px solid #ccc; background: #f7f6f6;">
					<td style="padding: 4px 0px 4px 14px;">E-Mail</td>
					<td style="padding: 4px"><%=session.getAttribute("mailid")%></td>
				</tr>
				<tr style="border-bottom: 1px solid #ccc; background: #eaeaea;">
					<td style="padding: 4px 0px 4px 14px;">Role</td>
					<td style="padding: 4px"><%=session.getAttribute("ComplianceRole")%></td>
				</tr>
				<tr style="border-bottom: 1px solid #ccc; background: #f7f6f6;">
					<td style="padding: 4px 0px 4px 14px;">Access</td>
					<td style="padding: 4px"><%=session.getAttribute("Access")%></td>
				</tr>
			</tbody>
		</table>
	</div> --%>
	</div>
	<div class="hidden-xs" style="border-left: 1px solid #000;">
		<div style="border-left: 2px solid #4e4d4d; height: 100%;">
			SALES
			<!-- <form action="search.html" class="header-search pull-right">
				<span role="status" aria-live="polite"
					class="ui-helper-hidden-accessible"></span><input id="search-fld"
					type="text" name="param" placeholder="Find reports and more"
					style="min-width: 310px;"
					data-autocomplete="[
					&quot;ActionScript&quot;,
					&quot;AppleScript&quot;,
					&quot;Asp&quot;,
					&quot;BASIC&quot;,
					&quot;C&quot;,
					&quot;C++&quot;,
					&quot;Clojure&quot;,
					&quot;COBOL&quot;,
					&quot;ColdFusion&quot;,
					&quot;Erlang&quot;,
					&quot;Fortran&quot;,
					&quot;Groovy&quot;,
					&quot;Haskell&quot;,
					&quot;Java&quot;,
					&quot;JavaScript&quot;,
					&quot;Lisp&quot;,
					&quot;Perl&quot;,
					&quot;PHP&quot;,
					&quot;Python&quot;,
					&quot;Ruby&quot;,
					&quot;Scala&quot;,
					&quot;Scheme&quot;]"
					class="ui-autocomplete-input" autocomplete="off">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
				<a href="javascript:void(0);" id="cancel-search-js"
					title="Cancel Search"><i class="fa fa-times"></i></a>
			</form> -->
			<!-- <span id="logo" style="color: #fff; font-size: 16px; width: auto;">
			Compliance Dashboard </span> -->
		</div>
	</div>

	<div class="pull-right">

		<!-- collapse menu button -->

		<!-- end collapse menu -->

		<!-- #MOBILE -->
		<!-- Top menu profile link : this shows only when top menu is active -->
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

		<!-- logout button -->
		<div id="logout" class="btn-header transparent pull-right">
			<span> <a href="${contextRoot}/logout" title="Sign Out"
				data-action="userLogout"
				data-logout-msg="You can improve your security further after logging out by closing this opened browser"><i
					class="fa fa-sign-out"></i></a>
			</span>
		</div>

		<div id="hide-menu" class="btn-header pull-right">
			<span> <a href="javascript:void(0);" data-action="toggleMenu"
				title="Collapse Menu"><i class="fa fa-reorder"></i></a>
			</span>
		</div>



		<div id="fullscreen" class="btn-header transparent pull-right">
			<span> <a href="javascript:void(0);"
				data-action="launchFullscreen" title="Full Screen"><i
					class="fa fa-arrows-alt"></i></a>
			</span>
		</div>
	</div>
</header>
<aside id="left-panel" style="background: #464545 !important;">
	<div class="login-info row"
		style="background: linear-gradient(to bottom, #2d2c2c, #797878);">
		<div class="col-sm-12"
			style="padding: 5px 0 5px 0px; text-align: center;">
			<span> <a href="javascript:void(0);" id="show-shortcut"
				data-action="toggleShortcut"> <span>${userModel.fullName}</span>
			</a></span>
		</div>
		<div class="col-sm-12"
			style="padding: 5px 0 5px 0px; text-align: center;">
			<div class="col-sm-6"
				style="padding: 5px 0 5px 0px; text-align: center;">
				<img src="${images}/male.png" alt="me" class=""
					style="width: 65px; border: 0;">
			</div>
			<div class="col-sm-6"
				style="padding: 5px 0 5px 0px; text-align: center;">
				<a class="btn btn-danger" href="#" style="margin: 0;">Profile</a> <a
					class="btn btn-danger" href="#">Profile</a>
			</div>
		</div>
	</div>
	<nav>
		<ul>
			<li id="home"><a href="${contextRoot}/home"><i
					class="fa fa-lg fa-fw fa-home"></i> <span class="menu-item-parent">Home</span></a></li>
			<security:authorize access="hasAuthority('SUPER ADMIN')">
				<li id="users"><a href="${contextRoot}/su/product"><i
						class="fa fa-lg fa-fw fa-user"></i> <span class="menu-item-parent">User</span></a></li>
			</security:authorize>


			<security:authorize access="hasAuthority('ADMIN')">
				<li id="manageProduct"><a href="${contextRoot}/manage/product"><i
						class="fa fa-lg fa-fw fa-reorder"></i> <span
						class="menu-item-parent">Manage Products</span></a></li>

				<li id="about"><a href="${contextRoot}/about"><i
						class="fa fa-lg fa-fw fa-user"></i> <span class="menu-item-parent">About</span></a></li>
				<li id="contact"><a href="${contextRoot}/contact"><i
						class="fa fa-lg fa-fw fa-phone"></i> <span
						class="menu-item-parent">Contact</span></a></li>
				<!-- 	<li id="ComplianceSocrecard"><a href="ComplianceScorecard"><i
					class="fa fa-lg fa-fw fa-sitemap"></i> <span
					class="menu-item-parent">Categories</span></a></li> -->
				<li id="listProducts"><a
					href="${contextRoot}/show/all/products"><i
						class="fa fa-lg fa-fw fa-laptop"></i> <span
						class="menu-item-parent">Products</span></a></li>
			</security:authorize>

			<li><div class="minifyme"
					style="background: rgb(123, 120, 120); position: unset; text-align: center; font-size: 24px; padding: 6px 1px 31px; margin-top: 17px; cursor: pointer; width: 100%;"
					data-action="minifyMenu">
					<i class="fa fa-arrow-circle-left hit"></i>
				</div></li>

		</ul>
	</nav>
</aside>