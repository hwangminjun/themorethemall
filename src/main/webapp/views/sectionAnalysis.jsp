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
              <h5 class="card-title">Bordered Tabs Justified</h5>

              <!-- Bordered Tabs Justified -->
              <ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100 active" id="section_tab" data-bs-toggle="tab" data-bs-target="#section_content" type="button" role="tab" aria-controls="section" aria-selected="true">구역별 매출</button>
                </li>
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100" id="store_tab" data-bs-toggle="tab" data-bs-target="#store_content" type="button" role="tab" aria-controls="store" aria-selected="false">점포별 매출</button>
                </li>
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100" id="compare-tab" data-bs-toggle="tab" data-bs-target="#compare_content" type="button" role="tab" aria-controls="compare" aria-selected="false">매출 비교</button>
                </li>
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100" id="special-tab" data-bs-toggle="tab" data-bs-target="#special_content" type="button" role="tab" aria-controls="special" aria-selected="false">특이사항 관리</button>
                </li>
              </ul>
              <div class="tab-content pt-2" id="borderedTabJustifiedContent">
                <div class="tab-pane fade show active" id="section_content" role="tabpanel" aria-labelledby="section_tab">
					<select id='floor'>
                      <option selected>층</option>
                      <option value="1">1층</option>
                      <option value="2">2층</option>
                      <option value="3">3층</option>
                      <option value="4">4층</option>
                      <option value="5">5층</option>
                      <option value="6">6층</option>
                      <option value="7">7층</option>
                    </select>
					<select id='section'>
                      <option selected>구역</option>
                    </select>
					<input type="date" id="section_start_date"> ~ <input type="date" id="section_end_date">
					<button type="button" class="btn btn-primary" id='sec_btn'>검색</button>
                </div>
                <div class="tab-pane fade" id="store_content" role="tabpanel" aria-labelledby="store_tab">
					탭2
                </div>
                <div class="tab-pane fade" id="compare_content" role="tabpanel" aria-labelledby="compare-tab">
					탭3
                </div>
                <div class="tab-pane fade" id="special_content" role="tabpanel" aria-labelledby="special-tab">
					탭4
                </div>
              </div><!-- End Bordered Tabs Justified -->

            </div>
          </div>
</body>
<script>

var now_utc = Date.now() // 지금 날짜를 밀리초로
//getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
//new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("section_start_date").setAttribute("max", today);
document.getElementById("section_end_date").setAttribute("max", today);

$('#floor').change(function(){
	var val = $(this).val();
	//alert(val);
	$.ajax({
		type:'get',
		url:'sales/sec',
		data:{
			val:val
			},
		dataType:'json',
		success:function(data){
			//console.log(data.sec.length);
			drawSec(data.sec);
		},
		error:function(e){
			console.log(e);
		}
	});
});

function drawSec(list){
	var content = "";
	$('#section').empty();
	for(var i=0; i<list.length; i++){
		//console.log(list[i].section_num);
		content += "<option value='"+list[i].section_num+"'>"+list[i].section_num+"</option>";
	}
	$('#section').append(content);
}

$('#sec_btn').click(function(){
	console.log($('#section').val());
	console.log($('#section_start_date').val());
	console.log($('#section_end_date').val());
});
</script>
</html>