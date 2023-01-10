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
              <h5 class="card-title">매출 분석</h5>

              <!-- Bordered Tabs Justified -->
              <ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
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
                  <button class="nav-link w-100 active" 
                  id="compare-tab" 
                  data-bs-toggle="tab" 
                  data-bs-target="#compare_content" 
                  type="button" role="tab" 
                  aria-controls="compare" 
                  aria-selected="false">매출 비교</button>
                </li>
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100" 
                  id="special-tab" 
                  data-bs-toggle="tab" 
                  data-bs-target="#special_content" 
                  type="button" role="tab" 
                  aria-controls="special" 
                  aria-selected="false"
                  onclick="location.href='special.go'">특이사항 관리</button>
                </li>
              </ul>
              <div class="tab-content pt-2" id="borderedTabJustifiedContent">
                <div class="tab-pane fade" id="section_content" role="tabpanel" aria-labelledby="section_tab">
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
					<select id='time'>
                      <option value="date">일 단위</option>
                      <option value="week">주 단위</option>
                      <option value="month">월 단위</option>
                      <option value="year">년 단위</option>
                    </select>
					<button type="button" class="btn btn-primary" id='sec_btn'>검색</button>
					<div style="width: 1200px; height: 600px;" id="canvasDiv">
						<!--차트가 그려질 부분-->
						<canvas id="myChart"></canvas>
					</div>
                </div>
                <div class="tab-pane fade  show active" id="store_content" role="tabpanel" aria-labelledby="store_tab">
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
	//console.log($('#section').val());
	//console.log($('#section_start_date').val());
	//console.log($('#section_end_date').val());
	if($('#section').val()=='구역'){
		alert('구역을 입력하세요.');
	}else if($('#section_start_date').val()>$('#section_end_date').val()){
		alert('시작 날짜가 끝 날짜보다 큽니다.');
	}else{
		$.ajax({
			type:'get',
			url:'sales/graph',
			data:{
				'sec':$('#section').val(),
				'start':$('#section_start_date').val(),
				'end':$('#section_end_date').val(),
				'time':$('#time').val()
			},
			dataType:'json',
			success:function(data){
				console.log(data);
				drawGraph(data.list);
			},
			error:function(e){
				console.log(e);
			}
		});
	}
});

function drawGraph(list){
	//console.log(list);
	$('#myChart').remove();
	$('#canvasDiv').append("<canvas id='myChart'></canvas>");
	
	var context = document
    .getElementById('myChart')
    .getContext('2d');
	
	var labels = [];
	var data = [];
	
	for(var i=0;i<list.length;i++){
		labels.push(list[i].date);
		data.push(list[i].sum);
	}
	
var myChart = new Chart(context, {
    type: 'bar', // 차트의 형태
    data: { // 차트에 들어갈 데이터
        labels: labels, // x축
        datasets: [
            { //데이터
                label: '단위(만원)', //차트 제목
                fill: true, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                data: data, // y축
                backgroundColor: [
                    //색상
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    //경계선 색상
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1 //경계선 굵기
            }/* ,
            {
                label: 'test2',
                fill: false,
                data: [
                    8, 34, 12, 24
                ],
                backgroundColor: 'rgb(157, 109, 12)',
                borderColor: 'rgb(157, 109, 12)'
            } */
        ]
    },
    options: {
        scales: {
            yAxes: [
                {
                    ticks: {
                        beginAtZero: true
                    }
                }
            ]
        }
    }
});
}
</script>
</html>