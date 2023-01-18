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
		<select class="form-select" id="docSort" onchange="docRecList(1)">
		<option value=""></option>
		</select>
</div>
		
		</div>
		<table class="table table-hover">
		<thead>
			<tr>
				<td>문서 번호</td>
				<td>결재 종류</td>
				<td>발신자</td>
				<td>결재 제목</td>
				<td>작성일</td>
			</tr>
		</thead>
		
		<tbody id="signDocList"></tbody>
		
		<tfoot>
		
		<tr id="page">
						<td colspan="8" id="paging" style="text-align: center">
							<div class="container">
								<nav aria-label="Page navigation">
									<ul class="pagination" id="pagination"></ul>
								</nav>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="6"> 제목 - <input type="text" id="keyword" />
							<button class="btn btn-primary" onclick="docRecList(1)">검색</button></td>
					</tr>
					
		</tfoot>
		</table>
		
		</div>
	</div>
</body>
<script>
var showPage = 1;
var total = 5;
var flag = true;

var keyword='';
var doc_sort_num='';
var emp_num = "${sessionScope.loginInfo.emp_num}";


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
	
	docRecList(1);
});





function flags(){
	if(!flag){
		flag = true;
	}
}

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
	flags();
	keyword = $("#keyword").val();
	$("#keyword").val('');
	doc_sort_num=$("#docSort option:selected").val();
	$("#docSort option:selected").val('');
	
	console.log(keyword+"/"+doc_sort_num);
	$.ajax({
		url:"doc/docRecList.ajax",
		type:"GET",
		data:{
			'page':page,
			'keyword':keyword,
			'doc_sort_num':doc_sort_num,
			'emp_num':emp_num
		},
	dataType:"JSON",
	success:function(result){
		createRecTable(result.list);
		if(result.total>1){
			
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
		docDisContent += "</tr>";
	}
	$("#signDocList").empty();
	$("#signDocList").append(docDisContent);

}

function docRecFormDetail(doc_num){
	console.log("수신 상세보기");
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