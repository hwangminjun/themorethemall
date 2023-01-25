<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0px;
	padding: 3px;
}

.docLineDiv .docLinetd {
	border: 2.5px solid #ccc;
	border-collapse: collapse;
	text-align: center;
	padding: 7.5px;
}
.docLineImg {
	width: 60px;
	height: 40px;
}
.linePadding {
	padding: 8px;
}
</style>
</head>
<body>


	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">반려 메세지 입력</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- Modal body -->
				<div class="modal-body" style="text-align: center;">
					<div class="row">
						<div class="col-sm-12">
							<label>반려 사유를 입력해주세요.</label>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12">
							<textarea name="causeContent" id="causeContent" cols="48"
								rows="4"></textarea>
						</div>
					</div>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button class="btn btn-danger" data-bs-dismiss="modal">취소</button>

					<button class="btn btn-primary" data-bs-dismiss="modal"
						id="doCauseInsert">입력</button>

				</div>

			</div>
		</div>
	</div>















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
						<label for="inputText" class="col-form-label"
							style="font-size: 36px">제
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목 : </label>
					</div>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="docSub"
							readonly="readonly" style="font-size: 36px">
					</div>
					<div class="col-sm-4">
						<table id="docDetailLine" class="docLineDiv" style="float: right;">
						</table>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-8"></div>
					<div class="col-sm-4">
						<br class="linePadding">
						<h4 id="writer" style="float: right;"></h4>
					</div>
				</div>
				<!-- 결재 작성 body -->
				<div id="docBody"></div>
				<!-- 결재 작성 에디터 -->
				<div id="editor" style="height: 800px"></div>
				<button class="btn btn-primary" id="goBack">뒤로가기</button>

				<div id="docFooter_writer">
					<button class="btn btn-primary" id="recovery" style="display: none">회수하기</button>
				</div>

				<div id="docFooter_session" style="float: right">
					<button class="btn btn-primary" id="doSign">결재하기</button>
					<button class="btn btn-primary" id="doNotSign">반려하기</button>
				</div>

			</div>
		</div>
	</div>
</body>
<script>

var contentEditor = new RichTextEditor("#editor");
var singImg="";
var doc_num="";
var signImg = "${sessionScope.signImg}"
var returnEmpNum = '';
var bodyContent='';
var writer_emp_num='';
var session_emp_num='';
var doc_state_num=0;
var doc_sort='${doc.docDetails.doc_sort_num}';
var doc_ref;//참조자인지 결재자인지(참조자 = true, 결재자 = false);
var doc_chk;//해당 문서 결재 여부(했으면 true, 안했으면 false);
var doc_sign;//결재 가능한 상태인지 여부(가능하면 true, 불가능하면 false);
var lineSigns = [];

$(function(){
	
	$.ajax({
		url:"doc/docDetail.ajax",
		type:"get",
		success:function(res){
			if(res.doc.returnEmp!=null){
				returnEmpNum=res.doc.returnEmp;
				console.log(returnEmpNum);
			}
			writer_emp_num=res.doc.docDetails.emp_num;
			doc_num=res.doc.docDetails.doc_num;
			doc_state_num = res.doc.docDetails.doc_state_num;
			lineSigns = res.doc.signImgs;
			console.log("상태 : "+ doc_state_num);
			console.log("상태 : "+ res.doc.docDetails.doc_state_num);
			console.log(doc_num);
			session_emp_num="${sessionScope.loginInfo.emp_num}";
			console.log(res);
			insDocDetail(res.doc.docDetails, res.doc.docBody);
			drawDocLines(res.doc.docLines, res.doc.docDetails, lineSigns);
			drawDocExLines(res.doc.docExLines);
			
			
			if(doc_state_num!=1){//결재 진행중인 문서가 아니면 뒤로가기 버튼 제외 모두 비활성화
				$("#docFooter_writer").css('display','none');
				$("#docFooter_session").css('display','none');
			}
			
			else if(doc_state_num==1 && writer_emp_num==session_emp_num){//결재 진행중인 문서 + 작성자=사용자(회수)
					console.log(doc_num+"~_~");
				$("#docFooter_writer").css('display','inline');
				$("#docFooter_session").css('display','none');
			}else if(doc_state_num==1 && writer_emp_num!=session_emp_num){//결재 진행중인 문서 + 작성자!=사용자(결재/반려)
					console.log(doc_num+"^_^");
				
				
				$("#docFooter_writer").css('display','none');
				$("#docFooter_session").css('display','inline');
				$.ajax({
					url:"doc/getSignState.ajax",
					type:"GET",
					data:{
						emp_num:session_emp_num,
						doc_num:doc_num
					},
					dataType:"JSON",
					success:function(res){
						doc_ref=res.signState.doc_line_ref;
						doc_chk=res.signState.doc_line_chk;
						doc_sign=res.signState.doc_sign;
						console.log(doc_ref+"/"+doc_chk+"/"+doc_sign);
						
						if(doc_ref||doc_chk){//결재한 문서이거나 참조자로 조회 시 결제하기 및 상세보기도 숨김처리
							$("#docFooter_session").css('display','none');//참조했거나 이미 결재했으면 해당 버튼도 숨김처리
						}
					},
					error:function(res){
						alert('error');
					}
				});
			}
			
			
		},
		error:function(e){
			alert('error');
		}
	});
			console.log(doc_num);

	
	
});

