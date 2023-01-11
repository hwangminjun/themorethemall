<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
	nav{
	text-align:center;
	display:inline-block;
	}
	.container{
	display:inline-block;
	}
</style>
<body>
	<div class="card">
            <div class="card-body">

              <!-- Bordered Tabs Justified -->
              <ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist" style="margin-top:25px">
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100" 
                  id="section_tab" 
                  data-bs-toggle="tab" 
                  data-bs-target="#section_content" 
                  type="button" role="tab" 
                  aria-controls="section" 
                  aria-selected="true"
                  onclick="location.href='sectionAnalysis.go'">구역별 매출</button>
                </li>
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100" 
                  id="store_tab" 
                  data-bs-toggle="tab" 
                  data-bs-target="#store_content" 
                  type="button" role="tab" 
                  aria-controls="store" 
                  aria-selected="false"
                  onclick="location.href='storeAnalysis.go'">점포별 매출</button>
                </li>
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100" 
                  id="compare-tab" 
                  data-bs-toggle="tab" 
                  data-bs-target="#compare_content" 
                  type="button" role="tab" 
                  aria-controls="compare" 
                  aria-selected="false"
                  onclick="location.href='compareAnalysis.go'">매출 비교</button>
                </li>
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100 active" 
                  id="special-tab" 
                  data-bs-toggle="tab" 
                  data-bs-target="#special_content" 
                  type="button" role="tab" 
                  aria-controls="special" 
                  aria-selected="false">특이사항 관리</button>
                </li>
              </ul>
              <div class="tab-content pt-2" id="borderedTabJustifiedContent">
                <div class="tab-pane fade show active" id="special_content" role="tabpanel" aria-labelledby="special-tab">
					<div class="card">
			            <div class="card-body">
			              	<h3 style="margin-top:25px">특이사항 로그</h3>
							<button type="button" 
							class="btn btn-primary" 
							style="float:right;"
							data-bs-toggle="modal" 
							data-bs-target="#verticalycentered"
							onclick="getCurStd()">특이사항 등록</button>
			              <!-- Default Table -->
			              <table class="table" style="margin-top:80px;">
			                <thead>
			                  <tr>
			                    <th scope="col">점포명</th>
			                    <th scope="col">특이사항 기준</th>
			                    <th scope="col">매출 증감률</th>
			                    <th scope="col">날짜</th>
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
              </div><!-- End Bordered Tabs Justified -->

				<div class="modal fade" id="verticalycentered" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">특이사항 기준 등록</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    	현재 특이사항 기준(%) : <span></span>%
                    	<br>
                    	<br>
                    	설정할 특이사항 기준(%) : <input id="new_standard" type="number" value="1" min='1' max='99'>%
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button type="button" class="btn btn-primary" onclick="regStd()" data-bs-dismiss="modal">저장</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Vertically centered Modal-->

            </div>
          </div>
</body>
<script>
var showPage = 1;
var total = 5;
listCall(showPage);

/* $("#pagination").twbsPagination({
	startPage:1, // 시작페이지
	totalPages:total, // 총 페이지 수
	visiblePages:5, // 기본으로 보여줄 페이지 수
	onPageClick:function(e, page){ // 클릭했을 때 실행 내용
		//console.log(e);
		listCall(page);
	}
}); */

function listCall(page){
	$.ajax({
		type:'get',
		url:'sales/specialList.do',
		data:{
			'page':page
		},
		dataType:'json',
		success:function(data){
			//console.log(data.list);
			//console.log(data.total);
			drawList(data.list);
			total = data.total;
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
		content += "<td>"+list[i].store_name+"</td>";
		content += "<td>"+list[i].standard+"%</td>";
		content += "<td>"+list[i].sale_inc+"%</td>";
		content += "<td>"+list[i].write_date+"</td>";
		content += "</tr>";
	}
	$("#list").empty();
	$("#list").append(content);
}

function getCurStd(){
	
	$('#new_standard').val('1');
	
	$.ajax({
		type:'get',
		url:'sales/curStd.do',
		dataType:'json',
		success:function(data){
			//console.log(data.curStd);
			$('.modal-body span').text(data.curStd);
		},
		error:function(e){
			console.log(e);
		}
	});
}

// .modal('hide');

function regStd() {
	if($('#new_standard').val() < 1 || $('#new_standard').val() > 99){
		//console.log($('#new_standard').val());
		alert('1부터 99사이의 숫자를 입력하세요.');
	}else{
		$.ajax({
			type:'get',
			url:'sales/regStd.do',
			dataType:'json',
			data:{
				'val':$('#new_standard').val()
			},
			success:function(data){
				console.log(data);
			},
			error:function(e){
				console.log(e);
			}
		});
	}
}

</script>
</html>