<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#canvasDiv{
		width: 100%; 
		height: 400px;
		display: inline;
	}
	
	#myChart{
		
	}

</style>
<body>
	<div class="row align-items-top">
        <div class="col-lg-9">

          <!-- Default Card -->
          <div class="card">
            <div class="card-body" style="text-align: center">
              <h5 class="card-title">이번 달 백화점 매출</h5>
              	<div id="canvasDiv">
					<!--차트가 그려질 부분-->
					<canvas id="myChart"></canvas>
				</div>
            </div>
          </div><!-- End Default Card -->
          
          <div class="row align-items-top">
          	<div class="col-lg-6">
          		<!-- Default Card -->
	          <div class="card">
	            <div class="card-body" style="text-align: center">
	              <h5 class="card-title">Today 팀 스케줄</h5>
	            </div>
	          </div><!-- End Default Card -->
          	</div>
          	
          	<div class="col-lg-6">
          		<!-- Default Card -->
	          <div class="card">
	            <div class="card-body" style="text-align: center">
	              <h5 class="card-title">Today 시설 예약</h5>
	            </div>
	          </div><!-- End Default Card -->
          	</div>
          </div>
          
        </div>
        
        
        <div class="col-lg-3">

          <!-- Default Card -->
          <div class="card">
            <div class="card-body" style="text-align: center">
              <h5 class="card-title">전월 대비 백화점 성장률</h5>
              <div class='ps-3'>
              	<img src="" style="width:32px;height:32px">&nbsp;
	              <h2 id="percent" style="display:inline">X</h2>
              </div>
            </div>
          </div><!-- End Default Card -->
          
          <!-- Default Card -->
          <div class="card">
            <div class="card-body" style="text-align: center">
              <h5 class="card-title">결재 대기 중</h5>
              <h2 id="docWait" style="display:inline;">0건</h2>              
            </div>
          </div><!-- End Default Card -->
          
          <!-- Default Card -->
          <div class="card">
            <div class="card-body" style="text-align: center">
              <h5 class="card-title">결재 수신</h5>
              <h2 id="docSeq" style="display:inline">0건</h2>
            </div>
          </div><!-- End Default Card -->
          
          
        </div>

      </div>
</body>
<script>
thisMonthGraph();
preMonthComp();
getDocInfo();

function getDocInfo() {
	$.ajax({
		type:'get',
		url:'main/getDocInfo.ajax',
		dataType:'json',
		success:function(data){
			//console.log(data);
			$('#docWait').text(data.docWait+'건');
			$('#docSeq').text(data.docSeq+'건');
		},
		error:function(e){
			console.log(e);
		}
	});
}

function preMonthComp(){
	$.ajax({
		type:'get',
		url:'main/preMonthComp.ajax',
		dataType:'json',
		success:function(data){
			console.log(data.percent);
			if(data.percent.charAt(0) == "-"){
				$('.ps-3 img').prop('src','assets/img/down-arrows.png');
			}else{
				$('.ps-3 img').prop('src','assets/img/up-arrows.png');
			}
			
			$('#percent').text(data.percent+'%');
		},
		error:function(e){
			console.log(e);
		}
	});
}

function thisMonthGraph(){
	$.ajax({
		type:'get',
		url:'main/thisMonthGraph.ajax',
		dataType:'json',
		success:function(data){
			console.log(data.list);
			drawGraph(data.list);
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawGraph(list){
	$('#myChart').remove();
	$('#canvasDiv').append("<canvas id='myChart'></canvas>");
	
	var context = document
    .getElementById('myChart')
    .getContext('2d');
	
	var labels = [];
	var data = [];
	
	for(var i=0;i<list.length;i++){
		labels.push(list[i].doc_date);
		data.push(list[i].sales);
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
                    'rgba(255, 108, 108, 0.2)'
                ],
                borderColor: [
                    //경계선 색상
                    'rgba(255, 108, 108, 1)'
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