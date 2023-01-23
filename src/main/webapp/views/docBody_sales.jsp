<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>장재혁인데용</title>
</head>
<style></style>
<body>


	<div id="SalesBody">
		<input class="form-control" type="date" id="salesDate"
						onchange="availableStore()" />
		<table class="table" style="width: 100%" id="salesTable">
		<thead>
			<tr>
				<td>구역번호</td>
				<td>카테고리</td>
				<td>브랜드명</td>
				<td>매출액(만 원)</td>
			</tr>
			</thead>
			<tbody id="salesList">
			</tbody>
		</table>
	</div>
</body>
<script>
	var emp_num = "${sessionScope.loginInfo.emp_num}";

	var now_utc = Date.now() // 지금 날짜를 밀리초로
	var timeOff = new Date().getTimezoneOffset() * 60000; // 분단위를 밀리초로 변환
	var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
	document.getElementById("salesDate").setAttribute("max", today);
	var myStore = [];//자신의 담당 매장 리스트

	$(function() {
		console.log("접속 사번 : " + emp_num);
		//자신 담당의 매장을 배열에 저장
		$.ajax({
			url : "doc/manageStore.ajax",
			type : "GET",
			data : {
				emp_num : emp_num
			},
			dataType : "JSON",
			success : function(res) {
				for (let i = 0; i < res.list; i++) {
					myStore.push(res.list[i]);
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	});
	function availableStore() {//날짜값이 바뀌면 해당 날짜에 결재된 가게 리스트
		var date=$("#salesDate").val();
		console.log(date);
		$.ajax({
			url:'doc/unsignedStore.ajax',
			type:"GET",
			data:{
				date:date,
				emp_num:emp_num
			},
			dateType:"JSON",
			success:function(res){
				console.log(res.list);
				drawSalesTable(res.list);
			},
			error:function(e){
				alert('error');
			}
		});
	}
	
	
	function availableStore() {//날짜값이 바뀌면 해당 날짜에 결재된 가게 리스트
		var date=$("#salesDate").val();
		console.log(date);
		$.ajax({
			url:'doc/unsignedStore.ajax',
			type:"GET",
			data:{
				date:date,
				emp_num:emp_num
			},
			dateType:"JSON",
			success:function(res){
				console.log(res.list);
				drawSalesTable(res.list);
			},
			error:function(e){
				alert('error');
			}
		});
	}
	
	
	var salesContent="";
	function drawSalesTable(list){
			salesContent="";
		for(let i=0; i<list.length;i++){
			salesContent+="<tr>"
			salesContent+="<td>"+list[i].section_num+"</td>"
			salesContent+="<td>"+list[i].minor_category_name+"</td>"
			salesContent+="<td>"+list[i].store_name+"</td>"
			salesContent+="<td><input type='number' name='salesVal' id='"+list[i].store_num+"'/></td>"
			salesContent+="<td style='display:none;'>"+list[i].store_num+"</td>"
			salesContent+="<td style='display:none;'>"+list[i].minor_category_num+"</td></tr>"
		}
		$("#salesList").empty();
		$("#salesList").append(salesContent);
	}
	
</script>
</html>