<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	button{
	display:inline-block;
	margin:0px 20px;
	}
	.card-body{
	text-align:center;
	}
	
	#workNav{
	text-align:center;
	display:inline-block;
	}
	.container{
	display:inline-block;
	}
</style>
<body>
		<div class="row align-items-top">
		
        <div class="col-lg-3">
          <!-- Default Card -->
          <div class="card">
            <div class="card-body">
              <h5 class="card-title" id="work_result"></h5>
              <button type="button" class="btn btn-primary" onclick="hi()" id='hi'>출근하기</button>
              <button type="button" class="btn btn-outline-primary" onclick="bye()" id='bye' disabled>퇴근하기</button>
            </div>
          </div><!-- End Default Card -->
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">금월 근무 현황</h5>
              <p>근무 일수 : </p>
              <h2 id="work_date"></h2>
              <p>총 근무 시간 : </p>
              <h2 id="work_time"></h2>
            </div>
          </div><!-- End Default Card -->
          
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">금월 근태 현황</h5>
              <p>지각 일수 : </p>
              <h3 id="late">0일</h2>
              <p>결근 일수 : </p>
              <h3 id="absence">0일</h2>
              <p>휴가 일수 : </p>
              <h3 id="vacation">0일</h2>
              <p>출장 일수 : </p>
              <h3 id="travel">0일</h2>
            </div>
          </div><!-- End Default Card -->
          </div>
          
          <div class="col-lg-9">
          	<div class="card">
            <div class="card-body">
              <h5 class="card-title">출근 기록</h5>

              <!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">근무 일자</th>
                    <th scope="col">출근 시간</th>
                    <th scope="col">퇴근 시간</th>
                    <th scope="col">근무 상태</th>
                  </tr>
                </thead>
                <tbody id="list">
                  
                </tbody>
                <tr>
                	<td colspan="4" id="paging" style="text-align:center">
						<div class="container">
							<nav aria-label="Page navigation" id="workNav">
								<ul class = "pagination" id="pagination"></ul>
							</nav>
						</div>
					</td>
                </tr>
              </table>
              <!-- End Default Table Example -->
            </div>
          </div>
          </div>
          </div>
          
</body>
<script>
var showPage = 1;
listCall(showPage); // 근무 기록 리스트
showMonth(); // 이번달 근무 정보
btnCheck(); // 출근or퇴근 버튼

function btnCheck(){
	$.ajax({
		type:'get',
		url:'work/btnCheck.ajax',
		dataType:'json',
		success:function(data){
			console.log(data.row); 
			// 오늘 출근 했으면 1 아니면 0
			if(data.rowHi == 1){
				$('#hi').attr('disabled', true);
				$('#hi').attr('class',"btn btn-outline-primary");
				$('#bye').attr('disabled', false);
				$('#bye').attr('class',"btn btn-primary");
			}
			if(data.rowBye == 1){ // 퇴근 했으면 둘 다 안보임
				$('#work_result').text('오늘 일과 끝!');
				$('#hi').attr('disabled', true);
				$('#hi').attr('class',"btn btn-outline-primary");
				$('#bye').attr('disabled', true);
				$('#bye').attr('class',"btn btn-outline-primary");
			}
		},
		error:function(e){
			console.log(e);
		}
	});
}

function showMonth(){
	$.ajax({
		type:'get',
		url:'work/showMonth.ajax',
		dataType:'json',
		success:function(data){
			console.log(data);
			$('#work_date').text(data.work.work_date+'일');
			if(data.work.total_time == undefined){
				$('#work_time').text('0시간');
			}else{
				$('#work_time').text(data.work.total_time+'시간');
			}
			$('#late').text(data.attend.late+'일');
			$('#absence').text(data.attend.absence+'일');
			$('#vacation').text(data.attend.vacation+'일');
			$('#travel').text(data.attend.travel+'일');
		},
		error:function(e){
			console.log(e);
		}
	});	
}

function listCall(page){
	$.ajax({
		type:'get',
		url:'work/workList.ajax',
		data:{
			'page':page
		},
		dataType:'json',
		success:function(data){
			//console.log(data);
			//console.log(data.list);
			//console.log(data.total);
			drawList(data.list);
			//total = data.total;
			// 플러그인 적용
			$("#pagination").twbsPagination({
				startPage:1, // 시작페이지
				totalPages:data.total, // 총 페이지 수
				visiblePages:5, // 기본으로 보여줄 페이지 수
				onPageClick:function(e, page){ // 클릭했을 때 실행 내용
					//console.log(e);
					listCall(page);
				}
			});
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawList(list){
	var content="";
	for(var i=0;i<list.length;i++){
		content += "<tr>";
		content += "<td>"+list[i].date+"</td>";
		content += "<td>"+list[i].attend+"</td>";
		if(list[i].quit == undefined){
			content += "<td></td>"
		}else{
			content += "<td>"+list[i].quit+"</td>";
		}
		content += "<td>"+list[i].work_type+"</td>";
		content += "</tr>";
	}
	$("#list").empty();
	$("#list").append(content);
}

function hi(){
	//console.log('hi');
	var rtn;
	
	rtn = confirm('출근하시겠습니까?');
	
	if(rtn){
		$.ajax({
			type:'get',
			url:'work/hiCheck.ajax',
			dataType:'json',
			success:function(data){
				console.log(data);
				location.href="/workRecord.go";
			},
			error:function(e){
				console.log(e);
			}
		});
	}else{
		return false;
	}
}

function bye(){
	var rtn;
	
	rtn = confirm('퇴근하시겠습니까?');
	
	if(rtn){
		$.ajax({
			type:'get',
			url:'work/byeCheck.ajax',
			dataType:'json',
			success:function(data){
				console.log(data);
				location.href="/workRecord.go"
			},
			error:function(e){
				console.log(e);
			}
		});
	}else{
		return false;
	}
}
</script>
</html>