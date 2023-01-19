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
				<td>문서 번호</td>
				<td>결재 종류</td>
				<td>발신자</td>
				<td>결재 제목</td>
				<td>작성일</td>
			</tr>
		</thead>
		
		<tbody id="signDocList"></tbody>
		
		<tfoot>
		
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
							<button class="btn btn-primary" onclick="docRecList(1)">검색</button></td>
					</tr>
					
		</tfoot>
		</table>
</body>
<script>
</script>
</html>