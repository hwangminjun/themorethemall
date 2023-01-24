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
</style>
</head>
<body>
	<div class="container">
		<div class="card">
			<div class="card-body">
				
				<div class="row">
					<div class="col-sm-2">
						<label for="inputText" class="col-form-label"
							style="font-size: 36px">제
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목 : </label>
					</div>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="docSub"
							readonly="readonly" style="font-size: 36px">
					</div>

					<div class="col-sm-2">
						<p id="docSortname"></p></div>
						
					<div class="col-sm-2"><p id="writer"></p></div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div id="div_editor1" style="height: 800px;"></div>
					</div>
				</div>

			<div class="row">
			
					<div class="col-sm-4">
				<button class="btn btn-primary" id="goBack">뒤로가기</button>
				
				<button class="btn btn-primary" id="delete">삭제하기</button>
				<button class="btn btn-primary" onclick="location.href='docStyleUpdate.go'" id="revise">수정하기</button>
				</div>
			</div>
			</div>
		</div>
	</div>
</body>
<script>
	var contentEditor = new RichTextEditor("#div_editor1");
	var session_emp_num = "${sessionScope.loginInfo.emp_num}";
	var form_emp_num='';
	
	$(function(){
		$.ajax({
		url:'docForm/getDocFormDetail.ajax',
		type:'GET',
		success:function(res){
			$('#docSub').val(res.docFormDetail.form_title);
			$('#writer').text("작성자 : "+res.docFormDetail.emp_name);
			console.log(res.docFormDetail.doc_sort_name);
			$('#docSortname').text("양식 종류 :  "+res.docFormDetail.doc_sort_name);
			contentEditor.setHTMLCode(res.docFormDetail.form_style);
			contentEditor.setReadOnly();
			form_emp_num=res.docFormDetail.emp_num;
			if(session_emp_num!=form_emp_num){
				$("#revise").css('display','none');
				$("#delete").css('display','none');
			}
		},
		error:function(e){}
		});
		

		
		
		
		
	});
	
	$("#goBack").on('click',function(){
		window.history.back();
	});
	$("#delete").on('click',function(){
		var rtn = confirm('삭제하시겠습니까?');
		if(rtn){
			$.ajax({
				url:'docForm/delete.ajax',
				type:'GET',
				success:function(res){
					alert('삭제가 완료되었습니다.');
					location.href='docStyleList.go';
				},
				error:function(e){}
				});
		}
	});
</script>
</html>