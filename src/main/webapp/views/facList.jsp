<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
<style>
	#facPhoto{
		text-align: center;
		width: 150px;
		height: 150px;
	}
	.khs_th{
		text-align: center;
		justify-content: center;
	}
	.card-title{
		text-align: center;
		justify-content: center;
		align-items: center;
		line-height: 120px;
	}
	
	
	
</style>
</head>

<body>
		<div class="modal fade" id="modalDialogScrollable" tabindex="-1">
                <div class="modal-dialog modal-dialog-scrollable">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    
                    <div class="modal-body">
                    <input type="hidden" id="emp_num">
                    <input type="hidden" id="fac_num">
                   	 <div class="row mb-3" id="fac_name">
                  		<label class="col-sm-2 col-form-label">회의실</label>
                  		<select class="form-select" aria-label="Default select example" id="facility">
                  			<option>==회의실을 선택하세요==</option>
                  		</select>
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
                    <select class="form-select" aria-label="Default select example" id="start">
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
                    <select class="form-select" aria-label="Default select example" id="end">
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
               
                
                  <h5>참여자</h5>
                  
                    
                  
                  
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
                    <div class="modal-footer">
                      <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">뒤로가기</button>
                      
                      <button type="button" class="btn btn-primary" id="book-btn">예약하기</button>
                    </div>
                  </div>
                </div>
              </div>

			
		
			
                  				
			
			<!-- 시설물 리스트 -->
			<div class="card">
            	<div class="card-body">
            	<br>
            
            	<button class="btn btn-primary" onclick="location.href='facDetail.go'">예약 현황</button>
            
            	
            	<button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#modalDialogScrollable" onclick="departure()">예약하기</button>
            
            	<br>
            	<br>
            	
					<table class="table table-striped">
						<thead> 
							<tr> 
							
								<th class="khs_th" width="34%">사진</th>
								<th class="khs_th" width="33%">시설명</th>
								<th class="khs_th" width="33%">회의실 상태</th>
							</tr>
						</thead>
						<tbody id="facList">
						
						</tbody>
					
					</table>
				</div>
			</div>
			 
			<!-- ======================================================================= -->
		<div class="card">
            <div class="card-body">
        		<h5 class="card-title">내 예약 리스트</h5>
        			<table class="table table-striped">
        				<thead class="table table-striped">
        					<tr> 
        						<th scope="col">시설</th>
        						<th scope="col">시작시간</th>
        						<th scope="col">종료시간</th>
        					</tr>
						</thead>
						<tbody id="bookList">
						
						
						</tbody>
						
					</table>
            </div>
          </div>
			
			<!-- 버튼들 -->
			
		
	


</body>

<script>
 facList();
 myBook();


var now_utc = Date.now() // 지금 날짜를 밀리초로
var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("book_date").setAttribute("min", today);

var writer = "";
var emp_num = "${sessionScope.loginInfo.emp_num}";


function facList(){// 시설리스트 불러오기
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
	fnm="";
	for (var i = 0; i < facList.length; i++) {
		
		if(facList[i].fac_num != ''){
		content += "<tr>";
		content += '<td class="khs_td"><img id="facPhoto" src="photo.do?path='+facList[i].new_filename+'"></td>';
		content += '<td class="khs_td"><h5 class="card-title">'+facList[i].fac_name+'</h5></td>';
		if(facList[i].book_num != 0){
			content += '<td class="khs_td"><h5 class="card-title">사용 중</h5></td>';
		}else{
			content += '<td class="khs_td"><h5 class="card-title">사용 가능</h5></td>';
		}
		
		content += "</tr>";
			
		}
	}
	$('#facList').empty();
	$('#facList').append(content);
	for (var i = 0; i < facList.length; i++) {
		if(facList[i].fac_num != 0){
			if(facList[i].book_num == 0){
				fac += '<option value="'+facList[i].fac_num+'">'+facList[i].fac_name+'</option>';
				
			}
			
		}
	}
	$('#facility').empty();
	$('#facility').append(fac);
	
} 



//시설 번호랑 날짜 조인

// 예약을 했을때 


	

