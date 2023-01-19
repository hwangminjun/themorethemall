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

	<div class="card">
            	<div class="card-body">
            	<br>
            	
            	<button type="submit" class="btn btn-priamry" onclick="location.href='facUpdate.go'">시설 추가</button>
           
            	<br>
            	<br>
            	
					<table class="table table-bordered">
						
							<tr> 			
								<th>사진</th>
								<th>시설명</th>
								<th>책임자</th>
							</tr>
							<c:forEach items="${detailList}" var="fac">
								<tr> 
									<td>${fac.new_filename}</td>
									<td>${fac.new_filename}</td>
									<td>${fac.new_filename}</td>
								</tr>
							</c:forEach>
					
						
					
					</table>
				</div>
			</div>


</body>
<script>
var msg = ${msg};
if(msg!=null){
	alert(msg);
}
</script>


</html>