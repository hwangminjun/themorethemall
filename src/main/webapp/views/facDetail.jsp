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
                    <select class="form-select" aria-label="Default select example">
                      <option selected>Open this select menu</option>
                      <option value="1">One</option>
                      <option value="2">Two</option>
                      <option value="3">Three</option>
                    </select>
                  </div>
                </div>
	
</body>
<script>
facSelect();
var select = "";

function facSelect(){
	$.ajax({
		type : 'get',
		url : '/fac/register.go',
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
	for (var i = 0; i < facility.length; i++) {
		select += '<option value='+i+'>'+facility[i].fac_name+'</option>';
	}
	$('.form-select').empty();
	$('.form-select').append(select);
}

















</script>
</html>