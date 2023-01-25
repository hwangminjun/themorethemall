<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                <div class="tab-pane fade show active" id="compare_content" role="tabpanel" aria-labelledby="compare-tab">
                	<fieldset class="row mb-3">
                  
                  <div class="col-sm-10">
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="section" checked>
                      <label class="form-check-label" for="gridRadios1">
                        구역 비교
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="store">
                      <label class="form-check-label" for="gridRadios2">
                        점포 비교
                      </label>
                    </div>
                  </div>
                </fieldset>
					<select id='floor1'>
                      <option class='def' selected>층</option>
                      <option value="1">1층</option>
                      <option value="2">2층</option>
                      <option value="3">3층</option>
                      <option value="4">4층</option>
                      <option value="5">5층</option>
                      <option value="6">6층</option>
                      <option value="7">7층</option>
                    </select>
					<select id='comp1' name='comp'>
                      <option selected>구역</option>
                    </select>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <select id='floor2'>
                      <option class='def' selected>층</option>
                      <option value="1">1층</option>
                      <option value="2">2층</option>
                      <option value="3">3층</option>
                      <option value="4">4층</option>
                      <option value="5">5층</option>
                      <option value="6">6층</option>
                      <option value="7">7층</option>
                    </select>
					<select id='comp2' name='comp'>
                      <option selected>구역</option>
                    </select>
                    <br>
                    <br>
					<input type="date" id="start_date"> ~ <input type="date" id="end_date">
					<select id='time'>
                      <option value="date">일 단위</option>
                      <option value="week">주 단위</option>
                      <option value="month">월 단위</option>
                      <option value="year">년 단위</option>
                    </select>
					<button type="button" class="btn btn-primary" id='comp_btn'>검색</button>
					<div style="width: 1200px; height: 500px;" id="canvasDiv">
						<!--차트가 그려질 부분-->
						<canvas id="myChart"></canvas>
					</div>
                </div>
              </div><!-- End Bordered Tabs Justified -->

            </div>
          </div>
</body>
<script>
var url = 'sales/sec.ajax';

var now_utc = Date.now() // 지금 날짜를 밀리초로
//getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
//new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("start_date").setAttribute("max", today);
document.getElementById("end_date").setAttribute("max", today);

$('input[name="gridRadios"]').change(function(){
	if($('input[name="gridRadios"]:checked').val()=='section'){
		url = 'sales/sec.ajax';
		$('.def').prop('selected',true);
		$('select[name="comp"] option').remove();
		$('select[name="comp"]').append('<option selected>구역</option>');
	}else if($('input[name="gridRadios"]:checked').val()=='store'){
		url = 'sales/store.ajax';
		$('.def').prop('selected',true);
		$('select[name="comp"] option').remove();
		$('select[name="comp"]').append('<option selected>점포</option>');
	}
});

$('#floor1').change(function(){
	var val = $(this).val();
	//console.log(url);
	$.ajax({
		type:'get',
		url:url,
		data:{
			val:val
			},
		dataType:'json',
		success:function(data){
			//console.log(data.sec.length);
			if(url=='sales/sec.ajax'){
				drawSec1(data.sec);
			}else{
				drawStore1(data.store);
			}
		},
		error:function(e){
			console.log(e);
		}
	});
});

$('#floor2').change(function(){
	var val = $(this).val();
	//alert(val);
	$.ajax({
		type:'get',
		url:url,
		data:{
			val:val
			},
		dataType:'json',
		success:function(data){
			//console.log(data.sec.length);
			if(url=='sales/sec.ajax'){
				drawSec2(data.sec);
			}else{
				drawStore2(data.store);
			}
		},
		error:function(e){
			console.log(e);
		}
	});
});

function drawSec1(list){
	var content = "";
	$('#comp1').empty();
	for(var i=0; i<list.length; i++){
		//console.log(list[i].section_num);
		content += "<option value='"+list[i].section_num+"'>"+list[i].section_num+"</option>";
	}
	if(list.length==0){
		content += '<option selected>구역</option>';
	}
	$('#comp1').append(content);
}

function drawSec2(list){
	var content = "";
	$('#comp2').empty();
	for(var i=0; i<list.length; i++){
		//console.log(list[i].section_num);
		content += "<option value='"+list[i].section_num+"'>"+list[i].section_num+"</option>";
	}
	if(list.length==0){
		content += '<option selected>구역</option>';
	}
	$('#comp2').append(content);
}

