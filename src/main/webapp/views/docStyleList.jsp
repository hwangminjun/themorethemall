<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<div class="card">
		<div class="card-body">
			<p>결재 양식 리스트</p>
			<select id="docFormSort" onchange="sortSearch()" class="form-select"></select>
			<button class="btn btn-primary"
				onclick="location.href='docStyleCreate.go'">양식 생성</button>

			<table class="table">
				<thead>
					<tr>
						<th scope="col">양식 번호</th>
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
						<td colspan="8" id="paging" style="text-align: center">
							<div class="container">
								<nav aria-label="Page navigation">
									<ul class="pagination" id="pagination"></ul>
								</nav>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="6"><select id="docFormOption">
								<option value="form_title">양식 제목</option>
								<option value="emp_name">작성자</option>
						</select> <input type="text" id="keyword" />
							<button class="btn btn-primary" onclick="docFormSearch()">검색</button></td>
					</tr>
				</tfoot>
			</table>



		</div>
	</div>
</body>
<script>
	var showPage = 1;
	var total = 5;
	var flag = true;

	function flags() {
		if (!flag) {
			flag = true;
		}
	}

	function docFormListCall(page) {
		$.ajax({
			url : "docForm/list.ajax",
			type : "GET",
			data : {
				page : page
			},
			dataType : "JSON",
			success : function(result) {
				console.log(result.docFormList);
				createTableDocSort(result.docFormSort);
				createTableDocForm(result.docFormList);
				if (result.total > 1) {
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
		docFormListCall(1);
	});

	function createTableDocForm(list) {
		var docFormContent = "";
		for (var i = 0; i < list.length; i++) {
			docFormContent += "<tr><td>" + list[i].form_num + "</td>";
			docFormContent += "<td>" + list[i].doc_sort_name + "</td>";
			docFormContent += "<td><a onclick='docFormDetail("
					+ list[i].form_num + ")'>" + list[i].form_title
					+ "</a></td>";
			docFormContent += "<td>" + list[i].write_time + "</td>";
			docFormContent += "<td>" + list[i].emp_name + "</td>";
			docFormContent += "<td>" + list[i].form_cnt + "</td></tr>";
		}
		$("#docFormList").empty();
		$("#docFormList").append(docFormContent);

	}

	function createTableDocSort(list) {
		var docSort = "<option value='' selected disabled>선택</option>";
		var index;
		for (var i = 0; i < list.length; i++) {
			index = i + 1;
			docSort += "<option value='"+index+"'>" + list[i] + "</option>";
		}
		$("#docFormSort").empty();
		$("#docFormSort").append(docSort);

	}
	function sortSearch() {
				drawPage();
		sortSearchAjax(1);
	}
	function sortSearchAjax(page) {
		var sort = $("#docFormSort option:selected").val();

		console.log(sort);

		$.ajax({
			url : "docForm/sortSearch.ajax",
			type : "GET",
			data : {
				sort : sort,
				page : page
			},
			dataType : "JSON",
			success : function(result) {

				createTableDocForm(result.sortSearchList);
				if (result.total > 1) {
					$("#pagination").twbsPagination({
						startPage : 1, // 시작페이지
						totalPages : result.total, // 총 페이지 수
						visiblePages : 5, // 기본으로 보여줄 페이지 수
						onPageClick : function(e, page) { // 클릭했을 때 실행 내용
							sortSearch(page);
							flag = false;
						}
					});
				}
			},
			error : function(e) {
				console.log('errr');
			}
		});
	}
	function docFormSearch() {
		
				drawPage();
		docFormSearchAjax(1);
	}
	function docFormSearchAjax(page) {
		var option = $("#docFormOption option:selected").val();
		var keyword = $("#keyword").val();

		console.log(option + "/" + keyword);

		$.ajax({
			url : "docForm/keywordSearch.ajax",
			type : "GET",
			data : {
				option : option,
				keyword : keyword,
				page : page
			},
			dataType : "JSON",
			success : function(result) {

				createTableDocForm(result.keywordSearchList);
				if (result.total > 1) {
					$("#pagination").twbsPagination({
						startPage : 1, // 시작페이지
						totalPages : result.total, // 총 페이지 수
						visiblePages : 5, // 기본으로 보여줄 페이지 수
						onPageClick : function(e, page) { // 클릭했을 때 실행 내용
							docFormSearch(page);
							flag = false;
						}
					});
				}

			},
			error : function(e) {
				console.log(e);
			}
		})

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

	function docFormDetail(index) {
		$.ajax({
			url : "docForm/detail.ajax",
			type : "GET",
			data : {
				index : index
			},
			dataType : "JSON",
			success : function(result) {
				location.href = 'docStyleDetail.go';
			},
			error : function(e) {
				console.log(e);
			}
		})

	}
</script>
</html>