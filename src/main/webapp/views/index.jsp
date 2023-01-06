<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>테스트에용</title>
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

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- =======================================================
  * Template Name: NiceAdmin - v2.5.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->


</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a class="logo d-flex align-items-center" onclick="mainGo('main')"> <img
				src="assets/img/logo.png" alt=""> <span
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
						<span class="badge bg-primary badge-number">7</span> <!-- 읽지 않은 알람의 수 -->
				</a> <!-- End Notification Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications"
						style="width: 540px;">
						<li class="dropdown-header">***님의 알림 리스트</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item notice-alarm"><i id="alarm-type">공지사항</i>
							<div>
								<h5>송신자 : 인사부장 유재석</h5>
								<h4>2023.01.03 11:11</h4>
								<p>인사 관련 공지(2023.01.03)</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i id="alarm-type">전달 사항</i>
							<div>
								<h5>송신자 : 백화점</h5>
								<h4>이벤트 관련 문의 답변입니다.</h4>
								<p>안됩니다.</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item already-read"><i
							class="alarm-type">팀 일정</i>
							<div>
								<h5>송신자 : system</h5>
								<h4>2023.01.03 09:50 ~ 2023.01.03 10:50</h4>
								<p>회의 일정이 등록되었습니다.</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i class="alarm-type">팀 일정</i>
							<div>
								<h5>송신자 : system</h5>
								<h4>2023.01.03 11:00 ~ 2023.01.03 13:00</h4>
								<p>회의실 시설 예약이 등록되었습니다.</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i class="alarm-type">결재 순번</i>
							<div>
								<h5>송신자 : system</h5>
								<h4>일반 결재</h4>
								<p>처리해야 할 결재 문서가 도착했습니다.(문서번호)</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i class="alarm-type">결재 처리</i>
							<div>
								<h5>송신자 : system</h5>
								<h4>결재 처리 완료</h4>
								<p>(문서번호)결재 처리가 완료되었습니다.</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i class="alarm-type">결재 처리</i>
							<div>
								<h5>송신자 : system</h5>
								<h4>반려</h4>
								<p>처리했던 결재가 반려처리 되었습니다.</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>


						<li class="notification-item"><i class="alarm-type">매출
								미입력</i>
							<div>
								<h5>송신자 : system</h5>
								<h4>매출 미입력된 점포가 있습니다.</h4>
								<p>입생로랑, 디올 매장의 매출이 미입력되었습니다.</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

					</ul> <!-- End Notification Dropdown Items --></li>
				<!-- End Notification Nav -->


				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					onclick="" data-bs-toggle="dropdown"> <img
						src="assets/img/11.jpg" alt="Profile" class="rounded-circle">
						<span class="d-none d-md-block dropdown-toggle ps-2">이름</span>
				</a> <!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>이름</h6> <span>직책</span>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							onclick="mainGo('myPage')"> <i class="bi bi-person"></i> <span>내 정보</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>


						<li><a class="dropdown-item d-flex align-items-center"
							href="#"> <i class="bi bi-box-arrow-right"></i> <span>로그아웃</span>
						</a></li>

					</ul> <!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->

	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link collapsed"
				onclick="mainGo('myPage')"> <i class="bi bi-person"></i> <span>마이페이지</span>
			</a>
				<div
					class="card-body profile-card pt-4 d-flex flex-column align-items-center">

					<!-- 프로필 사진 -->
					<img src="assets/img/11.jpg" alt="Profile" class="rounded-circle">
					<h2>이름</h2>
					<h3>직책</h3>

				</div></li>
			<!-- End Dashboard Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				onclick="mainGo('workRecord')"> <i class="bi bi-chat-left-text"></i>
					<span>근태 관리</span>
			</a>
			</li>
			<!-- 근태 Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#sign-nav" data-bs-toggle="collapse" href="#"> <i
					class="bi bi-journal-text"></i><span>전자 결재</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="sign-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a onclick="mainGo('docRec')"> <i
							class="bi bi-circle"></i><span>결재 수신 문서함</span>
					</a></li>
					<li><a onclick="mainGo('docDis')"> <i
							class="bi bi-circle"></i><span>결재 발신 문서함</span>
					</a></li>
					<li><a onclick="mainGo('docTeam')"> <i
							class="bi bi-circle"></i><span>팀 결재 문서함</span>
					</a></li>
					<li><a onclick="mainGo('docStyleList')"> <i
							class="bi bi-circle"></i><span>결재 양식</span>
					</a></li>
					<li><a onclick="mainGo('docWrite')"> <i
							class="bi bi-circle"></i><span>결재 작성</span>
					</a></li>
				</ul></li>
			<!-- End 전자결재 Nav -->

	
			<li class="nav-item"><a class="nav-link collapsed"
				onclick="mainGo('orgChart')"> <i class="bi bi-chat-left-text"></i>
					<span>조직도</span>
			</a>
			</li>
			<!-- 조직도 Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#board-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-clipboard"></i><span>게시판</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="board-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li>
					<a onclick="mainGo('noticeList')"> <i
							class="bi bi-circle"></i><span>공지사항</span>
					</a>

					</li>
					<li>
					<a onclick="mainGo('teamBoardList')"> <i
							class="bi bi-circle"></i><span>게시판</span>
					</a>
					</li>

				</ul></li>
			<!-- 게시판 Nav -->

			<li class="nav-item">
			<a class="nav-link collapsed"
				onclick="mainGo('depRecMsgList')"> <i class="bi bi-chat-left-text"></i>
					<span>전달사항</span>
			</a>
			</li>
			<!-- End 전달사항 Page Nav -->
			
			
			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#floor-nav" data-bs-toggle="collapse" href="#"> <i
					class="bi bi-clipboard"></i><span>평면도</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="floor-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li>
					<a onclick="mainGo('floor')"> <i
							class="bi bi-circle"></i><span>평면도</span>
					</a>
					</li>
					
					<li>
					<a onclick="mainGo('storeList')"> <i
							class="bi bi-circle"></i><span>점포관리</span>
					</a>
					</li>
					
					<li>
					<a onclick="mainGo('sectionList')"> <i
							class="bi bi-circle"></i><span>구역관리</span>
					</a>
					</li>
					
				</ul></li>
			<!-- End 평면도 Page Nav -->

			<%-- <c:if test="${sessionScope.auth == 17}"> --%>
			<li class="nav-item">
			<a onclick="mainGo('sectionAnalysis')"> <i
							class="bi bi-circle"></i><span>매출관리</span>
			</a>
			</li>
			<%-- </c:if> --%>
			<!-- End 매출 Page Nav -->

			
			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#hr-nav" data-bs-toggle="collapse" href="#"> <i
					class="bi bi-clipboard"></i><span>인사관리</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="hr-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					
				
					<li>
					<a onclick="mainGo('sectionAnalysis')"> <i
							class="bi bi-circle"></i><span>직원목록</span>
					</a>
					</li>
					
