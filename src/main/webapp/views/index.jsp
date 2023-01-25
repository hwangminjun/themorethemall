<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>The More, The Mall</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
   rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
   rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
   rel="stylesheet">
<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<!-- Editor -->
<link rel="stylesheet" href="res/style.css" />
<link rel="stylesheet" href="richtexteditor/rte_theme_default.css" />
<script type="text/javascript" src="richtexteditor/rte.js"></script>
<script type="text/javascript"
   src='richtexteditor/plugins/all_plugins.js'></script>
<!-- Full-calendar -->
<link href='fullcalendar/main.css' rel='stylesheet' />
<script src='fullcalendar/main.js'></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>

  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="assets/js/jquery.twbsPagination.js"></script>
<!-- datepicker -->
<!-- =======================================================
  * Template Name: NiceAdmin - v2.5.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->


</head>


<body>
   <!-- Session -->
   <!-- 사용자 관련 정보 - sessionScope.loginInfo.컬럼명 -->
   <!-- 사용자 사진 - sessionScope.signImg(서명 이미지) -->
   <!-- 사용자 사진 - sessionScope.profileImg(프로필 이미지) -->
   <!-- 사용자 보유 권한 - sessionScope.authList(배열) -->
   <!-- ======= Header ======= -->
   <header id="header" class="header fixed-top d-flex align-items-center">

      <div class="d-flex align-items-center justify-content-between">
         <a class="logo d-flex align-items-center" onclick="location.href='index.go'">
            <img src="assets/img/logo.png" alt=""> <span
            class="d-none d-lg-block">The More, The Mall</span>
         </a> <i class="bi bi-list toggle-sidebar-btn"></i>
      </div>
      <!-- End Logo -->


      <nav class="header-nav ms-auto">
         <ul class="d-flex align-items-center">

            <li class="nav-item d-block d-lg-none"><a
               class="nav-link nav-icon search-bar-toggle " href="#"> <i
                  class="bi bi-search"></i>
            </a></li>
            <!-- End Search Icon-->

            <li class="nav-item dropdown"><a class="nav-link nav-icon"
               href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell"></i>
                  <span id="alarmNum" class="badge bg-primary badge-number"> </span> <!-- 읽지 않은 알람의 수 -->
            </a> <!-- End Notification Icon -->


				
               <ul
                  class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications"
                  style="width: 540px;">
                  <li class="dropdown-header">
                  

					${sessionScope.loginInfo.emp_name }
                  님의 알림 리스트</li>
                 
                  
                 
                 <li id="alarmList" class="alarmbar">
                 

                  
                 </li>
                  

               </ul> 
               
               
               <!-- End Notification Dropdown Items --></li>
            <!-- End Notification Nav -->


            <li class="nav-item dropdown pe-3"><a
               class="nav-link nav-profile d-flex align-items-center pe-0"
               onclick="" data-bs-toggle="dropdown"> 
               <c:if
                     test="${sessionScope.profileImg == null }">
                     <img src="/photo/no-profile.png" alt="Profile"
                        class="rounded-circle">
                  </c:if> <c:if test="${sessionScope.profileImg != null }">
                     <img src="/photo/${sessionScope.profileImg} " alt="Profile" class="rounded-circle">
                  </c:if> <span class="d-none d-md-block dropdown-toggle ps-2">
                   ${sessionScope.loginInfo.emp_name }
                  </span>
            </a> <!-- End Profile Iamge Icon -->

               <ul
                  class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                  <li class="dropdown-header">
                     <h6>
                     ${sessionScope.loginInfo.emp_name }
                  </h6> 
                  <span>${sessionScope.loginInfo.rank_name } </span>
                  </li>
                  <li>
                     <hr class="dropdown-divider">
                  </li>

                  <li><a class="dropdown-item d-flex align-items-center"
                     onclick="location.href='myPage.go'"> <i class="bi bi-person"></i> <span>내
                           정보</span>
                  </a></li>
                  <li>
                     <hr class="dropdown-divider">
                  </li>


                  <li>
                  <form action=""></form>
                  <a class="dropdown-item d-flex align-items-center"
                     onclick="location.href='login/logout.do'"> <i class="bi bi-person"></i> <span>로그아웃</span>
                  </a></li>

               </ul> <!-- End Profile Dropdown Items --></li>
            <!-- End Profile Nav -->

         </ul>
      </nav>
      <!-- End Icons Navigation -->

   </header>
   <!-- End Header -->

   <!-- ======= Sidebar ======= -->
   <c:set var="auth" value="${sessionScope.authority }"/>

   <aside id="sidebar" class="sidebar">

      <ul class="sidebar-nav" id="sidebar-nav">

         <li class="nav-item"><a class="nav-link collapsed"
            onclick="location.href='myPage.go'"> <i class="bi bi-person"></i> <span>마이페이지</span>
         </a>
            <div
               class="card-body profile-card pt-4 d-flex flex-column align-items-center">

               <!-- 프로필 사진 -->
               <c:if test="${sessionScope.profileImg == null }">
                  <img src="/photo/no-profile.png" alt="Profile"
                     class="rounded-circle" width="200">
               </c:if>

               <c:if test="${sessionScope.profileImg != null }">
                  <img src="/photo/${sessionScope.profileImg} " alt="Profile" class="rounded-circle" width="200">
               </c:if>
               <h2>   ${sessionScope.loginInfo.emp_name }
                  </h2>
               <h3>   ${sessionScope.loginInfo.rank_name }
                  </h3>
            </div></li>
         <!-- End Dashboard Nav -->

         <li class="nav-item"><a class="nav-link collapsed"
            onclick="location.href='workRecord.go'"> <i class="bi bi-chat-left-text"></i>
               <span>근태 관리</span>
         </a></li>
         <!-- 근태 Nav -->

         <li class="nav-item"><a class="nav-link collapsed"
            data-bs-target="#sign-nav" data-bs-toggle="collapse" href="#"> <i
               class="bi bi-journal-text"></i><span>전자 결재</span><i
               class="bi bi-chevron-down ms-auto"></i>
         </a>
            <ul id="sign-nav" class="nav-content collapse "
               data-bs-parent="#sidebar-nav">
               <li><a onclick="location.href='docRec.go'"> <i class="bi bi-circle"></i><span>결재
                        수신 문서함</span>
               </a></li>
               <li><a onclick="location.href='docExRec.go'"> <i class="bi bi-circle"></i><span>참조 결재 문서함</span>
               </a></li>
               <li><a onclick="location.href='docDis.go'"> <i class="bi bi-circle"></i><span>결재
                        발신 문서함</span>
               </a></li>
               <li><a onclick="location.href='docTeam.go'"> <i
                     class="bi bi-circle"></i><span>팀 결재 문서함</span>
               </a></li>
               <li><a onclick="location.href='docStyleList.go'"> <i
                     class="bi bi-circle"></i><span>결재 양식</span>
               </a></li>
               <li><a onclick="location.href='docWrite.go'"> <i
                     class="bi bi-circle"></i><span>결재 작성</span>
               </a></li>
                     <c:if test="${fn:contains(auth, 10) }">
                     <li><a onclick="location.href='compDoc.go'"> <i
                     class="bi bi-circle"></i><span>결재 완료 문서함</span>
               </a></li>
                     </c:if>
            </ul></li>
         <!-- End 전자결재 Nav -->


         <li class="nav-item"><a class="nav-link collapsed"
            onclick="location.href='OrgChart.go'"> <i class="bi bi-chat-left-text"></i>
               <span>조직도</span>
         </a></li>
