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
                  			<label id="date" for="inputDate" class="col-sm-2 col-form-label">날짜</label>
                  		<div class="col-sm-10">
                   		 	<input type="date" id="bookDate" class="form-control">
                  		</div>
                	</div>
               <fieldset class="row mb-3" class="bookContent">
                  <legend class="col-form-label col-sm-2 pt-0">시간</legend>
                  <div class="col-sm-10">
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="gridRadios" id="nineToTen" value="09:00~10:00">                   
                        09:00 ~ 10:00                
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="gridRadios" id="TenToEleven" value="option2">                   
                        10:00 ~ 11:00                
                    </div>
                    
                    <div class="form-check disabled">
                      <input class="form-check-input" type="radio" name="gridRadios" id="ElevenToTwelve" value="option">
                        11:00 ~ 12:00
                    </div>
                    
                    <div class="form-check disabled">
                      <input class="form-check-input" type="radio" name="gridRadios" id="thirdToFourth" value="option">
                        13:00 ~ 14:00
                    </div>
                   
                    <div class="form-check disabled">
                      <input class="form-check-input" type="radio" name="gridRadios" id="FourthToFifth" value="option">
                        14:00 ~ 15:00
                    </div>
                    
                    <div class="form-check disabled">
                      <input class="form-check-input" type="radio" name="gridRadios" id="FifthToSixth" value="option">
                        15:00 ~ 16:00
                    </div>
                    
                    <div class="form-check disabled">
                      <input class="form-check-input" type="radio" name="gridRadios" id="SixthToSevth" value="option">
                        16:00 ~ 17:00
                    </div>
                    
                    <div class="form-check disabled">
                      <input class="form-check-input" type="radio" name="gridRadios" id="SevthToEight" value="option"> 
                        17:00 ~ 18:00
                    </div>
                  </div>
                </fieldset>
                
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
                     	<option>부서를 선택하세요</option>
                    </select>
                  </div>
                </div>
                <div class="col md-6">
                  <label class="col-sm-2 col-form-label">팀</label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example" id="teamList">
                      
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
                      <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">뒤로가기</button>
                      <button type="button" class="btn btn-primary" id="book-btn">예약하기</button>
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
 defEmp();
 departure();
 var now_utc = Date.now() // 지금 날짜를 밀리초로
//getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
//new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("bookDate").setAttribute("min", today);

var content = "";
var dep = "";

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
	for (var i = 0; i < facList.length; i++) {
		content += "<tr>";
		content += '<th><img src="">'+facList[i].new_filename+'</th>';
		content += '<th>'+facList[i].fac_name+'</th>';
		content += '<th>'+facList[i].fac_state_name+'</th>';
		content += '<th><button id="reg_btn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalDialogScrollable">예약하기</button></th>';
		
		content += "</tr>";
	}
	$('#facList').empty();
	$('#facList').append(content);
} 
	
$('#book-btn').click(function(){//예약하기
	bookDate = $('#bookDate').val();
	bookTime = $('input[name=gridRadios]:checked').val();
	bookCont = $('#bookCont').val();
	selEmp = $('#empList option:selected').val();
	console.log(bookDate);
	console.log(bookTime);
	console.log(bookCont);
	console.log(selEmp);
	 if(bookDate==''){
		alert('날짜를 입력해주세요.');
	}else if(bookTime==undefined){
		alert('시간을 입력해주세요.');
	}else if(bookCont==''){
		alert('내용을 입력해주세요.');
	}else if(selEmp==undefined){
		alert('사원을 선택해주세요.');
	} 
});

function departure(){// 부서 뿌려주기
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

function drawBookGo(depList){ // 모달에서 부서뿌리기
	var dep = '';
	for (var i = 0; i < depList.length; i++) {
		dep += '<option value='+depList[i].dep_num+'>'+depList[i].dep_name+'</option>';	
	}
	$('#departure').empty();
	$('#departure').append(dep);
}


//=============================== 모달 셀렉박스 변화
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

function drawTeam(teamList){
	var team = "";	
	for (var i = 0; i < teamList.length; i++) {
		team += '<option value='+teamList[i].team_num+'>'+teamList[i].team_name+'</option>';		
	}
	$('#teamList').empty();
	$('#teamList').append(team);
}


$('#teamList').change(function (team_num){
	console.log($("#teamList option:selected").val());
	   $.ajax({
		 type : 'get',
		 url : '/fac/emplist.ajax',
		 dataType : 'json',
		 data : {team_num:$("#teamList option:selected").val()},
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
		emp += '<option value='+empList[i].emp_num+'>'+empList[i].emp_name+'</option>';	
	}
	$('#empList').empty();
	$('#empList').append(emp);
}
//============================ 모달 끝

/* function selTeam(dep_num){
	var selTeam = '';
	for (var i = 0; i < dep_num.length; i++) {
		selTeam = '<option value='+dep_num[i].team_num+'>'+dep_num[i].team_name+'</option>';
	}
	$('#teamList').empty();
	$('#teamList').append(selTeam);
} */

function defEmp() {
	var mix = $('#departure option:selected').val();
	console.log(mix);
	if(mix=='부서를 선택하세요'){
		//mix.val();
	}
	for (var i = 0; i < array.length; i++) {
		var start = '시작시간';
		var emd = '종료시간';
		
		if(start.val() < end.val()){
			start = ''
		}
	}
	

/* $.ajax({
	type:'get',
	url:'/fac/kimList.ajax',
	dataType:'json',
	success:function(data){
		console.log(data);
	},
	erroe:function(e){
		console.log(e);
	}
}); */
}

/* function drawKim(kim){
var cont = '';
for (var i = 0; i < kim.length; i++) {
	var cont = '<option value='+kim[i].emp_num+'>'+kim[i].emp_name+'</option>';
}

$('#empList').empty();
$('#empList').append(cont);
}

function chkKim(){
console.log($('#empList option:selected').val());
} 
 */
 	



/* function bookGo(){
$.ajax({
	type:'get',
	dataType:'json',
	 data:{
		bookDate:$('#bookDate.')val(),
		bookTime:$('#bookTime input:checked')val(),
		bookCont:$('#bookCont').val(),
	}, 
	url:'fac/reg.go.ajax',
	data:{fac_num:fac_num},
	success:function(data){
		console.log(data);
		
	},
	error:function(e){
		console.log(e);
	}
});
} */







 


// 1. 부서선택 시 팀배열
//2. 팀배열에서 인덱스로


</script>
</html>
