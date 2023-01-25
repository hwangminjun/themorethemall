<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 양식 생성</title>
<style>
*{
	padding:3px;
}
</style>
</head>
<body>

	<div class="container">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-sm-10">

						<table id="titleSection" style="width: 100%;">
							<tr>
								<td><h2>제&nbsp;&nbsp;&nbsp;&nbsp;목</h2></td>
								<td><h2>
										<input type="text" name="docTitle"
											style="float: right; width: 100%;" />
									</h2></td>
							</tr>
						</table>
					</div>

					<div class="col-sm-2">
						<select id="formType" style="width: 100%">

						</select>
					</div>
				</div>


				<div class="row">
					<div class="col-sm-12">
						<div id="div_editor1"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<button class="btn btn-primary" onclick="docFormWrite()">저장</button>

	<script>
		//editor1.setHTMLCode("Use inline HTML or setHTMLCode to init the default content.");
		var contentEditor = new RichTextEditor("#div_editor1");

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
			
		});
		function createTableDocSort(list) {
			var sortList = "<option value='' selected disabled style='display:none;'>선택</option>";
			for (var i = 0; i < list.length; i++) {
				sortList += "<option value='"+list[i].doc_sort_num+"'>"
						+ list[i].doc_sort_name + "</option>";
			}
			$("#formType").empty();
			$("#formType").append(sortList);

		}

		function docFormWrite() {
			if($("#docSub").val()==''){
				alert('제목을 입력해주세요!');
			}else if(contentEditor.getHTMLCode==''){
				alert('내용을 입력해주세요!');
			}else{
			var rtn = confirm('결재 양식을 생성하시겠습니까?')
				
			if(rtn){
				
			var title = $("input[type='text']").val();
			var content = contentEditor.getHTMLCode();
			var sort = $("#formType option:selected").val();
			var writer = '${sessionScope.loginInfo.emp_num}';
			console.log(title);
			console.log(content);
			console.log(sort);
			console.log(writer);

			$.ajax({
				url : "docForm/write.ajax",
				type : "GET",
				data : {
					title : title,
					content : content,
					sort : sort,
					writer : writer
				},
				dataType : "JSON",
				success : function(result) {
					alert('양식이 등록되었습니다.');
					location.href="docStyleList.go";
				},
				error : function(e) {
					console.log(e);
				}
			});
			}
		}
		}
	</script>
</body>

</html>