<!--          조직도 Nav -->

<!--          <li class="nav-item"><a class="nav-link collapsed" -->
<!--             data-bs-target="#board-nav" data-bs-toggle="collapse" href="#"> -->
<!--                <i class="bi bi-clipboard"></i><span>게시판</span><i -->
<!--                class="bi bi-chevron-down ms-auto"></i> -->
<!--          </a> -->
<!--             <ul id="board-nav" class="nav-content collapse " -->
<!--                data-bs-parent="#sidebar-nav"> -->
<!--                <li><a onclick="location.href='noticeList.go'"> <i -->
<!--                      class="bi bi-circle"></i><span>공지사항</span> -->
<!--                </a></li> -->
<!--                <li><a onclick="location.href='teamBoardList.go'"> <i -->
<!--                      class="bi bi-circle"></i><span>게시판</span> -->
<!--                </a></li> -->

<!--             </ul></li> -->
         <!-- 게시판 Nav -->

<!--          <li class="nav-item"><a class="nav-link collapsed" -->
<!--             onclick="location.href='depRecMsgList.go'"> <i -->
<!--                class="bi bi-chat-left-text"></i> <span>전달사항</span> -->
<!--          </a></li> -->
         <!-- End 전달사항 Page Nav -->


         <li class="nav-item"><a class="nav-link collapsed"
            data-bs-target="#floor-nav" data-bs-toggle="collapse" href="#">
               <i class="bi bi-clipboard"></i><span>평면도</span><i
               class="bi bi-chevron-down ms-auto"></i>
         </a>
            <ul id="floor-nav" class="nav-content collapse "
               data-bs-parent="#sidebar-nav">
               <li><a onclick="location.href='floor.go'"> <i class="bi bi-circle"></i><span>평면도</span>
               </a></li>

