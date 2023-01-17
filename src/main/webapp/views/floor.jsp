<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*       body { */
/*         margin: 0; */
/*       } */
      #canvas {

         background: #eee;
        border: 1px solid #C0C0C0;
        border-radius: 5px;
      }
      #accordion{
      width : 500px;
      
      }

    </style>
</head>
<body>




<div class="card-body">
	<h5 class="card-title">평면도</h5>
	
				<div id="map_aside" >
			<div id="search">

			</div>
		
			<div id="list">
			
			<div class="card" id="accordion">
            <div class="card-body">
<!--               <h5 class="card-title">Accordion without outline borders</h5> -->

              <!-- Accordion without outline borders -->
              <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                  <h2 class="accordion-header" id="flush-headingOne">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                      	<p id="floorAco">1층</p>
                    </button>
                  </h2>
                  <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
					<table class="table table-striped">
						<tr>
							<td class="floor">7층</td>
						</tr>
						<tr>
							<td class="floor">6층</td>
						</tr>
						<tr>
							<td class="floor">5층</td>
						</tr>
						<tr>
							<td class="floor">4층</td>
						</tr>
						<tr>
							<td class="floor">3층</td>
						</tr>
						<tr>
							<td class="floor">2층</td>
						</tr>
						<tr>
							<td class="floor">1층</td>
						</tr>	
					
					</table>

                  </div>
                </div>


              </div><!-- End Accordion without outline borders -->

            </div>
			 </div>

		
			</div>

		</div>

	<div id="map">
	


		
			<canvas id="canvas" width="1000" height="600">현재 브라우저는 평면도 기능을 지원하지 않습니다.</canvas>

		




	</div>


</div>


<!--           <div class="card"> -->
<!--             <div class="card-body"> -->
<!--               <h5 class="card-title">Disabled Backdrop</h5> -->
<%--               <p>You can disable the backdrop by adding <code>data-bs-backdrop="false"</code> to <code>.modal-dialog</code></p> --%>

              <!-- Disabled Backdrop Modal -->
<!--               <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#disablebackdrop"> -->
<!--                 Launch Modal -->
<!--               </button> -->
              <div class="modal fade" id="disablebackdrop" tabindex="-1" data-bs-backdrop="false">
                <div class="modal-dialog">
                  <div class="modal-content" id="modal">
                    <div class="modal-header">
                      <h5 class="modal-title">점포 상세보기</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    
                    <label for="inputCity" class="form-label">매장 번호</label>
                    <input type="text" class="form-control" id="storeNumber" readonly>
                    

                    <label for="inputCity" class="form-label">매장 이름</label>
                    <input type="text" class="form-control" id="storeName">
                    <br>
                    
                    <label for="inputCity" class="form-label">매장 층</label>
                    <input type="text" class="form-control" id="storefloor" readonly>
                    <br>
                    
                    <label for="inputCity" class="form-label">매장 구역</label>
                    <input type="text" class="form-control" id="storePos" readonly>
                    <br>
                    
                   	<label for="inputCity" class="form-label">상태</label>
                    <input type="text" class="form-control" id="state" readonly>
                    <br>
                    
                 <div class="col-md-6" style="float:left">
                  <label for="inputCity" class="form-label">대분류</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="departure"> -->
                    <select id="Macategory" class="form-select" aria-label="Default select example" name="Macategory" >
                      <option selected>대분류를 선택해주세요</option>
                     
                      <option value="1">패션잡화</option>
                      <option value="2">여성패션</option>
                      <option value="3">남성패션</option>
                      <option value="4">영패션</option>
                      <option value="5">아동/유아</option>
                      <option value="6">스포츠</option>
                      <option value="7">리빙</option>
                    </select>
                </div>
                    
                   
                  <div class="col-md-6" style="float:left">
                  <label for="inputCity" class="form-label">소분류</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="team_name"> -->
                    <select id="Micategory" class="form-select" aria-label="Default select example" name="Micategory" >
                      <option selected>소분류를 선택해주세요</option>
