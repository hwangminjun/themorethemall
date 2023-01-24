<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>
<style>
	nav{
	text-align:center;
	display:inline-block;
	}
	.container{
	display:inline-block;
	}
</style>
<body>
	

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">직원 목록</h5>
              
				            <div class="card-body">
<!--               <h5 class="card-title">Disabled Backdrop</h5> -->
<%--               <p>You can disable the backdrop by adding <code>data-bs-backdrop="false"</code> to <code>.modal-dialog</code></p> --%>

              <!-- Disabled Backdrop Modal -->
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#disablebackdrop">
                직원추가
              </button>
              
<!--               <form action="hr/write.go" method="post"> -->
              <div class="modal fade" id="disablebackdrop" tabindex="-1" data-bs-backdrop="false">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">직원 추가</h5>
                      <button type="button" id="empModalBtn" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    
                    <div class="modal-body">
                    
                              <div class="card">
                               
            <div class="card-body">
<!--               <h5 class="card-title">Vertical Form</h5> -->

              <!-- Vertical Form -->
             
                <div class="col-12">
                  <label for="inputNanme4" class="form-label">이름</label>
                  <input type="text" id="emp_name" class="form-control"  name="emp_name">
                </div>
                <div class="col-12">
                  <label for="inputNanme4" class="form-label">생년월일</label>
                  <input type="date" id="birth" class="form-control"  name="birth">
                </div>
                <div class="col-12">
                  <label for="inputEmail4" class="form-label">이메일</label>
                  <input type="email" id="email" class="form-control"  name="email">
                </div>
                <div class="col-12">
                  <label for="inputNanme4" class="form-label">연락처</label>
                 
                  <input type="text" id="phone" class="form-control" name="phoneNum" maxlength="13" oninput="phoneNumber(this)">
                </div>
                    <div class="col-12">
                  <label for="inputNanme4" class="form-label">최종학력</label>
                  <input type="text" id="academy" class="form-control" id="inputNanme4" name="academy">
                </div>
                 <div class="col-12">
                  <label for="inputNanme4" class="form-label">입사일</label>
                  <input type="date" id="join_date" class="form-control" id="inputNanme4" name="join_date">
                </div>
                 <div class="col-md-6" style="float:left">
                  <label for="inputCity" class="form-label">부서</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="departure"> -->
                    <select id="deplist" class="form-select" aria-label="Default select example" name="dep_num">
                      <option selected>부서를 선택해주세요</option>
                     
<!--                       <option value="2">Two</option> -->
<!--                       <option value="3">Three</option> -->
                    </select>
                </div>
                  <div class="col-md-6" style="float:left">
                  <label for="inputCity" class="form-label">팀</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="team_name"> -->
                    <select id="teamlist" class="form-select" aria-label="Default select example" name="team_num">
                      <option selected>팀을 선택해주세요</option>
<!--                       <option value="1">One</option> -->
<!--                       <option value="2">Two</option> -->
<!--                       <option value="3">Three</option> -->
                    </select>
                </div>
                 <div class="col-md-6" style="float:left">
                  <label for="inputCity" class="form-label">직급</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="rank_name"> -->
                    <select id="ranklist" class="form-select" aria-label="Default select example" name="rank_num">
<!--                       <option selected>직급을 선택해주세요</option> -->
<!--                       <option value="1">One</option> -->
<!--                       <option value="2">Two</option> -->
<!--                       <option value="3">Three</option> -->
                    </select>
                </div>
                 <div class="col-md-6" style="float:left">
                  <label for="inputCity" class="form-label">직책</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="position_name"> -->
                    <select id="poslist" class="form-select" aria-label="Default select example" name="pos_num">
<!--                       <option selected>직책을 선택해주세요</option> -->
<!--                       <option value="1">One</option> -->
<!--                       <option value="2">Two</option> -->
<!--                       <option value="3">Three</option> -->
                    </select>
                </div>
                

                <div class="text-center">
<!--                   <button type="submit" class="btn btn-primary">저장</button> -->
<!--                   <button type="reset" class="btn btn-secondary">닫기</button> -->
                </div>
                
                
              <!-- Vertical Form -->

            </div>
            
          </div>
                    
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button type="button" id="empAddBtn" class="btn btn-primary">직원추가</button>
                    </div>
                  </div>
                </div>
                
              </div><!-- End Disabled Backdrop Modal-->
