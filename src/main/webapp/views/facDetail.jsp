<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 -->

</head>
<body>
		<!-- 모달부분 -->
		<div class="modal fade" id="myModal" tabindex="-1">
                <div class="modal-dialog modal-dialog-scrollable">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    
                    <div class="modal-body">
                   	 <div class="row mb-3">
                  		<label class="col-sm-2 col-form-label">회의실</label>
                  	<div class="col-sm-10">
                    	<select class="form-select" aria-label="Default select example" id="facility">
                     		<option selected>==회의실을 선택하세요==</option>
                    	</select>
                  </div>
                </div>
                     	<div class="row mb-3" id="facName">
                     	
                  			<label id="date" for="inputDate" class="col-sm-2 col-form-label">날짜</label>
                  		<div class="col-sm-10">
                   		 	<input type="date" id="book_date" class="form-control">
                  		</div>
                	</div>
               
               <div class="row mb-3">
                  <div class="col-md-6" style="float:left" id="book_start">
                  <label class="col-sm-2 col-form-label">시작</label>
                    <select class="form-select" aria-label="Default select example">
                      <option selected>==시작시간==</option>
                      <option value="09:00:00">09:00</option>
                      <option value="10:00:00">10:00</option>
                      <option value="11:00:00">11:00</option>
                      <option value="12:00:00">12:00</option>
                      <option value="14:00:00">14:00</option>
                      <option value="15:00:00">15:00</option>
                      <option value="16:00:00">16:00</option>
                      <option value="17:00:00">17:00</option>
                    </select>
                  </div>
                
              
                  <div class="col-md-6" style="float:left" id="book_end">
                  <label class="col-sm-2 col-form-label">종료</label>
                    <select class="form-select" aria-label="Default select example">
                      <option selected>==종료시간==</option>
                      <option value="10:00:00">10:00</option>
                      <option value="11:00:00">11:00</option>
                      <option value="12:00:00">12:00</option>
                      <option value="14:00:00">14:00</option>
                      <option value="15:00:00">15:00</option>
                      <option value="16:00:00">16:00</option>
                      <option value="17:00:00">17:00</option>
                      <option value="18:00:00">18:00</option>
                    </select>
                  </div>
              </div>
              
                <div class="row mb-3" id="bookContent">
                  <label class="col-sm-2 col-form-label">내용</label>
                  <div class="col-sm-10">
                    <input type="text" id="bookCont" class="form-control">
                  </div>
                </div>
               
                
                  <h5 class="card-title">참여자</h5>
                  
                    
                  
                  
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">부서</label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example" id="departure">
                     	<option selected>==부서를 선택하세요==</option>
                    </select>
                  </div>
                </div>
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">팀</label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example" id="teamList">
						<option selected>==팀을 선택하세요==</option>
                    </select>
                  </div>
                </div>
                <div class="row mb-3">
                  	<div class="col-sm-10"  id="empList">
                    <div class="form-check form-switch">
                      <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
                      <label class="form-check-label" for="flexSwitchCheckDefault"></label>
                    </div>
                    </div>
                </div>
                    	
                    </div>
                    <div class="modal-footer" id="buttons">
                    	
                      <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">뒤로가기</button>
                      <button type="button" class="btn btn-primary" id="modify-btn">수정하기</button>
                    </div>
                  </div>
                </div>
              </div>
            
            <div id="calendar"></div>
            

</body>
<script>
calendar();
facList();
departure();

