<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>
table, td, th{
border: 1px solid black;
border-collapse: collapse;
text-align: center;
}
.signSection {
	width: 96px;
	heigth: 64px;
}

div #docBody {
	padding: 10px 0px;
}
</style>
</head>
<body>
	<div class="card">
		<div class="card-body">
			<!-- 결재라인 Modal -->
			<div class="modal" id="myModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">결재라인 지정</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						</div>
						<!-- Modal body -->
						<div class="container">
							<div class="row" style="padding: 10px;">

								<div class="col-sm-6">
									<div class="modal-body">
										<input type="radio" name="isLine" value="f" checked />결재자 / <input
											type="radio" name="isLine" value="t" />참조자
										<div class="row">
											<!-- 모달 리스트 -->
											<ul id="docLine">

											</ul>
										</div>

									</div>
								</div>
								<div class="col-sm-6">
									<div id="selectLineEmp" style="height: 50%;">
										<p>결재라인</p>
										<ul id="selectLineEmpUL"></ul>
										<!-- 참조자 영역 -->
									</div>
									<div id="selectLineEx" style="height: 50%;">
										<p>참조라인</p>
										<ul id="selectLineExUL"></ul>

									</div>
								</div>
							</div>
						</div>
						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="submit" class="btn btn-danger"
								onclick="lineClear()">초기화</button>

							<button type="submit" class="btn btn-primary"
								data-bs-dismiss="modal" onclick="lineSave()">저장</button>
						</div>

					</div>
				</div>
			</div>
			<!-- 모다아아아아아아아아아아아아아앙아아아알ㄹ -->

			<!-- 결재 작성 Header -->
			<div class="container">
				<div class="row" style="padding: 10px;">

					<div class="col-sm-3">
						<p>
							결재 양식 : <select id="formType" class="form-select" style="width: 180px;">
								<option value="">선택</option>
							</select>
						</p>
					</div>
					<div class="col-sm-3">
						<select id="docType" class="form-select" style="display: none;"></select>
					</div>
					<div class="col-sm-3"></div>
					<div class="col-sm-3">
						<button type="button" id="selLineCall" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#myModal">결재 라인
							지정</button>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">
						<h2 style="font-size: 36px;">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목
							:</h2>
					</div>
					<div class="col-sm-6">
						<div>
							<input type="text" id="docTitle"
								style="width: 100%; font-size: 36px;" />
						</div>
					</div>


					<div class="col-sm-4">

						<table id="tabledocLine" style="float: right;">
							<tr>
								<th rowspan="2">서명</th>
								<th>결재자 1</th>
								<th>결재자 2</th>
								<th>결재자 3</th>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>

				</div>
				<!-- 결재 작성 body -->
				<div id="docBody"></div>
				<!-- 결재 작성 에디터 -->
				<div id="editor" style="height: 800px"></div>

				<div id="docFooter">
					<button class="btn btn-primary" id="writeDoc">결재 작성</button>
				</div>

			</div>
		</div>
	</div>

