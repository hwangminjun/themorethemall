<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>장재혁인데용</title>
</head>
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
	<div class="container">
		<div class="row">
			<!-- 팀 리스트 + 협업 / 본부면 제외 -->
			<div class="col-sm-2">
				<select id="coorVal">
					<c:forEach items="${sessionScope.coorList }" var="coor"
						varStatus="index">
						<c:if test="${coor eq sessionScope.loginInfo.team_name }">
							<option value="${index.count }" selected>${coor}</option>
						</c:if>
						<c:if test="${coor ne sessionScope.loginInfo.team_name }">
							<option value="${index.count }">${coor}</option>
						</c:if>
					</c:forEach>
				</select> tt

			</div>


		</div>
	</div>
	<div id="calendar"></div>
	<!-- 사용자의 팀 번호 -->
</body>
<script>
	console.log('tt');
	$(function() {

		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
	        expandRows: true, // 화면에 맞게 높이 재설정
	        slotMinTime: '09:00', // Day 캘린더에서 시작 시간
	        slotMaxTime: '18:00', // Day 캘린더에서 종료 시간
	        navLinks: true, // can click day/week names to navigate views
	    	editable: true,
	    	allDaySlot: false,
	    	eventLimit: true, // allow "more" link when too many events
	        // 해더에 표시할 툴바
	        headerToolbar: {
	          left: 'prev,next today',
	          center: 'title',
	          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
	        },
			initialView : 'dayGridMonth',
		events : [
			$.ajax({
				type:'GET',
				url:'schedule/list.do',
				success:function(sch){
					console.log(sch);
					for(let i=0; i<sch.date.length;i++){
					calendar.addEvent({
						title:sch.date[i].sch_content,
						start:sch.date[i].sch_start,
						color:sch.date[i].color,
						textColor : "#000000",
						end:sch.date[i].sch_end,
						allDay:false
					})
					}
				},
				error:function(e){
					console.log(e);
				}
			})
		]
		});
		calendar.render();
	});
</script>
</html>