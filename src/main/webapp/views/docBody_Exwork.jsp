<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>장재혁인데용</title>
</head>
<style></style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<body>
<div id="eventBody">
	<table style="width:100%">
		<tr>
			<td>시작일</td>
			<td>종료일</td>
			<td>출장지</td>
		</tr>
		<tr>
			<td><input class="form-control" type="date" id="startDate" /></td>
			<td><input class="form-control" type="date" id="endDate"/></td>
			<td><input type="text" id="exPlace"/></td>
		</tr>
	</table>
</div>
</body>
<script></script>
</html>