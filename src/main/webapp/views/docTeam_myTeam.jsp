<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	padding:3px;
}
</style>
</head>
<body>


<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">문서 번호</th>
				<th scope="col">결재 종류
		</th>
				<th scope="col">결재 제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">처리 완료일</th>
				<th scope="col">처리 결과 : <select id="docStateNum"  onchange="docStateSearch()">
					<option value=0>전체</option>
					<option value=2>결재 완료</option>
					<option value=3>반려</option>
				</select></th>
			</tr>
		</thead>
		<tbody id="docTeamList">

		</tbody>
		<tr id="page">
			<td colspan="7" id="paging" style="text-align: center">
				<div class="container">
					<nav aria-label="Page navigation">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>
			<tr>
					<td colspan="7" style="text-align: center">
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
	<!-- End Default Table Example -->
</body>

<script>
	$(function() {


		team_num="${sessionScope.loginInfo.team_num}";
		docTeam(1);
	})

</script>


</html>