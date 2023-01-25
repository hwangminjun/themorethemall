<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 -->
<style>
	
</style>
</head>
<body>
		<!-- 모달부분 -->
		<form id="modalForm">
		<div class="modal fade" id="myModal" tabindex="-1">
                <div class="modal-dialog modal-dialog-scrollable">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    
                    <div class="modal-body">
                   		
                    <div class="row">
						<input type="text" id="book_num" style="display: none">
						<input type="text" id="writer" style="display: none">
					</div>
                   	 <div class="row mb-3">
                  		<label class="col-sm-2 col-form-label">회의실</label>
                  	<div class="col-sm-10">
                    	<select class="form-select" aria-label="Default select example" id="facility" disabled>
                     		<option selected>==회의실을 선택하세요==</option>
                    	</select>
                  </div>
                  <!-- 
	}); -->
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
                    <select class="form-select" aria-label="Default select example" id="bookStart">
                      <option selected>==시작시간==</option>
                      <option value="09:00:00">09:00</option>
                      <option value="10:00:00">10:00</option>
                      <option value="11:00:00">11:00</option>
                      <option value="12:00:00">12:00</option>
                      <option value="14:00:00">14:00</option>
                      <option value="15:00:00">15:00</option>
                      <option value="16:00:00">16:00</option>
                      <option value="17:00:00">17:00</option>
                      <option value="18:00:00">18:00</option>
                      <option value="19:00:00">19:00</option>
                      <option value="20:00:00">20:00</option>
                    </select>
                  </div>
                
              
                  <div class="col-md-6" style="float:left" id="book_end">
                  <label class="col-sm-2 col-form-label">종료</label>
                    <select class="form-select" aria-label="Default select example" id="bookEnd">
                      <option selected>==종료시간==</option>
                      <option value="10:00:00">10:00</option>
                      <option value="11:00:00">11:00</option>
                      <option value="12:00:00">12:00</option>
                      <option value="14:00:00">14:00</option>
                      <option value="15:00:00">15:00</option>
                      <option value="16:00:00">16:00</option>
                      <option value="17:00:00">17:00</option>
                      <option value="18:00:00">18:00</option>
                      <option value="19:00:00">19:00</option>
                      <option value="20:00:00">20:00</option>
                      <option value="21:00:00">21:00</option>
                    </select>
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
                     <%--  <c:if test="${sessionScope.loginInfo.emp_num eq 'emp_num'}">  --%>
                      	<button type="button" class="btn btn-primary" id="modify-btn">수정하기</button>                     
                      	<button type="button" class="btn btn-danger" id="delete-btn">삭제</button>
                   	 <%-- </c:if> --%> 
                    </div>
                  </div>
                </div>
              </div>
            </form>
            
            <div id="calendar"></div>
            

</body>
<script>
calendar();
facList();
departure();



var sessionUser = '${sessionScope.loginInfo.emp_num}';

