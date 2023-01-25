<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>


</style>
<body>
    <div class="pagetitle">
      <h3>마이페이지</h3>
      
    </div><!-- End Page Title -->

    <section class="section profile">
      <div class="row">
        <div class="col-xl-4">

          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
				<c:if test="${sessionScope.profileImg == null }">
				
					<img src="/photo/no-profile.png" alt="Profile" class="rounded-circle">
				</c:if> 
				<c:if test="${sessionScope.profileImg != null }">
					<img src="/photo/${sessionScope.profileImg} " alt="Profile" class="rounded-circle">
				</c:if>
              <h2>프로필 사진</h2>
              <br>
              <div>
<!--           	<label className="input-file-button" for="profileImg" class="btn btn-primary"> 업로드</label> -->
<!-- 			<input type="file" id="profileImg" style="display:none;" name="profileImg" accept="image/*"/> -->
				<button id="imgModalBtn" class="btn btn-primary"  data-bs-toggle="modal" data-bs-target="#imgModal">이미지 설정</button>
              
              </div>
            </div>
          </div>
          
          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
				<c:if test="${sessionScope.signImg == null }">
					<img src="/photo/no-sign.png" alt="sign">
				</c:if> 
				<c:if test="${sessionScope.signImg != null }">
					<img src="/photo/${sessionScope.signImg} " alt="sign">
				</c:if>
              
              <h2>서명 이미지</h2>
              
                            <br>
              <div>
				<button id="signModal" class="btn btn-primary"  data-bs-toggle="modal" data-bs-target="#signImgModal">이미지 설정</button>
              
              </div>
              
              
              
            </div>
          </div>

        </div>

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">내 정보</button>
                </li>


                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">비밀번호 변경</button>
                </li>

              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                  
                  <h5 class="card-title">내 정보</h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">이름</div>
                    <div class="col-lg-9 col-md-8"><input id="name" type="text" value="${sessionScope.loginInfo.emp_name }" class="form-control" style="width: 250px"></div>
                     <div class="col-lg-9 col-md-8"><input id="emp_num" type="hidden" value="${sessionScope.loginInfo.emp_num }" class="form-control" style="width: 250px"></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">생년월일</div>
                    <div class="col-lg-9 col-md-8">${sessionScope.loginInfo.birth }</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">부서</div>
                    <div class="col-lg-9 col-md-8">${sessionScope.loginInfo.dep_name }</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">팀</div>
                    <div class="col-lg-9 col-md-8">${sessionScope.loginInfo.team_name }</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">직급</div>
                    <div class="col-lg-9 col-md-8">${sessionScope.loginInfo.rank_name}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">직책</div>
                    <div class="col-lg-9 col-md-8">${sessionScope.loginInfo.pos_name }</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">전화번호</div>
                    <div class="col-lg-9 col-md-8"><input id="phone" type="text" value="${sessionScope.loginInfo.phone }" class="form-control" style="width: 250px"></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">이메일</div>
                    <div class="col-lg-9 col-md-8"><input id="email" type="text" value="${sessionScope.loginInfo.email }" class="form-control" style="width: 250px"></div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">최종학력</div>
                    <div class="col-lg-9 col-md-8"><input id="academy" type="text" value="${sessionScope.loginInfo.academy }" class="form-control" style="width: 250px"></div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">이력사항</div>
                    <div class="col-lg-9 col-md-8">
                    <c:if test="${sessionScope.careers.size() == null}">
                    	<ul>
                    		<li>이력이 없습니다.</li>
                    	</ul>
                    </c:if>
                    <c:if test="${sessionScope.careers.size() != null}">
                    	<ul>
                    		<c:forEach items="${sessionScope.careers}" var="item">
                    		<div style="margin-bottom:5px;">
                    		<input type="button" id="${item.career_num}" value="수정" class="btn btn-primary btn-sm" onclick="careerUp(this.id)" data-bs-toggle="modal" data-bs-target="#disablebackdrop">
                    		<input type="button" id="${item.career_num}" value="삭제" class="btn btn-danger btn-sm" onclick="careerDel(this.id)">
                    		<input type="hidden" value="${item.career_num}" id="${item.career_num}">
                    		
                    		</div>
                    		
                    		<table class="table" style="width:300px;">
                    				<tr ><td>기간 : ${item.work_start} ~ ${item.work_end}</td></tr>
                    				<tr ><td>회사 : ${item.company}</td></tr>
                    				<tr ><td>직급 : ${item.rank}</td></tr>
                    				<tr><td>내용 : ${item.content}</td></tr>

                    			</table>
                    			<br>

                    		</c:forEach>
                    	</ul>
                    </c:if>
                    	
					</div>
                  </div>
                  
                  	<div style="margin-left: 270px;">
                  		<button id="careerBtn" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">이력 추가</button>
                  		<button id="profileBtn" type="button" class="btn btn-primary">내 정보 수정</button>
					</div>
                
                </div>



                <div class="tab-pane fade pt-3" id="profile-change-password">
                  <!-- Change Password Form -->
                  <form>

                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">현재 비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="password" type="password" class="form-control" id="cur_pw">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="newpassword" type="password" class="form-control" id="new_pw">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호 확인</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="renewpassword" type="password" class="form-control" id="renew_pw">
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="button" class="btn btn-primary" onclick="pwChange()">비밀번호 재설정</button>
                    </div>
                  </form><!-- End Change Password Form -->

                </div>

              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </section>
    
    
    
