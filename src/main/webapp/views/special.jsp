<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
	#specialNav{
	text-align:center;
	display:inline-block;
	}
	.container{
	display:inline-block;
	}
	
	#detailContent th{
		text-align:center;
		vertical-align:middle;
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
			              	<hr>
			              	<br>
			              	<input type="text" placeholder="검색어 입력" name="detailContent" id="detailContent" class="form-control" style="width: 400px; float: left; margin-right: 10px;">
		              			<button onclick="flags(); detailSearch(1)" class="btn btn-primary btn-sm" style="height: 37px;">검색</button>
							<br>
							<button type="button" 
							class="btn btn-primary" 
							style="float:right;"
							data-bs-toggle="modal" 
							data-bs-target="#regSpecial"
							onclick="getCurStd()">특이사항 등록</button>
							<br>
			              <!-- Default Table -->
			              <table class="table">
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
			                <tr id="page">
								<td colspan="4" id="paging" style="text-align:center">
									<div class="container">
										<nav aria-label="Page navigation" id="specialNav">
											<ul class = "pagination" id="pagination"></ul>
										</nav>
									</div>
								</td>
							</tr>
							<tr>
								
							</tr>
			              </table>
			              <div>
			              	
			              </div>
			              <!-- End Default Table Example -->
			            </div>
			          </div>
                </div>
              </div><!-- End Bordered Tabs Justified -->

				<div class="modal fade" id="regSpecial" tabindex="-1">
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
                      <button type="button" class="btn btn-primary" onclick="regStd()">저장</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Vertically centered Modal-->
              
              <div class="modal fade" id="specialDetail" tabindex="-1">
                <div class="modal-dialog modal-dialog-scrollable">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">상세보기</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <div class="card">
			            <div class="card-body">
			              <h5 class="card-title">특이사항 정보</h5>
			              <!-- Bordered Table -->
			              <table class="table table-bordered">
			                <thead>
			                  <tr>
			                    <th scope="col"></th>
			                    <th scope="col">내용</th>
			                  </tr>
			                </thead>
			                <tbody id="detailContent">
			                  <tr id="write_date_tr">
			                    <th scope="row">날짜</th>
			                    <td></td>
			                  </tr>
			                  <tr id="store_name_tr">
			                    <th scope="row">점포명</th>
			                    <td></td>
			                  </tr>
			                  <tr id="standard_tr">
			                    <th scope="row">특이사항 기준</th>
			                    <td></td>
			                  </tr>
			                  <tr id="sale_inc_tr">
			                    <th scope="row">매출 증감률</th>
			                    <td></td>
			                  </tr>
			                  <tr id="event_tr">
			                    <th scope="row">이벤트 내역</th>
			                    <td>
			                    	<ul class="list-group list-group-flush" id="ul">
						               
						             </ul>
			                    </td>
			                  </tr>
			                </tbody>
			              </table>
			              <!-- End Bordered Table -->
			              </div>
              			</div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Modal Dialog Scrollable-->

            </div>
          </div>
</body>
<script>
var showPage = 1;
var total = 5;
listCall(showPage);

var flag = true;

function flags(){
	if(!flag){
		flag = true;
	}
}

function detailSearch(page){
	if(flag){
		drawPage();
	}
		$.ajax({
			type:'get',
			url:'sales/detailSearch.ajax',
			data:{
				'page':page,
				'content':$('#detailContent').val()
			},
			dataType:"JSON",
			success:function(data){
				console.log(data.list);
				drawList(data.list);
			if(data.total >= 1){
				$("#pagination").twbsPagination({
					startPage:1,
					totalPages:data.total,
					visiblePages:5,
					onPageClick:function(e, page){
						flag = false;
						detailSearch(page);
						
					}
				});
			}
				
			},
			error:function(e){
				console.log(e);
			}
		});
	
}

function drawPage(){
	var paging = "";
	$("#page").empty();
	paging += '<td colspan="4" id="paging" style="text-align:center">';
	paging += '<div class="container">';
	paging += '<nav aria-label="Page navigation" id="specialNav">';
	paging += '<ul class = "pagination" id="pagination"></ul>';
	paging += "</nav></div></td>";
	$("#page").append(paging);
}

function listCall(page){
	$.ajax({
		type:'get',
		url:'sales/specialList.ajax',
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
			if(data.total >= 1){
				$("#pagination").twbsPagination({
					startPage:1, // 시작페이지
					totalPages:data.total, // 총 페이지 수
					visiblePages:5, // 기본으로 보여줄 페이지 수
					onPageClick:function(e, page){ // 클릭했을 때 실행 내용
						//console.log(e);
						listCall(page);
					}
				});
			}
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawList(list){
	var content="";
	for(var i=0;i<list.length;i++){
		content += "<tr onclick='getSpecialDetail("+list[i].special_pk+")' data-bs-toggle='modal' data-bs-target='#specialDetail'>";
		content += "<td>"+list[i].store_name+"</td>";
		content += "<td>"+list[i].standard+"%</td>";
		content += "<td>"+list[i].sale_inc+"%</td>";
		content += "<td>"+list[i].write_date+"</td>";
		content += "</tr>";
	}
	$("#list").empty();
	$("#list").append(content);
}

function getSpecialDetail(special_pk){
	//console.log(special_pk);
	var content = "";
	$.ajax({
		type:'get',
		url:'sales/specialDetail.ajax',
		data:{
			'special_pk':special_pk
		},
		dataType:'json',
		success:function(data){
			//console.log(data.list);
			
			content = data.dto.write_date;
			$('#write_date_tr').children('td').text(content);
			
			content = data.dto.store_name;
			$('#store_name_tr').children('td').text(content).text(content);
			
			content = data.dto.standard+'%';
			$('#standard_tr').children('td').text(content).text(content);
			
			content = data.dto.sale_inc+'%';
			$('#sale_inc_tr').children('td').text(content).text(content);
			
			content = '';
			
			if(data.list.length == 0){
				$('#ul').empty();
				content = '<li class="list-group-item">이벤트 내역이 없습니다.</li>';
				$('#ul').append(content);
			}else{
				$('#ul').empty();
				for(var i=0;i<data.list.length;i++){
					content += '<li class="list-group-item">';
					content += '<p>'+data.list[i].doc_sub+'<p>';
					content += '<p>'+data.list[i].event_start+' ~ '+data.list[i].event_finish+'</p>';
					content += '</li>';
				}
				$('#ul').append(content);
			}
			
		},
		error:function(e){
			console.log(e);
		}
	});
	
}

function getCurStd(){
	
	$('#new_standard').val('1');
	
	$.ajax({
		type:'get',
		url:'sales/curStd.ajax',
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
		var rtn = confirm("특이사항 기준을 저장하시겠습니까?");
		
		if(rtn){
			$.ajax({
				type:'get',
				url:'sales/regStd.ajax',
				dataType:'json',
				data:{
					'val':$('#new_standard').val()
				},
				success:function(data){
					console.log(data);
					$("#regSpecial").modal("hide");
				},
				error:function(e){
					console.log(e);
				}
			});
		}else{
			return false;
		}
	}
}

</script>
</html>