<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.menu-on-top .a.active>a {
	font-weight: 700 !important;
	background: #eae8e8 !important;
	box-shadow: -3px 0px 0px #57889c !important;
}

.panel-success:hover {
	box-shadow: 4px 3px 8px #457531;
}

.panel-body:after {
	content: none;
}
</style>
<div id="content">
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

						<div class="row">
							<div class="col-sm-2">
								<div class="col-xs-12 col-sm-12 col-md-12">
									<h3
										style="margin-top: 0; margin-bottom: 0; border-bottom: 0px solid #7b7979; padding: 0px 12px 11px 13px;">Categories
										....</h3>
								</div>
								<div class=" ">
									<ul class="nav nav-tabs tabs-left" id="demo-pill-nav">
										<c:forEach items="${categories}" var="cat">
											<c:set var="i" value="${i+1}" scope="page" />
											<c:if test="${cat.id == category.id}">
												<li class="a active" style="width: 100%;"
													onclick="updatePanel('${cat.id}');"><a
													href="javascript:void(0)" style="cursor: pointer;"
													data-toggle="tab"><span
														class="badge bg-color-blue txt-color-white">${i}</span>
														${cat.name} </a></li>
											</c:if>
											<c:if test="${cat.id != category.id}">
												<li class="a" style="width: 100%;"
													onclick="updatePanel('${cat.id}');"><a
													href="javascript:void(0)" style="cursor: pointer;"
													data-toggle="tab"><span
														class="badge bg-color-blue txt-color-white">${i}</span>
														${cat.name} </a></li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="col-sm-10" id="allProducts">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12">
										<h3
											style="margin-top: 0; margin-bottom: 0; border-bottom: 0px solid #7b7979; padding: 0px 12px 11px 13px;">${category.name}
											....</h3>
									</div>
									<c:forEach items="${products}" var="pro">
										<div class="col-xs-12 col-sm-6 col-md-3">
											<div class="panel panel-success pricing-big">
												<div class="panel-heading"
													style="padding: 0 8px 0px 8px; border: 0; background: #fff; text-align: center; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
													<span class="panel-title"
														style="padding: 13px 0 7px 0; font-weight: 100; font-size: 17px;">${pro.name}</span>
												</div>
												<div class="panel-heading"
													style="padding: 2px 2px; border: 0; background: #fff;">
													<h3 class="panel-title" style="padding: 0;">
														<img
															style="width: 100%; height: 220px; border-radius: 2px;"
															src="${img}/${pro.code}.jpg">
													</h3>
												</div>
												<div class="panel-body no-padding text-align-center">
													<div class="price-features"
														style="min-height: 0; background: #fff; padding-bottom: 0; padding: 0;">
														<ul class="list-unstyled text-left"
															style="text-align: center !important; padding: 13px 12px 2px 12px;">
															<li class="text-success">Price - <strong>
																	just <i class="fa fa-rupee text-success"></i>
																	${pro.unitPrice}
															</strong></li>
															<c:choose>
																<c:when test="${pro.quantity < 1}">
																	<li style="margin-top: 2px; color: red;">!! Out of
																		Stock !!</li>
																</c:when>
																<c:otherwise>
																	<li style="margin-top: 2px;">Qty Available : <strong>
																			${pro.quantity}</strong> <i class="fa fa-check text-success"></i>
																	</li>
																</c:otherwise>
															</c:choose>
															<li style="margin-bottom: 10px;"><button
																	class="btn btn-primary"
																	onclick="window.location.href='${contextRoot}/show/${pro.id}/product'">
																	<i class="fa fa-eye"></i> View
																</button> <c:choose>
																	<c:when test="${pro.quantity < 1}">
																		<button class="btn btn-primary" disabled="disabled">
																			<i class="fa fa-shopping-cart"></i> Add to Cart
																		</button>
																	</c:when>
																	<c:otherwise>
																		<button class="btn btn-primary"
																			onclick="window.location.href='${contextRoot}/cart/add/${pro.id}/product'">
																			<i class="fa fa-shopping-cart"></i> Add to Cart
																		</button>
																	</c:otherwise>
																</c:choose></li>
														</ul>
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

<script>
	function updatePanel(categoryId) {
		$.ajax({
			type : "GET",
			url : window.contextRoot + "/show/category/" + categoryId
					+ "/products",
			success : function(response) {
				$('#allProducts').html(response);
			},
			error : function(e) {
				console.log('Error: ' + e);
			}
		});
	}
</script>