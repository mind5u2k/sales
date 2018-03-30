<%@include file="../../flows-shared/header1.jsp"%>
<div id="main" role="main">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Total Items</h3>
					</div>
					<div class="panel-body">
						<c:forEach items="${checkoutModel.cartLines}" var="cartLine">
							<div class="col-xs-12"
								style="border-bottom: 0px solid #ccc; margin-bottom: 12px; padding-bottom: 12px;">
								<div>
									<span
										style="font-size: 16px; padding: 0 0 0 0; margin: 0 0px 0 0px;">${cartLine.product.name}</span>
									<br>Quantity -${cartLine.productCount} <br>Buying
									Price - &#8377; ${cartLine.buyingPrice}/-
								</div>
								<div
									style="background: #ccc; padding: 5px 5px 7px 8px; margin: 5px -9px 0px -9px;">
									<span>Grand Total</span> <span style="float: right;">&#8377;
										${cartLine.total}/-</span>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Payment Details</h3>
					</div>
					<div class="panel-body">
						<form role="form">
							<div class="form-group">
								<label for="cardNumber"> CARD NUMBER</label>
								<div class="input-group">
									<input type="text" class="form-control" id="cardNumber"
										placeholder="Valid Card Number" required autofocus /> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-7 col-md-7">
									<div class="form-group">
										<label for="expityMonth">EXPIRY DATE</label> <br />
										<div class="col-xs-6 col-lg-6 pl-ziro">
											<input type="text" class="form-control" id="expityMonth"
												placeholder="MM" required />
										</div>
										<div class="col-xs-6 col-lg-6 pl-ziro">
											<input type="text" class="form-control" id="expityYear"
												placeholder="YY" required />
										</div>
									</div>
								</div>
								<div class="col-xs-5 col-md-5 pull-right">
									<div class="form-group">
										<label for="cvCode"> CV CODE</label> <input type="password"
											class="form-control" id="cvCode" placeholder="CV" required />
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#"><span
							class="badge pull-right"> &#8377;
								${checkoutModel.checkoutTotal}/-</span> Final Payment</a></li>
				</ul>
				<br /> <a href="${flowExecutionUrl}&_eventId_pay"
					class="btn btn-success btn-lg btn-block" role="button">Pay</a>

			</div>
		</div>
	</div>
</div>

<%@include file="../../flows-shared/footer1.jsp"%>