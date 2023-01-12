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
              <h5 class="card-title">직원 권한 및 협업 관리</h5>

              <!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">사번</th>
                    <th scope="col">부서</th>
                    <th scope="col">팀</th>
                    <th scope="col">직책</th>
                    <th scope="col">직급</th>
                    <th scope="col">이름</th>
                    <th scope="col">권한</th>
                    <th scope="col">협업</th>
                  </tr>
                </thead>
                <tbody id="list">

                </tbody>
                                	   <tr>
						<td colspan="8" id="paging" style="text-align:center">
							<div class="container">
								<nav aria-label="Page navigation">
									<ul class = "pagination" id="pagination"></ul>
								</nav>
							</div>
						</td>
					</tr>
              </table>
              <!-- End Default Table Example -->
            </div>
          </div>
          
          
          
          
                    <div class="card">
            <div class="card-body">
              <h5 class="card-title">Scrolling long content</h5>


              <!-- Modal Dialog Scrollable -->
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalDialogScrollable">
                Modal Dialog Scrollable
              </button>
              <div class="modal fade" id="modalDialogScrollable" tabindex="-1">
                <div class="modal-dialog modal-dialog-scrollable">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Modal Dialog Scrollable</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    
                    <div id="authlist"></div>

                     
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button type="button" class="btn btn-primary" data-bs-dismiss="modal">저장</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Modal Dialog Scrollable-->
              
              
              
                            <!-- Scrolling Modal -->
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#scrollingModal">
                Scrolling Modal
              </button>
               <div class="modal fade" id="scrollingModal" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Scrolling Modal</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" style="min-height: 500px;">
                    
                    <div id="teamlist">
                    
                    
                    </div>
                    
                    
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button type="button" class="btn btn-primary" data-bs-dismiss="modal">저장</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Scrolling Modal-->
              
              
              
              
              
              
              
              
              

          
          
           

</body>
<script type="text/javascript">
var showPage = 1;
var total = 5;
listCall(showPage);
teamList();

function listCall(page){
	$.ajax({
		type : 'post',
		url : 'manage/list.ajax',
		data : {'page':page},
		dataType : 'json',
		success : function(data){
			//console.log(data);
			drawList(data.list);
			total = data.total;
			
			$('#pagination').twbsPagination({
				startPage: 1,
				totalPages: data.total,
				visiblePages:5,
				onPageClick: function(e,page){
					listCall(page);
				}
			});
			
		},
		error : function(e){
			console.log(e)
		}
	});
}

function drawList(list){
	var content ='';
	
	for(var i=0; i<list.length; i++){
		content += '<tr>';
		content += '<td>'+list[i].emp_num+'</td>'
		content += '<td>'+list[i].dep_name+'</td>'
		content += '<td>'+list[i].team_name+'</td>'	
		content += '<td>'+list[i].pos_name+'</td>'
		content += '<td>'+list[i].rank_name+'</td>'
		content += '<td>'+list[i].emp_name+'</td>'
		content += '<td><input type="button" id="'+list[i].emp_num+'" value="권한설정" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modalDialogScrollable" onclick="authModal(this.id)"></td>'	
		content += '<td><input type="button" id="cor'+list[i].emp_num+'" value="협업설정" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#scrollingModal"></td>'
		content += '</tr>';
		
		
	}
	
	$('#list').empty();
	$('#list').append(content);	
	
};

$(document).on('click', '#selAll', function(){
	if($('#selAll').is(':checked')){
		$("input[name=auth]").prop('checked',true);
	}else{
		$("input[name=auth]").prop('checked',false);
	}
})

function authModal(click_id){
	console.log("click_id : "+click_id);
	
	val = click_id;
	
	$.ajax({
		type : 'post',
		url : 'manage/authCheck.ajax',
		data : {'val' : val},
		dataType : 'json',
		success : function(data){
			//console.log(data);
			authiden(data.emp_authlist);
			authList(data.authlist);
			
			drawAuth(data.authlist);
		},
		error: function(e){
			console.log(e);
		}
	});
	
	return val;
}

