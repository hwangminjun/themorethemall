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
	<!-- Default Table -->
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">문서 번호</th>
				<th scope="col">결재 종류</th>
				<th scope="col">결재 제목</th>
				<th scope="col">작성일</th>
				<th scope="col">처리 완료일</th>
				<th scope="col">처리 결과</th>
			</tr>
		</thead>
		<tbody id="docDisList">

		</tbody>
		<tr id="page">
			<td colspan="8" id="paging" style="text-align: center">
				<div class="container">
					<nav aria-label="Page navigation">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>
		<tr>
						<td colspan="6"> 제목 - <input type="text" id="keyword" />
							<button class="btn btn-primary" onclick="subSearch()">검색</button></td>
					</tr>
	</table>
	<!-- End Default Table Example -->

</body>
<script>
</script>
</html>