<!-- </form> -->
            </div>
            
            
              <!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
<!--                     <th scope="col"><input type="checkbox"></th>            -->
                    <th scope="col">사번</th>
					<th scope="col">이름</th>
					<th scope="col">부서</th>
					<th scope="col">팀</th>
					<th scope="col">직급</th>
					<th scope="col">직책</th>
					<th scope="col">입사일</th>
					<th scope="col">상태</th>
<!-- 					<th scope="col"><a href="">수정</a></th> -->
                  </tr>
                </thead>
                <tbody id="list">

                </tbody>

                			
                	          <tr id="page">
								<td colspan="8" id="paging" style="text-align:center">
									<div class="container">
										<nav aria-label="Page navigation">
											<ul class = "pagination" id="pagination"></ul>
										</nav>
									</div>
								</td>
							</tr>
						
						<tr>
						<td colspan="8" style="text-align:center">
							<div class="container">
							<nav>
							
						<select id="sl1" name="category" class="form-select" style="width: 100px; float: left; margin-right: 10px;" > 
		              	<option value="emp_name" selected>이름</option>
		              	<option value="emp_num" >사번</option>
		              </select>
		              
		              <input type="text" placeholder="검색어 입력" name="detailContent" id="detailContent" class="form-control" style="width: 400px; float: left; margin-right: 10px;">
		         
		              <button onclick="flags(); detailSearch(1)" class="btn btn-primary btn-sm" style="height: 37px;">검색</button>
						</nav>
						
						</div>
						
						</td>	
						</tr>

	   			 
              </table>
              <!-- End Default Table Example -->
              


              
		
				
				<br>
				<br>
			
				
				
				
			
				
       
       </div>
       </div>
      

        
        
        
      
           
              

          
          
          
            <div class="card">
<!--             <div class="card-body"> -->
<!--               <h5 class="card-title">Basic Modal</h5> -->
<!--               <p>Toggle a working modal demo by clicking the button below. It will slide down and fade in from the top of the page</p> -->

              <!-- Basic Modal -->
<!--               <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModal"> -->
<!--                 Basic Modal -->
<!--               </button> -->
              <div class="modal fade" id="basicModal" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">직원 상세보기</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    
                    
                  <div class="col-12">
                  <label for="inputNanme4" class="form-label">사번</label>
                  <input type="text" id="emp_num_Detail" class="form-control" id="inputNanme4" name="emp_num" readonly>
                </div>
                    

                  <div class="col-12">
                  <label for="inputNanme4" class="form-label">이름</label>
                  <input type="text" id="emp_name_Detail" class="form-control" id="inputNanme4" name="emp_name">
                </div>
                <div class="col-12">
                  <label for="inputNanme4" class="form-label">생년월일</label>
                  <input type="date" id="birth_Detail" class="form-control" id="inputNanme4" name="birth">
                </div>
                <div class="col-12">
                  <label for="inputEmail4" class="form-label">이메일</label>
                  <input type="email" id="email_Detail" class="form-control" id="inputEmail4" name="email">
                </div>
                <div class="col-12">
                  <label for="inputNanme4" class="form-label">연락처</label>
                  <input type="text" id="phone_Detail" class="form-control" id="inputNanme4" name="phone" maxlength="13" oninput="phoneNumber_detail(this)">
                </div>
                    <div class="col-12">
                  <label for="inputNanme4" class="form-label">최종학력</label>
                  <input type="text" id="academy_Detail" class="form-control" id="inputNanme4" name="academy">
                </div>
                 <div class="col-12">
                  <label for="inputNanme4" class="form-label">입사일</label>
                  <input type="date" id="join_date_Detail" class="form-control" id="inputNanme4" name="join_date">
                </div>
                 <div class="col-md-6" style="float:left">
                  <label for="inputCity" class="form-label">부서</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="departure"> -->
                    <select id="deplist_Detail" class="form-select" aria-label="Default select example" name="dep_num" >
                      <option selected>부서를 선택해주세요</option>
                     
<!--                       <option value="2">Two</option> -->
<!--                       <option value="3">Three</option> -->
                    </select>
                </div>
                  <div class="col-md-6" style="float:left">
                  <label for="inputCity" class="form-label">팀</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="team_name"> -->
                    <select id="teamlist_Detail" class="form-select" aria-label="Default select example" name="team_num" >
                      <option selected>팀을 선택해주세요</option>
