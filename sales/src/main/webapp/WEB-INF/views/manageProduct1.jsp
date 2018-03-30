<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<style>
.help-block {
	display: block;
	margin-top: 5px;
	margin-bottom: 10px;
	color: #c71010;
}

.panel-teal:hover {
	box-shadow: 6px 6px 7px #6e7171;
}

.onoffswitch {
	position: relative;
	width: 80px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	margin-top: 3px;
	margin-bottom: 3px;
	margin-left: 5px;
	display: inline-block;
	vertical-align: middle;
}

.onoffswitch-switch {
	width: 19px;
	height: 19px;
	margin: -2px;
	background: #fff;
	border: 1px solid #9a9a9a;
	border-radius: 50px;
	position: absolute;
	top: 0;
	bottom: 0;
	right: 62px;
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
	background-color: #f4f4f4;
	background-image: -moz-linear-gradient(top, #fff, #eee);
	background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#fff),
		to(#eee));
	background-image: -webkit-linear-gradient(top, #fff, #eee);
	background-image: -o-linear-gradient(top, #fff, #eee);
	background-image: linear-gradient(to bottom, #fff, #eee);
	background-repeat: repeat-x;
	-webkit-box-shadow: 1px 1px 4px 0 rgba(0, 0, 0, .3);
	box-shadow: 1px 1px 4px 0 rgba(0, 0, 0, .3);
}
</style>
<div id="content">
	<div class="row">
		<div class="col-sm-12 col-md-12 col-lg-12">
			<div class="containerPanel" style="padding-top: 25px;">
				<c:if test="${not empty message}">
					<div class="row">
						<div class="col-xs-12 col-md-offset-2 col-md-8">
							<div class="alert alert-success fade in">${message}</div>
						</div>
					</div>
				</c:if>
				<div class="row">
					<div class="col-md-offset-3 col-md-6">
						<div class="panel panel-primary"
							style="border-color: #464545; box-shadow: 6px 6px 6px #a29e9e;">
							<div class="panel-heading"
								style="background: #666565; border-color: #464545;">
								<h4>Product Management</h4>
							</div>
							<div class="panel-body">
								<sf:form class="form-horizontal" modelAttribute="product"
									action="${contextRoot}/manage/product" method="POST"
									enctype="multipart/form-data">
									<div class="form-group">
										<label class="control-label col-md-4">Name</label>
										<div class="col-md-8">
											<sf:input type="text" path="name" class="form-control"
												placeholder="Product Name" />
											<sf:errors path="name" cssClass="help-block" element="em" />
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-4">Brand</label>
										<div class="col-md-8">
											<sf:input type="text" path="brand" class="form-control"
												placeholder="Brand Name" />
											<sf:errors path="brand" cssClass="help-block" element="em" />
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-4">Description</label>
										<div class="col-md-8">
											<sf:textarea path="description" class="form-control"
												placeholder="Enter your description here!" />
											<sf:errors path="description" cssClass="help-block"
												element="em" />
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-4">Unit Price</label>
										<div class="col-md-8">
											<sf:input type="number" path="unitPrice" class="form-control"
												placeholder="Enter Unit Price" />
											<sf:errors path="unitPrice" cssClass="help-block"
												element="em" />
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-4">Quantity</label>
										<div class="col-md-8">
											<sf:input type="number" path="quantity" class="form-control"
												placeholder="Enter Quantity" />
											<sf:errors path="quantity" cssClass="help-block" element="em" />
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-4">Upload a file</label>
										<div class="col-md-8">
											<sf:input type="file" path="file" class="form-control" />
											<sf:errors path="file" cssClass="help-block" element="em" />
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-4">Category</label>
										<div class="col-md-8">
											<sf:select path="categoryId" items="${categories}"
												itemLabel="name" itemValue="id" class="form-control" />
											<div class="text-right">
												<br />
												<sf:hidden path="id" />
												<sf:hidden path="code" />
												<sf:hidden path="supplierId" />
												<sf:hidden path="active" />
												<button type="button" class="btn btn-warning"
													data-toggle="modal" data-target="#myCategoryModal">Add
													New Category</button>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-offset-4 col-md-4">
											<input type="submit" name="submit" value="Save Or Update"
												class="btn btn-primary" />
										</div>
									</div>
								</sf:form>
							</div>
						</div>
					</div>
				</div>
				<div class="modal fade" id="myCategoryModal" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header"
								style="padding: 11px 27px; background: #514f4f; color: #fff;">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">New Category</h4>
							</div>
							<div class="modal-body">
								<sf:form id="categoryForm" class="form-horizontal"
									modelAttribute="category"
									action="${contextRoot}/manage/category" method="POST">
									<div class="form-group">
										<label class="control-label col-md-4">Name</label>
										<div class="col-md-8 validate">
											<sf:input type="text" path="name" class="form-control"
												placeholder="Category Name" />
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-4">Description</label>
										<div class="col-md-8 validate">
											<sf:textarea path="description" class="form-control"
												placeholder="Enter category description here!" />
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-offset-4 col-md-4">
											<input type="submit" name="submit" value="Save"
												class="btn btn-primary" />
										</div>
									</div>
								</sf:form>
							</div>
						</div>
					</div>
				</div>
				<hr />
				<hr />
				<div class="row">
					<div class="col-sm-12 col-md-12 col-lg-12">
						<div class="jarviswidget" id="wid-id-5"
							data-widget-colorbutton="false" data-widget-editbutton="false"
							data-widget-fullscreenbutton="false"
							data-widget-custombutton="false" data-widget-sortable="false"
							role="widget">
							<div role="content" style="border-top: 1px solid #ccc;">
								<div class="jarviswidget-editbox"></div>
								<div class="widget-body">
									<h1 style="margin-bottom: 31px;">Available Products...</h1>
									<div class="row">
										<div class="col-sm-12">
											<div class="row">
												<c:forEach items="${products}" var="pro">
													<div class="col-xs-12 col-sm-6 col-md-3">
														<div class="panel panel-teal pricing-big">

															<div class="panel-heading" style="padding: 2px 2px;">
																<h3 class="panel-title" style="padding: 0;">
																	<img
																		style="width: 100%; height: 171px; border-radius: 2px;"
																		src="${img}/${pro.code}.jpg">
																</h3>
															</div>
															<div class="panel-body no-padding text-align-center">
																<div class="the-price"
																	style="background: #464545; padding: 0px 9px 6px 9px;">
																	<span style="font-size: 15px; font-weight: 100;">${pro.name}</span>
																</div>
																<div class="price-features"
																	style="min-height: 0; background: #e8e7e7; border: 1px solid #464545; padding-bottom: 0; padding: 0;">
																	<ul class="list-unstyled text-left"
																		style="text-align: center !important; padding: 13px 12px 2px 12px;">
																		<li class="text-success">Price - <strong>
																				just <i class="fa fa-rupee text-success"></i>
																				${pro.unitPrice}
																		</strong></li>
																		<li>Qty Available : <strong>
																				${pro.quantity}</strong> <i class="fa fa-check text-success"></i>
																		</li>
																	</ul>
																	<div class="row"
																		style="padding: 11px 0px; background: #969595; margin: 0;">
																		<div class="col-sm-6">
																			<span class="onoffswitch"> <c:if
																					test="${pro.active == true }">
																					<input type="checkbox" name="start_interval"
																						value="${pro.id}" class="onoffswitch-checkbox"
																						id="start_interval" checked="checked">
																				</c:if> <c:if test="${pro.active == false }">
																					<input type="checkbox" name="start_interval"
																						value="${pro.id}" class="onoffswitch-checkbox"
																						id="start_interval">
																				</c:if> <label class="onoffswitch-label"
																				for="start_interval"> <span
																					class="onoffswitch-inner" data-swchon-text="ACTIVE"
																					data-swchoff-text="INACTIVE"></span> <span
																					class="onoffswitch-switch"></span>
																			</label>
																			</span>
																		</div>
																		<div class="col-sm-6">
																			<a href="${contextRoot}/manage/${pro.id}/product"
																				class="btn btn-primary">Edit Product </a>
																		</div>
																	</div>
																	<%-- <div>
																		<span class="onoffswitch"> <input
																			type="checkbox" name="start_interval"
																			class="onoffswitch-checkbox" id="start_interval">
																			<label class="onoffswitch-label" for="start_interval">
																				<span class="onoffswitch-inner"
																				data-swchon-text="ACTIVE"
																				data-swchoff-text="INACTIVE"></span> <span
																				class="onoffswitch-switch"></span>
																		</label>
																		</span>
																	</div>
																	<div>
																		<a href="${contextRoot}/manage/${pro.id}/product"
																			class="btn btn-primary">Edit Product </a>
																	</div> --%>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$('.onoffswitch-checkbox')
			.on(
					'change',
					function() {
						var id = this.value;
						var checked = this.checked;
						var checkbox = $(this);
						var dText = (this.checked) ? 'You want to activate the Product?'
								: 'You want to de-activate the Product?';
						$
								.SmartMessageBox(
										{
											title : "!! Attention Please !!",
											content : dText,
											buttons : '[No][Yes]'
										},
										function(ButtonPressed) {
											if (ButtonPressed === "Yes") {
												$
														.ajax({
															type : 'GET',
															url : window.contextRoot
																	+ '/manage/product/'
																	+ id
																	+ '/activation',
															timeout : 100000,
															success : function(
																	data) {
																$
																		.smallBox({
																			title : "Response Action",
																			content : "<i class='fa fa-clock-o'></i> <i>"
																					+ data
																					+ "</i>",
																			color : "#30681f",
																			iconSmall : "fa fa-times fa-2x fadeInRight animated",
																			timeout : 4000
																		});
															},
															error : function(e) {
																bootbox
																		.alert('ERROR: '
																				+ e);
																//display(e);
															}
														});
											}
											if (ButtonPressed === "No") {
												checkbox.prop('checked',
														!checked);
												$
														.smallBox({
															title : "Response Action",
															content : "<i class='fa fa-clock-o'></i> <i>You pressed No...</i>",
															color : "#792625",
															iconSmall : "fa fa-times fa-2x fadeInRight animated",
															timeout : 4000
														});
											}

										});
					});
</script>