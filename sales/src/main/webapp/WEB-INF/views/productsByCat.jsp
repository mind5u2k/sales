<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<spring:url var="img" value="/resources/images" />
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
						<img style="width: 100%; height: 220px; border-radius: 2px;"
							src="${img}/${pro.code}.jpg">
					</h3>
				</div>
				<div class="panel-body no-padding text-align-center">
					<div class="price-features"
						style="min-height: 0; background: #fff; padding-bottom: 0; padding: 0;">
						<ul class="list-unstyled text-left"
							style="text-align: center !important; padding: 13px 12px 2px 12px;">
							<li class="text-success">Price - <strong> just <i
									class="fa fa-rupee text-success"></i> ${pro.unitPrice}
							</strong></li>
							<c:choose>
								<c:when test="${pro.quantity < 1}">
									<li style="margin-top: 2px; color: red;">!! Out of Stock
										!!</li>
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