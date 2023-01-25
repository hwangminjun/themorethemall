<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>장재혁인데용</title>
</head>
<style>
* {
	padding: 3px;
}

br {
	padding: 5px;
}
	nav{
	text-align:center;
	display:inline-block;
	}
		.container{
	display:inline-block;
	}
</style>
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
			<td colspan="6" id="paging" style="text-align: center">
				<div class="container">
					<nav aria-label="Page navigation">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>
		<tr>

					<tr>
					<td colspan="6" style="text-align: center">
						<div class="container">
							<nav>
			<select name="option" id="option" class="form-select" style="width: 100px; float: left; margin-right: 10px;" >
				<option value="doc_sub" selected>제목</option>
			</select> <input type="text" placeholder="검색어 입력" name="keyword"
				id="keyword" class="form-control" style="width: 400px; float: left; margin-right: 10px;">

			<button onclick="flags(); keywordSearch()"
				class="btn btn-primary btn-sm" style="height: 37px;">검색</button>
</nav>
</div>
</td>
</tr>
	</table>
	<!-- End Default Table Example -->
</body>
<script>
</script>
</html>