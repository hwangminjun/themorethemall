<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	div #eventBody{
		background: white;
	}
</style>
<div id="eventBody">
	<table style="width:100%">
		<tr>
			<td>시작일</td>
			<td>종료일</td>
			<td>층</td>
			<td>브랜드명</td>
		</tr>
		<tr>
			<td><input type="date" id="startDate" /></td>
			<td><input type="date" id="endDate"/></td>
			<td><select id="floor" onchange="callSec()"></select></td>
			<td><select id="storeName"></select></td>
		</tr>
	</table>
</div>
<script>
  document.getElementById('startDate').value = new Date().toISOString().substring(0, 10);;
$(function() {
	$.ajax({
		url:"doc/floor.ajax",
		type:"GET",
		success:function(res){
			drawFloor(res.list);
		},
		error:function(e){
			alert('error');
		}
	});
})
  function drawFloor(list){
	var content="";
	for(let i=0; i<list.length; i++){
		content+="<option value='"+list[i]+"'>"+list[i]+"</option>";
	}
	$("#floor").empty();
	$("#floor").append(content);
}


  function callSec(){
	  var floor=$("#floor option:selected").val();
	  console.log(floor);
	  var param={};
	  param.floor=floor;
	  console.log(param);
	  $.ajax({
		  url:"doc/section.ajax",
		  type:"post",
		  data : {
			  floor : floor
		  },
		  success:function(res){
			  createSelSec(res.list);
		  },
		  error:function(){
				alert('error');
			  
		  }
		  
	  });
	  
	  
  }
  
  function createSelSec(list){
		var content="";
		for(let i=0; i<list.length; i++){
			content+="<option value='"+list[i].store_num+"'>"+list[i].store_name+"</option>";
		}
			$("#storeName").empty();
			$("#storeName").append(content);
				
	}
  
  
  
  </script>