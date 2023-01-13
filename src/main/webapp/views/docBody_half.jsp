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
			<td>반차일</td>
			<td>오전인지 오후인지?</td>
		</tr>
		<tr>
			<td><input type="date" id="startDate" /></td>
			<td><input type="radio" name="day" value="before"/>오전 / <input type="radio" name="day" value="after"/>오후</td>
		</tr>
	</table>
</div>
</body>
<script></script>
</html>