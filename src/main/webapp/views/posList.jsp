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

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">직책목록</h5>

              <!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">비활성화</th>
					<th scope="col">직책명</th>
					<th scope="col">레벨</th>
					<th scope="col">수정</th>
					</tr>
                </thead>
                <tbody id="list">

                </tbody>
              </table>
              <!-- End Default Table Example -->
            </div>
          </div>
          
          
          
                      		<div class="card-body">
<!--               <h5 class="card-title">Disabled Backdrop</h5> -->
<%--               <p>You can disable the backdrop by adding <code>data-bs-backdrop="false"</code> to <code>.modal-dialog</code></p> --%>

              <!-- Disabled Backdrop Modal -->
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#disablebackdrop">
                직책 추가
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
              
                <div class="col-12">
                  <label for="inputNanme4" class="form-label">직책명</label>
                  <input type="text" id="pos_name" class="form-control" id="inputNanme4" name="pos_name">
                </div>
              
                   <div class="col-md-6">
                  <label for="inputCity" class="form-label">레벨</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="departure"> -->
					 <input type="number" id="pos_level" class="form-control" id="inputNanme4" name="pos_level">
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
                      <button type="button" id="posAddBtn" class="btn btn-primary" data-bs-dismiss="modal" >저장</button>
                    </div>
                  </div>
                </div>
                
              </div><!-- End Disabled Backdrop Modal-->

            </div>


</body>
<script>
listCall();

function listCall(){
	$.ajax({
		type : 'post',
		url : 'hr/list.ajax',
		dataType : 'JSON',
		success :function(data){
			console.log(data.poslist);
 			drawList(data.poslist);
		},
		error : function(e){
			console.log(e);
		}		
	});	
}

function drawList(poslist){
	var content = '';
	
	for(var i = 0; i<poslist.length; i++){
		content += '<tr>';
		content += '<td><input type="checkbox"></td>';
		content += '<td>'+poslist[i].pos_name+'</td>';
		content += '<td>'+poslist[i].pos_level+'</td>';
		content += '<td><a>수정</a></td>';
		content += '</tr>';
	}
	
	$('#list').empty();
	$('#list').append(content);
}

$('#posAddBtn').click(function(){
	
	
	$pos_name = $('#pos_name').val();	
	$pos_level = $("#pos_level").val();
	
	console.log("pos_name : "+$pos_name);
	console.log("pos_level : "+$pos_level);
	
	var param = {};
	param.pos_name = $pos_name;
	param.pos_level = $pos_level;
	
	$.ajax({
		type : 'post',
		url : 'hr/posAdd.ajax',
		data : param,
		dataType : 'json',
		success: function(data){
			console.log(data);
			location.href = "posList.go";
		},
		error : function(e){
			console.log(e);
		}
		
		
	});
	

	
// 	$('#modalDiv').remove();
// 	$('#modal').modal('hide');
	
})

</script>
</html>