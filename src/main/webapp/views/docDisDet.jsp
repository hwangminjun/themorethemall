<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div class="card">
		<div class="card-body">
			<div class="container">
				<div class="row" style="padding: 10px;">

					<div class="col-sm-3">
						<p>
							결재 양식 : <select id="formType" class="form-select"
								style="width: 180px;">
								<option value="">선택</option>
							</select>
						</p>
					</div>
					<div class="col-sm-3">
						<select id="docType" class="form-select" style="display: none;"></select>
					</div>
					<div class="col-sm-3"></div>
					<div class="col-sm-3">

					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">
						<h2 style="font-size: 36px;">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목
							:</h2>
					</div>
					<div class="col-sm-6">
							<h2>${doc.docDetails.doc_sub}</h2>
					</div>
					
					<div class="col-sm-4">

						<table id="tabledocLine" style="float: right;">
							<tr>
								<th rowspan="2">서명</th>
								<th>${doc.docLines[0].emp_num}</th>
								<th>${doc.docLines[1].emp_num}</th>
								<th>${doc.docLines[2].emp_num}</th>
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

var contentEditor = new RichTextEditor("#editor");
var doc_sort='${doc.docDetails.doc_sort_num}';
console.log(doc_sort);
console.log(doc);

$(function(){
	if(doc_sort=="3"){
		$("doc_body").load("views/docBody_sales.jsp");
	}
})
</script>
</html>