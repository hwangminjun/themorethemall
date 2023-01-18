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
	<table class="table" style="width:100%">
		<tr>
			<td>시작일</td>
			<td>종료일</td>
		</tr>
		<tr>
			<td><input type="date" id="startDate" class="form-control" /></td>
			<td><input type="date" id="endDate" class="form-control"/></td>
		</tr>
	</table>
</div>
</body>
<script>
$("#startDate", "#endDate").datepicker({
	dateFormat:'yy-mm-dd',
	monthNames:['일 월','이 월','삼 월','사 월','오 월','유 월','칠 월','팔 월','구 월','시 월','십일 월','십이 월'],
	monthNamesShort:['일','이','삼','사','오','육','칠','팔','구','십','십일','십이'],
	dayNames:['일','월','화','수','목','금','토'],
});
</script>
</html>