<%--       <c:if test="${fn:contains(auth, 11) }"> --%>
<!--                <li><a onclick="location.href='storeList.go'"> <i -->
<!--                      class="bi bi-circle"></i><span>점포관리</span> -->
<!--                </a></li> -->
<%--       </c:if> --%>

      <c:if test="${fn:contains(auth, 13) }">
               <li><a onclick="location.href='sectionList.go'"> <i
                     class="bi bi-circle"></i><span>구역관리</span>
               </a></li>
      </c:if>

            </ul></li>
         <!-- End 평면도 Page Nav -->

      <c:if test="${fn:contains(auth, 12)}">
            <li class="nav-item">
            <a class="nav-link collapsed" onclick="location.href='sectionAnalysis.go'">
             <i class="bi bi-chat-left-text"></i> <span>매출관리</span>
         </a>
         </li>
      </c:if>
         <!-- End 매출 Page Nav -->

			
			 <c:if test="${fn:contains(auth, 2) || fn:contains(auth, 3) || fn:contains(auth, 4) || fn:contains(auth, 5) }">
         <li class="nav-item"><a class="nav-link collapsed"
            data-bs-target="#hr-nav" data-bs-toggle="collapse" href="#"> <i
               class="bi bi-clipboard"></i><span>인사관리</span><i
               class="bi bi-chevron-down ms-auto"></i>
         </a>
            <ul id="hr-nav" class="nav-content collapse "
               data-bs-parent="#sidebar-nav">


				 <c:if test="${fn:contains(auth, 2)}">

               <li><a onclick="location.href='empList.go'"> <i
                     class="bi bi-circle"></i><span>직원목록</span>
               </a></li>
               
               </c:if>

                     <c:if test="${fn:contains(auth, 3) }">
                     
                     <li><a onclick="location.href='teamList.go'"> <i
                     class="bi bi-circle"></i><span>팀관리</span>
               </a></li>

               </c:if>


               <c:if test="${fn:contains(auth, 4) }">

               <li><a onclick="location.href='posList.go'"> <i
                     class="bi bi-circle"></i><span>직책관리</span>
               </a></li>

               </c:if>

               <c:if test="${fn:contains(auth, 5) }">

               <li><a onclick="location.href='rankList.go'"> <i
                     class="bi bi-circle"></i><span>직급관리</span>
               </a></li>

               </c:if>

            </ul></li>
			</c:if>
         <!-- 인사관리 Nav -->

         <li class="nav-item"><a class="nav-link collapsed"
            onclick="location.href='teamSch.go'"> <i class="bi bi-chat-left-text"></i>
               <span>팀일정</span>
         </a></li>
         <!-- 팀 일정 Nav -->

         <li class="nav-item"><a class="nav-link collapsed"
            onclick="location.href='facList.go'"> <i class="bi bi-chat-left-text"></i>
               <span>시설예약</span>
         </a></li>
         <!-- 시설예약 Nav -->

		<c:if test="${fn:contains(auth, 6) }">

         <li class="nav-item"><a class="nav-link collapsed"
            onclick="location.href='facManage.go'"> <i class="bi bi-chat-left-text"></i>
               <span>시설 관리</span>
         </a></li>

         </c:if>
         <!-- 시설 관리 Nav -->

         <c:if test="${fn:contains(auth, 1) }">

         <li class="nav-item"><a class="nav-link collapsed"
            onclick="location.href='corEmpList.go'"> <i class="bi bi-chat-left-text"></i>
               <span>협업 및 권한 관리</span>
         </a></li>

         </c:if>
         <!-- 협업 및 권한 관리 Nav -->
   

         <!-- <li class="nav-item"><a class="nav-link collapsed"
            onclick="location.href='stateChangeLog.go'"> <i
               class="bi bi-chat-left-text"></i> <span>직원 변경 로그</span>
         </a></li>
         직원 변경 로그 Nav -->
      </ul>

   </aside>

   <!-- End Sidebar-->

   <main id="main" class="main">
      <div id="inner_jsp"></div>

   </main>
   <!-- ======= Footer ======= -->
   <!-- <footer id="footer" class="footer">
      <div class="copyright">
         &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights
         Reserved
      </div>
      <div class="credits">
         All the links in the footer should remain intact.
         You can delete the links only if you purchased the pro version.
         Licensing information: https://bootstrapmade.com/license/
         Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
         Designed by <a href="https://bootstrapmade.com/">장재혁</a>
      </div>
   </footer> -->
   <!-- End Footer -->

   <a href="#"
      class="back-to-top d-flex align-items-center justify-content-center"><i
      class="bi bi-arrow-up-short"></i></a>

   <!-- Vendor JS Files -->
   <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
   <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="assets/vendor/chart.js/chart.umd.js"></script>
   <script src="assets/vendor/echarts/echarts.min.js"></script>
   <script src="assets/vendor/quill/quill.min.js"></script>
   <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
   <script src="assets/vendor/tinymce/tinymce.min.js"></script>
   <script src="assets/vendor/php-email-form/validate.js"></script>

   <!-- Template Main JS File -->
   <script src="assets/js/main.js"></script>
   

