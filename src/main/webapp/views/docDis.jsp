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
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">${sessionScope.loginInfo.emp_name}의 결재 발신함</h5>
              <input type="radio" name="docState" value="1" checked> 결재 중 / 
              <input type="radio" name="docState" value="2"> 결재완료
          <select id="docType" onchange="sortSearch()"></select>

              <!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">문서 번호</th>
                    <th scope="col">결재 종류</th>
                    <th scope="col">결재 제목</th>
                    <th scope="col">작성일</th>
                  </tr>
                </thead>
                <tbody id="docDisList">

                </tbody>
              </table>
              <!-- End Default Table Example -->
              
              		 <select id="sl1" name="category" > 
              	<option value="emp_num" selected>사번</option>
              	<option value="emp_name" >이름</option>
              </select>
              
              <input type="text" placeholder="검색어 입력" name="detailContent" id="detailContent" >
         
              <button onclick="flags(); detailSearch(1)" class="btn btn-primary btn-sm">검색</button>
           
              
              
            </div>
          </div>
</body>
<script>

	var emp_num="${sessionScope.loginInfo.emp_num}";
$(function(){
	var doc_state_num = $("input[name='docState']:checked").val();
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
	
	myDisDocList(doc_state_num);
});


//결재중, 결재 완료 변경 시
$("input[name='docState']").change(function(){
	var doc_state_num = $("input[name='docState']:checked").val();
	myDisDocList(doc_state_num);			
});

function myDisDocList(doc_state_num){
	console.log(doc_state_num);
	//val= 결재 중인지 완료인지
	$.ajax({
		url:'doc/myDisDocList.ajax',
		type:'GET',
		data:{
			emp_num:emp_num,
			doc_state_num:doc_state_num
		},
	dataType:'JSON',
	success:function(res){
		createMyDocDisTable(res.list);
	},
	error:function(e){
		alert('error');
	}
	});
	
}

function createSelbox(list) {
	var sortList = "<option value='' selected disabled style='display:none;'>선택</option>";
	var index;
	for (var i = 0; i < list.length; i++) {
		sortList += "<option value='"+list[i].doc_sort_num+"'>"
				+ list[i].doc_sort_name + "</option>";
	}
	$("#docType").empty();
	$("#docType").append(sortList);
	
}

function createMyDocDisTable(list){
	var docDisContent = "";
	for (var i = 0; i < list.length; i++) {
		docDisContent += "<tr><td>" + list[i].doc_num + "</td>";
		docDisContent += "<td>" + list[i].doc_sort_name + "</td>";
		docDisContent += "<td><a onclick='docFormDetail("
				+ list[i].form_num + ")'>" + list[i].doc_sub
				+ "</a></td>";
		docDisContent += "<td>" + list[i].doc_reg + "</td></tr>";
	}
	$("#docDisList").empty();
	$("#docDisList").append(docDisContent);

}

</script>
</html>