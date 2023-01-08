<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 양식 생성</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>

</style>
</head>
<body >
	<div class="container">
		<div class="row">
			<div class="col-sm-10">
			
			<table id="titleSection" style="width:100%;">
				<tr>
					<td><h2>제&nbsp;&nbsp;&nbsp;&nbsp;목</h2></td>
					<td><h2>
					<input type="text" name="docTitle"
						style="float: right; width: 100%;"/>
				</h2></td>
				</tr>
			</table>
			</div>
			
			<div class="col-sm-2" >
				<select id="formType" style="width: 100%">
					<option value="1">일반 결재</option>
					<option value="2">매출 결재</option>
					<option value="3">이벤트 결재</option>
					<option value="4">휴가 결재</option>
					<option value="5">반차 결재</option>
					<option value="6">출장 결재</option>
				</select>
			</div>
		</div>


		<div class="row">
			<p>양식 작성</p>
			<div class="col-sm-12">
				<div id="div_editor1"></div>
			</div>
		</div>
		
	</div>
	<button onclick="docFormWrite()">저장</button>

	<script>
		//editor1.setHTMLCode("Use inline HTML or setHTMLCode to init the default content.");
		var contentEditor = new RichTextEditor("#div_editor1");
		
		function docFormWrite(){
			var title = $("input[type='text']").val();
			var content = contentEditor.getHTMLCode();
			var sort = $("#formType option:selected").val();
			var writer = '${sessionScope.loginInfo.emp_num}';
			console.log(title);
			console.log(content);
			console.log(sort);
			console.log(writer);
			
			$.ajax({
				url:"docForm/write.ajax",
				type:"GET",
				data:{
					title:title,
					content:content,
					sort:sort,
					writer:writer
				},
				dataType:"JSON",
				success:function(result){
					alert(result.page+"로 이동");
					mainGo(result.page);
				},
				error:function(e){
					console.log(e);
				}
			});
			
		}
		
		
		
	</script>
</body>

</html>