</body>
<script>
	var doclines = [];
	var exlines = [];//결재자 및 참조자를 담을 배열

	var contentEditor = new RichTextEditor("#editor");
	$(function() {
		//결재 종류 불러오기
		$.ajax({
			url : "doc/docSort.ajax",
			type : "GET",
			dataType : "JSON",
			success : function(result) {
				createSelbox(result.sort);
			},
			error : function(e) {
				alert("종류조회실패이예이에");
			}
		});

	});

	function createSelbox(list) {
		var sortList = "<option value='' selected disabled style='display:none;'>선택</option>";
		var index;
		for (var i = 0; i < list.length; i++) {
			sortList += "<option value='"+list[i].doc_sort_num+"'>"
					+ list[i].doc_sort_name + "</option>";
		}
		$("#formType").empty();
		$("#formType").append(sortList);
		
	}
	$("#formType").change(function() {
		//결재양식 지정하고
		var docType = $("#formType option:selected").val();
		console.log(docType);
		$.ajax({
			url : "doc/docFormList.ajax",
			type : "GET",
			dateType : "JSON",
			data : {
				docType : docType
			},
			success : function(suc) {
				console.log(suc.form);
				createSelDoc(suc.form);
			},
			error : function(e) {
				alert('erorr');
			}
		})
		//에디터에 넣고
		//양식에 따른 css 불러오고
		var formVal = $("#formType option:selected").val();
		if (formVal == 1) {
			$("#docBody").load("views/docBody_event.jsp");
		} else if (formVal == 2) {
			$("#docBody").load("views/docBody_norm.jsp");
		} else if (formVal == 3) {
			$("#docBody").load("views/docBody_sales.jsp");
		} else if (formVal == 4) {
			$("#docBody").load("views/docBody_vacat.jsp");
		} else if (formVal == 5) {
			$("#docBody").load("views/docBody_half.jsp");
		} else {
			$("#docBody").load("views/docBody_Exwork.jsp");

		}
	});

	//양식 지정 시 양식 내용을 에디터에 추가
	$("#docType").change(function() {
		var formNum = $("#docType option:selected").val();
		console.log(formNum);
		$.ajax({
			url : "doc/callFormContent.ajax",
			type : "GET",
			data : {
				formNum : formNum
			},
			dataType : "JSON",
			success : function(result) {
				var content = result.content;
				console.log(content);
				contentEditor.setHTMLCode(content);
			},
			error : function(e) {
				alert('error');
			}
		})
	});

	function createSelDoc(list) {
		var sortList = "<option value='' selected disabled style='display:none;'>선택</option>";
		var index;
		for (var i = 0; i < list.length; i++) {
			sortList += "<option value='"+list[i].form_num+"'>"
					+ list[i].form_title + "</option>";
		}
		$("#docType").empty();
		$("#docType").append(sortList);
		$("#docType").css("display","inline");

	}

	function selLines(e, name) {//num = 참조자로 등록할 사원번호

		console.log(e);
		console.log($(e));
		var lineType = $("input[name='isLine']:checked").val();
		var able = true;
		console.log(lineType + "/" + name);
		console.log("참조자 : " + exlines);
		console.log("졀재자 : " + doclines);
		if (lineType == 'f') {
			if (doclines.length < 3) {
				$("#selectLineEmpUL").append(e);
				doclines.push(name);
			} else {
				alert('결재자는 3명까지 등록 가능합니다.');
			}

		} else if (lineType == 't') {
			if (exlines.length < 3) {

				exlines.push(name);
				$("#selectLineExUL").append(e);
			}
		}
	}
	//결재선 등록 조건
	/*
		라디오 버튼 val이 f이면서
		결재선 배열의 크기가 2 미만이면서
		참조선에 해당 직원이 없을 때
		
	
	 */

	/* 
	if (lineType == 'f' && doclines.length <= 2) {
		for (let i = 0; i < exlines.length; i++) {
			if (num == exlines[i]) {
				alert('이미 참조자로 등록된 직원입니다.');
			}else{
				doclines.push(num);
				console.log(doclines);

			}

		}

	} else if (lineType == 't' && exlines.length <= 2) {
		for (let i = 0; i < exlines.length; i++) {
			if (num == doclines[i]) {
				alert('이미 결재자로 등록된 직원입니다.');
			}else{
				exlines.push(num);
				console.log(doclines);
			}
		}
		

	} else if (lineType == 'f') {
		alert('결재자는 최대 3명까지 등록가능합니다.');
		console.log(doclines);
	} else {
		alert('참조자는 최대 3명까지 등록가능합니다.');

	}
	 */
	function lineClear() {
		doclines = [];
		exlines = [];
		$("#selectLineExUL").empty();
		$("#selectLineEmpUL").empty();
		empCall();
	}

	function lineSave() {
		console.log(doclines);
		console.log(doclines.length);
		console.log(exlines);
		doclines = doclines.sort(function(a, b) {
			return a.rank - b.rank;
		});
		exlines = exlines.sort(function(a, b) {
			return a.rank - b.rank;
		});

		var tableA = "<tr><th rowspan='2'>서명</th>";
		var tableB = "<tr>";
		$("#tabledocLine").empty();
		for (var i = 0; i < doclines.length; i++) {
			tableA += "<td>" + doclines[i] + "</td>";
			tableB += "<td></td>";
		}
		tableA += "</tr>";
		tableB += "</tr>";
		tableA = tableA + tableB;
		console.log(tableA);

		$("#tabledocLine").append(tableA);
	}

	//모달에 가져온 사원 리스트를 그려준다.
	function drawLine(teamlist, emplist) {
		var lineContent = "";
		for (var i = 0; i < teamlist.length; i++) {
			lineContent += '<li class="nav-item">';
			lineContent += '<a class="nav-link collapsed" data-bs-target="#'+teamlist[i]+'" data-bs-toggle="collapse" href="#">';
			lineContent += "" + teamlist[i];
			lineContent += '<i class="bi bi-chevron-down ms-auto">';
			lineContent += '</i>';
			lineContent += '</a>';
			for (var j = 0; j < emplist.length; j++) {
				if (teamlist[i] == emplist[j].team_name) {
					lineContent += '<ul id="'+emplist[j].team_name+'" class="nav-content collapse emplist"data-bs-parent="#sidebar-nav">';
					lineContent += '<li id="' + emplist[j].emp_num
							+ '" class="' + emplist[j].team_name
							+ '" onclick="selLines(this, \''
							+ emplist[j].emp_name + '\', \''
							+ emplist[j].rank_num + '\')">';
					lineContent += '<a>';
					lineContent += "" + emplist[j].team_name + " "
							+ emplist[j].pos_name + " " + emplist[j].emp_name;
					lineContent += '</a></li></ul>';
				}
			}
			lineContent += '</li>';
		}

		$("#docLine").empty();
		$("#docLine").append(lineContent);
	}

	$('#selLineCall').on('click', function(e) {
		empCall()
	});
	function empCall() {
		//팀과 팀원 조회해서 모달에 뿌려준다.
		$.ajax({
			url : "doc/line.ajax",
			type : "get",
			dataType : "JSON",
			success : function(result) {
				console.log(result.emplist);
				drawLine(result.teamlist, result.emplist);
			},
			error : function(e) {
				console.log(e);
			}

		});

	}
	
	//글 작성 시
	$("#writeDoc").on('click',function(){
		console.log($("#docTitle").val());
		if($("#formType option:selected").val()==""){
		//결재 종류 선택X
			alert('결재 종류를 선택해주세요!');
		}
		//결재자가 0명일때
		else if(doclines.length<1){
			alert('결재자를 선택해주세요.');
		}
		//제목이 없을때
		else if($("#docTitle").val()==""){
			alert('제목을 입력해주세요!');
		}
		//에디터 안에 내용이 비어있을때
		else if(contentEditor.getHTMLCode()==""){
			alert('내용을 입력해주세요!');
		}
		//이벤트 시작일이 없을때
		//이벤트 종료일이 없을때
		//이벤트 기간이 이상할때
		
		//매출 기간 입력이 안되어있을 때
		//날짜를 선택 안했을 때
		//매출액 입력이 안되어있을 때
		
		//휴가 시작일이 없을때
		//휴가 종료일이 없을때
		//휴가 기간이 이상할때
		
		//반차 날짜가 없을 때
		//반차 종류 선택 안되어있을 때
		
		//출장 시작일이 없을때
		//출장 종료일이 없을때
		//출장 기간이 이상할때
		//출장지 입력이 안되어있을 때
		
	});
</script>
</html>