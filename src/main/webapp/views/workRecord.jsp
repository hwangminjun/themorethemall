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
	
	nav{
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
              <h5 class="card-title">출/퇴근 기록</h5>
              <button type="button" class="btn btn-primary" id="">출근하기</button>
              <button type="button" class="btn btn-outline-primary" disabled>퇴근하기</button>
            </div>
          </div><!-- End Default Card -->
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">금월 근무 현황</h5>
              <p>g</p>
              <p>g</p>
              <p>g</p>
              <p>g</p>
              <p>g</p>
            </div>
          </div><!-- End Default Card -->
          
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">금월 근태 현황</h5>
              <p>g</p>
              <p>g</p>
              <p>g</p>
              <p>g</p>
              <p>g</p>
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
							<nav aria-label="Page navigation">
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
listCall(showPage);

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
		content += "<td>"+list[i].quit+"</td>";
		content += "<td>"+list[i].work_type+"</td>";
		content += "</tr>";
	}
	$("#list").empty();
	$("#list").append(content);
}
</script>
</html>