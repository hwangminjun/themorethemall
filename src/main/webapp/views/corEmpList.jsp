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
                    
                     
                     
<!--                      <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="selAll" > -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">전체 선택</label> -->
<!--                     </div> -->
                     
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth1" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">권한 부여/회수 권한</label> -->
<!--                     </div> -->
                    
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth2" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">직원 관리 권한</label> -->
<!--                     </div> -->
                    
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth3" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">팀 관리 권한</label> -->
<!--                     </div> -->
                    
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth4" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">직책 관리 권한</label> -->
<!--                     </div> -->
                    
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth5" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">직급 관리 권한</label> -->
<!--                     </div> -->
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth6" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">시설 관리 권한</label> -->
<!--                     </div> -->
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth7" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">공지 사항 작성 권한</label> -->
<!--                     </div> -->
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth8" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">매출결재 완료 조회 권한</label> -->
<!--                     </div> -->
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth9" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">행사결재 완료 조회 권한</label> -->
<!--                     </div> -->
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth10" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">결재완료 상세보기 권한</label> -->
<!--                     </div> -->
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth11" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">점포 등록 권한</label> -->
<!--                     </div> -->
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth12" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">점포 상세보기 권한</label> -->
<!--                     </div> -->
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth13" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">점포 수정 권한</label> -->
<!--                     </div> -->
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth14" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">점포 매출 조회 권한</label> -->
<!--                     </div> -->
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth15" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">특이사항 기준 설정 권한</label> -->
<!--                     </div> -->
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth16" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">특이사항 상세보기 권한</label> -->
<!--                     </div> -->
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth17" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">매출 비교 조회 권한</label> -->
<!--                     </div> -->
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth18" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">협업 관리 권한</label> -->
<!--                     </div> -->
<!--                     <div class="form-check form-switch"> -->
<!--                       <input class="form-check-input" type="checkbox" id="auth19" name="auth"> -->
<!--                       <label class="form-check-label" for="flexSwitchCheckChecked">구역 담당 권한</label> -->
<!--                     </div> -->

                     
                     
                     
                     
                     
                     
                     
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Modal Dialog Scrollable-->

            </div>
          </div>
          
          
           

</body>
<script type="text/javascript">
var showPage = 1;
var total = 5;
listCall(showPage);

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
		content += '<td><input type="button" id="cor'+list[i].emp_num+'" value="협업설정" class="btn btn-primary btn-sm"></td>'
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
			authList(data.authlist);
			authiden(data.emp_authlist);
			drawAuth(data.authlist);
		},
		error: function(e){
			console.log(e);
		}
		
		
	});
}


	function authList(list){
// 		console.log("권한 목록 : "+list);
		
// 		authiden(list);
// 		console.log("개별 : "+authiden(list));
		
		
		

	}

	function authiden(list){
		//console.log(list);
		//console.log(list[0].auth_num);
		newArr = [];
		
		for(var i = 0; i<list.length; i++){
			console.log(list[i].auth_num);
			newArr.push(list[i].auth_num);
		}
		console.log(newArr);
		
// 		return "안녕";
	}





function drawAuth(list){
	//console.log("draw");
	var content = '<div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="selAll" ><label class="form-check-label" for="flexSwitchCheckChecked">전체 선택</label></div>';
	
	for(var i=0; i<list.length; i++){
		console.log(list[i].auth_name);
		content += '<div class="form-check form-switch"><input class="form-check-input" type="checkbox" id="auth'+i+'" name="auth"><label class="form-check-label" for="flexSwitchCheckChecked">'+list[i].auth_name+'</label></div>';
	}
	
	$('#authlist').empty();
	$('#authlist').append(content);
	
}



// function authiden(emp_authlist){
// 	//console.log(authlist);
// 	//console.log(typeof[authlist]);
// 	//console.log(authlist[0].auth_num);
	
// 	var newArr = [];
	
// 	for(var i=0; i<authlist.length; i++){
		
// 		newArr += authlist[i].auth_num+' ';

// 	}
	
// 	console.log("newArr : "+newArr);
// 	//console.log(typeof[newArr]);
	
	
// 	for(var i = 1; i<=newArr.length; i++){
// 		if(newArr.includes(i)){
// 			console.log('#auth'+i+'');
// 			$('#auth'+i+'').prop('checked',true);
// 		}
// 	}
// if(newArr.includes("9")){
// 	console.log("9");
// 	$('#auth9').prop('checked',true);
// }else if(newArr.includes("10"){
// 	console
// }
	
// }








// $('#modalDialogScrollable').on('hidden.bs.modal', function(){
// 	$('input[name=auth]').prop('checked',false);
// })



	
	


</script>

</html>