<%-- 				<c:if test="${sessionScope.auth == 3 }">					 --%>
					<li>
					<a onclick="mainGo('teamList')"> <i
							class="bi bi-circle"></i><span>팀관리</span>
					</a>
					</li>
<%-- 				</c:if> --%>
					
					
<%-- 					<c:if test="${sessionScope.auth == 4 }"> --%>
					<li>
					<a onclick="mainGo('posList')"> <i
							class="bi bi-circle"></i><span>직잭관리</span>
					</a>
					</li>
<%-- 					</c:if> --%>
					
<%-- 					<c:if test="${sessionScope.auth == 5 }"> --%>
					<li>
					<a onclick="mainGo('rankList')"> <i
							class="bi bi-circle"></i><span>직급관리</span>
					</a>
					</li>
<%-- 					</c:if> --%>
					
				</ul></li>
			
			<!-- 인사관리 Nav -->

			<li class="nav-item">
			<a class="nav-link collapsed"
				onclick="mainGo('teamSch')"> <i class="bi bi-chat-left-text"></i>
					<span>팀일정</span>
			</a>
			</li>
			<!-- 팀 일정 Nav -->

			<li class="nav-item">
			<a class="nav-link collapsed"
				onclick="mainGo('facList')"> <i class="bi bi-chat-left-text"></i>
					<span>시설예약</span>
			</a>
			</li>
			<!-- 시설예약 Nav -->
			
<%-- 			<c:if test="${sessionScope.auth == 5 }"> --%>
			<li class="nav-item">
			<a class="nav-link collapsed"
				onclick="mainGo('corEmpList')"> <i class="bi bi-chat-left-text"></i>
					<span>협업 및 권한 관리</span>
			</a>
			</li>
<%-- 			</c:if> --%>
			<!-- 협업 및 권한 관리 Nav -->
			
			
			<li class="nav-item">
			<a class="nav-link collapsed"
				onclick="mainGo('stateChangeLog')"> <i class="bi bi-chat-left-text"></i>
					<span>직원 변경 로그</span>
			</a>
			</li>
				<!-- 직원 변경 로그 Nav -->
		</ul>

	</aside>

	<!-- End Sidebar-->

	<main id="main" class="main">
		<div id="inner_jsp">페이지 들어가는 곳</div>

	</main>
	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="copyright">
			&copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights
			Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
			Designed by <a href="https://bootstrapmade.com/">장재혁</a>
		</div>
	</footer>
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
function mainGo(url){
	console.log(url);
	$("#inner_jsp").empty();
	$("#inner_jsp").load("views/"+url+".jsp");
}

</script>
</html>