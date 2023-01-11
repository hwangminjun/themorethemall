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
<!-- 테이블 -->

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">팀관리</h5>

              <!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">비활성화</th>
					<th scope="col">부서</th>
					<th scope="col">팀</th>
<!-- 					<th scope="col">수정</th> -->
					</tr>
                </thead>
                <tbody id="list">

                </tbody>
              </table>
              <!-- End 테이블--> 
          

            </div>
              </div>
            
            
            
            
            		<div id="modal" class="card-body">
<!--               <h5 class="card-title">Disabled Backdrop</h5> -->
<%--               <p>You can disable the backdrop by adding <code>data-bs-backdrop="false"</code> to <code>.modal-dialog</code></p> --%>

              <!-- Disabled Backdrop Modal -->
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#disablebackdrop">
                팀 추가
              </button>
              
              <div class="modal fade" id="disablebackdrop" tabindex="-1" data-bs-backdrop="false">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
<!--                       <h5 class="modal-title">팀 추가</h5> -->
                      <button type="button" id="empModalBtn" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    
                    <div class="modal-body">
                    
                              <div class="card">
                               
            <div class="card-body">
<!--               <h5 class="card-title">Vertical Form</h5> -->

              <!-- Vertical Form -->
              
                   <div class="col-md-6">
                  <label for="inputCity" class="form-label">부서</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="departure"> -->
                    <select id="deplist" class="form-select" aria-label="Default select example" name="dep_num">
                      <option selected>부서를 선택해주세요</option>
                     
<!--                       <option value="2">Two</option> -->
<!--                       <option value="3">Three</option> -->
                    </select>
                </div>
             
                <div class="col-12">
                  <label for="inputNanme4" class="form-label">팀 명</label>
                  <input type="text" id="team_name" class="form-control" id="inputNanme4" name="emp_name">
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
                      <button type="button" id="teamAddBtn" class="btn btn-primary" data-bs-dismiss="modal">저장</button>
                    </div>
                  </div>
                </div>
                
              </div><!-- End Disabled Backdrop Modal-->
            </div>
            
            
            
            
                      <div class="card">
            <div class="card-body">
              <h5 class="card-title">Basic Modal</h5>
              <p>Toggle a working modal demo by clicking the button below. It will slide down and fade in from the top of the page</p>

              <!-- Basic Modal -->
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModal">
                Basic Modal
              </button>
              <div class="modal fade" id="basicModal" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">팀 상세보기</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    
                    
                   <div class="col-md-6">
                  <label for="inputCity" class="form-label">부서</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="departure"> -->
                    <select id="deplist_Detail" class="form-select" aria-label="Default select example" name="dep_num">
<!--                       <option selected >부서를 선택해주세요</option> -->
                     
<!--                       <option value="2">Two</option> -->
<!--                       <option value="3">Three</option> -->
                    </select>
                </div>
             
                <div class="col-12">
                  <label for="inputNanme4" class="form-label">팀 명</label>
                  <input type="text" id="team_name_Detail" class="form-control" id="inputNanme4" name="team_name" value="">
                </div>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Basic Modal-->

            </div>
          </div>
            
            
            
           
            
            
            
          


</body>
<script>
listCall();
departList();

function listCall(){
	$.ajax({
		type : 'post',
		url : 'hr/Teamlist.ajax',
		dataType : 'JSON',
		success :function(data){
 			drawList(data.list);
 			teamUpdate(data.list);
 			
		},
		error : function(e){
			console.log(e);
		}		
	});	
}

function drawList(list){
	var content = '';
	
	for(var i = 0; i<list.length; i++){
		content += '<tr id="'+list[i].team_num+'" onclick= "teamUpdate(this.id)" data-bs-toggle="modal" data-bs-target="#basicModal">';
		content += '<td><input type="checkbox"></td>';
		content += '<td>'+list[i].dep_name+'</td>';
		content += '<td>'+list[i].team_name+'</td>';
// 		content += '<td><button type="button"  >수정</button></td>';
		content += '</tr>';
// 		data-bs-toggle="modal" data-bs-target="#basicModal"
	}
	
	$('#list').empty();
	$('#list').append(content);

}

// function teamUpdate(list){
	
// 	for(var i = 0; i<list.length; i++){
// 		$('#list').on('click','#'+i+'',function(){
// 			console.log("id : "+i);			
// 				})		
// 	}	
// }


	








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
	var content =  '<option>부서를 선택해주세요</option>';
	
	for(var i=0; i<deplist.length; i++){
 		console.log(deplist);
		content += '<option value="'+deplist[i].dep_num+'" >'+deplist[i].dep_name+'</option>'		
	}
	
	
	$('#deplist').empty();
	$('#deplist').append(content);
	
	$('#deplist_Detail').empty();
	$('#deplist_Detail').append(content);
	
}

$('#teamAddBtn').click(function(){
	
	
	$deplist = $('#deplist option:selected').val();
	//console.log($deplist);
	
	$team_name = $("#team_name").val();
	console.log($team_name);
	
	var param = {};
	param.dep_num = $deplist
	param.team_name = $team_name;
	
	$.ajax({
		type : 'post',
		url : 'hr/teamAdd.ajax',
		data : param,
		dataType : 'json',
		success: function(data){
			console.log(data);
			location.href = "teamList.go";
		},
		error : function(e){
			console.log(e);
		}
		
		
	});
	

	

	
})

	
	
	function teamUpdate(clicked_id){
		console.log("clicked_id : "+clicked_id);
		
		$('#list').on('click','#'+clicked_id+'',function(){
			var checkList = $(this);
			var td = checkList.children();
			
			var dep_name = td.eq(1).text();
			var team_name = td.eq(2).text();
			
			console.log("dep_name : "+dep_name);
			console.log("team_name : "+team_name);
			
//	 		document.getElementById("deplist_Detail").value = td.eq(1).text();
			
			document.getElementById("team_name_Detail").value = td.eq(2).text();
		
		})	
	}



</script>
</html>