<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="panel-footer">
	<h4 class="panel-title">CHI TIẾT ĐƠN HÀNG</h4>
</div>
<table class="table table-hover">
	<thead>
		<tr>

			<th>Tên</th>
			<th>Giá</th>
			<th>Giảm giá</th>
			<th>Số lượng </th>
			<th>Tổng tiền</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="d" items="${order.orderDetails}">
			<tr>

				<td>${d.product.name}</td>
				<td>$<f:formatNumber value="${d.unitPrice}" pattern="#,###.00" />
				</td>
				<td><f:formatNumber value="${d.discount * 100}"
						pattern="#,###.00" /> %</td>
				<td>${d.quantity}</td>
				<td>$<f:formatNumber
						value="${d.unitPrice*d.quantity*(1-d.discount)}"
						pattern="#,###.00" />
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="panel-body text-center">

</div>
