<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<c:set var="availableCount" value="${userModel.cart.cartLines}" />
<div id="content">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12">
			<h3
				style="margin-top: 0; margin-bottom: 0; border-bottom: 0px solid #7b7979; padding: 9px 12px 14px 13px;">My
				Cart</h3>
		</div>
	</div>
	<div
		class="jarviswidget jarviswidget-color-darken jarviswidget-sortable"
		id="wid-id-1" data-widget-editbutton="false" role="widget"
		style="border-top: 1px solid #ccc;">
		<div role="content">
			<div class="jarviswidget-editbox"></div>
			<div class="widget-body no-padding">
				<c:if test="${not empty message}">
					<div class="alert alert-info no-margin"
						style="text-align: center; font-size: 19px;">
						<button class="close" data-dismiss="alert">×</button>
						<i class="fa-fw fa fa-info"></i> ${message}
					</div>
				</c:if>
				<div class="table-responsive">
					<c:choose>
						<c:when test="${not empty cartLines}">
							<table id="cart"
								class="table table-hover table-condensed table table-bordered table-striped">
								<tr
									style="height: 35px; background: #838282; font-size: 14px; color: #fff;">
									<th style="width: 50%; vertical-align: middle;">Product</th>
									<th style="width: 10%; vertical-align: middle;">Price</th>
									<th style="width: 8%; vertical-align: middle;">Quantity</th>
									<th style="width: 22%; vertical-align: middle;"
										class="text-center">Subtotal</th>
									<th style="width: 10%; vertical-align: middle;"></th>
								</tr>
								<tbody>
									<c:forEach items="${cartLines}" var="cartLine">
										<c:if test="${cartLine.available == false}">
											<c:set var="availableCount" value="${availableCount - 1}" />
										</c:if>
										<tr>
											<td data-th="Product" style="padding: 9px !important;">
												<div class="row">
													<div class="col-sm-2 hidden-xs">
														<img src="${img}/${cartLine.product.code}.jpg"
															alt="${cartLine.product.name}"
															class="img-responsive dataTableImg" />
													</div>
													<div class="col-sm-10">
														<h4 class="nomargin">${cartLine.product.name}
															<c:if test="${cartLine.available == false}">
																<strong style="color: red">(Not Available)</strong>
															</c:if>
														</h4>
														<p>Brand : ${cartLine.product.brand}</p>
														<p>Description : ${cartLine.product.description}
													</div>
												</div>
											</td>
											<td data-th="Price">&#8377; ${cartLine.buyingPrice} /-</td>
											<td data-th="Quantity"><input type="number"
												id="count_${cartLine.id}" class="form-control text-center"
												value="${cartLine.productCount}" min="1" max="3"></td>
											<td data-th="Subtotal" class="text-center">&#8377;
												${cartLine.total} /-</td>
											<td class="actions" data-th=""><c:if
													test="${cartLine.available == true}">
													<button type="button" name="refreshCart"
														class="btn btn-info btn-sm" value="${cartLine.id}">
														<span class="glyphicon glyphicon-refresh"></span>
													</button>
												</c:if> <a href="${contextRoot}/cart/${cartLine.id}/remove"
												class="btn btn-danger btn-sm"><span
													class="glyphicon glyphicon-trash"></span></a></td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr class="visible-xs">
										<td class="text-center"><strong>Total &#8377;
												${userModel.cart.grandTotal}</strong></td>
									</tr>
									<tr>
										<td style="border-right: 0;"><a
											href="${contextRoot}/show/all/products"
											class="btn btn-warning"><span
												class="glyphicon glyphicon-chevron-left"></span> Continue
												Shopping</a></td>
										<td colspan="2" class="hidden-xs"
											style="border-left: 0; border-right: 0;"></td>
										<td class="hidden-xs text-center"
											style="border-left: 0; border-right: 0;"><strong>Total
												&#8377; ${userModel.cart.grandTotal}/-</strong></td>

										<c:choose>
											<c:when test="${availableCount != 0}">
												<td style="border-left: 0;"><a
													href="${contextRoot}/cart/validate"
													class="btn btn-success btn-block">Checkout <span
														class="glyphicon glyphicon-chevron-right"></span></a></td>
											</c:when>
											<c:otherwise>
												<td style="border-left: 0;"><a
													href="javascript:void(0)"
													class="btn btn-success btn-block disabled">Checkout <span
														class="glyphicon glyphicon-chevron-right"></span>
												</a></td>
											</c:otherwise>
										</c:choose>
									</tr>
								</tfoot>
							</table>
						</c:when>
						<c:otherwise>
							<div class="jumbotron">
								<h3 class="text-center">Your Cart is Empty!</h3>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>