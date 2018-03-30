<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>


<style>
.panel-body:after {
	content: none;
}

.panel-default>.panel-heading {
	color: #333;
	background-color: #ffffff;
}
</style>
<div id="ribbon">
	<ol class="breadcrumb">
		<li><a href="${contextRoot}/home">Home</a></li>
		<li><a href="${contextRoot}/show/all/products">Products</a></li>
		<li class="active">${product.name}</li>
	</ol>
</div>
<div id="content">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-1"></div>
		<div class="col-xs-12 col-sm-12 col-md-4">
			<div class="panel panel-default pricing-big"
				style="box-shadow: 6px 6px 6px #625b5b;">
				<div class="panel-heading"
					style="padding: 0; border: 0; background: #fff;">
					<h3 class="panel-title" style="padding: 13px 0 7px 0;">${product.name}</h3>
				</div>
				<div class="panel-heading" style="padding: 2px 2px; border: 0;">
					<h3 class="panel-title" style="padding: 0;">
						<img style="width: 96%; height: auto; border-radius: 2px;"
							src="${img}/${product.code}.jpg">
					</h3>
				</div>
				<div class="panel-body no-padding text-align-center">
					<div class="price-features"
						style="min-height: 0; background: #fff; padding-bottom: 0; padding: 0;">
						<ul class="list-unstyled text-left"
							style="text-align: center !important; padding: 13px 12px 2px 12px;">
							<li style="margin-bottom: 10px;"><security:authorize
									access="isAnonymous() or hasAuthority('USER')">
									<c:choose>
										<c:when test="${product.quantity < 1}">
											<a href="javascript:void(0)"
												class="btn btn-success disabled btn-lg" style="width: 45%;">
												<i class="fa fa-shopping-cart"></i> Add to Cart
											</a>
										</c:when>
										<c:otherwise>
											<a href="${contextRoot}/cart/add/${product.id}/product"
												style="width: 45%;" class="btn btn-success btn-lg"> <i
												class="fa fa-shopping-cart"></i> Add to Cart
											</a>
										</c:otherwise>
									</c:choose>
								</security:authorize> <security:authorize access="hasAuthority('ADMIN')">
									<a href="${contextRoot}/manage/${product.id}/product"
										class="btn btn-success btn-lg" style="width: 45%;"> <span
										class="glyphicon glyphicon-pencil"></span> Edit
									</a>
								</security:authorize> <a href="${contextRoot}/show/all/products"
								class="btn btn-warning btn-lg" style="width: 45%;"> Continue
									Shopping</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6">
			<h3
				style="text-align: center; font-size: 21px; margin: 0 0 16px 0; border-bottom: 1px solid #474544; padding: 8px 0 11px 0px;">${product.name}<span>(${product.brand})</span>
			</h3>
			<p>${product.description}</p>
			<h4>
				Price: <strong> &#8377; ${product.unitPrice} /-</strong>
			</h4>
			<c:choose>
				<c:when test="${product.quantity < 1}">
					<h6>
						Qty. Available: <span style="color: red">Out of Stock!</span>
					</h6>
				</c:when>
				<c:otherwise>
					<h6>Qty. Available: ${product.quantity}</h6>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-1"></div>
	</div>
</div>