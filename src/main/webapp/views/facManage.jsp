<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                  			<label for="inputNumber" class="col-sm-2 col-form-label">시설사진</label>
                  	  <div class="col-sm-10">
                    		<input class="form-control" type="file" id="formFile" name="photo">
                  	  </div>
                	</div>
                	<div class="row mb-3" id="fac_name">
                  		<label for="inputText" class="col-sm-2 col-form-label">시설명</label> <!-- 중복확인 -->
                  	<div class="col-sm-10">
                    	<input type="text" class="form-control" name="fac_name">
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
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">등록취소</button>
                      <button id="register" type="button" class="btn btn-primary">등록</button>
                    </div>
                  </div>
                </div>
              </div>
              </form>
              
              
          <form action="facManage/update.do" method="post" enctype="multipart/form-data">    
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
                		<div class="row mb-3" id="admin">
                  			<label class="col-sm-2 col-form-label">책임자</label>
                  		<div class="col-sm-10">
                    		<select class="form-select" name="emp_num" id="detail_admin_emp">
                      			<option selected></option>
                      			
                    		</select>
                  </div>
                </div>
                    </div>
                    
                    <div class="modal-footer">
                      <button type="button" class="btn btn-danger" id="delete">삭제</button>
                      <button id="update" type="button" class="btn btn-primary">수정완료</button>
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
            	
					<table class="table table-bordered">
						<thead> 
							<tr> 			
								<th>사진</th>
								<th>시설명</th>
								<th>회의실 상태</th>
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

var fac_num="";

function facList(){//현재 시설 뿌리기
	$.ajax({
		type : 'get',
		url : 'facManage/list.ajax',
		dataType : 'json',
		success : function(data){
			console.log(data);
			drawFacList(data.facList);
			//fac_num = $('#fac_num').val(data.facList);
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
		content += '<th><img src="">'+facList[i].new_filename+'</th>';
		content += '<th>'+facList[i].fac_name+'</th>';
		if(facList[i].book_num != 0){
			content += '<th>사용 중</th>';			
		}else{
			content += '<th>사용 가능</th>';			
		}
		content += '<button></button>';	
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
		console.log(typeof new_filename);
		console.log(typeof fac_name);	
		//document.getElementById("photo_detail").value = td.eq(0).text();
		document.getElementById("fac_datail").value = td.eq(1).text();	
		document.getElementById("fac_num").value = admin;	
	
	})

}

$('#register').click(function(){
	var ori_fileName = $('#facPhoto input[name=photo]').val();
	var fac_name = $('#fac_name input[name=fac_name]').val();
	var emp_num = $('#admin option:selected').val().toString();
	console.log(ori_fileName);
	console.log(fac_name);
	console.log(emp_num);
	if(ori_fileName == ''){
		alert('사진을 선택하세요');
	}else if(fac_name == ''){
		alert('시설명을 입력하세요');
	}else if(emp_num == '==책임자를 선택하세요=='){
		alert('책임자를 선택하세요');
	}else{
		
		var form = $('#formFile')[0].files[0];
		var formData = new FormData();
		formData.append('files', form);
		
		var data={
			fac_name : $('#fac_name input[name=fac_name]').val(),
			emp_num : $('#admin option:selected').val()
		};
		
		formData.set("data", 'hi');
		formData.set("photo",form);
		formData.set("fac_name",fac_name);
		formData.set("emp_num",emp_num);
		
		
		
		console.log(fac_name);
		console.log(emp_num);
		
		//form data  는 이름그대로 보내면됨 단, set으로
		//params.fac_name = fac_name;
		//params.emp_num = emp_num;
		//console.log(typeof(fac_name));
		//console.log(typeof(emp_num));
		//console.log(typeof(params));
		
		
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
				//regPhoto(data.fac_num);
			},
			error:function(e){
				console.log(e);
			}
		}); 
		
	}
	
}); 
	
	
/* $('#delete').click(function(){
	var ori_fileName = $('#modifyfacPhoto input[name=modifyfacPhoto]').val();
	var fac_name = $('#modifyFac_name input[name=fac_name]').val();
	var emp_num = $('#detail_admin_emp option:selected').val();
	
	
}  */

 function regPhoto(){
	var form = $('#formFile')[0].files[0];
	var formData = new FormData();
	formData.append('files', form);
	
	var form = $('#register');
	
	$.ajax({
		type:'post',
		dataType:'json',
		url : 'facManage/registerFile.ajax',
		processData : false,
		contentType : false,
		//cache:false,
		data:formData,
		success:function(data){
			console.log(data);
			alert('등록완료');
		},
		error:function(e){
			console.log(e);
		}
	}); 
} 

	
</script>
</html>