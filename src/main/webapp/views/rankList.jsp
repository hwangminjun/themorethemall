<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">직급 목록</h5>

              <!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
                     <th scope="col">활성화</th>
                     <th scope="col">직급번호</th>
					<th scope="col">직급</th>
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
                직급 추가
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
                  <label for="inputNanme4" class="form-label">직급명</label>
                  <input type="text" id="rank_name" class="form-control" id="inputNanme4" name="rank_name">
                </div>
              
                   <div class="col-md-6">
                  <label for="inputCity" class="form-label">레벨</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="departure"> -->
					 <input type="number" id="rank_level" class="form-control" id="inputNanme4" name="rank_level" min="0">
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
                      <button id="closeAdd" type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button id="rankAddBtn" type="button" class="btn btn-primary">저장</button>
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
                      <h5 class="modal-title">직급 상세보기</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    
                   
                
                 <div class="col-md-6">
                  <label for="inputCity" class="form-label">직급번호</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="departure"> -->
					 <input type="number" id="rank_num_Detail" class="form-control" id="inputNanme4" name="pos_level" readonly>
                </div> 
                
                <div class="col-12">
                  <label for="inputNanme4" class="form-label">직급명</label>
                  <input type="text" id="rank_name_Detail" class="form-control" id="inputNanme4" name="pos_name">
                </div>
              
                   <div class="col-md-6">
                  <label for="inputCity" class="form-label">레벨</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="departure"> -->
					 <input type="number" id="rank_level_Detail" class="form-control" id="inputNanme4" name="pos_level" min="0">
                </div>       
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    </div>
                    <div class="modal-footer">
                      <button type="button" id="closeUpBtn"class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button type="button" id="rankUpBtn" class="btn btn-primary">수정</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Basic Modal-->

     
          </div>
            
            
            

</body>
<script type="text/javascript">
listCall();

function listCall(){
	$.ajax({
		type : 'post',
		url : 'hr/rankList.ajax',
		dataType : 'JSON',
		success :function(data){
			console.log(data);
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
		content += '<tr id="'+list[i].rank_num+'" onclick="rankUpdate(this.id)">';
		
		console.log(list[i].act);
		if(list[i].act == 1){
			content += '<td><input type="checkbox" id="'+list[i].rank_num+'" onchange="checkChange(this.id)"></td>';
		}else{
			content += '<td><input type="checkbox" id="'+list[i].rank_num+'" onchange="checkChange(this.id)" checked></td>';
		}
		
		
		
		
		
		content += '<td data-bs-toggle="modal" data-bs-target="#basicModal">'+list[i].rank_num+'</td>';
		content += '<td data-bs-toggle="modal" data-bs-target="#basicModal">'+list[i].rank_name+'</td>';
		content += '<td data-bs-toggle="modal" data-bs-target="#basicModal">'+list[i].rank_level+'</td>';
		content += '</tr>';
	}
	
	$('#list').empty();
	$('#list').append(content);
}


$('#rankAddBtn').click(function(){

	
	$rank_name = $('#rank_name').val();	
	$rank_level = $("#rank_level").val();
	
	var rank_name = $rank_name;
	
// 	console.log("rank_name : "+$rank_name);
// 	console.log("rank_level : "+$rank_level);
	

	rankOver(rank_name);
	

})

function rankOver(rank_name){
	
	$.ajax({
		type : 'post',
		url : 'hr/rankAddOver.ajax',
		data : {rank_name : rank_name},
		dataType : 'json',
		success : function(data){
			console.log(data);
			
			if(data.rankOverlay){
				alert("이미 존재하는 직급명입니다.");
			}else{
				rankAdd();
			}
			
		},
		error : function(e){
			console.log(e);
		}
	})
}


function rankAdd(){
	
	$rank_name = $('#rank_name').val();	
	$rank_level = $("#rank_level").val();
	
	var param = {};
	param.rank_name = $rank_name;
	param.rank_level = $rank_level;
	
	if($rank_name == ''){
		alert("직급명을 입력해주세요");
	}else if($rank_level == ''){
		alert("직급레벨을 확인해주세요");
	}else if($rank_level <0){
		alert("직급레벨을 양수로 설정해 주세요");
	}else{

		
		$.ajax({
			type : 'post',
			url : 'hr/rankAdd.ajax',
			data : param,
			dataType : 'json',
			success: function(data){
				console.log(data);
				location.href = "rankList.go";
			},
			error : function(e){
				console.log(e);
			}
		});
		
	}
	
	
}

function rankUpdate(clicked_id){
	console.log("clicked_id : "+clicked_id);
	
	$('#list').on('click','#'+clicked_id+'',function(){
		var checkList = $(this);
		var td = checkList.children();
		
		var rank_num = td.eq(1).text();
		var rank_name = td.eq(2).text();
		var rank_level = td.eq(3).text();
		
		document.getElementById("rank_num_Detail").value = td.eq(1).text();
		document.getElementById("rank_name_Detail").value = td.eq(2).text();
		document.getElementById("rank_level_Detail").value = td.eq(3).text();
		
	})	
}

$('#rankUpBtn').click(function(){
	

	$rank_name = $('#rank_name_Detail').val();
	var rank_name = $rank_name;
	$rank_num = $('#rank_num_Detail').val();
	var rank_num = $rank_num
	
	
	rankUpOver(rank_name,rank_num);
});

function rankUpOver(rank_name, rank_num){
	$.ajax({
		type : 'post',
		url : 'hr/rankOver.ajax',
		data : {rank_name : rank_name, rank_num:rank_num},
		dataType : 'json',
		success : function(data){
			console.log(data);
			
			if(data.rankOverlay){
				alert("이미 존재하는 직급명입니다.");
			}else{
				rankUp();
			}
			
		},
		error : function(e){
			console.log(e);
		}
	})
	
	
	
}

function rankUp(){
	
	$rank_num = $('#rank_num_Detail').val();
	$rank_name = $('#rank_name_Detail').val();
	$rank_level = $('#rank_level_Detail').val();
	
	var param = {};
	param.rank_num = $rank_num;
	param.rank_name = $rank_name;
	param.rank_level = $rank_level;
	
	if($rank_name == ''){
		alert("직급명을 입력해주세요");
	}else if($rank_level == ''){
		alert("직급레벨을 입력해주세요");
	}else if($rank_level <0){
		alert("직급레벨을 양수로 설정해 주세요");
	}else{		
		$.ajax({
			type : 'post',
			url : 'hr/rankUP.ajax',
			data : param,
			success : function(data){
				console.log(data);
				location.href = "rankList.go"
			},
			error : function(e){
				console.log(e);
			}
		})
	}
	
	
}

function checkChange(rank_num){
	console.log("chage event");
	console.log("rank_num : "+rank_num);
	
	var val = rank_num;
	
	$.ajax({
		type : 'post',
		url : 'hr/rankCheck.ajax',
		dataType: 'json',
		data: {val:val},
		success: function(data){
			console.log(data);
			if(data.msg){
				alert(data.msg);
			}
			location.href = "rankList.go";
		},
		error: function(e){
			console.log(e);
		}		
	});

}
			
$('#closeAdd').click(function(){
	$('#rank_name').val('');
	$('#rank_level').val('');
	
})




</script>
</html>