/* 체크박스 리스트 그리기 */
function drawAuth(list){
	//console.log("draw");
	var content = '<div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="selAll" ><label class="form-check-label" for="flexSwitchCheckChecked">전체 선택</label></div>';
	
	
	if(compare.includes(1)){
		content += '<div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="auth'+1+'" name="auth" checked onchange="checkbox(this.id)"><label class="form-check-label" for="flexSwitchCheckChecked">'+list[0].auth_name+'</label></div>';
	}else{
		content += '<div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="auth'+1+'" name="auth" onchange="checkbox(this.id)"><label class="form-check-label" for="flexSwitchCheckChecked">'+list[0].auth_name+'</label></div>';
	}
	
	for(var i= 1; i<list.length; i++){
		console.log(list[i].auth_name);
		
		if(compare.includes(i+1)){
			content += '<div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="auth'+(i+1)+'" name="auth" checked onchange="checkbox(this.id)"><label class="form-check-label" for="flexSwitchCheckChecked">'+list[i].auth_name+'</label></div>';
		}else{
			content += '<div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="auth'+(i+1)+'" name="auth" onchange="checkbox(this.id)"><label class="form-check-label" for="flexSwitchCheckChecked">'+list[i].auth_name+'</label></div>';
		}
		
	}
	
	$('#authlist').empty();
	$('#authlist').append(content);
	
}

/* 부여된 권한 리스트 가져오기 */
function authiden(list){
	empAuth_Arr = [];
	
	for(var i = 0 ; i<list.length; i++){
// 		console.log("부여된 권한"+list[i].auth_num);
		empAuth_Arr.push(list[i].auth_num);
	}	
	
// 	console.log("newArr : "+newArr);
	
	return empAuth_Arr;
}

/* 권한 목록 가져오기, 비교하기 */
function authList(list){
	Auth_Arr = [];
	
	for(var i = 0; i<list.length; i++){
// 		console.log("권한 종류: "+list[i].auth_num);
		Auth_Arr.push(list[i].auth_num);
	}
	
	compare = Auth_Arr.filter(x => empAuth_Arr.includes(x));
 	console.log("compare : "+compare);




	return compare	
}


function checkbox(tagId){
	
	console.log(tagId);
	console.log("return : "+val);
	
	var emp_num = tagId.substr(4);
	console.log(emp_num);
	
	$auth_num = emp_num
	$emp_num = val;
	
	param = {};
	
	param.auth_num  = $auth_num
	param.emp_num = $emp_num
	
	if($('#'+tagId+'').prop('checked')){
// 		var check = $('#'+tagId+'').val('on');
		console.log("on");
		
		$.ajax({
			type: 'post',
			url : 'manage/authAdd.ajax',
			dataType : 'json',
			data : param,
			success: function(data){
				console.log(data);
			},
			error: function(e){
				console.log(e);
			}
		});
		
	}else{
		console.log("off");
		
		$.ajax({
			type: 'post',
			url : 'manage/authDel.ajax',
			dataType : 'json',
			data : param,
			success: function(data){
				console.log(data);
			},
			error: function(e){
				console.log(e);
			}
		});
		
	}

	
}

$('#modalDialogScrollable').on('hidden.bs.modal', function(){
	$('input[name=auth]').prop('checked',false);
})

function teamList(){
	$.ajax({
		type: 'post',
		url : 'manage/teamlist.ajax',
		dataType : 'json',
		success: function(data){
			console.log(data);
			drawTeam(data.teamlist);
			
		},
		error: function(e){
			console.log(e);
		}
		
	});
	
	
}


function drawTeam(list){
	var content = '<div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="selAll" ><label class="form-check-label" for="flexSwitchCheckChecked">전체 선택</label></div>';
	
	for(var i = 0; i<list.length; i++){
		content += '<div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="team'+1+'" name="team" checked onchange="teamcheck(this.id)"><label class="form-check-label" for="flexSwitchCheckChecked">'+list[i].team_name+'</label></div>';
 
		
	}
	
	$('#teamlist').empty();
	$('#teamlist').append(content);
	

	
}


	
	


</script>

</html>