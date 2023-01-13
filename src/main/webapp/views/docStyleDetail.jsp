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
	<div class="container">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-sm-6">

						<table id="titleSection" class=table" style="width: 100%;">
							<tr>
								<td><h2 class= "card-title">제&nbsp;&nbsp;&nbsp;&nbsp;목 :
										${sessionScope.docFormInfo.form_title }</h2></td>
							</tr>
						</table>
					</div>

					<div class="col-sm-2">
						${sessionScope.docFormInfo.doc_sort_name}</div>
					<div class="col-sm-2">사용 회수 :
						${sessionScope.docFormInfo.form_cnt}</div>
					<div class="col-sm-2">작성자 :
						${sessionScope.docFormInfo.emp_name}</div>
				</div>
				<div id="detailContent" style="display: none">${sessionScope.docFormInfo.form_style}</div>

				<div class="row">
					<p>양식 작성</p>
					<div class="col-sm-12">
						<div id="div_editor1" style="height: 800px;"></div>
					</div>
				</div>

			</div>

			<c:if
				test="${sessionScope.docFormInfo.emp_name eq sessionScope.loginInfo.emp_name}">
				<button class="btn btn-primary" onclick="location.href='docStyleUpdate.go'">수정하기</button>

			</c:if>
		</div>
	</div>
</body>
<script>
	var contentEditor = new RichTextEditor("#div_editor1");
	contentEditor.setHTMLCode($("#detailContent").html());
	contentEditor.setReadOnly();
</script>
</html>