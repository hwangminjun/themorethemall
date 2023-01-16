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
		<div class="modal fade" id="modalDialogScrollable" tabindex="-1">
                <div class="modal-dialog modal-dialog-scrollable">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    
                    <div class="modal-body">
                   	 <div class="col md-6">
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
               
                  <div class="col-md-6" style="float:left" id="book_start">
                  <label class="col-sm-2 col-form-label">시작</label>
                    <select class="form-select" aria-label="Default select example">
                      <option selected>==시작시간==</option>
                      <option value="09:00:00">09:00</option>
                      <option value="10:00:00">10:00</option>
                      <option value="11:00:00">11:00</option>
                      <option value="1:00:00">12:00</option>
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
              
                <br>
                <div class="row mb-3" id="bookContent">
                  <label class="col-sm-2 col-form-label">예약 내용</label>
                  <div class="col-sm-10">
                    <input type="text" id="bookCont" class="form-control">
                  </div>
                </div>
                
                
                  <h5 class="card-title">참여자</h5>
                  
                    
                  
                  
                <div class="col md-6">
                  <label class="col-sm-2 col-form-label">부서</label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example" id="departure">
                     	<option selected>==부서를 선택하세요==</option>
                    </select>
                  </div>
                </div>
                <div class="col md-6">
                  <label class="col-sm-2 col-form-label">팀</label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example" id="teamList">
						<option selected>==팀을 선택하세요==</option>
                    </select>
                  </div>
                </div>
                <div class="col md-6">
                  <label class="col-sm-2 col-form-label">사원</label>
                  <div class="col-sm-10">
                    <select class="form-select" multiple aria-label="multiple select example" id="empList">
                      <option selected>==사원을 선택하세요==</option>
                    </select>
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

			
		
			
                  				<button class="btn btn-warning" onclick="location.href='facDetail.go'">일정 보기</button>
			
			<!-- 시설물 리스트 -->
				<table class="table table-bordered">
					<thead> 
						<tr> 
							
							<th>사진</th>
							<th>시설명</th>
							<th>회의실 상태</th>
						</tr>
					</thead>
					<tbody id="facList">
						
					</tbody>
					
				</table>
						
			 
			<!-- ======================================================================= -->
		
			
			<!-- 버튼들 -->
			
		
	
	

</body>

<script>
 facList();
 //defEmp();

 var now_utc = Date.now() // 지금 날짜를 밀리초로
//getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("book_date").setAttribute("min", today);

var content = "";
var dep = "";

function facList(){// 시설리스트 불러오기
	$.ajax({
		type : 'get',
		dataType : 'json',
		url : '/fac/list.ajax',
		success : function(data){
			//console.log(data);
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
		content += "<tr>";
		content += '<th><img src="">'+facList[i].new_filename+'</th>';
		content += '<th>'+facList[i].fac_name+'</th>';
		content += '<th>'+facList[i].fac_state_name+'</th>';
		content += '<th><button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#modalDialogScrollable" onclick="departure()" value="'+facList[i].fac_num+'">예약하기</button></th>';
		content += "</tr>";
	}
	$('#facList').empty();
	$('#facList').append(content);
	for (var i = 0; i < facList.length; i++) {
		fac += '<option value="'+facList[i].fac_num+'">'+facList[i].fac_name+'</option>';
	}
	$('#facility').empty();
	$('#facility').append(fac);
} 

	

	


$('#book-btn').click(function(){//예약하기
	fac_num = $('#facility option:selected').val();	
	book_start = $('#book_date').val()+' '+$('#book_start option:selected').val();
	book_end = $('#book_date').val()+' '+$('#book_end option:selected').val();
	cont = $('#bookCont').val();
	emp_num = $('#empList option:selected').val();
	console.log(emp_num);
	console.log(book_end);
	if(fac_num=='==회의실을 선택하세요=='){
		alert('회의실을 선택하세요');
	}else if(book_date==''){
		alert('날짜를 입력해주세요.');
	}else if(book_start=='==시작시간=='){
		alert('시작시간을 입력하세요');
	}else if(book_end=='==종료시간=='){
		alert('종료시간을 입력해주세요.');
	}else if(book_start >= book_end){
		alert('시간을 올바르게 입력하세요.');
	}else if(cont==''){
		alert('내용을 입력해주세요.');
	}else{
		  $.ajax({
			type:'get',
			url:'fac/register.ajax',
			dataType:'json',
			data:{			
				fac_num:fac_num,
				emp_num:emp_num,
				book_start:book_start,
				book_end:book_end
			},
			success:function(data){
				console.log(data);
				location.href('facList.go')
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
		if($('#depList option:selected').val()==0){
			alert('eddddd');
		}
		emp += '<option value='+empList[i].emp_num+'>'+empList[i].emp_name+'</option>';	
	}
	$('#empList').empty();
	$('#empList').append(emp);
} 




//============================ 모달 끝








 


// 1. 부서선택 시 팀배열
//2. 팀배열에서 인덱스로


</script>
</html>
