<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>

<table>

<thead>
	<tr>
		<th><input type="checkbox"></th>
		<th>사번</th>
		<th>이름</th>
		<th>부서</th>
		<th>팀</th>
		<th>직급</th>
		<th>직책</th>
		<th>입사일</th>
		<th>상태</th>
	</tr>
</thead>

<tbody id="list">
</tbody>


</table>


</body>

<script>
listCall();

function listCall(){
	$.ajax({
		type: 'post',
		url : '/hr/list.ajax',
		dataType : 'json',
		success: function(data){
			console.log(data);
			//drawList(data.list);			
		},
		error : function(e){
			console.log(e);
		}		
	});
}

function drawList(list){
	var content = '';
	
	for(var i=0; i<list.length; i++){
		console.log(list[i]);
		content += '<tr>';
		content += '<td>'+list[i].emp_num+'</td>';
		content += '<td>'+list[i].emp_name+'</td>';


		content += '<td>'+list[i].dep_name+'</td>';
		content += '<td>'+list[i].team_num+'</td>';
		content += '<td>'+list[i].pos_num+'</td>';
		content += '<td>'+list[i].rank_num+'</td>';
		
		content += '<td>'+list[i].state_num+'</td>';
		content += '<td>'+list[i].emp_num+'</td>';
		content += '</tr>';
		
	}
	
	$('#list').empty();
	$('#list').append(content);
	
}



</script>
</html>