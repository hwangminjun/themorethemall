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



<div class="row align-items-top">

	<div class="col-lg-3">
		<div class="card">
            <div class="card-body">
              <h5 class="card-title">조직도</h5>
              
              <hr>
              <br><br>

              <!-- Default Accordion -->
              <div class="accordion" id="accordionExample" style="width: 200px;">
              
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                      대표
                    </button>
                  </h2>
                  <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div id="chairMan" class="accordion-body">
                    대표이사 장재혁
                    
                    
                    </div>
                  </div>
                </div>
                
                
                
                
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                      MD본부
                    </button>
                  </h2>
                  <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                    
                 <div class="accordion-item">
                  <h2 class="accordion-header" id="heading0">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse0" aria-expanded="false" aria-controls="collapse0">
                      MD1팀
                    </button>
                  </h2>
                  <div id="collapse0" class="accordion-collapse collapse" aria-labelledby="heading0" >
                    <div id="MD" class="accordion-body">
                    MD1팀MD1팀MD1팀MD1팀MD1팀MD1팀MD1팀
                    
                    </div>
                  </div>
                </div>
                    
                    
                    </div>
                  </div>
                </div>
                
               
                
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                      인사부
                    </button>
                  </h2>
                  <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                    
                    
                    </div>
                  </div>
                </div>
                
                
                
                  <div class="accordion-item">
                  <h2 class="accordion-header" id="headingFour">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                      총무부
                    </button>
                  </h2>
                  <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                    <div id="secretary" class="accordion-body">
                    
                    
                    </div>
                  </div>
                </div>
                
                
                
                
                  <div class="accordion-item">
                  <h2 class="accordion-header" id="headingFive">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                     영업지원부
                    </button>
                  </h2>
                  <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
                    <div id="sales" class="accordion-body">
                    
                    
                    </div>
                  </div>
                </div>
                
              
                
                  <div class="accordion-item">
                  <h2 class="accordion-header" id="headingSix">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                      운영지원부
                    </button>
                  </h2>
                  <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionExample">
                    <div id=" sales" class="accordion-body">
                    
                    
                    </div>
                  </div>
                </div>
                
              </div><!-- End Default Accordion Example -->
              
            <br><br><br>
            <hr>

              
            </div>
	</div>
	</div>

	
	
	
	
	<div class="col-lg-9">
		<div class="card">
		
			<div class="card-body">
				<h5 class="card-title">직원 정보</h5>
				<hr>
				<h6 class="card-title">직원 사진</h6>
				
				<c:if test="${sessionScope.profileImg == null }">
                  <img src="default_image/no-profile.png" alt="Profile"
                     class="rounded-circle" width="100">
               </c:if>

               <c:if test="${sessionScope.profileImg != null }">
                  <img src="assets/img/11.jpg" alt="Profile" class="rounded-circle" width="100">
               </c:if>
				
				<div class="tab-pane fade show active profile-overview" id="profile-overview" role="tabpanel">
						
						<br>
                  <h5 class="card-title">직원 프로필</h5>
                  <br>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">이 름</div>
                    <div class="col-lg-9 col-md-8">Kevin Anderson</div>
                  </div>
					<br>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">부 서</div>
                    <div class="col-lg-9 col-md-8">Lueilwitz, Wisoky and Leuschke</div>
                  </div>
					<br>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">팀</div>
                    <div class="col-lg-9 col-md-8">Web Designer</div>
                  </div>
					<br>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">직 책</div>
                    <div class="col-lg-9 col-md-8">USA</div>
                  </div>
					<br>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">직 급</div>
                    <div class="col-lg-9 col-md-8">A108 Adam Street, New York, NY 535022</div>
                  </div>
					<br>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">전화번호</div>
                    <div class="col-lg-9 col-md-8">(436) 486-3538 x29071</div>
                  </div>
					<br>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">이메일</div>
                    <div class="col-lg-9 col-md-8">k.anderson@example.com</div>
                  </div>
					<br>
                </div>
			<hr>
			</div>
			
		
		</div>
		
		
	</div>
	
	
	
	</div>


</body>
<script>
orgList();

function orgList(){
	
	$.ajax({
		type : 'post',
		url : 'org/orgList.ajax',
		dataType: 'json',
		success : function(data){
// 			console.log(data);
			drawOrgList(data.list);
		},
		error : function(e){
			console.log(data);
		}
	})
	
}

function drawOrgList(list){
	console.log(list);
}


</script>
</html>