function facList(){//모달 시설리스트 불러오기
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

function meetingRoom(facList) { // 시설물 리스트 그리기
	content="";	
	fac = "<option selected>==회의실을 선택하세요==</option>";
	for (var i = 0; i < facList.length; i++) {
		fac += '<option value="'+facList[i].fac_num+'">'+facList[i].fac_name+'</option>';
	}
	$('#facility').empty();
	$('#facility').append(fac);
}

function departure(){// 부서 뿌려주기
	$.ajax({
		type:'get',
		dataType:'json',
		url:'fac/deplist.ajax',
		success:function(data){
			console.log(data);
			depList(data.depList);
		},
		error:function(e){
			console.log(e);
		}
	});	
}

function depList(depList){ // 부서 그리기--부서
	var dep = '<option selected>==부서를 선택하세요==</option>';
	for (var i = 0; i < depList.length; i++) {
	
		dep += '<option value='+depList[i].dep_num+'>'+depList[i].dep_name+'</option>';
		
	}
	$('#departure').empty();
	$('#departure').append(dep);
}

$('#departure').change(function (dep_num){ //팀
	console.log($("#departure option:selected").val());
	 $.ajax({
		 type : 'get',
		 url : '/fac/teamlist.ajax',
		 dataType : 'json',
		 data : {dep_num:$("#departure option:selected").val()},
		 success : function(data){
			 console.log(data);
			 drawTeam(data.teamList);
		 },
		 error : function(e){
			 console.log(e);
		 }
	 });
});

function drawTeam(teamList){
	var team = "<option>팀을 선택해주세요</option>";	
	for (var i = 0; i < teamList.length; i++) {
		
		team += '<option value='+teamList[i].team_num+'>'+teamList[i].team_name+'</option>';	
	}
	$('#teamList').empty();
	$('#teamList').append(team);
} 

$('#teamList').change(function (team_num){ // 직원
	console.log($("#teamList option:selected").val());
	   $.ajax({
		 type : 'get',
		 url : '/fac/emplist.ajax',
		 dataType : 'json',
		 data : {team_num:$("#teamList option:selected").val()},
		 success : function(data){
			 //console.log(data);
			 drawEmp(data.empList);
		 },
		 error : function(e){
			 console.log(e);
		 }
	 });  
}); 

 function drawEmp(empList){
	var emp = "";
	for (var i = 0; i < empList.length; i++) {
		emp += '<div class="form-check form-switch">';
		emp += '<input class="form-check-input" name="empChk" type="checkbox" id="flexSwitchCheckDefault" value="'+empList[i].emp_num+'">';
		emp += '<label class="form-check-label" for="flexSwitchCheckDefault">'+empList[i].emp_name+'</label>';
		emp += '</div>';
		//emp += '<option value='+empList[i].emp_num+'>'+empList[i].emp_name+'</option>';	
	}
	$('#empList').empty();
	$('#empList').append(emp);
} 

 //////////////////////////////////////////////////////////////////////////////

function calendar(){
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      expandRows : true,
	   	  //slotMinTime : "09:00",
	   	 // slotMaxTime : "18:00",
	   	  navLinks:true,
	   	  allDaySlot:false,
	   	  editable:false,
	   	  locale : 'ko',
	   	  headerToolbar : {
	   		  left : 'prev,next today',
	   		  center : 'title',
	   		  right : 'dayGridMonth,timeGridWeek,timeGridDay'
	   	  }, 
	   	  initialView: 'timeGridWeek',
	      events : [
	    	  $.ajax({
	    		  type : 'get',
	    		  url : '/fac/bookList.ajax', 
	    		  dataType:'json',
	    		  success : function(data){
	    			  console.log(data);
	    			  //userChk(data.bookList);
	    			  for (var i = 0; i < data.bookList.length; i++) {
						calendar.addEvent({
							id : data.bookList[i].book_num,
							title : data.bookList[i].fac_name,
							start : data.bookList[i].book_start,
							groupId : data.bookList[i].fac_num,
							
							//color : data.bookList[i].color,
							end : data.bookList[i].book_end
						})
					}
	    		  },
	    		  error:function(e){
	    			  console.log(e);
	    		  }
	    		  
	    	  })], 
	   	  		eventClick : function updateForm(info){
					 // 제이쿼리 중복으로 뜨지 않았어음
					var emp_num = '${sessionScope.loginInfo.emp_num}';//세션스코프로 내가 작성한 리스트만 수정하기 버튼생성
					console.log(info);
					//console.log(info.event._def.publicId);
					var fac_num = info.event._def.groupId;//시설번호
					var book_num = info.event._def.publicId; //예약번호
					var start = info.event.start; //시작시간(가공필요)
					var end = info.event.end; // 종료시간(가공필요)
					var startDate = dateFormat(start);//가공한 시간
					var endDate = dateFormat(end);
					
					
					var start = dateFormat(start).toString();
					var end = dateFormat(end).toString();
					var book_date = start.substr(0,10);
					var book_start = start.substr(11,19);
					var book_end = end.substr(11,19);
					
					// 참여자 어케 뽑음???
					 
					console.log(book_date); //날짜
					console.log(book_start); // 시작시간
					console.log(book_end); // 종료시간
					
					$('#facility').val(fac_num).prop("selected",true);
					$('#book_date').val(book_date);
					$('#book_start option').val(book_start).prop("selected",true);
					$('#book_end option').val(book_end).prop("selected",true);
					$('#myModal').modal('show');
				
	   	  		}
	   	  
   	  
	    });  
	    
	    calendar.render();
	
}
 
function dateFormat(date) {
    var month = date.getMonth() + 1;
    if(month<10){
    	month="0"+month;
    }
    var day = date.getDate();
    if(day<10){
    	day="0"+day;
    }
    var hour = date.getHours();
    if(hour<10){
    	hour="0"+hour;
    }
    var minute = date.getMinutes();
    if(minute<10){
    	minute="0"+minute;
    }
    
    date = date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + '00';
    return date;
}

function userChk(bookList){
	var chk = "";
	for (var i = 0; i < bookList.length; i++) {
		chk += '<c:if test="${sessionScope.loginInfo.emp_num eq '+bookList[i].emp_num+'}">';
		chk += '<button>수정</button>';
		chk += '<button>삭제</button>';
		chk += '</c:if>';
	}
	$('#buttons').empty();
	$('#buttons').append(chk);
}




</script>
</html>