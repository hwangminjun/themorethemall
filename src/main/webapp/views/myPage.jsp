<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
					<img src="default_image/no-profile.png" alt="Profile" class="rounded-circle">
				</c:if> 
				<c:if test="${sessionScope.profileImg != null }">
					<img src="assets/img/11.jpg" alt="Profile" class="rounded-circle">
				</c:if>
              <h2>프로필 사진</h2>
              
            </div>
          </div>
          
          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
				<c:if test="${sessionScope.signImg == null }">
					<img src="default_image/no-sign.png" alt="sign">
				</c:if> 
				<c:if test="${sessionScope.signImg != null }">
					<img src="assets/img/서명.png" alt="sign">
				</c:if>
              
              <h2>서명 이미지</h2>
              
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
                    			<li>기간 : ${item.work_start} ~ ${item.work_end}<br>
                    				회사 : ${item.company}<br>
                    				직급 : ${item.rank}<br>
                    				내용 : ${item.content}
                    			
                    				<input type="hidden" id="career_num" value="${item.career_num}">
                    				
                    				<input type="button" id="${item.career_num}" value="수정" class="btn btn-primary btn-sm" onclick="careerUp(this.id)">
                    				<input type="button" id="${item.career_num}" value="삭제" class="btn btn-danger btn-sm" onclick="careerDel(this.id)">
                    			</li><br>
                    		</c:forEach>
                    	</ul>
                    </c:if>
                    	
					</div>
                  </div>
                  
                  	<div style="margin-left: 270px;">
                  		<button id="careerBtn" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#disablebackdrop">이력 추가</button>
                  		<button id="profileBtn" type="button" class="btn btn-primary">내 정보 수정</button>
					</div>
                
                </div>



                <div class="tab-pane fade pt-3" id="profile-change-password">
                  <!-- Change Password Form -->
                  <form>

                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">현재 비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="password" type="password" class="form-control" id="currentPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="newpassword" type="password" class="form-control" id="newPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호 확인</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="renewpassword" type="password" class="form-control" id="renewPassword">
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">비밀번호 재설정</button>
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
                    
                    <c:forEach items="${sessionScope.careers}" var="item">
                    ${item.career_num } == 
                    </c:forEach>
                    
                    <div class="row mb-3">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">기간</label>
                  <div class="col-sm-10">
                    <input type="date" class="form-control" id="startDate">
                    <br>
                    <input type="date" class="form-control" id="endDate">
                  </div>
                </div>
                
                   <div class="row mb-3">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">회사</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputText" id="modalCom">
                  </div>
                </div>
                
                  <div class="row mb-3">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">직급</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputText" id="modalPos">
                  </div>
                </div>
                
                 <div class="row mb-3">
                  <label for="inputEmail3" class="col-sm-2 col-form-label">내용</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputText" id="modalContent">
                  </div>
                </div>
                    
                    
                    
                    
                    
                    
                    
                    
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button type="button" class="btn btn-primary">저장</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Disabled Backdrop Modal-->

<!--             </div> -->
<!--           </div> -->
    
    
    
    
    
    
    
    
    
    
    
    
</body>
<script>

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
}

function careerUpInfo(list){
	
}


</script>
</html>