</body>
<script>
<!-- 메인화면에 jsp 넣기 -->
var page="${page}";
console.log(page);
console.log("${doc}");
var doc = "${doc}";

mainGo(page);
function mainGo(page){
   $("#inner_jsp").empty();
   $("#inner_jsp").load("views/"+page+".jsp");
console.log(page);
}



/////////////////////////////////////////////////////////////////////////
/* 알람 */
 var emp_num = "${sessionScope.loginInfo.emp_num}";
alarm(emp_num);
alarmNum(emp_num);
console.log(emp_num);

 
 function alarm(emp_num){
	 $.ajax({
			type : 'get',
			url : 'alarm/list.ajax',
			data : {'emp_num' : emp_num},
			dataType : 'json',
			success : function(data){
				console.log(data);
				alarmDrawList(data.list);
			},
			error : function(e){
				console.log(e);
			}
		 })
 }
 
 function alarmDrawList(list){
	 var content = '';
	 for(i=0; i<list.length; i++){
		 content += '<li><hr class="dropdown-divider"></li>';
		 console.log("sender : "+list[i].sender);

			 if(list[i].read_check == 1){
				 content += '<li id="'+list[i].alarm_num+'" onclick="alarmClick(this.id)"  class="notification-item"><i id="alarm-type" class="bi bi-check-circle" style="font-size: 15px;">'+list[i].alarm_sort_name+'</i><div><h5>송신자 : '+list[i].emp_name+'</h5><h4>'+list[i].send_date+'</h4><p>'+list[i].alarm_content+'</p></div></li>'
			 }else{
				 content += '<li id="'+list[i].alarm_num+'" onclick="alarmClick(this.id)"  class="notification-item notice-alarm"><i id="alarm-type" class="bi bi-check-circle text-success" style="font-size: 15px;">'+list[i].alarm_sort_name+'</i><div><h5>송신자 : '+list[i].emp_name+'</h5><h4>'+list[i].send_date+'</h4><p>'+list[i].alarm_content+'</p></div></li>'
			 }
		
		
		 

		 
		 if(list.length >3){
			 $('#alarmList').prop('style','height:300px;');
		 }
		
		 content += '<li><hr class="dropdown-divider"></li>';
	 }
	 
	 $('#alarmList').empty();
	 $('#alarmList').append(content);
	 
	 
 }
 
function alarmNum(emp_num){
	
	$.ajax({
		type : 'get',
		url : 'alarm/alarmNum.ajax',
		data : {emp_num : emp_num},
		dataType : 'json',
		success : function(data){
			console.log(data);
			alarmNumDraw(data.list);
		},
		error : function(e){
			console.log(e);
		}
	})
}
 
 function alarmNumDraw(list){
	 console.log("숫자 : "+list.length);
	 var content =  list.length;
	 
	 $('#alarmNum').empty();
	 $('#alarmNum').append(content);
 }
 
 function alarmClick(id){
	 var alarm_num = id;
	 console.log("알람숫자 : "+alarm_num);
	 
	 $.ajax({
		 type : 'get',
		 url : 'alarm/detailInfo.ajax',
		 data : {alarm_num : alarm_num},
		 dataType : 'json',
		 success : function(data){
			 console.log(data);
			 alarmDetail(data.list);
		 },
		 error: function(e){
			 console.log(e);
		 }
	 })
 }
 
 function alarmDetail(list){
	 
	 console.log(emp_num);
	 var alarm_sort_num = list[0].alarm_sort_num;
	 var doc_num = list[0].all_num;
	 
	 if(alarm_sort_num == 4 || alarm_sort_num == 5){
			$.ajax({
				url:'doc/docDetailGo.ajax',
				type:"GET",
				data:{
					doc_num:doc_num
				},
				dataType:"JSON",
				success:function(res){
					location.href='docDisDet.go';
				},
				error:function(e){
					alert('error');
				}
			});
	 }else if(alarm_sort_num = 2){
		 location.href = "teamSch.go";
	 }
 }
 

</script>
</html>