function drawStore1(list){
	var content = "";
	$('#comp1').empty();
	for(var i=0; i<list.length; i++){
		//console.log(list[i].section_num);
		if(list[i] != null){
			content += "<option value='"+list[i].store_num+"'>"+list[i].store_name+"</option>";
		}
	}
	if(list.length==0){
		content += '<option selected>점포</option>';
	}
	$('#comp1').append(content);
}

function drawStore2(list){
	var content = "";
	$('#comp2').empty();
	for(var i=0; i<list.length; i++){
		//console.log(list[i].section_num);
		if(list[i] != null){
			content += "<option value='"+list[i].store_num+"'>"+list[i].store_name+"</option>";
		}
	}
	if(list.length==0){
		content += '<option selected>점포</option>';
	}
	$('#comp2').append(content);
}

$('#comp_btn').click(function(){
	//alert($('#comp1').val());
	if($('#comp1').val() == '구역' || $('#comp2').val() == '구역'){
		alert('비교할 구역을 모두 입력하세요.');
	}else if($('#comp1').val() == '점포' || $('#comp2').val() == '점포'){
		alert('비교할 점포를 모두 입력하세요.');
	}else if($('#comp1').val() == $('#comp2').val()){
		alert('비교 대상이 같습니다.');
	}else if($('#start_date').val() == ''){
		alert('시작 날짜를 입력해주세요.');
	}else if($('#end_date').val() == ''){
		alert('끝 날짜를 입력해주세요.');
	}else if($('#start_date').val()>$('#end_date').val()){
		alert('시작 날짜가 끝 날짜보다 큽니다.');
	}else{
		$.ajax({
			type:'get',
			url:'sales/compGraph.ajax',
			data:{
				'type':$('input[name="gridRadios"]:checked').val(),
				'comp1':$('#comp1').val(),
				'comp2':$('#comp2').val(),
				'start':$('#start_date').val(),
				'end':$('#end_date').val(),
				'time':$('#time').val()
			},
			dataType:'json',
			success:function(data){
				if(data.listComp1.length == 0 && data.listComp2.length == 0){
					alert('불러올 데이터가 없습니다.');
				}else{
					drawCompGraph(data.listComp1, data.listComp2, $('#comp1 option:checked').text(), $('#comp2 option:checked').text());
					// 비교 대상 2개 리스트 & label에 들어갈 이름 2개
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
});

var type = 'line';

function drawCompGraph(listComp1, listComp2, comp1_name, comp2_name){
	//console.log(list);
	$('#myChart').remove();
	$('#canvasDiv').append("<canvas id='myChart'></canvas>");
	
	var context = document
    .getElementById('myChart')
    .getContext('2d');
	
	var labels = [];
	var data1 = [];
	var data2 = [];
	
	for(var i=0;i<listComp1.length;i++){
		//labels1.push(listComp1[i].date);
		data1.push(listComp1[i].sum);
	}
	
	for(var i=0;i<listComp2.length;i++){
		//labels2.push(listComp2[i].date);
		data2.push(listComp2[i].sum);
	}
	
	// 데이터가 더 많은 쪽으로 x축 그리는 로직
	if(listComp1.length >= listComp2.length){
		for(var i=0;i<listComp1.length;i++){
			labels.push(listComp1[i].date);
		}
	}else{
		for(var i=0;i<listComp2.length;i++){
			labels.push(listComp2[i].date);
		}
	}
	
	if(listComp1.length == 1 || listComp2.length == 1){
		type = 'bar';
	}else{
		type = 'line';
	}
	
var myChart = new Chart(context, {
    type: type, // 차트의 형태
    data: { // 차트에 들어갈 데이터
        labels: labels, // x축
        datasets: [
            { //데이터
                label: comp1_name, //차트 제목
                fill: true, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                data: data1, // y축
                backgroundColor: [
                    //색상
                	'rgba(71, 66, 219, 0.2)'
                ],
                borderColor: [
                    //경계선 색상
                	'rgba(71, 66, 219, 1)'
                ],
                borderWidth: 1 //경계선 굵기
            } ,
            {
                label: comp2_name,
                fill: true,
                data: data2,
                backgroundColor: [
                	'rgba(255, 108, 108, 0.2)'
                ],
                borderColor: [
                	'rgba(71, 108, 108, 1)'
                ],
                borderWidth: 1
            } 
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