<!--                       <option value="1">One</option> -->
<!--                       <option value="2">Two</option> -->
<!--                       <option value="3">Three</option> -->
                    </select>
                </div>
                 <div class="col-md-6" style="float:left">
                  <label for="inputCity" class="form-label">직급</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="rank_name"> -->
                    <select id="ranklist_Detail" class="form-select" aria-label="Default select example" name="rank_num" >
<!--                       <option selected>직급을 선택해주세요</option> -->
<!--                       <option value="1">One</option> -->
<!--                       <option value="2">Two</option> -->
<!--                       <option value="3">Three</option> -->
                    </select>
                </div>
                 <div class="col-md-6" style="float:left">
                  <label for="inputCity" class="form-label">직책</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="position_name"> -->
                    <select id="poslist_Detail" class="form-select" aria-label="Default select example" name="pos_num" >
<!--                       <option selected>직책을 선택해주세요</option> -->
<!--                       <option value="1">One</option> -->
<!--                       <option value="2">Two</option> -->
<!--                       <option value="3">Three</option> -->
                    </select>
                </div>
                
                  <div class="col-md-6">
                  <label for="inputCity" class="form-label">상태</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="rank_name"> -->
                    <select id="state" class="form-select" aria-label="Default select example" name="state">
                      <option selected>상태를 선택해주세요</option>
                      <option value="1">휴가</option>
                      <option value="2">반차</option>
                      <option value="3">출장</option>
                      <option value="4">재직</option>
                      <option value="5">퇴직</option>
                    </select>
                </div>
  

                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button type="button" id="empUpBtn" class="btn btn-primary">수정</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Basic Modal-->

<!--             </div> -->
          </div>
            
            
          
          



</body>

<script>


var showPage = 1;
var total = 5;
listCall(showPage);

departList();
rankList();
posList();



/* 직원목록 페이징으로 불러오기 */
function listCall(page){
	
	$.ajax({
		type: 'post',
		url : 'hr/list.ajax',
		data : {'page':page},
		dataType : 'JSON',
		success: function(data){
			console.log(data);
			drawList(data.list);	
			total = data.total;
			
			$("#pagination").twbsPagination({
				startPage:1, // 시작페이지
				totalPages:data.total, // 총 페이지 수
				visiblePages:5, // 기본으로 보여줄 페이지 수
				onPageClick:function(e, page){ // 클릭했을 때 실행 내용
					//console.log(e);
					listCall(page);
				}
			});
		},
		error : function(e){
			console.log(e);
		}		
	});
	
}

/* 직원 목록 그리기 */
function drawList(list){
	var content = '';
	
	for(var i=0; i<list.length; i++){

		content += '<tr id="'+list[i].emp_num+'" onclick="empUpdate(this.id)" data-bs-toggle="modal" data-bs-target="#basicModal">';
		content += '<td>'+list[i].emp_num+'</td>';
		content += '<td>'+list[i].emp_name+'</td>';
		content += '<td>'+list[i].dep_name+'</td>';
		content += '<td>'+list[i].team_name+'</td>';
		content += '<td>'+list[i].pos_name+'</td>';
		content += '<td>'+list[i].rank_name+'</td>';		
		content += '<td>'+list[i].join_date+'</td>';
		content += '<td>'+list[i].state+'</td>';
		content += '</tr>';
	}
	
	$('#list').empty();
	$('#list').append(content);
	
}

/* 부서 데이터 불러오기 */
function departList(){
	$.ajax({
		type: 'post',
		url : 'hr/etclist.ajax',
		dataType : 'JSON',
		success: function(date){
			console.log(date);
		departDraw(date.deplist);
		},
		error : function(e){
			console.log(e);
		}

	});
	
}

/* 부서 그리기 */
function departDraw(deplist){
	var content =  '<option>부서를 선택해주세요</option>';
	
	for(var i=0; i<deplist.length; i++){
		content += '<option value="'+deplist[i].dep_num+'" >'+deplist[i].dep_name+'</option>'		
	}
	
	$('#deplist').empty();
	$('#deplist').append(content);
	
	$('#deplist_Detail').empty();
	$('#deplist_Detail').append(content);
	
}

/* 부서 드롭다운 클릭 시 해당 팀 불러오기 */
$('#deplist').change(function(){
	var val = $(this).val();

	$.ajax({
		type: 'get',
		url : 'hr/teamlist.ajax',
		data:{val:val},
		dataType:'json',
		success: function(data){
			drawTeam(data.teamlist);
		},
		error: function(e){
			console.log(e);
		}		
	});	
});