<!--               <div class="card"> -->
<!--             <div class="card-body"> -->
<!--               <h5 class="card-title">이력 상세보기</h5> -->
<%--               <p>You can disable the backdrop by adding <code>data-bs-backdrop="false"</code> to <code>.modal-dialog</code></p> --%>

              <!-- Disabled Backdrop Modal -->
<!--               <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#disablebackdrop"> -->
<!--                 Launch Modal -->
<!--               </button> -->
              <div class="modal fade" id="disablebackdrop" tabindex="-1" data-bs-backdrop="false">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">이력 상세보기</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    
                   <div class="row mb-3">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">입사일</label>
                  <div class="col-sm-10">
                    <input type="date" class="form-control" id="startDate">
                  </div>
                </div>
                
                 <div class="row mb-3">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">퇴직일</label>
                  <div class="col-sm-10">
                     <input type="date" class="form-control" id="endDate">
                  </div>
                </div>
                    
                
                   <div class="row mb-3">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">회사</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="modalCom">
                  </div>
                </div>
                
                  <div class="row mb-3">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">직급</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="modalPos">
                  </div>
                </div>
                
                 <div class="row mb-3">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">내용</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="modalContent">
                  </div>
                </div>
                    
                    
                    
                    
                    
                    
                    
                    
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button id="UpBtn" type="button" class="btn btn-primary">저장</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Disabled Backdrop Modal-->

<!--             </div> -->
<!--           </div> -->
    
    
    
                  <div class="modal fade" id="addModal" tabindex="-1" data-bs-backdrop="false">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">이력 추가하기</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    
                 <div class="row mb-3">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">입사일</label>
                  <div class="col-sm-10">
                    <input type="date" class="form-control" id="start">
                  </div>
                </div>
                
                 <div class="row mb-3">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">퇴직일</label>
                  <div class="col-sm-10">
                      <input type="date" class="form-control" id="end">
                  </div>
                </div>

                
                   <div class="row mb-3">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">회사</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="Com">
                  </div>
                </div>
                
                  <div class="row mb-3">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">직급</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="Pos">
                  </div>
                </div>
                
                 <div class="row mb-3">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">내용</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="Content">
                  </div>
                </div>
                    

                    </div>
                    <div class="modal-footer">
                      <button id="closeUpBtn" type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button id="addBtn" type="button" class="btn btn-primary">저장</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Disabled Backdrop Modal-->
    
    
    
    
<!--               <div class="card"> -->
<!--             <div class="card-body"> -->
<!--               <h5 class="card-title">Disabled Backdrop</h5> -->
<%--               <p>You can disable the backdrop by adding <code>data-bs-backdrop="false"</code> to <code>.modal-dialog</code></p> --%>

              <!-- Disabled Backdrop Modal -->
<!--               <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#disablebackdrop"> -->
<!--                 Launch Modal -->
<!--               </button> -->
              <div class="modal fade" id="imgModal" tabindex="-1" data-bs-backdrop="false">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">프로필 이미지 넣기</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                   <form action="myPage/proImg.do" method="post" enctype="multipart/form-data">
                    <div class="modal-body">
                    
                  <c:if test="${sessionScope.profileImg == null }">
				
					<img src="/photo/no-profile.png" alt="Profile" style="width: 200px;" id="preview">
				</c:if> 
				<c:if test="${sessionScope.profileImg != null }">
					<img src="/photo/${sessionScope.profileImg} " alt="Profile" style="width: 200px;" id="preview">
				</c:if>
                    