<!--                       <option value="1">One</option> -->
<!--                       <option value="2">Two</option> -->
<!--                       <option value="3">Three</option> -->
                    </select>
                </div>
                
                    
                    <label for="inputCity" class="form-label">담당자</label>
                    <input type="text" class="form-control" id="emp_name" readonly>
                    <br>
                    
                    <div>
	                <div class="col-12" style="float: left; width: 200px; margin-right: 20px;">
	                  <label for="inputNanme4" class="form-label">임대 시작일</label>
	                  <input type="date" class="form-control" id="lease_start">
	                </div>
	                
		               <div class="col-12" style="float: left; width: 200px ">
		                 <label for="inputNanme4" class="form-label">임대 종료일</label>
		                 <input type="date" class="form-control" id="lease_end">
		               </div>
		              </div>


		             <div class="col-12"> 
		            <label for="inputCity" class="form-label">임대료</label>
                    <input type="text" class="form-control" id="money" onchange="getNum(this);" onkeyup="getNum(this);">
                    </div>
                    
                    </div>
                    <div class="modal-footer">
                      <button id="clearBtn" type="button" class="btn btn btn-danger">구역 비우기</button>
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button id="upBtn" type="button" class="btn btn-primary">저장</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Disabled Backdrop Modal-->

<!--             </div> -->
<!--           </div> -->
          
          
          
          
          
<!--                     <div class="card"> -->
<!--             <div class="card-body"> -->
<!--               <h5 class="card-title">Disabled Backdrop</h5> -->
<%--               <p>You can disable the backdrop by adding <code>data-bs-backdrop="false"</code> to <code>.modal-dialog</code></p> --%>

              <!-- Disabled Backdrop Modal -->
<!--               <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#disablebackdrop"> -->
<!--                 Launch Modal -->
<!--               </button> -->
              <div class="modal fade" id="emptyModal" tabindex="-1" data-bs-backdrop="false">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">매장 추가하기</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    
                    
                    
                    <label for="inputCity" class="form-label">매장 이름</label>
                    <input type="text" class="form-control" id="storeNameAdd">
                    
<!--                     <label for="inputCity" class="form-label">매장 층</label> -->
                    <input type="hidden" class="form-control" id="storefloorAdd" readonly>
                    
<!--                     <label for="inputCity" class="form-label">매장 구역</label> -->
                    <input type="hidden" class="form-control" id="storePosAdd" readonly>
                    
<!--                    	<label for="inputCity" class="form-label">상태</label> -->
                    <input type="hidden" class="form-control" id="stateAdd" readonly>
                    <br>
                    
                 <div class="col-md-6" style="float:left">
                  <label for="inputCity" class="form-label">대분류</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="departure"> -->
                    <select id="MacategoryAdd" class="form-select" aria-label="Default select example" name="MacategoryAdd" >
                      <option selected>대분류를 선택해주세요</option>
                      
                      <option value="1">패션잡화</option>
                      <option value="2">여성패션</option>
                      <option value="3">남성패션</option>
                      <option value="4">영패션</option>
                      <option value="5">아동/유아</option>
                      <option value="6">스포츠</option>
                      <option value="7">리빙</option>

                    </select>
                </div>
                    
                   
                  <div class="col-md-6" style="float:left">
                  <label for="inputCity" class="form-label">소분류</label>
<!--                   <input type="text" class="form-control" id="inputCity" name="team_name"> -->
                    <select id="MicategoryAdd" class="form-select" aria-label="Default select example" name="MicategoryAdd" >
                      <option selected>소분류를 선택해주세요</option>
<!--                       <option value="1">One</option> -->
<!--                       <option value="2">Two</option> -->
<!--                       <option value="3">Three</option> -->
                    </select>
                </div>
                
                    
                    <label for="inputCity" class="form-label">담당자</label>
                    <input type="text" class="form-control" id="emp_nameAdd" readonly>
                    <br>
                    
                    <div>
	                <div class="col-12" style="float: left; width: 200px; margin-right: 20px;">
	                  <label for="inputNanme4" class="form-label">임대 시작일</label>
	                  <input type="date" class="form-control" id="lease_startAdd">
	                </div>
	                
		               <div class="col-12" style="float: left; width: 200px ">
		                 <label for="inputNanme4" class="form-label">임대 종료일</label>
		                 <input type="date" class="form-control" id="lease_endAdd">
		               </div>
		              </div>


		             <div class="col-12"> 
		            <label for="inputCity" class="form-label">임대료</label>
                    <input type="text" class="form-control" id="moneyAdd">
                    </div>
                    
                    
                    
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button id="AddBtn" type="button" class="btn btn-primary">저장</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Disabled Backdrop Modal-->

