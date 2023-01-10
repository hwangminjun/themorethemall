<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>장재혁인데용</title>
</head>
<!--  bootstrap5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.fc-day-sun a {
	color: red;
	text-decoration: none;
}

/* 토요일 날짜 파란색 */
.fc-day-sat a {
	color: blue;
	text-decoration: none;
}
</style>
<body>
	<!-- 입력 Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">일정 추가</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
				<div class="row">
					<p id="today"></p>
				</div>
					<div class="row">
						<div class="col-sm-12">
							<label class="col-sm-4" for="edit-desc">설명</label> <input
								type="text" name="schContent" id="schContent" />
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<label class="col-sm-4" for="schStart">시작일</label> <input
								class="inputModal" type="datetime-local" name="schStart"
								id="schStart" />
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<label class="col-sm-4" for="schEnd">종료일</label> <input
								class="inputModal" type="datetime-local" name="schEnd"
								id="schEnd" />
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<label class="col-sm-4" for="schMembers">참여자</label>
							<table>
								<thead>
									<tr>
										<th></th>
										<th>이름</th>
									</tr>
								</thead>
								<tbody id="chkMembers"></tbody>
							</table>

						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<label class="col-sm-4" for="schType">일정 종류</label> <select
								name="schType" id="schType">

							</select>
						</div>
					</div>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">저장</button>
						<button type="button" class="btn btn-warning"
						data-bs-dismiss="modal">삭제</button>
				</div>

			</div>
		</div>
	</div>

	<!-- /.modal -->

	<div class="container">
		<div class="row">
			<!-- 팀 리스트 + 협업 / 본부면 제외 -->
			<div class="col-sm-2">
				<select id="coorVal" onchange="teamVal()">
					<c:forEach items="${sessionScope.coorList }" var="coor"
						varStatus="index">
						<c:if test="${coor eq sessionScope.loginInfo.team_name }">
							<option value="${index.count }" selected>${coor}</option>
						</c:if>
						<c:if test="${coor ne sessionScope.loginInfo.team_name }">
							<option value="${index.count }">${coor}</option>
						</c:if>
					</c:forEach>
				</select>

			</div>


		</div>
	</div>
	<div id="calendar"></div>
	<!-- 사용자의 팀 번호 -->

</body>
<script>
	console.log('tt');
	
	team="";
	function teamVal(){
		team=$("#coorVal option:selected").val();
		//팀원조회
		$.ajax({
			url : 'schedule/candidator.ajax',
			data : {
				team_num : team
			},
			type : "GET",
			dataType : "JSON",
			success : function(res) {
				createChkbox(res.members);
			},
			error : function(e) {
				console.log(e);
			}
		})
	}
	
	
	CallElems();
	function CallElems() {
		console.log("type");
		$.ajax({
			url : "schedule/type.ajax",
			type : "GET",
			success : function(list) {
				createSel(list.type);
			},
			error : function() {
				console.log("error");
			}
		});
		
	}
	

	function createChkbox(list) {
		var chkContent = "";
		for (var i = 0; i < list.length; i++) {
			chkContent += "<tr><td><input type='checkbox' name='members' value='"+list[i].emp_num+"'/></td><td>"
					+ list[i].emp_name + "</td></tr>";
		}
		$("#chkMembers").empty();
		$("#chkMembers").append(chkContent);

	}

	$(function() {

		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			expandRows : true, // 화면에 맞게 높이 재설정
			slotMinTime : '09:00', // Day 캘린더에서 시작 시간
			slotMaxTime : '18:00', // Day 캘린더에서 종료 시간
			navLinks : true, // can click day/week names to navigate views
			editable : true,
			allDaySlot : false,
			eventLimit : true, // allow "more" link when too many events
			// 해더에 표시할 툴바
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			initialView : 'dayGridMonth',
			events : [ $.ajax({
				type : 'GET',
				url : 'schedule/list.do',
				success : function(sch) {
					console.log(sch);
					for (let i = 0; i < sch.date.length; i++) {
						calendar.addEvent({
							title : sch.date[i].sch_content,
							start : sch.date[i].sch_start,
							color : sch.date[i].color,
							textColor : "#000000",
							end : sch.date[i].sch_end,
							allDay : false
						})
					}
				},
				error : function(e) {
					console.log(e);
				}
			}) ],
			dateClick : function(info) {
				var now=info.dateStr;
				console.log(now);
				$("#today").text("선택한 날짜 : "+now);
				console.log(info);
				alert('a dxay has been clicked!');
				$('#myModal').modal('show');
				$('#myModal').on(
						'hidden.bs.modal',
						function(e) {
							$(".btn-warning").css("{display:none}");
							
							var content = $("#schContent").val();
							var start = $("#schStart").val();
							var end = $("#schEnd").val();
							var members=[];
							$("input[name='members']:checked").each(function(e){
						        var value = $(this).val();
						        members.push(value);        
						    })
							var type = $("#schType option:selected").val();
							var team = $("#coorVal option:selected").val();
							var emp_num = "${sessionScope.loginInfo.emp_num}";
							
							
							
							if (start > end) {
								alert('잘못된 기간 설정입니다.');
							}
							console.log(members);
							console.log(content + "/" + start + "~" + end + "/"
									+ members + "/" + type + "/" + emp_num
									+ "/" + team);
							var param = {};
							param.team = team;
							param.start = start;
							param.end = end;
							param.type = type;
							param.emp_num = emp_num;
							param.content = content;
							param.members = members;
							console.log(param.content);
							$.ajax({
								type : "GET",
								url : "schedule/insert.ajax",
								data : param,
								dataType : "JSON",
								success : function(res) {
									console.log("success");
									location.href = "teamSch.go";
								},
								error : function(e) {
									console.log("error");
								}
							})
						});
			},
			//이벤트 추가 End
			//기존 이벤트 클릭 ㅇㅣ벤트
			eventClick: function(info){
				$('#myModal').modal('show');
				console.log(info.event.title);
				console.log(info.event);
				var title = info.event.title;
				var start = info.event.start;
				var end = info.event.end;
				var title = info.event.title;
							$(".btn-warning").css("{display:none}");
							$(".modal-title").html(title);
							$("#schContent").val(title);
							$("#schStart").val()
				$('#myModal').on('hidden.bs.modal',
						function(e) {
							
						});
				}
			
			
			
		});
		calendar.render();
	});
	
	function createSel(list) {
		var docSort = "<option value='' selected disabled>선택</option>";
		var index;
		for (var i = 0; i < list.length; i++) {
			index = i + 1;
			docSort += "<option value='"+index+"'>" + list[i] + "</option>";
		}
		$("#schType").empty();
		$("#schType").append(docSort);

	}
	
	
	
</script>
</html>