<!--                     <img id="preview"  style="width: 200px;"/> -->
                    <br>
                    <br>
                    
                     
                    <div>
                    
                     <label className="input-file-button" for="profileImg" class="btn btn-primary" > 업로드</label>
					<input type="file" id="profileImg" style="display:none;" name="profileImg" onchange="readURL(this);"/>
                    <input type="hidden"name="proImg">
                    
                    
                    </div>

                    
                    </div>
                    <div class="modal-footer">
                    <button id="proImgDel" type="button" class="btn btn-danger">이미지 삭제</button>
                       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button type="submit" class="btn btn-primary">저장</button>
                      
                    </div>
                    </form>
                  </div>
                </div>
              </div><!-- End Disabled Backdrop Modal-->

<!--             </div> -->
<!--           </div> -->




              <div class="modal fade" id="signImgModal" tabindex="-1" data-bs-backdrop="false">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">서명 이미지 넣기</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                   <form action="myPage/signImg.do" method="post" enctype="multipart/form-data">
                    <div class="modal-body">
                    
				<c:if test="${sessionScope.signImg == null }">
					<img src="/photo/no-sign.png" alt="signPre" style="width: 200px;" id="signPre">
				</c:if> 
				<c:if test="${sessionScope.signImg != null }">
					<img src="/photo/${sessionScope.signImg} " alt="signPre" style="width: 200px;" id="signPre">
				</c:if>
                    
<!--                     <img id="preview"  style="width: 200px;"/> -->
                    <br>
                    <br>
                    
                     
                    <div>
                    
                     <label className="input-file-button" for="signImg" class="btn btn-primary" > 업로드</label>
					<input type="file" id="signImg" style="display:none;" name="signImg" onchange="ImgUrl(this);"/>
                    <input type="hidden"name="signImg">
                    
                    
                    </div>

                    
                    </div>
                    <div class="modal-footer">
                    	<button id="signImgDel" type="button" class="btn btn-danger">이미지삭제</button>
                       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button type="submit" class="btn btn-primary">저장</button>
                      
                    </div>
                    </form>
                  </div>
                </div>
              </div><!-- End Disabled Backdrop Modal-->
    
    
    
    
    
</body>
<script>

function pwChange(){
	if($('#cur_pw').val() == "" || $('#new_pw').val() == "" || $('#renew_pw').val() == ""){
		alert("모든 칸을 입력하세요.");
	}else if($('#new_pw').val() != $('#renew_pw').val()){
		alert("새 비밀번호와 새 비밀번호 확인이 일치해야 합니다.");
	}else{
		$.ajax({
			type:'post',
			url:'myPage/pwChange.ajax',
			data:{
				cur_pw:$('#cur_pw').val(),
				new_pw:$('#new_pw').val()
			},
			dataType:'json',
			success:function(data){
				console.log(data.msg);
				alert(data.msg);
				if(data.result == true){
					location.href = "/login/logout.do";
				}
			},
			error:function(e){
				console.log(e);
			}
		
		});
	}
}

$('#profileBtn').click(function(){
	
	console.log("here");
	
	$emp_num = $('#emp_num').val();
	$name = $('#name').val();
	$phone = $('#phone').val();
	$email = $('#email').val();
	$academy = $('#academy').val();
	
	if($name == ''){
		alert("이름을 입력해 주세요");
	}else if($phone == ''){
		alert("전화번호를 입력해 주세요");
	}else if($email == ''){
		alert("이메일을 입력해 주세요");
	}else if($academy == ''){
		alert("최종학력을 입력해 주세요");
	}else{
		
		var params = {};
		params.emp_name = $name;
		params.phone = $phone;
		params.email = $email;
		params.academy = $academy;
		params.emp_num = $emp_num;
		
		$.ajax({
			type : 'post',
			url : 'myPage/update.ajax',
			data : params,
			dataType : 'json',
			success : function(data){
				console.log(data);
				location.href = "myPage.go";
			},
			error : function(e){
				console.log(e);
			}
		})
	}
})

function careerUp(career_num){
	console.log("커리어 수정 번호 : "+career_num);

	careerNum = career_num;
	
	$.ajax({
		type : 'post',
		url : 'myPage/careerUp.ajax', 
		data : {career_num : career_num},
		dataType : 'json',
		success : function(data){
			console.log(data);
			careerUpInfo(data.list);
		},
		error : function(e){
			console.log(e);
		}
	})
	
	return careerNum;
}

function careerUpInfo(list){
	
	$('#startDate').val(list[0].work_start);
	$('#endDate').val(list[0].work_end);
	$('#modalCom').val(list[0].company);
	$('#modalPos').val(list[0].rank);
	$('#modalContent').val(list[0].content);

	
}

