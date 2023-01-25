<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	#fac_Photo{
		width:150px;
		height: 150px;
	} 
	.card-title{
		text-align: center;
		justify-content: center;
		align-items: center;
		line-height: 120px;
	}
	
	.khs_th{
		text-align: center;
		justify-content: center;
	}
	
	</style>
</head>
<body>
		
	<!-- 시설추가 모달 -->
		<form id="regModal" enctype="multipart/form-data" method="post">
			<div class="modal fade" id="addFac" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5>시설추가</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      	<div class="row mb-3" id="facPhoto">
                  			<label for="inputNumber" class="col-sm-2 col-form-label">사진</label>
                  	  <div class="col-sm-10">
                    		<input class="form-control" type="file" id="formFile" name="photo">
                  	  </div>
                	</div>
                	<div class="row mb-3" id="fac_name">
                  		<label for="inputText" class="col-sm-2 col-form-label">시설명</label> <!-- 중복확인 -->
                  	<div class="col-sm-10">
                    	<input type="text" class="form-control" name="fac_name" id="sisul">
                  	</div>
                	</div>
                		<div class="row mb-3" id="admin">
                  			<label class="col-sm-2 col-form-label">책임자</label>
                  				<div class="col-sm-10">
                    				<select class="form-select" name="emp_num" id="admin_emp">
                      					<option selected></option>	
                    				</select>
                  				</div>
                		</div>
                		<div class="row mb-3">
                  			<label for="inputColor" class="col-sm-2 col-form-label">회의실 색상</label>
                  				<div class="col-sm-10">
                    				<input type="color" class="form-control form-control-color" name="color" id="exampleColorInput" value="#000000" title="Choose your color">
                  				</div>
                		</div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">등록취소</button>
                      <button id="register" type="button" class="btn btn-primary">등록</button>
                    </div>
                  </div>
                </div>
              </div>
              </form>
              
              
          <form id="updateModal" method="post" enctype="multipart/form-data">    
          <div class="modal fade" id="modal" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5>시설관리</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                   
                      <div class="modal-body">
                      	<div class="row mb-3" id="modifyfacPhoto">
                      		<input type="hidden" name="fac_num" id="fac_num">
                      		
                  			<label for="inputNumber" class="col-sm-2 col-form-label">시설사진</label>
                  	  <div class="col-sm-10">
                    		<input class="form-control" type="file" id="photo_detail" name="modifyfacPhoto">
                  	  </div>
                	</div>
                	<div class="row mb-3" id="modifyFac_name">
                  		<label for="inputText" class="col-sm-2 col-form-label">시설명</label> <!-- 중복확인 -->
                  	<div class="col-sm-10">
                    	<input type="text" class="form-control"  id="fac_datail" name="fac_name">
                  	</div>
                	</div>
                		<div class="row mb-3" id="detail_admin">
                  			<label class="col-sm-2 col-form-label">책임자</label>
                  				<div class="col-sm-10">
                    				<select class="form-select" name="emp_num" id="detail_admin_emp">
                      					<option selected></option>                   			
                    				</select>
                  				</div>
                			</div>
                			<div class="row mb-3">
                  			<label for="inputColor" class="col-sm-2 col-form-label">회의실 색상</label>
                  				<div class="col-sm-10">
                    				<input type="color" class="form-control form-control-color" id="facColor" title="Choose your color">
                  				</div>
                		</div>
                    </div>
                    
                    <div class="modal-footer">
                      <button type="button" class="btn btn-danger" id="delete">삭제</button>
                      <button id="update" type="button" class="btn btn-primary">수정</button>
                    </div>
                  </div>
                </div>
              </div>
		</form>





	
	<div class="card">
            	<div class="card-body">
            	<br>
            	
            	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addFac">시설 추가</button>
           
            	<br>
            	<br>
            	
					<table class="table table-striped">
						<thead> 
							<tr> 			
								<th class="khs_th" width="34%">사진</th>
								<th class="khs_th" width="33%">시설명</th>
								<th class="khs_th" width="33%">책임자</th>
							</tr>
						</thead>
						<tbody id="facManageList">
						
						</tbody>
					
					</table>
				</div>
			</div>
			
		


</body>

<script>
facList();
empChoice();
var msg = "${msg}";
if(msg!=""){
	alert(msg);
}



function facList(){//현재 시설 뿌리기
	$.ajax({
		type : 'get',
		url : 'facManage/list.ajax',
		dataType : 'json',
		success : function(data){
			console.log(data);
			
			drawFacList(data.facList);
		},
		error : function(e){
			console.log(e);
		}
	});
}

function drawFacList(facList) { // 시설물 리스트 그리기
	content="";	
	
	for (var i = 0; i < facList.length; i++) {
		//onclick="datail(this.id)"
		content += '<tr id="'+facList[i].fac_num+'" onclick="detail(this.id)" data-bs-toggle="modal" data-bs-target="#modal">';
		content += '<th class="th"><img id="fac_Photo" src="/photo/'+facList[i].new_filename+'"></th>';
		content += '<th class="th"><h5 class="card-title">'+facList[i].fac_name+'</h5></th>';
		content += '<th class="th"><h5 class="card-title">'+facList[i].emp_name+'</h5></th>';
		content += "</tr>";
		
	}
	$('#facManageList').empty();
	$('#facManageList').append(content);	
}






