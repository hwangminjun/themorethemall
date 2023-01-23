<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>장재혁인데용</title>
</head>
<style></style>
<body>
	<div class="card" style="height: 960px;">
		<div class="card-body">
		<h2> 참조결재 문서함 </h2>
			<div class="col-sm-2">
				<select class="form-select" id="docSort" onchange="sortSearch()">
					<option value=""></option>
				</select>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">문서 번호</th>
						<th scope="col">결재 종류</th>
						<th scope="col">결재 제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">처리 완료일</th>
						<th scope="col">처리 결과 - <select id="docStateNum" onchange="docStateSearch()">
					<option value=0>전체</option>
					<option value=1>결재 진행중</option>
					<option value=2>결재 완료</option>
					<option value=3>반려</option>
				</select></th>
					</tr>
				</thead>
				<tbody id="docExRecList">

				</tbody>
				<tr id="page">
					<td colspan="8" id="paging" style="text-align: center">
						<div class="container">
							<nav aria-label="Page navigation">
								<ul class="pagination" id="pagination"></ul>
							</nav>
						</div>
					</td>
				</tr>
			</table>

			<select name="option" id="option" class="form-select" style="width: 100px; float: left; margin-right: 10px; margin-left: 290px;" >
				<option value="emp_name" selected>작성자</option>
				<option value="doc_sub">제목</option>
			</select> <input type="text" placeholder="검색어 입력" name="keyword"
				id="keyword" class="form-control" style="width: 400px; float: left; margin-right: 10px;">

			<button onclick="flags(); keywordSearch(1)"
				class="btn btn-primary btn-sm" style="height: 37px;">검색</button>



		</div>
	</div>
</body>
<script>
var option="";
var keyword = "";
var doc_sort_num=0;
var doc_state_num = 0;
var emp_num="${sessionScope.loginInfo.emp_num}";
var showPage = 1;
var total = 5;
var flag = true;

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
	docExRec(1);
});

function docExRec(page){
	if(flag){
		drawPage();
	}
	flag = false;
	$.ajax({
		url:'doc/docExRec.ajax',
		type:'GET',
		data:{
			emp_num:emp_num,
			option:option,
			keyword:keyword,
			doc_sort_num:doc_sort_num,
			doc_state_num:doc_state_num,
			page:page
		},
	dataType:'JSON',
	success:function(res){
		createDocExRec(res.list);
		
		if(res.total >= 1){
		$("#pagination").twbsPagination({
			startPage:1, // 시작페이지
			totalPages:res.total, // 총 페이지 수
			visiblePages:5, // 기본으로 보여줄 페이지 수
			onPageClick:function(e, page){ // 클릭했을 때 실행 내용
				docExRec(page);
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


function createDocExRec(list){
	var createDocExRecContent = "";
	
	for (var i = 0; i < list.length; i++) {
		createDocExRecContent += "<tr onclick='docFormDetail("
			+ list[i].doc_num + ")'><td>" + list[i].doc_num + "</td>";
		createDocExRecContent += "<td>" + list[i].doc_sort_name + "</td>";
		createDocExRecContent += "<td>" + list[i].doc_sub
				+ "</td>";
		createDocExRecContent += "<td>" + list[i].emp_name + "</td>";
		createDocExRecContent += "<td>" + list[i].doc_reg + "</td>";
		createDocExRecContent += "<td>" + list[i].doc_pro + "</td>";
		createDocExRecContent += "<td>" + list[i].doc_state_name + "</td>";
		createDocExRecContent += "</tr>";
	}
	$("#docExRecList").empty();
	$("#docExRecList").append(createDocExRecContent);

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


function sortSearch(){
	doc_sort_num = $("#docSort option:selected").val();
	docExRec(1);
}

function keywordSearch(){
	option = $("#sl1 option:selected").val();
	keyword = $("#keyword").val()
	
	docExRec(1);
}

function docStateSearch(){
	doc_state_num = $("#docStateNum option:selected").val();
	docExRec(1);
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

function flags(){
	if(!flag){
		flag = true;
	}
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