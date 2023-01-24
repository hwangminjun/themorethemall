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
            </div>
          </div>
          
    		
          
          
          



              <!-- Modal Dialog Scrollable -->
<!--               <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalDialogScrollable"> -->
<!--                 Modal Dialog Scrollable -->
<!--               </button> -->
              <div class="modal fade" id="modalDialogScrollable" tabindex="-1">
                <div class="modal-dialog modal-dialog-scrollable">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">직원 권한 설정</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    
                    <div id="authlist"></div>

                     
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
<!--                       <button type="button" class="btn btn-primary" data-bs-dismiss="modal">저장</button> -->
                    </div>
                  </div>
                </div>
              </div><!-- End Modal Dialog Scrollable-->
              
              
              
                            <!-- Scrolling Modal -->
<!--               <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#scrollingModal"> -->
<!--                 Scrolling Modal -->
<!--               </button> -->
               <div class="modal fade" id="scrollingModal" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">직원 협업 설정</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" style="min-height: 500px;">
                    
                    <div id="teamlist">
                    
                    
                    </div>
                    
                    
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
<!--                       <button type="button" class="btn btn-primary" data-bs-dismiss="modal">저장</button> -->
                    </div>
                  </div>
                </div>
              </div><!-- End Scrolling Modal-->
              
              
              
              
              
              
              
              
              

          
          
           

</body>
<script type="text/javascript">
var showPage = 1;
var total = 5;
listCall(showPage);
// teamList();

/* 직원목록 불러오기 */
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

/* 직원목록 그리기 */
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
		content += '<td><input type="button" id="cor'+list[i].emp_num+'" value="협업설정" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#scrollingModal" onclick="teamModal(this.id)"></td>'
		content += '</tr>';
		
		
	}
	
	$('#list').empty();
	$('#list').append(content);	
	
};

/* 권한 all 체크박스 */
$(document).on('click', '#authSelAll', function(){
	if($('#selAll').is(':checked')){
		$("input[name=auth]").prop('checked',true);
	}else{
		$("input[name=auth]").prop('checked',false);
	}
})








/* 권한 모달 클릭 시 권한 종류 체크박스 데이터 불러오기 */
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

/* 권한 체크박스 리스트 그리기 */
function drawAuth(list){
	//console.log("draw");
// 	var content = '<div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="authSelAll" ><label class="form-check-label" for="flexSwitchCheckChecked">전체 선택</label></div>';
	var content = '';
	
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

/* 권한 체크 클릭 시 데이터 업데이트 */
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





/* 협업 팀 체크박스 그리기 */
function drawTeam(list){
// 	var content = '<div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="selAll" ><label class="form-check-label" for="flexSwitchCheckChecked">전체 선택</label></div>';
	var content = '';
	
	if(teamCom.includes(1)){
		content += '<div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="team'+1+'" name="auth" checked onchange="teamcheck(this.id)"><label class="form-check-label" for="flexSwitchCheckChecked">'+list[0].team_name+'</label></div>';
	}else{
		content += '<div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="team'+1+'" name="auth" onchange="teamcheck(this.id)"><label class="form-check-label" for="flexSwitchCheckChecked">'+list[0].team_name+'</label></div>';	
	}

	
	for(var i = 1; i<list.length; i++){
		if(teamCom.includes(i+1)){
			content += '<div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="team'+(i+1)+'" name="team" onchange="teamcheck(this.id)" checked><label class="form-check-label" for="flexSwitchCheckChecked">'+list[i].team_name+'</label></div>';
		}else{
			content += '<div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="team'+(i+1)+'" name="team" onchange="teamcheck(this.id)"><label class="form-check-label" for="flexSwitchCheckChecked">'+list[i].team_name+'</label></div>';
		}
		
	}
	$('#teamlist').empty();
	$('#teamlist').append(content);
}

/* 팀 모달 클릭 시 본인 협업 팀 리스트 , 모든 협업 리스트 가져오기  */
function teamModal(click_id){
	
// 	console.log(click_id);
	id = click_id;
	var emp_num = id.substr(3);
	
// 	console.log("id : "+id);
	
	
// 	console.log(emp_num);

	$.ajax({
		type:'post',
		url : 'manage/corTeam.ajax',
		data: {emp_num:emp_num},
		dataType : 'json',
		success : function(data){
// 			console.log(data);
			corTeam(data.corTeam);
			corList(data.corList);
			
			drawTeam(data.corList);
		},
		error : function(e){
			console.log(e);
		}		
	});
	
	return id;
}
	
/* 본인 팀협업 데이터 */
function corTeam(list){
// 	console.log(typeof [list]);
// 	console.log("지닌권한 : "+list[0].coo_team);
	
	setArr = [];
	
	for(var i=0; i<list.length; i++){
		setArr.push(list[i].coo_team);
	}
	
	
	return setArr;
}

/* 팀 데이터 */
function corList(list){
// 	console.log("팀 리스트 : "+list[0].team_num);
// 	console.log("setArr : "+setArr);
// 	console.log("setArr : "+setArr);

	teamArr = [];
	for(var i=0; i<list.length; i++){
		teamArr.push(list[i].team_num);
	}
	
	teamCom = teamArr.filter(x => setArr.includes(x));
 	console.log("teamCom : "+teamCom);
	
	return teamCom;
}

function teamcheck(check_id){
// 	console.log("id : "+id);
	
	var emp_num = id.substr(3);
	console.log("emp_num : "+emp_num);
	
	console.log("check_id : "+check_id)
	
	var coo_team = check_id.substr(4);
	console.log("coo_team : "+coo_team);
	
// 	$emp_num = emp_num;
// 	$coo_team = coo_team;
	
	param = {};
	
	param.emp_num = emp_num;
	param.coo_team = coo_team;
	
	if($('#'+check_id+'').prop('checked')){
// 		var check = $('#'+tagId+'').val('on');
		console.log("on");
		
		$.ajax({
			type: 'post',
			url : 'manage/teamAdd.ajax',
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
			url : 'manage/teamDel.ajax',
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
		url : 'manage/searchList.ajax',
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

</script>

</html>