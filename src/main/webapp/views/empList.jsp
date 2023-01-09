<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

 <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <link href="assets/css/style.css" rel="stylesheet">

</head>
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
              <div class="modal fade" id="disablebackdrop" tabindex="-1" data-bs-backdrop="false">
                <div class="modal-dialog">
                  <div class="modal-content">
                  <form action="hr/deplist.do" method="post">
                    <div class="modal-header">
                      <h5 class="modal-title">직원 추가</h5>
                      <button type="button" id="empModalBtn" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    </form>
                    <div class="modal-body">
                    
                              <div class="card">
            <div class="card-body">
<!--               <h5 class="card-title">Vertical Form</h5> -->

              <!-- Vertical Form -->
              
                <div class="col-12">
                  <label for="inputNanme4" class="form-label">이름</label>
                  <input type="text" class="form-control" id="inputNanme4" name="emp_name">
                </div>
                <div class="col-12">
                  <label for="inputNanme4" class="form-label">생년월일</label>
                  <input type="date" class="form-control" id="inputNanme4" name="birth">
                </div>
                <div class="col-12">
                  <label for="inputEmail4" class="form-label">이메일</label>
                  <input type="email" class="form-control" id="inputEmail4" name="email">
                </div>
                <div class="col-12">
                  <label for="inputNanme4" class="form-label">연락처</label>
                  <input type="text" class="form-control" id="inputNanme4" placeholder="- 제외 입력" name="phone">
                </div>
                    <div class="col-12">
                  <label for="inputNanme4" class="form-label">최종학력</label>
                  <input type="text" class="form-control" id="inputNanme4" name="academy">
                </div>
                 <div class="col-12">
                  <label for="inputNanme4" class="form-label">입사일</label>
                  <input type="date" class="form-control" id="inputNanme4" name="join_date">
                </div>
                 <div class="col-md-6" style="float:left">
                  <label for="inputCity" class="form-label">부서</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="departure"> -->
                    <select id="deplist" class="form-select" aria-label="Default select example">
                      <option selected>부서를 선택해주세요</option>
                     
<!--                       <option value="2">Two</option> -->
<!--                       <option value="3">Three</option> -->
                    </select>
                </div>
                  <div class="col-md-6" style="float:left">
                  <label for="inputCity" class="form-label">팀</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="team_name"> -->
                    <select id="teamlist" class="form-select" aria-label="Default select example">
                      <option selected>팀을 선택해주세요</option>
<!--                       <option value="1">One</option> -->
<!--                       <option value="2">Two</option> -->
<!--                       <option value="3">Three</option> -->
                    </select>
                </div>
                 <div class="col-md-6" style="float:left">
                  <label for="inputCity" class="form-label">직급</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="rank_name"> -->
                    <select class="form-select" aria-label="Default select example">
                      <option selected>직급을 선택해주세요</option>
                      <option value="1">One</option>
                      <option value="2">Two</option>
                      <option value="3">Three</option>
                    </select>
                </div>
                 <div class="col-md-6" style="float:left">
                  <label for="inputCity" class="form-label">직책</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="position_name"> -->
                    <select class="form-select" aria-label="Default select example">
                      <option selected>직책을 선택해주세요</option>
                      <option value="1">One</option>
                      <option value="2">Two</option>
                      <option value="3">Three</option>
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
                      <button type="submit" class="btn btn-primary">직원추가</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Disabled Backdrop Modal-->

            </div>
            
            
              <!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col"><input type="checkbox"></th>           
                    <th scope="col">사번</th>
					<th scope="col">이름</th>
					<th scope="col">부서</th>
					<th scope="col">팀</th>
					<th scope="col">직급</th>
					<th scope="col">직책</th>
					<th scope="col">입사일</th>
					<th scope="col">상태</th>
                  </tr>
                </thead>
                <tbody id="list">

                </tbody>
              </table>
              <!-- End Default Table Example -->
            </div>
          </div>






<!-- 		<tr> -->
<!-- 			<td colspan="9" id="paging"> -->
<!-- 			<div class="container"> -->
<!-- 				<nav aria-label="Page navigation" style="text-align:center"> -->
<!-- 					<ul class="pagination" id="pagination"></ul> -->
<!-- 				</nav> -->
<!-- 			</div> -->
<!-- 			</td> -->
<!-- 		</tr> -->

         

          

</body>

<script>

// var showPage = 1;

listCall();
departList();

function listCall(){
	$.ajax({
		type: 'post',
		url : 'hr/list.ajax',
		dataType : 'JSON',
		success: function(data){
			console.log(data);
			drawList(data.list);	
			
// 			$('#pagination').twbsPagination({
// 				startPage:1, // 시작 페이지
// 				totalPages: data.total, // 총 페이지 수
// 				visiblePages: 5, // 기본으로 보여줄 페이지 수
// 				onPageClick:function(e,page){ // 클릭했을 때 실행 내용
// 					//console.log(e);
// 					listCall(page);
// 				}
				
// 			});
		},
		error : function(e){
			console.log(e);
		}		
	});
}

function drawList(list){
	var content = '';
	
	for(var i=0; i<list.length; i++){
		console.log(list[i]);
		content += '<tr>';
		content += '<td><input type="checkbox"></td>';
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

function departList(){
	$.ajax({
		type: 'post',
		url : 'hr/list.ajax',
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

function departDraw(deplist){
	var content =  '<option>부서를 입력해주세요</option>';
	
	for(var i=0; i<deplist.length; i++){
// 		console.log(deplist);
		content += '<option value="'+deplist[i].dep_num+'" >'+deplist[i].dep_name+'</option>'		
	}
	
	$('#deplist').empty();
	$('#deplist').append(content);
	
}


$('#deplist').change(function(){
	var val = $(this).val();
	//console.log(val);
	
	$.ajax({
		type: 'get',
		url : 'hr/teamlist.do',
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

function drawTeam(teamlist){
	var content = '<option>팀을 입력해주세요</option>';
	$('#teamlist').empty();
	
	for(var i = 0; i<teamlist.length; i++){
		content += '<option value="'+teamlist[i].team_name+'" >'+teamlist[i].team_name+'</option>'	
		
	}
	$('#teamlist').append(content);
	
}



</script>
</html>