/* 팀 목록 그리기 */
function drawTeam(teamlist){
	var content = '<option>팀을 선택해주세요</option>';

	for(var i = 0; i<teamlist.length; i++){
		content += '<option value="'+teamlist[i].team_num+'" >'+teamlist[i].team_name+'</option>'	
	}
	
	$('#teamlist').empty();	
	$('#teamlist').append(content);	
	
	$('#teamlist_Detail').empty();	
	$('#teamlist_Detail').append(content);
}


function rankList(){
	$.ajax({
		type: 'post',
		url : 'hr/etclist.ajax',
		dataType : 'JSON',
		success: function(date){
			console.log(date);
		rankDraw(date.ranklist);
		},
		error : function(e){
			console.log(e);
		}		
	});	
}

/* 직급 드롭다운 그리기 */
function rankDraw(ranklist){
	var content =  '<option>직급을 선택해주세요</option>';
	
	for(var i=0; i<ranklist.length; i++){
		content += '<option value="'+ranklist[i].rank_num+'" >'+ranklist[i].rank_name+'</option>'		
	}
	
	$('#ranklist').empty();
	$('#ranklist').append(content);
	
	$('#ranklist_Detail').empty();
	$('#ranklist_Detail').append(content);
	
}

/* 직책 불러오기 */
function posList(){
	$.ajax({
		type: 'post',
		url : 'hr/etclist.ajax',
		dataType : 'JSON',
		success: function(date){
			console.log(date);
			posDraw(date.poslist);
		},
		error : function(e){
			console.log(e);
		}		
	});	
}

/* 직책 그리기 */
function posDraw(poslist){
	var content =  '<option>직책을 선택해주세요</option>';
	
	for(var i=0; i<poslist.length; i++){
		content += '<option value="'+poslist[i].pos_num+'" >'+poslist[i].pos_name+'</option>'		
	}
	
	$('#poslist').empty();
	$('#poslist').append(content);
	
	$('#poslist_Detail').empty();
	$('#poslist_Detail').append(content);
	
}

/* 직원 추가 버튼 이벤트 */
$('#empAddBtn').click(function(){
	
	$emp_name = $('#emp_name').val();	
	$birth = $("#birth").val();
	$email = $("#email").val();
	$phone = $("#phone").val();
	$academy = $("#academy").val();
	$join_date = $("#join_date").val();
	$dep_num = $("#deplist").val();
	$team_num = $("#teamlist").val();
	$rank_num = $("#ranklist").val();
	$pos_num = $("#poslist").val();	
	

	
	if($emp_name == ''){
		alert("사원 이름을 입력해주세요");
	}else if($birth == ''){
		alert("사원 생일을 입력해주세요");
	}else if($email == ''){
		alert("사원 이메일을 입력해주세요");
	}else if($phone == ''){
		alert("사원 전화번호를 입력해주세요");
	}else if($academy == ''){
		alert("사원 최종학력을 입력해주세요");
	}else if($join_date == ''){
		alert("사원 입사일을 입력해주세요");
	}else if($dep_num == '부서를 선택해주세요'){
		alert("부서를 선택해주세요");
	}else if($team_num == '팀을 선택해주세요'){
		alert("팀을 선택해주세요");
	}else if($rank_num == '직급을 선택해주세요'){
		alert("직급을 선택해주세요") ;
	}else if($pos_num == '직책을 선택해주세요'){
		alert("직책을 선택해주세요");
	}else{
		
		var param = {};
		
		param.emp_name = $emp_name
		param.birth = $birth
		param.email = $email
		param.phone = $phone
		param.academy = $academy
		param.join_date = $join_date
		param.dep_num = $dep_num
		param.team_num = $team_num
		param.rank_num = $rank_num
		param.pos_num = $pos_num

		
		$.ajax({
			type : 'post',
			url : 'hr/empAdd.ajax',
			data : param,
			dataType : 'json',
			success: function(data){
				console.log(data);
				location.href = "empList.go";
				$('#disablebackdrop').modal("hide");
			},
			error : function(e){
				console.log(e);
			}
		});
	}

})