$('#UpBtn').click(function(){
	console.log($('#startDate').val())
	console.log($('#endDate').val())
	console.log($('#modalCom').val())
	console.log($('#modalPos').val())
	console.log($('#modalContent').val())

	console.log("here : "+careerNum);
	
	
	
	
	$work_start = $('#startDate').val();
	$work_end = $('#endDate').val();
	$company = $('#modalCom').val();
	$rank = $('#modalPos').val();
	$content = $('#modalContent').val();
	$career_num = careerNum;
	
	if($work_start == ''){
		alert("근무 시작일을 선택해주세요");
	}else if($work_end == ''){
		alert("근무 종료일을 선택해 주세요");
	}else if($company == ''){
		alert("회사명을 입력해 주세요")
	}else if($rank == ''){
		alert("직급명을 입력해 주세요")
	}else if($content == ''){
		alert("상세내용을 입력해 주세요")
	}else if($work_start > $work_end){
		alert("근무 시작일이 종료일보다 큽니다")
	}else{
		var params = {};
		params.work_start = $work_start;
		params.work_end = $work_end;
		params.company = $company;
		params.rank = $rank;
		params.content = $content;
		params.career_num = $career_num;
		
		$.ajax({
			type : 'post',
			url : 'myPage/careerUpdate.ajax',
			data : params,
			dataType : 'json',
			success : function(data){
				console.log(data);
				location.href="myPage.go";
			},
			error : function(e){
				console.log(e);
			}
		})
	}
})

function careerDel(career_num){
	console.log("커리어 삭제 번호 : "+career_num);
	
	var rtn;
	rtn = confirm("이 경력을 지우시겠습니까?");
	if(rtn){
		$.ajax({
			type : 'post',
			url : 'myPage/careerDel.ajax',
			data : {career_num : career_num},
			dataType : 'json',
			success : function(data){
				console.log(data);
				location.href="/myPage.go";
			},
			error : function(e){
				console.log(e);
			}
		})
	}else{
		return false;
	}
}

$('#addBtn').click(function(){
	$work_start = $('#start').val();
	$work_end = $('#end').val();
	$company = $('#Com').val();
	$rank = $('#Pos').val();
	$content = $('#Content').val();
	$emp_num = $('#emp_num').val();
	
	if($work_start == ''){
		alert("근무 시작일을 선택해주세요");
	}else if($work_end == ''){
		alert("근무 종료일을 선택해 주세요");
	}else if($company == ''){
		alert("회사명을 입력해 주세요")
	}else if($rank == ''){
		alert("직급명을 입력해 주세요")
	}else if($content == ''){
		alert("상세내용을 입력해 주세요")
	}else if($work_start > $work_end){
		alert("근무 시작일이 종료일보다 큽니다")
	}else{
		var params = {};
		params.work_start = $work_start;
		params.work_end = $work_end;
		params.company = $company;
		params.rank = $rank;
		params.content = $content;
		params.emp_num = $emp_num;
		
		$.ajax({
			type : 'post',
			url : 'myPage/careerAdd.ajax',
			data : params,
			dataType : 'json',
			success : function(data){
				console.log(data);
				location.href="myPage.go";
			},
			error : function(e){
				console.log(e);
			}
		})
	}
})

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('preview').src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById('preview').src = "";
  }
}

function ImgUrl(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('signPre').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('signPre').src = "";
	  }
	}
	
	$('#proImgDel').click(function(){
		
		var emp_num = $('#emp_num').val();
		console.log("emp_num : "+emp_num);
		
		
		var rtn;
		rtn = confirm("프로필 이미지를 지우시겠습니까?");
		if(rtn){
			
			$.ajax({
				type : 'post',
				url : 'myPage/proImgDel.ajax',
				data : {emp_num : emp_num},
				dataType : 'json',
				success : function(data){
					console.log(data);
					location.href = "myPage.go"
				},
				error : function(e){
					console.log(e)
				}
			})
		}else{
			return false;
		}
	})
	
		$('#signImgDel').click(function(){
		
		var emp_num = $('#emp_num').val();
		console.log("emp_num : "+emp_num);
		
		
		var rtn;
		rtn = confirm("사인 이미지를 지우시겠습니까?");
		if(rtn){
			
			$.ajax({
				type : 'post',
				url : 'myPage/signImgDel.ajax',
				data : {emp_num : emp_num},
				dataType : 'json',
				success : function(data){
					console.log(data);
					location.href = "myPage.go"
				},
				error : function(e){
					console.log(e)
				}
			})
		}else{
			return false;
		}
	})
	
	$('#closeUpBtn').click(function(){
		$('#start').val('');
		$('#end').val('');
		$('#Com').val('');
		$('#Pos').val('');
		$('#Content').val('');	
		
	})
	
	


</script>
</html>