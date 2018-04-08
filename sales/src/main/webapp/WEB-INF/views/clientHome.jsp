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
		<article class="col-lg-3 sortable-grid ui-sortable"></article>
		<article class="col-lg-6 sortable-grid ui-sortable">
			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget jarviswidget-sortable" id="wid-id-0"
				role="widget">
				<header role="heading">
					<h2>
						<strong>Summary</strong>
					</h2>
				</header>
				<div role="content">
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body">
						<div class="row">
							<div class="col-lg-8" style="padding: 15px; font-size: 21px;">
								<span class="page-title txt-color-blueDark"> <i
									class="fa-fw fa fa-home"></i> My Products
								</span> <a href="#" class="dropdown-toggle" data-toggle="dropdown"
									aria-expanded="true"
									style="font-size: 16px; padding: 10px 9px 9px 9px; border: 1px solid #7ba0c9; margin-left: 17px; box-shadow: 3px 3px 3px #679edc;">Large
									Dropdown <b class="caret"></b>
								</a>

								<ul class="dropdown-menu dropdown-menu-large row"
									style="margin: 0px 0px 0 185px;">
									<li class="col-sm-12">
										<ul>
											<li class="dropdown-header">Glyphicons</li>
											<li><a href="javascript:void(0);">Available glyphs</a></li>
											<li class="disabled"><a href="javascript:void(0);">How
													to use</a></li>
											<li><a href="javascript:void(0);">Examples</a></li>
											<li class="divider"></li>
											<li class="dropdown-header">Dropdowns</li>
											<li><a href="javascript:void(0);">Example</a></li>
											<li><a href="javascript:void(0);">Aligninment
													options</a></li>
											<li><a href="javascript:void(0);">Headers</a></li>
											<li><a href="javascript:void(0);">Disabled menu
													items</a></li>
										</ul>
									</li>
								</ul>
							</div>
							<div class="col-lg-4"
								style="padding: 15px; font-size: 18px; text-align: right;">Status
								- Trail</div>
						</div>
						<div class="row" style="padding: 15px; text-align: center;">
							<!-- <div class="col-lg-3"
								style="font-size: 81px; padding: 0 0 0 0; text-align: center; border-right: 1px solid #ccc; color: #6a6464; margin-top: 19px;">
								<i class="fa fa-cubes"></i>
							</div> -->
							<div class="col-lg-12" style="padding: 15px;">
								<span style="font-size: 18px; text-decoration: underline;">Statement
									Overview</span>
							</div>
							<div class="col-lg-6" style="padding: 6px;">
								!! You are in Trail Period !!<br>Please purchase the
								product
							</div>
							<div class="col-lg-6" style="padding: 6px;">
								Start Date : 13th Mar 2018<br>End Date : 16th Mar 2018
							</div>
							<div class="col-lg-12" style="padding: 6px;">
								<button class="btn btn-default">Extension Approval</button>
								<button class="btn btn-default"
									onclick="window.location.href='clientPaymentDeatils'">Pay
									Now</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
		<article class="col-lg-3 sortable-grid ui-sortable"></article>
		<div class="col-lg-12"
			style="text-align: center; padding: 0 0 19px 0px; font-size: 20px;">Your
			account summary as on 07 Apr 2018</div>
		<article class="col-lg-6 sortable-grid ui-sortable">
			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget jarviswidget-sortable" id="wid-id-0"
				role="widget" style="border-top: 1px solid #ccc;">
				<div role="content">
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body">
						<div class="row">
							<div class="col-lg-8" style="padding: 15px; font-size: 21px;">
								<span class="page-title txt-color-blueDark"> <i
									class="fa-fw fa fa-home"></i> Current Outstanding
								</span>
							</div>
							<div class="col-lg-4"
								style="padding: 15px; font-size: 18px; text-align: right;">Status
								- Trail</div>
						</div>
						<div class="row" style="padding: 0px; text-align: center;">

							<div class="col-lg-6" style="padding: 6px;">
								Total<br>12222
							</div>
							<div class="col-lg-6" style="padding: 6px;">
								Unbilled<br>12232
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
		<article class="col-lg-6 sortable-grid ui-sortable">
			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget jarviswidget-sortable" id="wid-id-0"
				role="widget" style="border-top: 1px solid #ccc;">
				<div role="content">
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body">
						<div class="row">
							<div class="col-lg-8" style="padding: 15px; font-size: 21px;">
								<span class="page-title txt-color-blueDark"> <i
									class="fa-fw fa fa-home"></i> Current Outstanding
								</span>
							</div>
							<div class="col-lg-4"
								style="padding: 15px; font-size: 18px; text-align: right;">Status
								- Trail</div>
						</div>
						<div class="row" style="padding: 0px; text-align: center;">

							<div class="col-lg-6" style="padding: 6px;">
								Total<br>12222
							</div>
							<div class="col-lg-6" style="padding: 6px;">
								Unbilled<br>12232
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
	</div>
</div>
