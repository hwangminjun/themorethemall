<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	padding: 3px;
}

br {
	padding: 5px;
}
	nav{
	text-align:center;
	display:inline-block;
	}
		.container{
	display:inline-block;
	}
</style>
</head>
<body>
	<div class="card">
		<div class="card-body">
			<br>
			<h2>결재 양식 리스트</h2>

			<div class="col-sm-2">
				<select id="docFormSort" onchange="sortSearch()" class="form-select"></select>
			</div>
			<button class="btn btn-primary"
				onclick="location.href='docStyleCreate.go'">양식 생성</button>

			<table class="table table-hover">

				<thead>
					<tr>
						<th scope="col">결재 종류</th>
						<th scope="col">양식 제목</th>
						<th scope="col">생성일</th>
						<th scope="col">작성자</th>
						<th scope="col">사용 횟수</th>
					</tr>
				</thead>
				<tbody id="docFormList">

				</tbody>
				<tfoot>
					<tr id="page">
						<td colspan="5" id="paging" style="text-align: center">
							<div class="container">
								<nav aria-label="Page navigation">
									<ul class="pagination" id="pagination"></ul>
								</nav>
							</div>
						</td>
					</tr>

				</tfoot>
				<tr>
					<td colspan="5" style="text-align: center">
						<div class="container">
							<nav>
								<select name="option" id="option" class="form-select"
									style="width: 100px; float: left; margin-right: 10px;">
									<option value="e.emp_name" selected>작성자</option>
									<option value="form_title">제목</option>
								</select> <input type="text" placeholder="검색어 입력" name="keyword"
									id="keyword" class="form-control"
									style="width: 400px; float: left; margin-right: 10px;">

								<button onclick="flags(); keywordSearch(1)"
									class="btn btn-primary btn-sm" style="height: 37px;">검색</button>
							</nav>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>


	</div>
	</div>
</body>
<script>
	var showPage = 1;
	var flag = true;
	var sort = '';
	var keyword = '';
	var option = '';
	function flags() {
		if (!flag) {
			flag = true;
		}
	}

	function docFormListCall(page) {
		if (flag) {
			drawPage();
		}
		flag = false;
		$.ajax({
			url : "docForm/list.ajax",
			type : "GET",
			data : {
				page : page,
				sort : sort,
				keyword : keyword,
				option : option
			},
			dataType : "JSON",
			success : function(result) {
				console.log(result.docFormList);
				createTableDocForm(result.docFormList);
				console.log(result.total);
				if (result.total >= 1) {
					$("#pagination").twbsPagination({
						startPage : 1, // 시작페이지
						totalPages : result.total, // 총 페이지 수
						visiblePages : 5, // 기본으로 보여줄 페이지 수
						onPageClick : function(e, page) { // 클릭했을 때 실행 내용
							docFormListCall(page);
							flag = false;
						}
					});
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
	$(function() {

		$.ajax({//결재 종류 가져오고 select 추가
			url : "doc/docSort.ajax",
			type : "GET",
			dataType : "JSON",
			success : function(result) {
				createTableDocSort(result.sort);
			},
			error : function(e) {
				alert("종류조회실패이예이에");
			}
		});

		docFormListCall(1);
	});
	function createTableDocSort(list) {
		var sortList = "<option value='' selected disabled style='display:none;'>선택</option>";
		sortList += "<option value=''>전체 조회</option>"

		var index;
		for (var i = 0; i < list.length; i++) {
			sortList += "<option value='"+list[i].doc_sort_num+"'>"
					+ list[i].doc_sort_name + "</option>";
		}
		$("#docFormSort").empty();
		$("#docFormSort").append(sortList);

	}
	function createTableDocForm(list) {
		var docFormContent = "";
		for (var i = 0; i < list.length; i++) {
			docFormContent += "<tr onclick='docFormDetail(" + list[i].form_num
					+ ")'>";
			docFormContent += "<td>" + list[i].doc_sort_name + "</td>";
			docFormContent += "<td>" + list[i].form_title + "</td>";
			docFormContent += "<td>" + list[i].write_time + "</td>";
			docFormContent += "<td>" + list[i].emp_name + "</td>";
			docFormContent += "<td>" + list[i].form_cnt + "</td></tr>";
		}
		$("#docFormList").empty();
		$("#docFormList").append(docFormContent);

	}

	function sortSearch() {
		sort = $("#docFormSort option:selected").val();
		drawPage();
		docFormListCall(1);
	}

	function keywordSearch(page) {
		keyword = $('#keyword').val();
		option = $('#option option:selected').val();
		drawPage();
		docFormListCall(1);

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

	function docFormDetail(doc_num) {

		$.ajax({
			url : 'docForm/docFormDetailGo.ajax',
			type : "GET",
			data : {
				doc_num : doc_num
			},
			dataType : "JSON",
			success : function(res) {
				location.href = 'docStyleDetail.go';
			},
			error : function(e) {
				alert('error');
			}
		});

	}
</script>
</html>