<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="panel panel-default">
	<div class="panel-heading">
	<form action="/admin/product/index#list">
		<div class="input-group">

		</div>
	</form>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>

				<th>Tên</th>
				<th>Giá</th>
				<th>Số lượng</th>
				<th>Giảm giá</th>
				<th>Tình trạng</th>
				<th>Loại sản phẩm</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${list}">
			<tr>

				<td>${item.name}</td>
				<td>${item.unitPrice}</td>
				<td>${item.quantity}</td>
				<td>${item.discount*100}%</td>
				<td>${item.available?'Còn hàng':'Hết hàng'}</td>
				<td>${item.category.nameVN}</td>
				<td class="text-center">
					<a href="${prefix}/edit/${item.id}" class="btn btn-sm btn-info">
						<span class="glyphicon glyphicon-edit"></span>
					</a>
					<a href="${prefix}/delete/${item.id}" class="btn btn-sm btn-danger">
						<span class="glyphicon glyphicon-trash"></span>
					</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>