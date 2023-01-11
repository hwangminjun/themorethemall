<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
    <div class="pagetitle">
      <h3>Profile</h3>
      
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
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Overview</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-settings">Settings</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Change Password</button>
                </li>

              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                  
                  <h5 class="card-title">내 정보</h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">이름</div>
                    <div class="col-lg-9 col-md-8">${sessionScope.loginInfo.emp_name }</div>
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
                    <div class="col-lg-9 col-md-8">${sessionScope.loginInfo.phone }</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">이메일</div>
                    <div class="col-lg-9 col-md-8">${sessionScope.loginInfo.email }</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">최종학력</div>
                    <div class="col-lg-9 col-md-8">${sessionScope.loginInfo.academy }</div>
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
                    			</li><br>
                    		</c:forEach>
                    	</ul>
                    </c:if>
                    	
					</div>
                  </div>

                </div>

                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                  <!-- Profile Edit Form -->
                  <form action="mypage/update.do">
                    <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">프로필 이미지</label>
                      <div class="col-md-8 col-lg-9">
                        <img src="default_image/no-profile.png" alt="Profile">
                        <div class="pt-2">
                          <a href="#" class="btn btn-primary btn-sm" title="Upload new profile image"><i class="bi bi-upload"></i></a>
                          <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image"><i class="bi bi-trash"></i></a>
                        </div>
                      </div>
                    </div>
                    
                    <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">서명 이미지</label>
                      <div class="col-md-8 col-lg-9">
                        <img src="default_image/no-sign.png" alt="sign">
                        <div class="pt-2">
                          <a href="#" class="btn btn-primary btn-sm" title="Upload new profile image"><i class="bi bi-upload"></i></a>
                          <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image"><i class="bi bi-trash"></i></a>
                        </div>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">이름</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="emp_name" type="text" class="form-control" id="emp_name" value="${sessionScope.loginInfo.emp_name }">
                        <input name="emp_num" type="text" class="form-control" id="emp_num" value="${sessionScope.loginInfo.emp_num } "style="display: none;">
                        
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Phone" class="col-md-4 col-lg-3 col-form-label">전화번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="phone" type="text" class="form-control" id="phone" value="${sessionScope.loginInfo.phone}">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Phone" class="col-md-4 col-lg-3 col-form-label">최종 학력</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="academy" type="text" class="form-control" id="academy" value="${sessionScope.loginInfo.academy}">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Email" class="col-md-4 col-lg-3 col-form-label">이메일</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="email" type="email" class="form-control" id="email" value="${sessionScope.loginInfo.email}">
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                  </form>
                  <!-- End Profile Edit Form -->

                </div>

                <div class="tab-pane fade pt-3" id="profile-settings">

                  <!-- Settings Form -->
                  <form>

                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Email Notifications</label>
                      <div class="col-md-8 col-lg-9">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="changesMade" checked>
                          <label class="form-check-label" for="changesMade">
                            Changes made to your account
                          </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="newProducts" checked>
                          <label class="form-check-label" for="newProducts">
                            Information on new products and services
                          </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="proOffers">
                          <label class="form-check-label" for="proOffers">
                            Marketing and promo offers
                          </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="securityNotify" checked disabled>
                          <label class="form-check-label" for="securityNotify">
                            Security alerts
                          </label>
                        </div>
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                  </form><!-- End settings Form -->
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
                      <button type="submit" class="btn btn-primary">Change Password</button>
                    </div>
                  </form><!-- End Change Password Form -->

                </div>

              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </section>
</body>
</html>