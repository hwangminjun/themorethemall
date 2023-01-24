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
                    <th scope="col">활성화</th>
                    <th scope="col">직책번호</th>
					<th scope="col">직책명</th>
					<th scope="col">레벨</th>
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
					 <input type="number" id="pos_level" class="form-control" id="inputNanme4" name="pos_level" min="0">
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
                      <button type="button" id="closeAdd" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button type="button" id="posAddBtn" class="btn btn-primary">저장</button>
                    </div>
                  </div>
                </div>
                
              </div><!-- End Disabled Backdrop Modal-->

            </div>
            
            
            
            
            
                                  <div class="card">
         
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
                      <h5 class="modal-title">직책 상세보기</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    
                   
                
                 <div class="col-md-6">
                  <label for="inputCity" class="form-label">직책번호</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="departure"> -->
					 <input type="number" id="pos_num_Detail" class="form-control" id="inputNanme4" name="pos_level" readonly>
                </div> 
                
                <div class="col-12">
                  <label for="inputNanme4" class="form-label">직책명</label>
                  <input type="text" id="pos_name_Detail" class="form-control" id="inputNanme4" name="pos_name">
                </div>
              
                   <div class="col-md-6">
                  <label for="inputCity" class="form-label">레벨</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="departure"> -->
					 <input type="number" id="pos_level_Detail" class="form-control" id="inputNanme4" name="pos_level" min="0">
                </div>       
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button type="button" id="posUpBtn" class="btn btn-primary">수정</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Basic Modal-->

     
          </div>
            
            
            
            
            
            
            
            
            
            


</body>
<script>
listCall();

function listCall(){
	$.ajax({
		type : 'post',
		url : 'hr/posList.ajax',
		dataType : 'JSON',
		success :function(data){
			console.log(data.list);
 			drawList(data.list);
		},
		error : function(e){
			console.log(e);
		}		
	});	
}

function drawList(list){
	var content = '';
	
	for(var i = 0; i<list.length; i++){
		content += '<tr id="'+list[i].pos_num+'" onclick="posUpdate(this.id)">';
		
		if(list[i].act == 1){
			content += '<td><input type="checkbox" id="'+list[i].pos_num+'" onchange="checkChange(this.id)"></td>';
		}else{
			content += '<td><input type="checkbox" id="'+list[i].pos_num+'" onchange="checkChange(this.id)" checked></td>';
			
		}		
		
				
		content += '<td data-bs-toggle="modal" data-bs-target="#basicModal">'+list[i].pos_num+'</td>';
		content += '<td data-bs-toggle="modal" data-bs-target="#basicModal">'+list[i].pos_name+'</td>';
		content += '<td data-bs-toggle="modal" data-bs-target="#basicModal">'+list[i].pos_level+'</td>';
		content += '</tr>';
	}
	
	$('#list').empty();
	$('#list').append(content);
}

$('#posAddBtn').click(function(){
	
	
	var pos_name = $('#pos_name').val();	
	var pos_level = $("#pos_level").val();
	
	console.log("pos_name : "+pos_name);
	console.log("pos_level : "+pos_level);
	
	posAddOver(pos_name);
		
	})
	



function posAddOver(pos_name){
	$.ajax({
		type : 'post',
		url : 'hr/posAddOver.ajax',
		data : {pos_name : pos_name},
		dataType : 'json',
		success : function(data){
			console.log(data);
			if(data.posOverlay){
				alert('이미 존재하는 직책명입니다.');
			}else{
				posAdd();
			}
		},
		error: function(e){
			console.log(e);
		}
	});
}


function posAdd(){
	
	$pos_name = $('#pos_name').val();	
	$pos_level = $("#pos_level").val();
	
	var param = {};
	param.pos_name = $pos_name;
	param.pos_level = $pos_level;
	
	if($pos_name == ''){
		alert("직책명을 입력해 주세요");
	}else if($pos_level == ''){
		alert("직책 레벨을 확인해 주세요")
	}else if($pos_level < 0){
		alert("직책레벨을 양수로 설정해 주세요");
	}else{

		
		$.ajax({
			type : 'post',
			url : 'hr/posAdd.ajax',
			data : param,
			dataType : 'json',
			success: function(data){
				console.log(data);
// 				$('#disablebackdrop').modal('hide');
				location.href = "posList.go";
			},
			error : function(e){
				console.log(e);
			}
		});
	}
}

function posUpdate(checked_id){
	console.log("checked_id : "+checked_id);
	
	$('#list').on('click','#'+checked_id+'',function(){
		var checkList = $(this);
		var td = checkList.children();
		
		var pos_num = td.eq(1).text();
		var pos_name = td.eq(2).text();
		var pos_level = td.eq(3).text();
		
		console.log("pos_name : "+pos_name);
		console.log("pos_level : "+pos_level);
		
		document.getElementById("pos_num_Detail").value = td.eq(1).text();
		document.getElementById("pos_name_Detail").value = td.eq(2).text();
		document.getElementById("pos_level_Detail").value = td.eq(3).text();
		
		});
		
	}


$('#posUpBtn').click(function(){
	
	$pos_name = $('#pos_name_Detail').val();
	$pos_num = $('#pos_num_Detail').val();
	
	var pos_name = $pos_name;
	var pos_num = $pos_num;

	posUpOver(pos_name, pos_num);
	

});

function posUpOver(pos_name, pos_num){
	
	$.ajax({
		type : 'post',
		url : 'hr/posUpOver.ajax',
		data : {pos_name : pos_name, pos_num:pos_num},
		dataType : 'json',
		success : function(data){
			console.log(data);
			if(data.posOverlay){
				alert('이미 존재하는 직책명입니다.');
			}else{
				posUp();
			}
		},
		error: function(e){
			console.log(e);
		}
	});
	
	
}


function posUp(){
	
	$pos_num = $('#pos_num_Detail').val();
	$pos_name = $('#pos_name_Detail').val();
	$pos_level = $('#pos_level_Detail').val();
	
	var param = {};
	param.pos_num = $pos_num
	param.pos_name = $pos_name
	param.pos_level = $pos_level
	
	if($pos_name == ''){
		alert("직책명을 입력해 주세요");
	}else if($pos_level == ''){
		alert("직책레벨을 입력해 주세요");
	}else if($pos_level <0){
		alert("직책레벨을 양수로 설정해 주세요");
	}else{
	

		
		$.ajax({
			type : 'post',
			url : 'hr/posUP.ajax',
			data : param,
			success : function(data){
				console.log(data);
				location.href = "posList.go"
			},
			error : function(e){
				console.log(e);
			}
		})
	}
	
	
}

function checkChange(pos_num){
	console.log("chage event");
	console.log("pos_num : "+pos_num);
	
	var val = pos_num;
	
	$.ajax({
		type : 'post',
		url : 'hr/posCheck.ajax',
		dataType: 'json',
		data: {val:val},
		success: function(data){
			console.log(data);
			if(data.msg){
				alert(data.msg);
			}
			location.href = "posList.go";
// 			drawList(list);
		},
		error: function(e){
			console.log(e);
		}		
	});

}


$('#closeAdd').click(function(){
	$('#pos_name').val('');
	$('#pos_level').val('');
	
})




</script>
</html>