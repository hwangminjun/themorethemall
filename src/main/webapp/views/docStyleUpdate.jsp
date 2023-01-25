<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
							style="font-size: 36px">
					</div>

					<div class="col-sm-2">
						<select id="docFormSort" class="form-select"></select>
			</div>
						
					<div class="col-sm-2"><p id="writer"></p></div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div id="div_editor1" style="height: 800px;"></div>
					</div>
				</div>

			</div>
						<div class="row">
			
					<div class="col-sm-4">
				<button class="btn btn-primary" id="goBack">수정 취소</button>
				
				<button class="btn btn-primary" onclick="docFormUpdate()" id="revise">수정하기</button>
</div>
</div>
		</div>
	</div>
</body>

<script>

var contentEditor = new RichTextEditor("#div_editor1");
var session_emp_num = "${sessionScope.loginInfo.emp_num}";
var form_emp_num='';
var form_sort='';
$(function(){
	
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
	
	
	$.ajax({
	url:'docForm/getDocFormDetail.ajax',
	type:'GET',
	success:function(res){
		$('#docSub').val(res.docFormDetail.form_title);
		$('#writer').text("작성자 : "+res.docFormDetail.emp_name);
		console.log(res.docFormDetail.doc_sort_name);
		contentEditor.setHTMLCode(res.docFormDetail.form_style);
		form_emp_num=res.docFormDetail.emp_num;
		form_sort=res.docFormDetail.doc_sort_num+'';
		console.log(form_sort);
		$('#docFormSort').val(form_sort).prop("selected",true);
	},
	error:function(e){}
	});
});
function createTableDocSort(list) {
	var sortList = "<option value='' selected disabled style='display:none;'>선택</option>";
	for (var i = 0; i < list.length; i++) {
		sortList += "<option value='"+list[i].doc_sort_num+"'>"
				+ list[i].doc_sort_name + "</option>";
	}
	$("#docFormSort").empty();
	$("#docFormSort").append(sortList);

}


function docFormUpdate(){
		
	var rtn = confirm('수정하시겠습니까?');
	if(rtn){
		
	var newTitle = $("#docSub").val();
	var newContent = contentEditor.getHTMLCode;
	sort_num=$("#docFormSort option:selected").val();
	$.ajax({
		url:"docForm/update.ajax",
		Type:"GET",
		data:{
			sort:sort_num,
			title:newTitle,
			content:newContent
		},
		dataType:"JSON",
		success:function(result){
			alert('수정이 완료되었습니다.');
			location.href = 'docStyleList.go';
		},
		error:function(e){
			console.log(e);
		}
	});
	}
}


</script>

</html>