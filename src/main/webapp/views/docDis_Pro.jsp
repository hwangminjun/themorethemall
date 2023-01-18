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
	</table>
	<!-- End Default Table Example -->

	<select id="sl1" name="category">
		<option value="emp_num" selected>사번</option>
		<option value="emp_name">이름</option>
	</select>

	<input type="text" placeholder="검색어 입력" name="detailContent"
		id="detailContent">

	<button onclick="flags(); subSearch()" class="btn btn-primary btn-sm">검색</button>
</body>
<script>
</script>
</html>