<!--             </div> -->
<!--           </div> -->



</body>

<script>
var floor = 1;
setBackground();
floorCall(floor);


/* 소분류 불러오기 */
function miCate(val){
	$.ajax({
		type : 'post',
		url : 'store/Micate.ajax',
		data : {'val' : val},
		dataType : 'json',
		success : function(data){
			drawMiCate(data.list);
			
		},
		error : function(e){
			console.log(e)
		}
	})
	
}

/* 대분류 카테고리 변경 시  */
$('#Macategory').change(function(){
	var val = $(this).val();
	
	miCate(val);
})

$('#MacategoryAdd').change(function(){
	var val = $(this).val();
	
	miCate(val);
})



/* 소분류 그리기 */
function drawMiCate(list){
	var content = '<option>소분류를 선택해주세요</option>';
	
	for(var i=0; i<list.length; i++){
		content += '<option value="'+list[i].minor_category_num+'" >'+list[i].minor_category_name+'</option>'	
	}
	
	$('#Micategory').empty();
	$('#Micategory').append(content);
	
	$('#MicategoryAdd').empty();
	$('#MicategoryAdd').append(content);
	
}



/* 캔버스 설정 */
	canvas = document.getElementById('canvas');
	ctx = canvas.getContext('2d');


/* 처음 평면도 호출  */
function floorCall(floor){
	
	$.ajax({
		type : 'post',
		url : 'store/floorList.ajax',
		data : {'floor' : floor},
		dataType : 'JSON',
		success : function(data){
// 			console.log(data);
// 			console.log(data.list);
			storeName(data.list);
			
		},
		error : function(e){
			console.log(e);
		}
	})
	
	
}

/* 아코디언에서 층 클릭 시 평면도 재호출*/
$('.floor').click(function(){

	
	
	setBackground();
	ctx.clearRect(1,1,1000,600);
	
	var floorText = $(this).text();
	
	$('#floorAco').text(floorText);
	
	var floorStr = floorText.substr(0,1);
	var floor = Number(floorStr);
	
	floorCall(floor);
})

/* 평면도에 text 넣기 */
function storeName(list){
// 	ctx.fillText();
	
	ctx.font = "normal 15px normal";
	ctx.textAlign = "center";
	
	secArr = [];
	
	for(i=0; i<list.length; i++){
		
		secArr.push(list[i].section_num);
	}
	console.log(secArr);	



			if(!list[0].store_name){
				ctx.fillText("공실", 415,430, 70);
			}else{
				ctx.fillText(list[0].store_name, 415,430, 70);	
			}
			
			if(!list[1].store_name){
				ctx.fillText("공실", 230,440, 70);
			}else{
				ctx.fillText(list[1].store_name, 230,440, 70);
			}
			
			if(!list[2].store_name){
				ctx.fillText("공실", 290,110, 70);
			}else{
				ctx.fillText(list[2].store_name, 290,110, 70);
			}
			
			if(!list[3].store_name){
				ctx.fillText("공실", 635,420, 70);
			}else{
				ctx.fillText(list[3].store_name, 635,420, 70);
			}
		
			if(!list[4].store_name){
				ctx.fillText("공실", 835,415, 70);
			}else{
				ctx.fillText(list[4].store_name, 835,415, 70);
			}			
	

	storeList = [];
	
	for(i=0; i<list.length; i++){
// 		console.log(list[i].store_num);
		storeList.push(list[i].store_num);
	}
	
	return {storeList, secArr};
}


	
	
/* 캔버스 클릭 좌표 구하기 */
$(canvas).on("click", function(e){
	if(canvas.getContext){
		 l = $(this).offset().left;
		 t = $(this).offset().top;
		 x = e.pageX -l;
		 y = e.pageY - t;
		
		console.log("x : "+x);
		console.log("y : "+y);		
	}
	
	click(x,y);
	
})