function insDocDetail(detail, body){
	$("#doc_num").val(detail.doc_num);
	$("#docSub").val(detail.doc_sub);
	$("#writer").text("기안자 : "+detail.emp_name);
		console.log(detail.doc_cause);
	if(detail.doc_state_num==3){
	var content = detail.doc_content+"</br></br></hr><h1>반려사유 : "+detail.doc_cause+"</h1>";
		console.log(content);
	
		contentEditor.setHTMLCode(content);
		
	}else{
		contentEditor.setHTMLCode(detail.doc_content);
		
	}
	contentEditor.setReadOnly();
	if(detail.doc_sort_num==1){
		$("#docType").text("이벤트 결재");
		$("#docBody").load("views/docDetBody_Event.jsp");
		setTimeout(function(){
			//안하면 페이지 로드전에 함수를 실행해버림.
		drawEventBody(detail,body);
			   }, 100)
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
			   }, 100);

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
function getSignImg(sign_emp_num){
	$.ajax({
		url:'doc/getSignImg.ajax',
		type:'GET',
		data:{
			emp_num:sign_emp_num
		},
		dataType:'JSON',
		success:function(res){
			console.log(res.signImg)
			return res.signImg;
		},
		error:function(e){
			
		}
	});		
}
function drawDocLines(doclines, detail, lineSigns) {
	var tableA = "<tr><th class='docLinetd' rowspan='2'>서명</th>";
	var tableB = "<tr>";
	var recoveryAvail=0;
	
	$("#docDetailLine").empty();
		
	for (var i = 0; i < doclines.length; i++) {
		tableA += "<td class='docLinetd'>" + doclines[i].emp_name + "</td>";
		if(doclines[i].doc_line_chk){
			if(returnEmpNum!=doclines[i].emp_num){
				tableB += "<td class='docLinetd'><img class='docLineImg' src='/photo/"+lineSigns[i]+"' alt=\"sign\"/></td>";
			}else{
				tableB += "<td class='docLinetd'><img class='docLineImg' src='/photo/signReturn.png' alt=\"sign\"/></td>";
			}
			recoveryAvail++;
		}else{
			tableB += "<td class='docLinetd'><img class='docLineImg' src='/photo/emptySign.png' alt=\"sign\"/></td>"
		}
			console.log(doc_state_num);
	}
	console.log(recoveryAvail);
	tableA += "</tr>";
	tableB += "</tr>";
	tableA = tableA + tableB;
	console.log(tableA);

	$("#docDetailLine").append(tableA);
	if(recoveryAvail==0 && detail.doc_state_num==1){
		$("#recovery").css('display','inline');
	}
	
}

function drawDocExLines(docExlines) {
	if(docExlines.length==0){
		$("#docDetailExLine").empty();
		
	}else{
		
	var extable = "<tr><th class='docLinetd' colspan='"+(docExlines.length+1)+"'>참조자</th></tr><tr>";
	$("#docDetailExLine").empty();
	for (var i = 0; i < docExlines.length; i++) {
		extable += "<td class='docLinetd'>" + docExlines[i].emp_name + "</td>";
	}
		extable +="</tr>";
	console.log(extable);

	$("#docDetailExLine").empty();
	$("#docDetailExLine").append(extable);
	}
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



$("#doNotSign").on('click', function(){
//반려하기
	$('#myModal').modal('show');
});

$("#doSign").on('click', function(){
//결재


var rtn = confirm('결재하시겠습니까??');
if(rtn){
if(doc_chk){
	console.log('이미 결재한 문서입니다.');
}else if(signImg==''){
	alert('서명 이미지 등록 후 결재 가능합니다.');
}else{
	$.ajax({
		url:"doc/doSign.ajax",
		type:"POST",
		data:{
			doc_num:doc_num,
			emp_num:session_emp_num
		},
		dataType:"JSON",
		success:function(res){
			location.href="docRec.go";
		},
		error:function(e){
			alert('error');
		}
	});
}
}
});

$("#doCauseInsert").on('click', function(){
	var rtn = confirm('반려하시겠습니까??');
	if(rtn){
		
	var cause = $("#causeContent").val();
	console.log(cause);
	$.ajax({
		url:"doc/docReturn.ajax",
		type:"POST",
		data:{
			doc_num:doc_num,
			emp_num:writer_emp_num,
			sender:session_emp_num,
			cause:cause
		},
		dataType:"JSON",
		success:function(result){
			location.href="docRec.go";
		},
		error:function(e){
			alert('error')
		}
	});
	
	}
});

$("#goBack").on('click',function(){
	window.history.back();
});
</script>
</html>