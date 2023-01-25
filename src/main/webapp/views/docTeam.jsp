<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	padding:3px;
}
br{
	padding:5px;
}
nav {
	text-align: center;
	display: inline-block;
}

.container {
	display: inline-block;
}	
</style>
</head>


<body>
	<div class="card" style="height: 960px;">
		<div class="card-body">
			<div class="row">
			<br>
				<h2>팀 결재 문서함</h2>
				<div class="col-sm-4">
					<input class="form-check-input" type="radio" name="docTeam"
						value="0" checked> 마이 팀 문서함<c:if test="${sessionScope.coorList ne undefined}">
						
						 / <input
						class="form-check-input" type="radio" name="docTeam" value="1">
						타 팀 문서함
						</c:if>
				</div>
			</div>
				<div class="col-sm-2">
<select class="form-select" id="docSort" onchange="sortSearch()">
		<option value=""></option>
		</select>
		</div>
			<div id="docTeamTable"></div>


		</div>
	</div>
</body>

<script>
	var team_num = "${sessionScope.loginInfo.team_num}";
	var keyword = "";
	var option='';
	var doc_sort_num = 0;
	var doc_state_num = 0;
	var emp_num = "${sessionScope.loginInfo.emp_num}";
	var showPage = 1;
	var total = 5;
	var flag = true;
	var teamSel='';
	$(function() {
		$.ajax({
			url : "doc/docSort.ajax",
			type : "GET",
			success : function(result) {
				createSelbox(result.sort);

			},
			error : function(e) {
				alert('error');
			}
		});
		$("#docTeamTable").load("views/docTeam_myTeam.jsp");
		docTeam(1);
	});

	function docTeam(page) {
		console.log(team_num);
		if(!flag){
			drawPage();
		}
		flag = false;
		$.ajax({
			url : 'doc/docTeam.ajax',
			type : 'GET',
			data : {
				team_num : team_num,
				keyword : keyword,
				doc_sort_num : doc_sort_num,
				doc_state_num : doc_state_num,
				page : page,
				option : option
			},
			dataType : 'JSON',
			success : function(res) {
				createDocTeam(res.list);

				if (res.total >= 1) {
					$("#pagination").twbsPagination({
						startPage : 1, // 시작페이지
						totalPages : res.total, // 총 페이지 수
						visiblePages : 5, // 기본으로 보여줄 페이지 수
						onPageClick : function(e, page) { // 클릭했을 때 실행 내용
							docTeam(page);
							flag = false;
						}
					});
				}

			},
			error : function(e) {
				alert('error');
			}
		});

	}

	function createDocTeam(list) {
		var docTeamContent = "";

		for (var i = 0; i < list.length; i++) {
			docTeamContent += "<tr onclick='docFormDetail(" + list[i].doc_num
					+ ")'><td>" + list[i].doc_num + "</td>";
			docTeamContent += "<td>" + list[i].doc_sort_name + "</td>";
			docTeamContent += "<td>" + list[i].doc_sub + "</td>";
			docTeamContent += "<td>" + list[i].emp_name + "</td>";
			docTeamContent += "<td>" + list[i].doc_reg + "</td>";
			docTeamContent += "<td>" + list[i].doc_pro + "</td>";
			docTeamContent += "<td>" + list[i].doc_state_name + "</td>";
			docTeamContent += "</tr>";
		}
		$("#docTeamList").empty();
		$("#docTeamList").append(docTeamContent);

	}

	function createSelbox(list) {
		var sortList = "<option value=0>전체</option>";
		var index;
		for (var i = 0; i < list.length; i++) {
			sortList += "<option value='"+list[i].doc_sort_num+"'>"
					+ list[i].doc_sort_name + "</option>";
		}
		$("#docSort").empty();
		$("#docSort").append(sortList);

	}

	$("input[name=docTeam]").change(function() {
		teamSel = $("input[name=docTeam]:checked").val();
		console.log(teamSel);
		if (teamSel == 0) {//내 팀 결재 문서함
			$("#docTeamTable").load("views/docTeam_myTeam.jsp");
		} else {//타 팀 결재 문서함
			$("#docTeamTable").load("views/docTeam_otherTeam.jsp");
		}
	});

	function sortSearch() {
		doc_sort_num = $("#docSort option:selected").val();
		docTeam(1);
	}

	function keywordSearch() {
		keyword = $("#keyword").val()

		docTeam(1);
	}

	function docStateSearch() {
		doc_state_num = $("#docStateNum option:selected").val();
		docTeam(1);
	}
	function teamNumSearch(){
		
		team_num = $("#teamNum option:selected").val();
		docTeam(1);
}	

	/* 페이징 다시 그리기 */
	function drawPage() {
		var paging = "";
		$('#page').empty();
		paging += '<td colspan="8" id="paging" style="text-align:center">';
		paging += '<div class="container">';
		paging += '<nav aria-label="Page navigation">';
		paging += '<ul class="pagination" id="pagination"></ul>';
		paging += '</nav></div></td>';

		$('#page').append(paging);
	}

	function flags() {
		if (!flag) {
			flag = true;
		}
	}

	function docFormDetail(doc_num) {

		$.ajax({
			url : 'doc/docDetailGo.ajax',
			type : "GET",
			data : {
				doc_num : doc_num
			},
			dataType : "JSON",
			success : function(res) {
				location.href = 'docDisDet.go';
			},
			error : function(e) {
				alert('error');
			}
		});

	}

</script>
</html>