var now_utc = Date.now() // 지금 날짜를 밀리초로
//getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("book_date").setAttribute("min", today);

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
	    			  for (var i = 0; i < data.bookList.length; i++) {
						calendar.addEvent({
							id : data.bookList[i].book_num,
							title : data.bookList[i].fac_name,
							start : data.bookList[i].book_start,
							groupId : data.bookList[i].fac_num,	
							color : data.bookList[i].color,
							end : data.bookList[i].book_end
							//interactive : data.bookList[i].emp_num
							
						})
						//console.log(interactive);
					}
	    			  
	    		  },
	    		  error:function(e){
	    			  console.log(e);
	    		  }
	    		  
	    	  })], 
	   	  		eventClick : function updateForm(info){
					 // 제이쿼리 중복으로 뜨지 않았어음
					 
					var emp_num = '${sessionScope.loginInfo.emp_num}';//세션스코프로 내가 작성한 리스트만 수정하기 버튼생성
					console.log(emp_num);
					console.log(info);
					//console.log(info.event._def.publicId);
					var fac_num = info.event._def.groupId;//시설번호
					var book_num = info.event._def.publicId; //예약번호
					var start = info.event.start; //시작시간(가공필요)
					var end = info.event.end; // 종료시간(가공필요)
					var startDate = dateFormat(start).toString().substr(0,10);//가공한 시간					
					var book_start = dateFormat(start).substr(11,16);
					var book_end = dateFormat(end).substr(11,16);	
					
					
					console.log(startDate);
					console.log(book_start);
					console.log(book_end);
					console.log(book_num);
					$('#book_num').val(book_num);
					// 참여자 어케 뽑음???
					//$("#book_num").val(info.event._def.ui.publicId);
					
					//console.log(book_num);
					
					//console.log(book_date); //날짜
					$('#facility').val(fac_num).prop("selected",true);
					$('#book_date').val(startDate).prop('selected', true);
					$('#bookStart').val(book_start).prop('selected', true);
					$('#bookEnd').val(book_end).attr('selected', true);
					$('#myModal').modal('show');	
					
	   	  		}
	    });  
	    
	    calendar.render();
	   	    
}
$('#myModal').on('hidden.bs.modal', function (e) {
	console.log('모달을 닫아볼게유~');
	$("#departure option:eq(0)").prop("selected", true);
	$("#teamList option:eq(0)").prop("selected", true);
	$("#flexSwitchCheckDefault").prop("checked",false);
	$("#empList").empty();
});
 


 
 
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



$('#modify-btn').click(function(info){
	
	console.log(info);
	var fac_num = $('#facility option:selected').val();	
	var book_date = $('#book_start option:selected').val();
	var start = $('#book_start option:selected').val();
	var end = $('#book_end option:selected').val();
	var book_start = $('#book_date').val()+' '+$('#book_start option:selected').val();
	var book_end = $('#book_date').val()+' '+$('#book_end option:selected').val();
	var emp_num = '${sessionScope.loginInfo.emp_num}';
	var employee = $('#empList input[name=empChk]:checked').val();
	
	var book_num = $("#book_num").val();
	console.log(book_num);
	var members = [];
	
	$("#empList input[name=empChk]:checked").each(function(e){
		var value = $(this).val();
		console.log(value);
		members.push(value);
	});

	if(fac_num=='==회의실을 선택하세요=='){
		alert('회의실을 선택하세요');
	}else if(book_date==''){
		alert('날짜를 입력해주세요.');
	}else if(start=='==시작시간=='){
		alert('시작시간을 입력하세요');
	}else if(end=='==종료시간=='){
		alert('종료시간을 입력해주세요.');
	}else if(book_start >= book_end){
		alert('시간을 올바르게 입력하세요.');
	}else if(employee == undefined){
		alert('사원을 선택해주세요.');
	}else{
		var param ={};
		param.fac_num = fac_num;
		param.book_start = book_start;
		param.book_end = book_end;
		param.emp_num = emp_num;
		param.members = members;
		param.book_num = book_num;
		
		$.ajax({
			type:'get',
			url:'fac/update.ajax',
			dataType:'json',
			data : param,
			success:function(data){
				console.log("data : " + data.msg);
				if(data.timeChk!=0){
					alert(data.msg);
				}else{
					alert(data.msg)
					location.href='facDetail.go';				
				}
			},
			error: function(e){
				console.log(e);
			}
		
		});
		}
	
});


$('#delete-btn').click(function(){
	var del = confirm('예약을 삭제하시겠습니까?');
	var emp_num = '${sessionScope.loginInfo.emp_num}';
	if(del){
		var book_num = $('#book_num').val();
		$.ajax({
			type : 'get',
			url : '/fac/delete.ajax',
			data : {
			book_num : book_num,
			emp_num:emp_num
			},
			dataType : 'json',
			success : function(data){
				console.log(data);
				alert(data.msg);
				location.href='facDetail.go';
			},
			error : function(e){
				console.log(e);
			}
		});
	}
	
	
});
 function empNum(){
	$.ajax({
		type : 'get',
		url : '/fac/empNum.ajax',
		dataType : 'json',
		success : function(data){
			console.log(data);
			
		},
		error : function(e){
			console.log(e);
		}
	});
} 





</script>
</html>