/* 좌표기준 구역 구분 */
function click(x,y){
	
// 	console.log("storeList : "+storeList);

		
		if(352 <x && x<478 && 375 < y && y < 493){
// 			console.log("section 1");
			console.log("section 1 store : "+ storeList[0]);
			
			
// 			storeDet(storeList[0]);
			
// 			$('#disablebackdrop').modal('show');
			
			if(!storeList[0]){
				emptyInfo(secArr[0]);
				$('#emptyModal').modal('show');
			}else{
				storeDet(storeList[0]);
				$('#disablebackdrop').modal('show');
			}
			
			
		}else if(152 < x && x<303 && 325<y && y<544){
// 			console.log("section 2")
// 			console.log("section 1 store : "+ storeList[i]);
// 			storeDet(storeList[1]);
// 			$('#disablebackdrop').modal('show');
			
			if(!storeList[1]){
				emptyInfo(secArr[1]);
				$('#emptyModal').modal('show');
			}else{
				storeDet(storeList[1]);
				$('#disablebackdrop').modal('show');
			}
			
			
		}else if(120< x && x<459 && 37<y && y<169 ){
			console.log("section 3")
// 			storeDet(storeList[2]);
// 			$('#disablebackdrop').modal('show');
			
			if(!storeList[2]){
				emptyInfo(secArr[2]);
				$('#emptyModal').modal('show');
			}else{
				storeDet(storeList[2]);
				$('#disablebackdrop').modal('show');
			}
			
		}else if(559<x && x<708 && 310<y && y<512){
// 			console.log("section 4")
// 			storeDet(storeList[3]);
// 			$('#disablebackdrop').modal('show');
			
			if(!storeList[3]){
				emptyInfo(secArr[3]);
				$('#emptyModal').modal('show');
			}else{
				storeDet(storeList[3]);
				$('#disablebackdrop').modal('show');
			}
			
		}else if(742<x && x<932 && 309<y && y<510){
			console.log("section 5")
			console.log("공실 확인 : "+storeList[4]);
			
			if(!storeList[4]){
				emptyInfo(secArr[4]);
				$('#emptyModal').modal('show');
			}else{
				storeDet(storeList[4]);
				$('#disablebackdrop').modal('show');
			}
			
			
		}
		
		
}

function storeDet(store_num){
	
	console.log("store_num: "+store_num);
	
	
		$.ajax({
			type : 'post',
			url : 'store/storeDet.ajax',
			dataType : 'json',
			data : {'store_num' : store_num},
			success : function(data){
				console.log(data);
				console.log(data.list[0].major_category_num);
				miCate(data.list[0].major_category_num);
				storeDetModal(data.list);
				
			},
			error : function(e){
				console.log(e);
			}
		})
	
}

function emptyInfo(section_num){
	
	console.log("sec_num : "+section_num);
	
	var sec_num = section_num;
	
	$.ajax({
		type : 'post',
		url : 'store/emptyInfo.ajax',
		dataType : 'json',
		data : {'sec_num' : sec_num},
		success : function(data){
			console.log(data);
			secInfoDraw(data.list);
		},
		error : function(e){
			console.log(e);
		}
	})
}

function secInfoDraw(list){
	$('#storefloorAdd').val(list[0].floor);
	$('#storePosAdd').val(list[0].section_num);
	$('#stateAdd').val(list[0].section_state);
	$('#emp_nameAdd').val(list[0].emp_name);
	
	
}



function storeDetModal(list){
	console.log("here :"+list[0].store_num);
	
	if(list){
		$('#storeNumber').val(list[0].store_num);
		$('#storeName').val(list[0].store_name);
		$('#storefloor').val(list[0].floor);
		
		
		$('#storePos').val(list[0].section_num);
		$('#state').val(list[0].section_state);
		$('#Macategory').val(list[0].major_category_num);
		
		
		var val = list[0].major_category_num;
		
		$.ajax({
			type : 'post',
			url : 'store/selMicate.ajax',
			data : {'val' : val},
			dataType : 'json',
			success : function(data){
				drawMiCate(data.list);
				console.log(data);
				console.log("here : "+list[0].minor_category_num);
				$('#Micategory').val(list[0].minor_category_num);
			},
			error : function(e){
				console.log(e);
			}
			
			
		})
		

		$('#emp_name').val(list[0].emp_name);
		$('#lease_start').val(list[0].lease_start);
		$('#lease_end').val(list[0].lease_end);
		$('#money').val(list[0].lease_money);
		
	}
	
}

