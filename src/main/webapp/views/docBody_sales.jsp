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


	<div class="modal fade" id="modalDialogScrollable" tabindex="-1">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">매출 입력</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<input class="form-control" type="date" id="salesDate"
						onchange="availableStore()" />
					<table style="width: 100%">
						<tr>
							<td>구역번호</td>
							<td>브랜드명</td>
							<td>매출액(만 원)</td>
						</tr>
						<tr>
							<td><select id="sectionSel" onchange="avaliableDate()"></select></td>
							<td><p id="store"></p></td>
							<td><input type="number" /></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End Modal Dialog Scrollable-->




	<div id="SalesBody">
		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#modalDialogScrollable">매출 입력</button>
		<table style="width: 100%">
			<tr>
				<td>구역번호</td>
				<td>날짜</td>
				<td>브랜드명</td>
				<td>매출액(만 원)</td>
			</tr>
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
		$.ajax({
			url:'doc/unsignedStore.ajax',
			type:"GET",
			date:{
				date:date
			},
			dateType:"JSON",
			success:function(res){
				
			},
			error:function(e){
				alert('error');
			}
		});
	}
</script>
</html>