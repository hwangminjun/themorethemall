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
			<div class="row mb-3">
                  <label class="col-sm-2 col-form-label">Select</label>
                  <div class="col-sm-10">
                     
                    <select id="facList" class="form-select" aria-label="Default select example">
                      
                    </select>
                    
                  </div>
            </div>
            <table class="table">
            	<thead>
            		<tr>
            			<th>시작시간</th>
            			<th>종료시간</th>
            			<th>예약자</th>
            		</tr>
            	</thead>
				<tbody id="facBookList">
				
				</tbody>
            </table>
            
            
            
            
            

</body>
<script>
facSelect();

var select = "";
var content="";

function facSelect(){
	$.ajax({
		type : 'get',
		url : '/fac/register.ajax',
		dataType : 'json',
		success : function(data){
			console.log(data);
			drawSelect(data.facility);
		},
		error : function(e){
			console.log(e);
		}
	});
}

function drawSelect(facility){
	select += "";
	for (var i = 0; i < facility.length; i++) {
		select += '<option value='+facility[i].fac_num+'>'+facility[i].fac_name+'</option>';
	}
	$('.form-select').empty();
	$('.form-select').append(select);
}


$('#facList').change(function(){
	console.log($("option:selected").val());//option태그중 선택된거
 	$.ajax({
		type : 'get',
		url : '/fac/bookList.ajax',
		dataType : 'json',
		data:{fac_num:$("option:selected").val()},
		success : function(data){
			console.log(data);	
			drawBookList(data.facBookList);
		},
		error : function(e){
			console.log(e);
		}
	}); 
});

function drawBookList(facBookList){
	content = "";
	for (var i = 0; i < facBookList.length; i++) {
		content += '<tr>';
		content += '<td>'+facBookList[i].book_start+'</td>';
		content += '<td>'+facBookList[i].book_end+'</td>';
		content += '<td>'+facBookList[i].emp_name+'</td>';
		content += '</tr>';
	}
	$('#facBookList').empty();
	$('#facBookList').append(content);
} 


















</script>
</html>