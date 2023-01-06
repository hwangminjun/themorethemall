<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div id="loginForm">
	<form action="login/login.do" method="post">
		<table>
			<thead>
				<tr>
					<td colspan="3"><img alt="" src="assets/img/tmtmlogo.png"
						style="width: 240px;"></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="3"><input type="radio" id="userType" value="emp" checked>직원
						<input type="radio" id="userType" value="store">점포</td>
				</tr>
				<tr>
					<td>ID</td>
					<td><input type="text" name="id" id="id" /></td>
					<td rowspan="3"><button type="submit">Log in</button></td>
				</tr>
				<tr>
					<td>PW</td>
					<td><input type="password" name="pw" id="pw" /></td>
				</tr>
				<tr>
					<td colspan="3"><a href="#">비밀번호 찾기</a></td>
				</tr>
			</tbody>
		</table>
</form>
	</div>
</body>

<script>
/* 		var userType = $("input[id='userType']:checked").val();
		var id = $("#id").val();
		var pw = $("#pw").val(); */
/* 	function login() {
		console.log(userType + "/" + id + "/" + pw);
		var url = "login/"+userType+"/login.do";
		
		console.log(url);
		$.ajax({
			url : url,
			type:'POST',
			data : {
				id : id,
				pw : pw
			},
			dataType : "JSON",
			success:function(res){
				console.log("login 성공");
				location.href="/"+res.page+".jsp";
			},
			error:function(e){
				console.log(e);
			}
		})
	} */
</script>


</html>