<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>	
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	padding: 3px;
}
br{
	padding: 5px;
}
nav {
	text-align: center;
	display: inline-block;
}

.container {
	display: inline-block;
}	
</style>
</head>
<body>
	<div class="card"  style="height: 960px;">
		<div class="card-body">
		<div class="row">
			<br>
<h2> 나의 결재 수신함 </h2>
<div class="col-sm-2">
		<input class="form-check-input" type="radio" name="docState" value="0" checked> 수신함 /
			<input class="form-check-input" type="radio" name="docState" value="1"> 결재 내역

	
		<select class="form-select" id="docSort" onchange="sortSearch()">
		<option value=""></option>
		</select>
		</div>
		
		</div>
		<div id="docRecTable"></div>
		
		
		</div>
	</div>
</body>
<script>
var showPage = 1;
var total = 5;
var flag = true;

	var emp_num="${sessionScope.loginInfo.emp_num}";
	var doc_category_num = $("input[name='docState']:checked").val();
	var doc_state_num = 0;
	var keyword='';
	var option='';
	var doc_sort_num='';

$(function(){
	
	$.ajax({
		url:"doc/docSort.ajax",
		type:"GET",
		success:function(result){
			createSelbox(result.sort);
		},
		error:function(e){
			alert('error');
		}
	});
	doc_category_num = $("input[name='docState']:checked").val();
	$("#docRecTable").load("views/docRec_Sign.jsp");
	doc_state_num=1;
	docRecList(1);
});




/* 페이징 다시 그리기 */
function drawPage(){
	var paging = "";
	$('#page').empty();
	paging += '<td colspan="8" id="paging" style="text-align:center">';
	paging += '<div class="container">';
	paging += '<nav aria-label="Page navigation">';
	paging += '<ul class="pagination" id="pagination"></ul>';
	paging += '</nav></div></td>';
	
	$('#page').append(paging);
}


function docRecList(page){
	if(flag){
		drawPage();
	}
	flag = false;
	$.ajax({
		url:'doc/docRecList.ajax',
		type:'GET',
		data:{
			page:page,
			keyword:keyword,
			doc_sort_num:doc_sort_num,
			emp_num:emp_num,
			doc_state_num:doc_state_num,
			doc_category_num:doc_category_num,
			option:option
		},
	dataType:'JSON',
	success:function(res){
		createRecTable(res.list,doc_state_num);
		if(res.total >=1){
		$("#pagination").twbsPagination({
			startPage:1, // 시작페이지
			totalPages:res.total, // 총 페이지 수
			visiblePages:5, // 기본으로 보여줄 페이지 수
			onPageClick:function(e, page){ // 클릭했을 때 실행 내용
				docRecList(page);
				flag=false;
			}
		});
		}
		
	},
	error:function(e){
		alert('error');
	}
	});
	
}
//결재문서, 결재 했던 문서 변경 시
$("input[name='docState']").change(function(){
	doc_category_num = $("input[name='docState']:checked").val();
	if(doc_category_num==0){
		$("#docRecTable").load("views/docRec_Sign.jsp");
	}else{
		 doc_state_num = 0;
		$("#docRecTable").load("views/docRec_SignComp.jsp");
	}

	docRecList(1);			
});

function flags(){
	if(!flag){
		flag = true;
	}
}

//결재종류(docSort) select 변경 시
function sortSearch(){
	doc_sort_num = $("#docSort option:selected").val();
	console.log(doc_sort_num);

	docRecList(1);
}

//signComp에서 문서상태 select 변경 시
function docStateSearch(){
doc_state_num = $("#docStateNum option:selected").val();
	
	docRecList(1);
	
}
//키워드 검색
function keywordSearch(){
	keyword = $("#keyword").val();
	option = $("#option option:selected").val();

	if(keyword==''){
		alert('검색어를 입력해주세요!');
	}else{

		docRecList(1);
		keyword='';
	}
}
function createSelbox(list) {
	var sortList = "<option value=0>전체</option>";
	var index;
	for (var i = 0; i < list.length; i++) {
		sortList += "<option value='"+list[i].doc_sort_num+"'>"
				+ list[i].doc_sort_name + "</option>";
	}
	$("#docSort").empty();
	$("#docSort").append(sortList);
	
}
// doc_state_num = $("#docStateNum option:selected").val();
function createRecTable(list,num){
	var docDisContent = "";
	
	for (var i = 0; i < list.length; i++) {
		docDisContent += "<tr onclick='docFormDetail("
			+ list[i].doc_num + ")'><td>" + list[i].doc_num + "</td>";
		docDisContent += "<td>" + list[i].doc_sort_name + "</td>";
		docDisContent += "<td>" + list[i].emp_name
				+ "</td>";
		docDisContent += "<td>" + list[i].doc_sub + "</td>";
		docDisContent += "<td>" + list[i].doc_reg + "</td>";
		if(doc_category_num==1){
			
		docDisContent += "<td>" + list[i].doc_state_name + "</td>";
		}
		docDisContent += "</tr>";
	}
	$("#signDocList").empty();
	$("#signDocList").append(docDisContent);

}
function docFormDetail(doc_num){
	
	$.ajax({
		url:'doc/docDetailGo.ajax',
		type:"GET",
		data:{
			doc_num:doc_num
		},
		dataType:"JSON",
		success:function(res){
			location.href='docDisDet.go';
		},
		error:function(e){
			alert('error');
		}
	});
	
}



</script>
</html>