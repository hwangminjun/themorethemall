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
	<div class="card"  style="height: 960px;">
		<div class="card-body">
		<div class="row">
<h2> 나의 결재 수신함 </h2>
<div class="col-sm-2">
		<select class="form-select">
			<option>전체조회</option>
			<option>아침조회</option>
		</select>
</div>
		
		</div>
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
		
		<tfoot></tfoot>
		</table>
		
		</div>
	</div>
</body>
<script></script>
</html>