/* 직원목록 클릭 시 상세보기  */
/* 상세 내용 넣기-1  */
function empUpdate(checked_id){
	console.log("checked_id : "+checked_id);
	
	$('#list').on('click','#'+checked_id+'', function(){
		var checkList = $(this);
		var td = checkList.children();
	
		var emp_num = td.eq(0).text();
		var emp_name = td.eq(1).text();
		var join_date = td.eq(6).text();
		
		console.log("emp_num : "+emp_num);
		
		document.getElementById("emp_num_Detail").value = td.eq(0).text();
		document.getElementById("emp_name_Detail").value = td.eq(1).text();

		$("#join_date_Detail").val(td.eq(6).text());
	
	$.ajax({
		type : 'post',
		url : 'hr/empDetail.ajax',
		data : {emp_num:emp_num},
		dataType : 'json',
		success : function(data){
			console.log("what : "+data.empDetail);
			empDeLi(data.empDetail);
		},
		error : function(e){
			console.log(e);
		}		
	});
	})	
}

/* 상세 내용 넣기-2  */
function empDeLi(empDetail){

	console.log("team : "+empDetail[0].team_num);
	
	$('#state').val(empDetail[0].state_num);
	document.getElementById("phone_Detail").value = empDetail[0].phone;
	document.getElementById("email_Detail").value = empDetail[0].email;
	document.getElementById("academy_Detail").value = empDetail[0].academy;
	$("#birth_Detail").val(empDetail[0].birth);
	$("#deplist_Detail").val(empDetail[0].dep_num);
// 	$("#teamlist_Detail").val(empDetail[0].team_num);
	$("#ranklist_Detail").val(empDetail[0].rank_num);
	$("#poslist_Detail").val(empDetail[0].pos_num);
	
	var val = empDetail[0].dep_num;
	
	/* 여기에 직원의 상태 불러오기*/
	
	$.ajax({
		type: 'get',
		url : 'hr/teamlist.ajax',
		data:{val:val},
		dataType:'json',
		success: function(data){
			drawTeam(data.teamlist);
			$("#teamlist_Detail").val(empDetail[0].team_num);
			
		},
		error: function(e){
			console.log(e);
		}		
	});	
}

/* 상세보기 부서 변경 될때 팀 리스트 불러오기 */
$('#deplist_Detail').change(function(){
	var val = $(this).val();
	//console.log(val);
	
	$.ajax({
		type: 'get',
		url : 'hr/teamlist.ajax',
		data:{val:val},
		dataType:'json',
		success: function(data){
			//console.log(data.team_name);
			//console.log("here");
			drawTeam(data.teamlist);
		},
		error: function(e){
			console.log(e);
		}		
	});	
});

/* 직원 수정 버튼 이벤트  */
$('#empUpBtn').click(function(){
	
	$emp_num = $('#emp_num_Detail').val();	
	$emp_name = $('#emp_name_Detail').val();	
	$birth = $("#birth_Detail").val();
	$email = $("#email_Detail").val();
	$phone = $("#phone_Detail").val();
	$academy = $("#academy_Detail").val();
	$join_date = $("#join_date_Detail").val();
	$dep_num = $("#deplist_Detail").val();
	$team_num = $("#teamlist_Detail").val();
	$rank_num = $("#ranklist_Detail").val();
	$pos_num = $("#poslist_Detail").val();
	$state_num = $('#state').val();
	
	if($emp_name == ''){
		alert("사원 이름을 입력해주세요");
	}else if($birth == ''){
		alert("사원 생일을 입력해주세요");
	}else if($email == ''){
		alert("사원 이메일을 입력해주세요");
	}else if($phone == ''){
		alert("사원 전화번호를 입력해주세요");
	}else if($academy == ''){
		alert("사원 최종학력을 입력해주세요");
	}else if($join_date == ''){
		alert("사원 입사일을 입력해주세요");
	}else if($dep_num == '부서를 선택해주세요'){
		alert("부서를 선택해주세요");
	}else if($team_num == '팀을 선택해주세요'){
		alert("팀을 선택해주세요");
	}else if($rank_num == '직급을 선택해주세요'){
		alert("직급을 선택해주세요") ;
	}else if($pos_num == '직책을 선택해주세요'){
		alert("직책을 선택해주세요");
	}else if($state_num == '상태를 선택해주세요'){
		alert("상태를 선택해주세요");
	}else{
		
		var param = {};
		
		param.emp_num = $emp_num
		param.emp_name = $emp_name
		param.birth = $birth
		param.email = $email
		param.phone = $phone
		param.academy = $academy
		param.join_date = $join_date
		param.dep_num = $dep_num
		param.team_num = $team_num
		param.rank_num = $rank_num
		param.pos_num = $pos_num
		param.state_num = $state_num
		
		$.ajax({
			type : 'post',
			url : 'hr/empUpdate.ajax',
			data : param,
			dataType : 'json',
			success: function(data){
				console.log(data);
				location.href = "empList.go";
				$('#basicModal').modal("hide");
			},
			error : function(e){
				console.log(e);
			}

		});
	}
	

})

