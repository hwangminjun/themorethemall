<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>장재혁인데용</title>
</head>
<style></style>
<body>


	<div>
		<p id="docSalesDate"></p>
		<table class="table" style="width: 100%" id="salesTable">
		<thead>
			<tr>
				<td>구역번호</td>
				<td>카테고리</td>
				<td>브랜드명</td>
				<td>매출액(만 원)</td>
			</tr>
			</thead>
			<tbody id="salesDetList">
			<tr><td></td><td></td><td></td><td></td></tr>
			</tbody>
		</table>
	</div>
</body>

</html>