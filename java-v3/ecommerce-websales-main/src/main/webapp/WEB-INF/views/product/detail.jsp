<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp"%>
<f:formatDate value="${prod.productDate}" pattern="dd-MM-yyyy"
	var="date" />
<f:formatNumber value="${prod.unitPrice}" pattern="#,###.00" var="price" />
<div class="panel panel-success nn-detail" data-id="${prod.id}">
	<div class="panel-heading">
		<h4 class="panel-title">THÔNG TIN CHI TIẾT SẢN PHẨM</h4>
	</div>
	<div class="panel-body">
		<div class="col-sm-5 text-center">
			<img src="/static/images/products/${prod.image}" />
		</div>
		<ul class="col-sm-7">
			<li><strong>Tên</strong>: <em>${prod.name}</em></li>
			<li><strong>Giá</strong>: <em>${price}</em></li>
			<li><strong>Giảm giá</strong>: <em><f:formatNumber value="${prod.discount}" type="percent"/></em></li>
			<li><strong>Số lượng</strong>: <em>${prod.quantity}</em></li>



		</ul>
	</div>
	<div class="panel-footer text-justify">${prod.description}</div>
	<div class="panel-footer text-right">
		<%@include file="btn-prod.jsp"%>
	</div>
</div>



<div class="nn-detail-relatives">
	<!-- tab buttons -->
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#same">HÀNG
				CÙNG LOẠI</a></li>
		
	</ul>

	<div class="panel panel-default">
		<div class="panel-body">
			<!-- tab content -->
			<div class="tab-content">
				<div id="same" class="tab-pane fade in active">
					<c:forEach var="p" items="${prod.category.products}">
						<a href="/product/detail/${p.id}"><img
							src="/static/images/products/${p.image}" /></a>
					</c:forEach>
				</div>
			
			</div>
		</div>
	</div>
</div>