/* 페이징 다시 그리기 */
function drawPage(){
	var paging = "";
	$('#page').empty();
	paging += '<td colspan="8" id="paging" style="text-align:center">';
	paging += '<div class="container">';
	paging += '<nav aria-label="Page navigation">';
	paging += '<ul class="pagination" id="pagination"></ul>';
	paging += '</nav></div></td>';
	
	$('#page').append(paging);
}




/* 검색 */
var flag = true;

function flags(){
	if(!flag){
		flag = true;
	}
}


function detailSearch(page){
	if(flag){
		drawPage();
	}
	flag = false;
	var detailContent = $('#detailContent').val();
	var sl1 = document.getElementById("sl1");
	console.log(sl1.options[sl1.selectedIndex].value);
	
	$.ajax({
		type: 'post',
		url : 'hr/searchList.ajax',
		data : {
			'detailContent' : detailContent,
			'sl1' : sl1.options[sl1.selectedIndex].value,
			'page' : page
		},
		dataType : 'json',
		success: function(data){
			console.log(data.list);
			drawList(data.list);
			
			if(data.total >= 1){
				$('#pagination').twbsPagination({
					startPage : 1,
					totalPages : data.total,
					visiblePages : 5,
					onPageClick : function(e, page){
						detailSearch(page);
						flag = false;
						console.log("data.total : "+data.total);
					}
				});
			}
		},
		error : function(e){
			console.log(e);
		}		
	});	
}


const phoneNumber = (target) =>{
	value = target.value;
	
	if (!value) {
	    $('#phone').val('');
	  }

	  value = value.replace(/[^0-9]/g, "");

	  let result = [];
	  let restNumber = "";

	  // 지역번호와 나머지 번호로 나누기
	  if (value.startsWith("02")) {
	    // 서울 02 지역번호
	    result.push(value.substr(0, 2));
	    restNumber = value.substring(2);
	  } else if (value.startsWith("1")) {
	    // 지역 번호가 없는 경우
	    // 1xxx-yyyy
	    restNumber = value;
	  } else {
	    // 나머지 3자리 지역번호
	    // 0xx-yyyy-zzzz
	    result.push(value.substr(0, 3));
	    restNumber = value.substring(3);
	  }

	  if (restNumber.length === 7) {
	    // 7자리만 남았을 때는 xxx-yyyy
	    result.push(restNumber.substring(0, 3));
	    result.push(restNumber.substring(3));
	  } else {
	    result.push(restNumber.substring(0, 4));
	    result.push(restNumber.substring(4));
	  }

	$('#phone').val(result.filter((val) => val).join("-"));
	
}


const phoneNumber_detail = (target) =>{
	value = target.value;
	
	if (!value) {
	    $('#phone_Detail').val('');
	  }

	  value = value.replace(/[^0-9]/g, "");

	  let result = [];
	  let restNumber = "";

	  // 지역번호와 나머지 번호로 나누기
	  if (value.startsWith("02")) {
	    // 서울 02 지역번호
	    result.push(value.substr(0, 2));
	    restNumber = value.substring(2);
	  } else if (value.startsWith("1")) {
	    // 지역 번호가 없는 경우
	    // 1xxx-yyyy
	    restNumber = value;
	  } else {
	    // 나머지 3자리 지역번호
	    // 0xx-yyyy-zzzz
	    result.push(value.substr(0, 3));
	    restNumber = value.substring(3);
	  }

	  if (restNumber.length === 7) {
	    // 7자리만 남았을 때는 xxx-yyyy
	    result.push(restNumber.substring(0, 3));
	    result.push(restNumber.substring(3));
	  } else {
	    result.push(restNumber.substring(0, 4));
	    result.push(restNumber.substring(4));
	  }

	$('#phone_Detail').val(result.filter((val) => val).join("-"));
	
}


</script>
</html>