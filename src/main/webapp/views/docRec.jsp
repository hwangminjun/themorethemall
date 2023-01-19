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
	<div class="card"  style="height: 960px;">
		<div class="card-body">
		<div class="row">
<h2> 나의 결재 수신함 </h2>
<div class="col-sm-2">
		<input class="form-check-input" type="radio" name="docState" value="1" checked> 수신함 /
			<input class="form-check-input" type="radio" name="docState" value="2"> 결재 내역

	
		<select class="form-select" id="docSort" onchange="docRecList(1)">
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

	var doc_sort = 0;
	var emp_num="${sessionScope.loginInfo.emp_num}";
	var doc_category_num = $("input[name='docState']:checked").val();
	var doc_state_num = $("input[name='docState']:checked").val();
	var keyword='';
	var content='';

	var keyword='';
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
	docRecList(1);
});


//결재중, 결재 완료 변경 시
$("input[name='docState']").change(function(){
	doc_category_num = $("input[name='docState']:checked").val();
	if(doc_category_num==1){
		$("#docRecTable").load("views/docRec_Sign.jsp");
	}else{
		$("#docRecTable").load("views/docRec_SignComp.jsp");
	}

	drawPage();
	docRecList(1);			
});

function flags(){
	if(!flag){
		flag = true;
	}
}


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
	console.log(doc_sort);
	//val= 결재 중인지 완료인지
	$.ajax({
		url:'doc/docRecList.ajax',
		type:'GET',
		data:{
			page:page,
			keyword:keyword,
			doc_sort_num:doc_sort_num,
			emp_num:emp_num,
			doc_state_num:doc_state_num
		},
	dataType:'JSON',
	success:function(res){
		createMyDocDisTable(res.list,doc_state_num);
		
		if(res.total > 1){
		$("#pagination").twbsPagination({
			startPage:1, // 시작페이지
			totalPages:res.total, // 총 페이지 수
			visiblePages:5, // 기본으로 보여줄 페이지 수
			onPageClick:function(e, page){ // 클릭했을 때 실행 내용
				myDisDocList(page);
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

function sortSearch(){
	doc_sort = $("#docType option:selected").val();
	console.log(doc_sort);

	drawPage();
	myDisDocList(1);
}

function subSearch(){
	console.log(content);
	content = $("#detailContent").val();

	drawPage();
	if(content==undefined){
		alert('검색어를 입력해주세요!');
	}else{

		myDisDocList(1);
	}
}
function createSelbox(list) {
	var sortList = "<option value=0>전체</option>";
	var index;
	for (var i = 0; i < list.length; i++) {
		sortList += "<option value='"+list[i].doc_sort_num+"'>"
				+ list[i].doc_sort_name + "</option>";
	}
	$("#docType").empty();
	$("#docType").append(sortList);
	
}

function createMyDocDisTable(list,num){
	var docDisContent = "";
	
	
	
	
	for (var i = 0; i < list.length; i++) {
		docDisContent += "<tr onclick='docFormDetail("
			+ list[i].doc_num + ")'><td>" + list[i].doc_num + "</td>";
		docDisContent += "<td>" + list[i].doc_sort_name + "</td>";
		docDisContent += "<td>" + list[i].doc_sub
				+ "</td>";
		docDisContent += "<td>" + list[i].doc_reg + "</td>";
		if(num==2){
		docDisContent += "<td>" + list[i].doc_pro + "</td>";
		docDisContent += "<td>" + list[i].doc_state_name + "</td>";
		}
		docDisContent += "</tr>";
	}
	$("#docDisList").empty();
	$("#docDisList").append(docDisContent);

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