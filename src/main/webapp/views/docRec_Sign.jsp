<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>장재혁인데용</title>
</head>
<style>

</style>
<body>
	<!-- Default Table -->
	<table class="table table-hover">
		<thead>
			<tr>
				<td>문서 번호</td>
				<td>결재 종류</td>
				<td>발신자</td>
				<td>결재 제목</td>
				<td>작성일</td>
			</tr>
		</thead>
		
		<tbody id="signDocList"></tbody>
		
		<tfoot>
		
		<tr id="page" style="text-align:center">
						<td colspan="5" id="paging" style="text-align: center">
							<div class="container">
								<nav aria-label="Page navigation">
									<ul class="pagination" id="pagination"></ul>
								</nav>
							</div>
						</td>
					</tr>

					
		</tfoot>
		<tr>
					<td colspan="5" style="text-align: center">
						<div class="container">
							<nav>
			<select name="option" id="option" class="form-select" style="width: 100px; float: left; margin-right: 10px;" >
				<option value="emp_name" selected>작성자</option>
				<option value="doc_sub">제목</option>
			</select> <input type="text" placeholder="검색어 입력" name="keyword"
				id="keyword" class="form-control" style="width: 400px; float: left; margin-right: 10px;">

			<button onclick="flags(); keywordSearch(1)"
				class="btn btn-primary btn-sm" style="height: 37px;">검색</button>
</nav>
</div>
</td>
</tr>
		</table>
</body>
<script>
</script>
</html>