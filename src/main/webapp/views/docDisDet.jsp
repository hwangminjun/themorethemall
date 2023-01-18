<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.docLineDiv th, td {
	border: 1.21px solid black;
	border-collapse: collapse;
	text-align: center;
	padding: 4.84px;
}

* {
	margin: 0px;
	padding: 3px;
}
</style>
</head>
<body>
	<div class="card">
		<div class="card-body">
			<div class="container">
				<div class="row" style="padding: 10px;">

					<div class="col-sm-3">
						<p>
							결재 양식 : <label id="docType"></label>
						</p>
						<input type="text" id="doc_num" style="display: none">
					</div>
					<div class="col-sm-3">
						<select id="docType" class="form-select" style="display: none;"></select>
					</div>
					<div class="col-sm-2"></div>
					<div class="col-sm-4">
						<table id="docDetailExLine" class="docLineDiv"
							style="float: right;">
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">
						<h2 style="font-size: 36px;">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목
							:</h2>
					</div>
					<div class="col-sm-6">
						<h2 id="docSub"></h2>
					</div>

					<div class="col-sm-4">

						<table id="docDetailLine" class="docLineDiv" style="float: right;">
							<tr>
								<th rowspan="2">서명</th>
								<th>${doc.docLines[0].emp_num}</th>
								<th>${doc.docLines[1].emp_num}</th>
								<th>${doc.docLines[2].emp_num}</th>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>

				</div>
				<!-- 결재 작성 body -->
				<div id="docBody"></div>
				<!-- 결재 작성 에디터 -->
				<div id="editor" style="height: 800px"></div>

				<div id="docFooter">
					<button class="btn btn-primary" id="goBack">뒤로가기</button>
					<button class="btn btn-primary" id="recovery" style="display: none">회수하기</button>
				</div>

			</div>
		</div>
	</div>
</body>
<script>

var contentEditor = new RichTextEditor("#editor");
var doc_num="${res.doc.docDetails.doc_num}";
var bodyContent='';

var doc_sort='${doc.docDetails.doc_sort_num}';
console.log(doc_sort);
console.log(doc);
console.log(doc_num);

$(function(){
	
	$.ajax({
		url:"doc/docDetail.ajax",
		type:"get",
		success:function(res){
			console.log(res);
			insDocDetail(res.doc.docDetails, res.doc.docBody);
			drawDocLines(res.doc.docLines, res.doc.docDetails);
			drawDocExLines(res.doc.docExLines);
			
			doc_num=res.doc.docDetails.doc_num;
		},
		error:function(e){
			alert('error');
		}
	});
})

function insDocDetail(detail, body){
	console.log(detail);
	$("#doc_num").val(detail.doc_num);
	$("#docSub").text(detail.doc_sub);
	contentEditor.setHTMLCode(detail.doc_content);
	if(detail.doc_sort_num==1){
		$("#docType").text("이벤트 결재");
		$("#docBody").load("views/docDetBody_Event.jsp");
		setTimeout(function(){
			//안하면 페이지 로드전에 함수를 실행해버림.
		drawEventBody(detail,body);
			   }, 50)
	}else if(detail.doc_sort_num==2){
		$("#docType").text("일반 결재");
		$("#docBody").load("views/docBody_norm.jsp");
	}else if(detail.doc_sort_num==3){
		console.log("매출결재 상세보기");
		$("#docType").text("매출 결재");
		$("#docBody").load("views/docDetBody_sales.jsp");
		setTimeout(function(){
			//안하면 페이지 로드전에 함수를 실행해버림.
		drawSalesBody(detail,body);
			   }, 30);

	}else{
		//dsds
		if(detail.doc_sort_num==4){
			$("#docType").text("휴가 결재");
		}else if(detail.doc_sort_num==5){
			$("#docType").text("반차 결재");
		}else{
			$("#docType").text("출장 결재");
		}
			
		
		$("#docBody").load("views/docDetBody_Ess.jsp");
		setTimeout(function(){
				//안하면 페이지 로드전에 함수를 실행해버림.
		drawEssBody(detail,body);
			   }, 30);
	}
}

function drawDocLines(doclines, detail) {
	var tableA = "<tr><th rowspan='2'>서명</th>";
	var tableB = "<tr>";
	var recoveryAvail=0;
	
	$("#docDetailLine").empty();
	for (var i = 0; i < doclines.length; i++) {
		tableA += "<td>" + doclines[i].emp_name + "</td>";
		if(doclines[i].doc_line_chk){
					
		tableB += "<td>서명함</td>";
		}else{
			tableB += "<td>서명안함</td>"
			recoveryAvail++;
		}
	}
	console.log(recoveryAvail);
	tableA += "</tr>";
	tableB += "</tr>";
	tableA = tableA + tableB;
	console.log(tableA);

	$("#docDetailLine").append(tableA);
	if(recoveryAvail==3 && detail.doc_state_num==1){
		$("#recovery").css('display','inline');
	}
	
}

function drawDocExLines(docExlines) {
	var extable = "<tr><th colspan='"+(docExlines.length+1)+"'>참조자</th></tr><tr>";
	$("#docDetailExLine").empty();
	for (var i = 0; i < docExlines.length; i++) {
		extable += "<td>" + docExlines[i].emp_name + "</td>";
	}
		extable +="</tr>";
	console.log(extable);

	$("#docDetailExLine").append(extable);
}

function drawEventBody(detail, body){
	console.log('이벤트 결재 상세보기');
	console.log(body);
	console.log(detail);
	bodyContent="<tr><td>"+body.event_start+"</td><td>"+body.event_finish+"</td><td>"+body.floor+"</td><td>"+body.store_name+"</td></tr>";
	$("#eventBody").empty();
	$("#eventBody").append(bodyContent);
	console.log(bodyContent);
	bodtContent='';
}

function drawSalesBody(detail, body){
	
	console.log("매출결재 상세보기2");
	console.log(body[0].doc_date);
	$("#salesDetDate").text("결재일 : " + body[0].doc_date);
	console.log("매출결재 상세보기3");
	for(let i=0; i<body.length; i++){
	console.log("매출결재 상세보기"+(i+4));
	bodyContent+="<tr><td>"+body[i].section_num+"</td>";
	bodyContent+="<td>"+body[i].minor_category_name+"</td>";
	bodyContent+="<td>"+body[i].store_name+"</td>";
	bodyContent+="<td>"+body[i].sales_money+"만 원</td></tr>";
	}
	$("#salesDetList").empty();
	$("#salesDetList").append(bodyContent);
	bodyContent='';
}
function drawEssBody(detail, body){
	console.log('휴반출 결재 상세보기');
	bodyContent="<tr><td>"+body.date_type+"</td><td>"+body.start_time+"</td><td>"+body.end_time+"</td></tr>";
	$("#essBody").empty();
	$("#essBody").append(bodyContent);
	console.log(bodyContent);
	bodyContent='';
}

$("#recovery").on('click', function(){
	
	console.log('회수하기');
	console.log(doc_num);
	confirm('해당 문서를 회수합니다.');
	$.ajax({
		url:"doc/recoverDoc.ajax",
		type:"GET",
		data:{
			doc_num:doc_num
		},
		dateType:"JSON",
		success:function(res){
			location.href="docDis.go";
		},
		error:function(e){
			console.log('error');
		}
	});
})
</script>
</html>