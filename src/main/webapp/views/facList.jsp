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
                     	<div class="row mb-3">
                  			<label id="date" for="inputDate" class="col-sm-2 col-form-label" onclick="date()">날짜</label>
                  		<div class="col-sm-10">
                   		 	<input type="date" class="form-control">
                  		</div>
                	</div>
                	<fieldset class="row mb-3">
                  <legend class="col-form-label col-sm-2 pt-0">시간</legend>
                  <div class="col-sm-10">
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
                      <label class="form-check-label" for="gridRadios1">
                        09:00 ~ 10:00
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
                      <label class="form-check-label" for="gridRadios2">
                        10:00 ~ 11:00
                      </label>
                    </div>
                    <div class="form-check disabled">
                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios" value="option">
                      <label class="form-check-label" for="gridRadios3">
                        10:00 ~ 11:00
                      </label>
                    </div>
                    <div class="form-check disabled">
                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios" value="option">
                      <label class="form-check-label" for="gridRadios3">
                        11:00 ~ 12:00
                      </label>
                    </div>
                    <div class="form-check disabled">
                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios" value="option">
                      <label class="form-check-label" for="gridRadios3">
                        13:00 ~ 14:00
                      </label>
                    </div>
                    <div class="form-check disabled">
                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios" value="option">
                      <label class="form-check-label" for="gridRadios3">
                        15:00 ~ 16:00
                      </label>
                    </div>
                    <div class="form-check disabled">
                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios" value="option"> 
                      <label class="form-check-label" for="gridRadios3">
                        17:00 ~ 18:00
                      </label>
                    </div>
                  </div>
                </fieldset>
                
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">예약 내용</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control">
                  </div>
                </div>
                
                
                  <h5 class="card-title">참여자</h5>
                  
                    
                  
                  
                <div class="col md-6">
                  <label class="col-sm-2 col-form-label">부서</label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example" id="departure">
                     	<option>부서를 선택하세요</option>
                    </select>
                  </div>
                </div>
                <div class="col md-6">
                  <label class="col-sm-2 col-form-label">팀</label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example" id="teamList">
                      <option>팀을 선택하세요</option>
                    </select>
                  </div>
                </div>
                <div class="col md-6">
                  <label class="col-sm-2 col-form-label">사원</label>
                  <div class="col-sm-10">
                    <select class="form-select" multiple aria-label="multiple select example" id="empList">
                      <option>사원을 선택하세요</option>
                    </select>
                  </div>
                </div>
                    	
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">뒤로가기</button>
                      <button type="button" class="btn btn-primary" onclick="bookGo()">예약하기</button>
                    </div>
                  </div>
                </div>
              </div>

			
		
			
                  				<button class="btn btn-primary" onclick="location.href='facDetail.go'">일정 보기</button>
			
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
 departure();
 
var content = "";
var dep = "";
function facList(){
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

function departure(){
	$.ajax({
		type:'get',
		dataType:'json',
		url:'fac/deplist.ajax',
		success:function(data){
			console.log(data);
			drawBookGo(data.depList);
		},
		error:function(e){
			console.log(e);
		}
	});
}




	 	

function meetingRoom(facList) {
	content="";
	for (var i = 0; i < facList.length; i++) {
		content += "<tr>";
		content += '<th><img src="">'+facList[i].new_filename+'</th>';
		content += '<th>'+facList[i].fac_name+'</th>';
		content += '<th>'+facList[i].fac_state_name+'</th>';
		content += '<th><button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalDialogScrollable" onclick="bookGo('+facList[i].fac_num+')">예약하기</button></th>';
		
		content += "</tr>";
	}
	$('#facList').empty();
	$('#facList').append(content);
} 

function bookGo(fac_num){
	$.ajax({
		type:'get',
		dataType:'json',
		url:'fac/reg.go.ajax',
		data:{fac_num:fac_num},
		success:function(data){
			console.log(data);
			
		},
		error:function(e){
			console.log(e);
		}
	});
}

$('#departure').change(function (dep_num){
	console.log($("option:selected").val());
	 $.ajax({
		 type : 'get',
		 url : '/fac/teamlist.ajax',
		 dataType : 'json',
		 data : {dep_num:$("option:selected").val()},
		 success : function(data){
			 console.log(data);
			 drawTeam(data.teamList);
		 },
		 error : function(e){
			 console.log(e);
		 }
	 });
});

//dep_num
function drawBookGo(depList){
	var dep = '<option>부서를 선택하세요</option>';
	for (var i = 0; i < depList.length; i++) {
		dep += '<option value='+depList[i].dep_num+'>'+depList[i].dep_name+'</option>';	
	}
	$('#departure').empty();
	$('#departure').append(dep);
}



function drawTeam(teamList){
	var team = "";
	$('#teamList').empty();
	for (var i = 0; i < teamList.length; i++) {
		team += '<option value='+teamList[i].team_num+'>'+teamList[i].team_name+'</option>';	
	}
	
	$('#teamList').append(team);
}

$('#teamList').change(function (team_name){
	console.log($("#teamList option:selected").val());
	   $.ajax({
		 type : 'get',
		 url : '/fac/emplist.ajax',
		 dataType : 'json',
		 data : {team_name:$("#teamList option:selected").val()},
		 success : function(data){
			 console.log(data);
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
		emp += '<option value='+empList[i].team_num+'>'+empList[i].emp_name+'</option>';	
	}
	$('#empList').empty();
	$('#empList').append(emp);
}

function date(){
	console.log($('#date' ).val());
}

function def() {
	$.ajax({
		type : 'get',
		url : '/fac/partList.ajax',
		dataType : 'json',
		data : {
			'team':$('#departure option:selected').val,
			'emp':$('#teamList option:selected').val
		},
		succes : function(data){
			console.log(data);
		},
		error : function(e){
			console.log(e);
		}
	});
} 
// 1. 부서선택 시 팀배열
//2. 팀배열에서 인덱스로


</script>
</html>
