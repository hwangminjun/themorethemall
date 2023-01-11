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
			                    <th scope="col">#</th>
			                    <th scope="col">Name</th>
			                    <th scope="col">Position</th>
			                    <th scope="col">Age</th>
			                    <th scope="col">Start Date</th>
			                  </tr>
			                </thead>
			                <tbody>
			                  <tr>
			                    <th scope="row">1</th>
			                    <td>Brandon Jacob</td>
			                    <td>Designer</td>
			                    <td>28</td>
			                    <td>2016-05-25</td>
			                  </tr>
			                  <tr>
			                    <th scope="row">2</th>
			                    <td>Bridie Kessler</td>
			                    <td>Developer</td>
			                    <td>35</td>
			                    <td>2014-12-05</td>
			                  </tr>
			                  <tr>
			                    <th scope="row">3</th>
			                    <td>Ashleigh Langosh</td>
			                    <td>Finance</td>
			                    <td>45</td>
			                    <td>2011-08-12</td>
			                  </tr>
			                  <tr>
			                    <th scope="row">4</th>
			                    <td>Angus Grady</td>
			                    <td>HR</td>
			                    <td>34</td>
			                    <td>2012-06-11</td>
			                  </tr>
			                  <tr>
			                    <th scope="row">5</th>
			                    <td>Raheem Lehner</td>
			                    <td>Dynamic Division Officer</td>
			                    <td>47</td>
			                    <td>2011-04-19</td>
			                  </tr>
			                </tbody>
			              </table>
			              <!-- End Default Table Example -->
			              <!-- Disabled and active states -->
			              <nav aria-label="...">
			                <ul class="pagination">
			                  <li class="page-item disabled">
			                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
			                  </li>
			                  <li class="page-item"><a class="page-link" href="#">1</a></li>
			                  <li class="page-item active" aria-current="page">
			                    <a class="page-link" href="#">2</a>
			                  </li>
			                  <li class="page-item"><a class="page-link" href="#">3</a></li>
			                  <li class="page-item">
			                    <a class="page-link" href="#">Next</a>
			                  </li>
			                </ul>
			              </nav><!-- End Disabled and active states -->
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
                    	현재 특이사항 기준(%) : <span></span>
                    	<br>
                    	<br>
                    	설정할 특이사항 기준(%) : <input id="new_standard" type="number" value="1" min='1' max='99'>
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
listCall(showPage);

function listCall(page){
	$.ajax({
		type:'get',
		url:'sales/specialList',
		data:{
			'page':page
		},
		dataType:'json',
		success:function(data){
			console.log(data);
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
		url:'sales/curStd',
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
			url:'sales/regStd',
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