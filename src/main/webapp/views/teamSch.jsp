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


br{
	padding:5px;
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
				<form>
					<div class="row">
						<input type="text" id="sch_num" style="display: none">
					</div>
						
						<div class="row mb-3">
						 <label for="inputText" class="col-sm-2 col-form-label">설명</label>
						 <div class="col-sm-10">
						  <input type="text" name="schContent" id="schContent" class="form-control">
						  </div>
						  </div>
					<div class="row">
						<div class="col-sm-12">
							<label class="col-sm-4" for="schStart">시작일</label> <input
								class="inputModal" type="datetime-local" name="schStart"
								id="schStart" class="form-control"/>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<label class="col-sm-4" for="schEnd">종료일</label> <input
								class="inputModal" type="datetime-local" name="schEnd"
								id="schEnd" class="form-control"/>
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
					<div class="row mb-3">
					 <label class="col-sm-2 col-form-label" for="schType">일정</label>
					 <div class="col-sm-10">
					  <select name="schType" id="schType" class="form-select" aria-label="Default select example">
					   </select>
					  </div>
					  </div>
				</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-warning"
						data-bs-dismiss="modal" id="schClose">닫기</button>
					<button type="submit" class="btn btn-danger"
						id="schDelete">삭제</button>

					<button type="submit" class="btn btn-primary"
						id="schSave">저장</button>
						
					<button type="submit" class="btn btn-primary"
						id="schUpdate">수정</button>
				</div>

			</div>
		</div>
	</div>

	<!-- /.modal -->

	<div class="container">
		<div class="row">
		
	<div class="card">
			<!-- 팀 리스트 + 협업 / 본부면 제외 -->
			<div class="col-sm-2">
			<br>
				<select id="coorVal" onchange="teamVal()" class='form-select'>
				<option value="${ sessionScope.loginInfo.team_num}">
					${sessionScope.loginInfo.team_name}
				</option>
					<c:forEach items="${sessionScope.coorList }" var="coor"
						varStatus="index">
						<c:if test="${coor eq sessionScope.loginInfo.team_name }">
						</c:if>
						<c:if test="${coor ne sessionScope.loginInfo.team_name }">
							<option value="${coor.team_num}">${coor.team_name}</option>
						</c:if>
					</c:forEach>
				</select>

			</div>

	<div id="calendar" style="padding:10px;"></div>
		</div>
	<!-- 사용자의 팀 번호 -->
	</div>
	</div>

</body>
<script>
//모달 초기화
/* function initModal(arg){
	$('.modal #schContent').val('');
	$('.modal #schStart').val('');
	$('.modal #schEnd').val('');
	$('.modal').('hide');
	g_arg = null;
  } */
$(function(){
	team = $("#coorVal option:selected").val();
	calendar(team);
});
 teamVal();
	team = "";
	function teamVal() {//셀렉트 박스에 등록된 팀원 모달에 등록
		team = $("#coorVal option:selected").val();
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
		});
		calendar(team);
	}

	function CallElems() {//일정 종류 호출 => select에 등록
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

		console.log('인서트')
		var chkContent = "";
		for (var i = 0; i < list.length; i++) {
			chkContent += "<tr><td><input class='form-check-input' type='checkbox' name='members' value='"+list[i].emp_num+"'/></td><td>"
					+ list[i].emp_name + "</td></tr>";
		}
		$("#chkMembers").empty();
		$("#chkMembers").append(chkContent);

	}

