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


	
		
			
                  				<button class="btn btn-primary" onclick="location.href='facDetail.go'">일정 보기</button>
			
			<!-- 시설물 리스트 -->
				<table class="table table-bordered">
					<thead> 
						<tr> 
							<th>사진</th>
							<th>시설명</th>
							<th>회의실 상태</th>
						</tr>
					</thead>
					<tbody id="facList">
					
					</tbody>
					
				</table>
						
			 
			<!-- ======================================================================= -->
		
			
			<!-- 버튼들 -->
			
		
	
	

</body>

<script>
 facList();
var content = "";
function facList(){
	$.ajax({
		type : 'get',
		dataType : 'json',
		url : '/fac/list.ajax',
		success : function(data){
			console.log(data);
			meetingRoom(data.facList);
		},
		error : function(e){
			console.log(e);
		}
	});
}



	 	

function meetingRoom(facList) {
	content="";
	for (var i = 0; i < facList.length; i++) {
		content += "<tr>";
		content += '<th><img src="/photo">'+facList[i].new_filename+'</th>';
		content += '<th>'+facList[i].fac_name+'</th>';
		content += '<th>'+facList[i].fac_state_name+'</th>';
		content += '<th><button class="btn btn-primary" onclick="bookGo('+facList[i].fac_num+')">예약하기</button></th>';
		
		content += "</tr>";
	}
	$('#facList').empty();
	$('#facList').append(content);
	
} 





</script>

</html>