/* 업데이트 버튼 */
$('#upBtn').click(function(){
	$store_num = $('#storeNumber').val();
	$store_name = $('#storeName').val();
	$floor = $('#storefloor').val();
	$section_num = $('#storePos').val();
	$section_state = $('#state').val();
	$major_category_num = $('#Macategory').val();
	$minor_category_num = $('#Micategory').val();
	$emp_name = $('#emp_name').val();
	$lease_start = $('#lease_start').val();
	$lease_end = $('#lease_end').val();
	$lease_money = $('#money').val();
	
	if($store_name == ''){
		alert("매장 이름을 입력해 주세요")
	}else if($section_state == ''){
		alert("매장 상태를 선택해 주세요")
	}else if($major_category_num == ''){
		alert("대분류를 선택해 주세요")
	}else if($minor_category_num == ''){
		alert("대분류를 선택해 주세요")
	}else if($lease_start == ''){
		alert("임대 시작일을 선택해 주세요")
	}else if($lease_end == ''){
		alert("임대 종료일을 선택해 주세요")
	}else if($lease_money == ''){
		alert("임대료를 입력해주세요")
	}else if($lease_start >= $lease_money){
		alert("임대 시작일이 종료일보다 큽니다")
	} else{
		
		var param = {};
		param.store_num = $store_num
		param.store_name = $store_name
		param.floor = $floor
		param.section_num = $section_num
		param.section_state = $section_state
		param.major_category_num = $major_category_num
		param.minor_category_num = $minor_category_num
		param.emp_name = $emp_name
		param.lease_start = $lease_start
		param.lease_end = $lease_end
		param.lease_money = $lease_money
		
		$.ajax({
			type : 'post',
			url : 'store/floorUp.ajax',
			data : param,
			dataType : 'json',
			success : function(data){
				console.log(data);
				location.href = "floor.go";
			},
			error : function(e){
				console.log(e);
			}
		});
		
		
		$('#disablebackdrop').modal("hide");
	}
	
})

/* 구역 비우기 버튼 */
$('#clearBtn').click(function(){
	var param = {};
	
	var rtn;
	rtn = confirm("이 매장을 구역에서 비우시겠습니까?");
	if(rtn){
	
	param.store_num = $('#storeNumber').val();
	param.section_num = $('#storePos').val();
	$.ajax({
		type :'post',
		url : 'store/clear.ajax',
		data : param,
		dataType : 'json',
		success : function(data){
			console.log(data);
			location.href = "floor.go";
			
		},
		error : function(e){
			console.log(e);
		}

	});
	}else{
		return false;
	}
})

/* 빈 구역 정보 추가 */
$('#AddBtn').click(function(){
	
	$store_name = $('#storeNameAdd').val()
	$floor =$('#storefloorAdd').val()
	$section_num =$('#storePosAdd').val()
	$section_state =$('#stateAdd').val()
	$major_category_num =$('#MacategoryAdd').val()
	$minor_category_num =$('#MicategoryAdd').val()
	$emp_name =$('#emp_nameAdd').val()
	$lease_start =$('#lease_startAdd').val()
	$lease_end =$('#lease_endAdd').val()
	$lease_money =$('#moneyAdd').val() 
	
	var param = {};
	/* store */
	param.store_name = $store_name;
	param.section_num = $section_num;
	param.minor_category_num = $minor_category_num;
	
	param.major_category_num = $major_category_num;
	
	/* section */
	param.section_state = $section_state;
	param.floor = $floor;
	
	/* lease */
	param.lease_start = $lease_start;
	param.lease_end = $lease_end;
	param.lease_money = $lease_money;

	
	$.ajax({
		type : 'post',
		url : 'store/AddStore.ajax',
		data : param,
		dataType : 'json',
		success : function(data){
			console.log(data);
			location.href = "floor.go";
		},
		error : function(e){
			console.log(e)
		}
	})
	
});



/* 캔버스 배경 설정  */
function setBackground(){
	var backImg = new Image();
		
	backImg.onload = function(){
		ctx.drawImage(backImg,1,1,1000,600);
	}
	backImg.src = "assets/img/floor.jpg";
	
}

function getNumber(obj){
	var num01;
	var num02;
	num01 = obj.value;
	num02 = num01.replace(/\D/g,"");
	
	num02 = setComma(num02);
	obj.value = num01;
}

function setComma(n){
	var reg = /(^[+-]?\d+)(\d{3})/;
	n += '';
	while (reg.test(n)){
		n = n.replace(reg,'$1'+',' + '$2');
		
	}
	
	return n;
	
}



      
      	
</script>

</html>