function calendar(team){
		CallElems();//일정 종류 조회
		console.log(team);
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			expandRows : true, // 화면에 맞게 높이 재설정
			slotMinTime : '09:00', // Day 캘린더에서 시작 시간
			slotMaxTime : '18:00', // Day 캘린더에서 종료 시간
			navLinks : true, // can click day/week names to navigate views
			editable : false,
			allDaySlot : false,
			eventLimit : true, // allow "more" link when too many events
			// 해더에 표시할 툴바
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,listWeek'
			},
			initialView : 'dayGridMonth',
			events : [
				$.ajax({
				type : 'GET',
				url : 'schedule/list.do',
				data : {
					team : team
				},
				success : function(sch) {
					console.log(sch);
					for (let i = 0; i < sch.date.length; i++) {
						calendar.addEvent({
							id : sch.date[i].sch_num,
							title : sch.date[i].sch_content,
							start : sch.date[i].sch_start,
							color : sch.date[i].color,
							textColor : "#000000",
							end : sch.date[i].sch_end,
							groupId:sch.date[i].sch_sort,
							allDay : false
						})
					}
				},
				error : function(e) {
					console.log(e);
				}
			}) ],
			//이벤트 추가
			dateClick : function(start, end) {
				$('#schDelete').css('display','none');
				$('#schUpdate').css('display','none');
				$('#schSave').css('display','inline');
				$('#myModal').modal('show')
/* 				var modal = $("#myModal");
				modal.modal('show'); */
			},
			//이벤트 추가 End
			//기존 이벤트 클릭 ㅇㅣ벤트
			eventClick : function(info){
				var startDateStr = info.event.start;
				var endDateStr = info.event.end;
/* 				var startMonth = startDateStr.getMonth()+1;
				if(startMonth<10){
					startMonth="0"+startMonth;
				}
				var startDate = startDateStr.getDate();
				if(startDate<10){
					startDate="0"+startDate;
				}
				var startHour = startDateStr.getHours();
				if(startHour<10){
					startHour="0"+startHour;
				}
				var startMinute = startDateStr.getMinutes();
				if(startMinute<10){
					startMinute="0"+startMinute;
				} */
				$("input[name='members']").prop('checked', false); // 일단 모두 uncheck
				$.ajax({
					url:'schedule/getCand.ajax',
					type:'GET',
					data:{
						sch_num:info.event._def.publicId
					},
					dataType:'JSON',
					success:function(res){
							 console.log('tt');
						 for(let i=0;i<res.cands.length;i++){
							 console.log(res.cands);
							 $("input[name='members'][value="+res.cands[i].emp_num+"]").prop("checked",true);
						 }
					},
					error:function(e){console.log(e)}
				});
				startDateStr =dateFormat(startDateStr);
				endDateStr = dateFormat(endDateStr);
				console.log(startDateStr);
				$('#schDelete').css('display','inline');
				$('#schUpdate').css('display','inline');
				$('#schSave').css('display','none');
				$('#myModal').modal('show')
				console.log(info);
				console.log(info.event);
				console.log(info.event._instance.range.start);
				console.log(info.event._def.publicId);
				$("#sch_num").val(info.event._def.publicId);
				$('#schContent').val(info.event.title);
				$("#schType").val(info.event.groupId).prop("selected", true);
				$('#schStart').val(startDateStr);
				$('#schEnd').val(endDateStr);
				
			}
				
				
				
				/* function(info) {
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
				$("#schStart").val(start);
				$("#schStart").val(end);
				$('#myModal').on('hidden.bs.modal', function(e) {

				});
			} */
		});
		calendar.render();
	}
	function dateFormat(date){
		var Month = date.getMonth()+1;
		if(Month<10){
			Month="0"+Month;
		}
		var Date = date.getDate();
		if(Date<10){
			Date="0"+Date;
		}
		var Hour = date.getHours();
		if(Hour<10){
			Hour="0"+Hour;
		}
		var Minute = date.getMinutes();
		if(Minute<10){
			Minute="0"+Minute;
		}
		date = date.getFullYear() + '-' + Month +'-' +Date+'T'+Hour+":"+Minute+":00";
		return date;
	}
	
	$('#schSave').on('click', function() {
		var team = $("#coorVal option:checked").val();
        var content = $('#schContent').val();
        var start = $('#schStart').val();
        var end = $('#schEnd').val();
        var sort = $("#schType option:selected").val();
        var emp_num = "${sessionScope.loginInfo.emp_num}";

        var members = [];
		$("input[name='members']:checked").each(function(e) {
			var value = $(this).val();
			members.push(value);
		});
		console.log(content +"-"+ start +"-"+end+"-"+sort+"-"+members);
		if(content==''){
			alert('알람 내용을 입력해주세요!');
		}else if(start==''){
			alert('시작 시간을 입력해주세요!');
		}else if(end==''){
			alert('종료 시간을 입력해주세요!');
		}else if(sort==null){
			alert('일정 종류를 선택해주세요!');
		}else if(members.length==0){
			alert('참여자를 선택해주세요!');
		}else if (start > end) {
			alert('잘못된 기간 설정입니다.');
		}//시간 범위 체크
		else{
			
		var param = {};
		param.team = team;
		param.start = start;
		param.end = end;
		param.sort = sort;
		param.emp_num = emp_num;
		param.content = content;
		param.members = members;
		
		$.ajax({
			type : "GET",
			url : "schedule/insert.ajax",
			data : param,
			dataType : "JSON",
			success : function(res) {
				console.log("success");
				location.href = "teamSch.go";
		        // Clear modal inputs
		        $('#myModal').find('input').val('');
		        initModal();
		        // hide modal
		        $('.modal').modal('hide');
			},
			error : function(e) {
				alert('일정 등록에 실패했습니다.');
			}
		});
		}
	});
	$('#schUpdate').on('click', function() {
		var sch_num = $("#sch_num").val();
		var team = $("#coorVal option:selected").val();
        var content = $('#schContent').val();
        var start = $('#schStart').val();
        var end = $('#schEnd').val();
        var sort = $("#schType option:selected").val();
        var emp_num = "${sessionScope.loginInfo.emp_num}";
        var members = [];
		$("input[name='members']:checked").each(function(e) {
			var value = $(this).val();
			members.push(value);
		});
		console.log(sch_num+"-"+content +"-"+ start +"-"+end+"-"+sort+"-"+members);
		if(content==''){
			alert('알람 내용을 입력해주세요!');
		}else if(start==''){
			alert('시작 시간을 입력해주세요!');
		}else if(end==''){
			alert('시작 시간을 입력해주세요!');
		}else if(sort==null){
			alert('일정 종류를 선택해주세요!');
		}else if(members.length==0){
			alert('참여자를 선택해주세요!');
		}else if (start > end) {
			alert('잘못된 기간 설정입니다.');
		}//시간 범위 체크
		else{
			var rtn = confirm('수정하시겠습니까?')
			if(rtn){
				
		var param = {};
		param.sch_num = sch_num;
		param.start = start;
		param.end = end;
		param.sort = sort;
		param.content = content;
		param.members = members;
		
	 	$.ajax({
			type : "GET",
			url : "schedule/update.ajax",
			data : param,
			dataType : "JSON",
			success : function(res) {
				console.log("success");
				location.href = "teamSch.go";
		        // Clear modal inputs
		        $('#myModal').find('input').val('');

		        // hide modal
		        $('.modal').modal('hide');
			},
			error : function(e) {
				location.href = "teamSch.go";
	        // Clear modal inputs
	        $('#myModal').find('input').val('');
	        initModal();
	        // hide modal
	        $('.modal').modal('hide');
			}
		});
		}
			}
		
        /* if (title) {
            var eventData = {
                title: title,
                start: $('#starts-at').val(),
                end: $('#ends-at').val()
            };
            $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
        }
        $('#calendar').fullCalendar('unselect');
 */

    });
	//일정 삭제
	
	$('#schDelete').on('click', function(){
		var isDel = confirm('삭제하시겠습니까?');
		console.log(isDel);
		if(isDel){
			
		var sch_num =  $("#sch_num").val();
		$.ajax({
			url:"schedule/delete.ajax",
			data:{
				sch_num:sch_num
			},
			dataType:"JSON",
			type:"get",
			success:function(result){
				alert('삭제 완료');
				location.href = "teamSch.go";
		        // Clear modal inputs
		        $('#myModal').find('input').val('');
		        initModal();
		        // hide modal
		        $('.modal').modal('hide');
			},
			error:function(e){
				alert('삭제 실패');
				initModal();
			}
		});
		
		}
	});
	$('#schClose').on('click',function(){
		initModal();
	})
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
	$('#myModal').on('hidden.bs.modal', function (e) {
		$(this).find('form')[0].reset();
	});
	function initModal(){//모달 초기화
		$("#schContent").val('');
		$("#schStart").val('');
		$("#schEnd").val('');
		$("input[type=checkbox]").prop("checked", false);
		$("#schType option:eq(0)").attr('selected', 'selected');
	}
</script>
</html>