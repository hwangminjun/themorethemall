<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
</style>
</head>
<body>
	<select id="docFormSort" onchange="sortSearch()"></select>
	<div class="card">
		<div class="card-body">
			<p>결재 양식 리스트</p>
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
	$(function() {
		$.ajax({
			url : "docForm/list.ajax",
			type : "GET",
			data : {},
			dataType : "JSON",
			success : function(result) {
				console.log(result.docFormList);
				createTableDocSort(result.docFormSort);
				createTableDocForm(result.docFormList);
			},
			error : function(e) {
				console.log(e);
			}
		});
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
		var sort = $("#docFormSort option:selected").val();

		console.log(sort);

		$.ajax({
			url : "docForm/sortSearch.ajax",
			type : "GET",
			data : {
				sort : sort
			},
			dataType : "JSON",
			success : function(result) {

				createTableDocForm(result.sortSearchList);
			},
			error : function(e) {
				console.log(e);
			}
		})
	}
	function docFormSearch() {
		var option = $("#docFormOption option:selected").val();
		var keyword = $("#keyword").val();

		console.log(option + "/" + keyword);

		$.ajax({
			url : "docForm/keywordSearch.ajax",
			type : "GET",
			data : {
				option : option,
				keyword : keyword
			},
			dataType : "JSON",
			success : function(result) {

				createTableDocForm(result.keywordSearchList);
			},
			error : function(e) {
				console.log(e);
			}
		})

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
				location.href='docStyleDetail.go';
			},
			error : function(e) {
				console.log(e);
			}
		})

	}
</script>
</html>