function empChoice(){
	$.ajax({
		type : 'get',
		url : 'facManage/empList.ajax',
		dataType : 'json',
		success : function(data){
			console.log(data);
			drawEmpChoice(data.charger);
		},
		error : function(e){
			console.log(e);
		}
	});
}

function drawEmpChoice(charger){
	var admin = "<option>==책임자를 선택하세요==</option>";
	for (var i = 0; i < charger.length; i++) {
		admin += '<option value="'+charger[i].emp_num+'">'+charger[i].emp_name+'</option>';
	}
	$('#admin_emp').empty();
	$('#admin_emp').append(admin);
	$('#detail_admin_emp').empty();
	$('#detail_admin_emp').append(admin);
}





function detail(id){
	console.log(id);
	
	$('#facManageList').on('click','#'+id+'',function(){
		var admin = id;
		
		console.log(admin);
		var list = $(this);
		var td = list.children();	
		var new_filename = td.eq(0).text();		
		var fac_name = td.eq(1).text();
		var emp_name = td.eq(2).text();
		
		console.log(typeof new_filename);
		console.log(typeof fac_name);	
		//document.getElementById("photo_detail").value = td.eq(0).text();
		document.getElementById("fac_datail").value = td.eq(1).text();	
		document.getElementById("fac_num").value = admin;	
	
	
	})

}

$('#register').click(function(){//시설등록 및 파일업로드

	var ori_fileName = $('#facPhoto input[name=photo]').val();
	var fac_name = $('#fac_name input[name=fac_name]').val();
	var emp_num = $('#admin option:selected').val().toString();
	var color = $('#exampleColorInput').val();
	//console.log(ori_fileName);
	//console.log(fac_name);
	//console.log(emp_num);

	console.log(color);
	if(ori_fileName == ''){
		alert('사진을 선택하세요');
	}else if(fac_name == ''){
		alert('시설명을 입력하세요');
	}else if(emp_num == '==책임자를 선택하세요=='){
		alert('책임자를 선택하세요');
	}else if(color == ''){
		alert('색상을 선택해주세요');
	}else{	
		var form = $('#formFile')[0].files[0];
		var formData = new FormData();
		formData.append('files', form);
		
		
		//form data  는 이름그대로 보내면됨 단, set으로	
		
		formData.set("photo",form);
		formData.set("fac_name",fac_name);
		formData.set("emp_num",emp_num);
		formData.set("color",color);		
		
		console.log(fac_name);
		console.log(emp_num);
		
		 $.ajax({
			type:'post',
			dataType:'json',
			url:'facManage/register.ajax',
			data:formData,
			contentType:false,
			processData:false,
			cache:false,
			success:function(data){
				console.log(data);
				if(data.row){
					alert('시설등록이 완료되었습니다.');
					location.href=data.page+".go";
				}
			},
			error:function(e){
				console.log(e);
			}
		});  	
	}	
}); 

$('#update').click(function(){//시설등록 및 파일업로드
	var fac_num = $('#fac_num').val();
	var ori_fileName = $('#photo_detail').val();
	var fac_name = $('#modifyFac_name input[name=fac_name]').val();
	var emp_num = $('#detail_admin option:selected').val().toString();
	var color = $('#facColor').change().val();
	//console.log(ori_fileName);
	//console.log(fac_name);
	//console.log(emp_num);
	console.log(color);
	if(ori_fileName == ''){
		alert('사진을 선택하세요');
	}else if(fac_name == ''){
		alert('시설명을 입력하세요');
	}else if(emp_num == '==책임자를 선택하세요=='){
		alert('책임자를 선택하세요');
	}else if(color == ''){
		alert('색상을 선택해주세요');
	}else{	
		
		var form = $('#photo_detail')[0].files[0];
		var formData = new FormData();
		formData.append('files', form);
		
		//form data  는 이름그대로 보내면됨 단, set으로		
		formData.set("photo",form);
		formData.set("fac_name",fac_name);
		formData.set("emp_num",emp_num);
		formData.set("color",color);		
		formData.set("fac_num", fac_num);
		console.log(form);
		console.log(color);
		console.log(fac_name);
		console.log(emp_num);
		
 		 $.ajax({
			type:'post',
			dataType:'json',
			url:'facManage/update.ajax',
			data:formData,
			contentType:false,
			processData:false,
			cache:false,
			success:function(data){
				console.log(data);
				if(data.row == 1){
					alert(data.msg);
					location.href="facManage.go";
				}else{
					alert(data.msg);
				}
			},
			error:function(e){
				console.log(e);
			}
		});  	 
	}	
}); 
	
$('#delete').click(function(){//쿼리문 수정요망
	var del = confirm("시설물을 지우시겠습니까?");
	var fac_num = $('#fac_num').val();
	console.log(fac_num);
	if(del){
		$.ajax({
			url:'facManage/delete.ajax',
			dataType:'json',
			type:'get',
			data:{fac_num:fac_num},
			success:function(data){
				console.log(data);
				location.href = data.page + ".go";
			},
			error:function(e){
				console.log(e);
			}
		})
	}
});
	

$('#addFac').on('hidden.bs.modal', function (e) {
	$("#sisul").val('');
	$("#admin_emp option:eq(0)").prop("selected", true);
});
$('#modal').on('hidden.bs.modal', function (e) {
	$("#fac_detail").val('');
	$("#detail_admin_emp option:eq(0)").prop("selected", true);
});




	
</script>
</html>