//insert 할때 db에 저자되었는 값들을 비교해서 alert로 예약불가 라고 알려줌
//1. 시작시간, 종료시간을 컨트롤러로 보냄 0
//2. db에 저장되어엇는 시간을 먼저 불러 확인 
$('#book-btn').click(function(){//예약하기
	var fac_num = $('#facility option:selected').val();	
	var book_date = $('#book_start option:selected').val();
	var start = $('#book_start option:selected').val();
	var end = $('#book_end option:selected').val();
	var book_start = $('#book_date').val()+' '+$('#book_start option:selected').val();
	var book_end = $('#book_date').val()+' '+$('#book_end option:selected').val();
	var emp_num = '${sessionScope.loginInfo.emp_num}';
	var employee = $('#empList input[name=empChk]:checked').val();
	var cont = $('#bookCont').val();
	var members = [];
	//console.log(employee);
	
	
	
	
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
	}else if(cont==''){
		alert('내용을 입력해주세요.');
	}else{
		var param ={};
		param.fac_num = fac_num;
		param.book_start = book_start;
		param.book_end = book_end;
		param.emp_num = emp_num;
		param.members = members;
		
		
		  $.ajax({
			type:'get',
			url:'fac/register.ajax',
			dataType:'json',
			data:param,
			success:function(data){
				console.log(data);
				if(data.timeChk != 0){
					alert('예약된 시간입니다.');
				}else{
					alert('예약이 완료되었습니다.');
					location.href='facDetail.go';
				}
			},
			error:function(e){
				console.log(e);
			}
		});  
	}
		
});


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


//=============================== 모달 셀렉박스 상태 변화
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
//============================ 모달 끝


 
function myBook(){
	var emp_num = '${sessionScope.loginInfo.emp_num}';
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth()+1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2); // 오늘 날짜 yyyy-MM-dd
	var book_start = year+'-'+month+'-'+day+' '+'09:00';
	var book_end = year+'-'+month+'-'+day+' '+'18:00';
	var param = {};
	param.book_start=book_start; 
	param.book_end=book_end; 
	param.emp_num=emp_num; 
	
	 	$.ajax({
			type : 'get',
			dataType : 'json',
			data : param,
			url : '/fac/myBookList.ajax',
			success : function(data){
				console.log(data);
				mistake(data.myBookList);

			},
			error:function(e){
				console.log(e);
			}
		});
}

function mistake(myBookList){
	var book = '';
	console.log(myBookList);
	for (var i = 0; i < myBookList.length; i++) {
		if(myBookList.length == 0){
			book += '<tr>일정없음</tr>';
		}
		book += '<tr>';
		book += '<th scope="row">'+myBookList[i].fac_name+'</th>';
		book += '<td>'+myBookList[i].book_start.substring(11, 16)+'</td>';
		book += '<td>'+myBookList[i].book_end.substring(11, 16)+'</td>';
		book += '</tr>';
		
	}
	$('#bookList').empty();
	$('#bookList').append(book);	
} 

/* dateChk();
function dateChk(){
	var now = new Date();
	var nowHour = now.getHours();
	var nowMin = now.getMinutes();
	var tttime = nowHour+ ':' +nowMin;
	var time = parseInt(tttime);
	console.log(time); // 
	var selTimee = 
		$('#book_start').find('option').map(function() {
	      return $(this).val();
	}).get()
	var selTime = parseInt(selTimee);
	console.log(typeof(selTime));
	console.log(time-selTime[1]);
	   for (var i = 1; i < selTime.length; i++) {
		if(time)
	}   
	
} */


$('#modalDialogScrollable').on('hidden.bs.modal', function (e) {
	console.log('모달을 닫아볼게유~');
	$("#facility option:eq(0)").prop("selected", true);
	$("#book_date").val('');
	$("#start option:eq(0)").prop("selected", true);
	$("#end option:eq(0)").prop("selected", true);
	$("#departure option:eq(0)").prop("selected", true);
	$("#teamList option:eq(0)").prop("selected", true);
	$("#flexSwitchCheckDefault").prop("checked",false);
	$("#empList").empty();
});


 


// 1. 부서선택 시 팀배열
//2. 팀배열에서 인덱스로


</script>
</html>
