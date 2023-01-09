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
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
			
			<table id="titleSection" style="width:100%;">
				<tr>
					<td><h2>제&nbsp;&nbsp;&nbsp;&nbsp;목 : 
					<input type="text" id="docFormTitle" value="${sessionScope.docFormInfo.form_title }"/>
				</h2></td>
				</tr>
			</table>
			</div>
			
			<div class="col-sm-2" >
				<select id="sortVal">
					<c:forEach items="${sessionScope.sortList }" var="sort" varStatus="index">
						<c:if test="${sort eq sessionScope.docFormInfo.doc_sort_name }">
						<option value="${index.count }" selected>${sort}</option>
						</c:if>
						<c:if test="${sort ne sessionScope.docFormInfo.doc_sort_name }">
						<option value="${index.count }">${sort}</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="col-sm-2" >
				사용 회수 : ${sessionScope.docFormInfo.form_cnt}
			</div>
			<div class="col-sm-2" >
				작성자 : ${sessionScope.docFormInfo.emp_name}
			</div>
		</div>
<div id="detailContent" style="display: none">${sessionScope.docFormInfo.form_style}</div>

		<div class="row">
			<p>양식 작성</p>
			<div class="col-sm-12">
				<div id="div_editor1"></div>
			</div>
		</div>
		
	</div>
	
	<c:if test="${sessionScope.docFormInfo.emp_name eq sessionScope.loginInfo.emp_name}">
	<button onclick="docFormUpdate()">수정 완료</button>
	
	</c:if>
</body>

<script>
var contentEditor = new RichTextEditor("#div_editor1");
contentEditor.setHTMLCode($("#detailContent").html());

function docFormUpdate(){
	var form_num = "${sessionScope.docFormInfo.form_num}"
	var newTitle = $("#docFormTitle").val();
	var newContent = contentEditor.getHTMLCode;
	
	$.ajax({
		url:"docForm/update.ajax",
		Type:"GET",
		data:{
			num:form_num,
			title:newTitle,
			content:newContent
		},
		dataType:"JSON",
		success:function(result){
			console.log('tt')
			mainGo('docStyleDetail');
		},
		error:function(e){
			console.log(e);
		}
	})
}


</script>

</html>