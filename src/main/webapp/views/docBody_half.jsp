<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>장재혁인데용</title>
</head>
<style></style>
<body>
<div id="eventBody">
	<table class="table" style="width:100%; text-align:center;">
		<tr>
			<td>반차일</td>
			<td>반차 선택</td>
		</tr>
		<tr>
			<td><input type="date" id="startDate" class="form-control"/></td>
			<td><input type="radio" name="day" value="before" class="form-check-input"/>오전 / <input type="radio" name="day" value="after" class="form-check-input"/>오후</td>
		</tr>
	</table>
</div>
</body>
<script></script>
</html>