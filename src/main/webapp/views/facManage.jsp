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
		<form action="facManage/register.ajax" method="post" enctype="multipart/form-data">
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
                      <button id="registerFac" type="submit" class="btn btn-primary">등록</button>
                    </div>
                  </div>
                </div>
              </div>
              </form>
              
          <div class="modal fade" id="modal" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5>시설관리</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">등록취소</button>
                      <button type="button" class="btn btn-primary">등록</button>
                    </div>
                  </div>
                </div>
              </div>







	
	<div class="card">
            	<div class="card-body">
            	<br>
            	
            	<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addFac">시설 추가</button>
           
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
		content += '<tr  id="'+facList[i].fac_num+'" onclick="update()" data-bs-toggle="modal" data-bs-target="#modal">';
		content += '<th><img src="">'+facList[i].new_filename+'</th>';
		content += '<th>'+facList[i].fac_name+'</th>';
		if(facList[i].book_num != 0){
			content += '<th>사용 중</th>';			
		}else{
			content += '<th>사용 가능</th>';			
		}
		content += "<button></button>";
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
}


$('#registerFac').click(function(){
	var ori_fileName = $('#facPhoto input[name=photo]').val();
	var fac_name = $('#fac_name input[name=fac]').val();
	var emp_num = $('#admin option:selected').val();
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
		console.log('완료');
	}
	
});
		



function update(){
	
}








	
</script>
</html>