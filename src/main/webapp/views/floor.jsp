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


          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Disabled Backdrop</h5>
              <p>You can disable the backdrop by adding <code>data-bs-backdrop="false"</code> to <code>.modal-dialog</code></p>

              <!-- Disabled Backdrop Modal -->
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#disablebackdrop">
                Launch Modal
              </button>
              <div class="modal fade" id="disablebackdrop" tabindex="-1" data-bs-backdrop="false">
                <div class="modal-dialog">
                  <div class="modal-content" id="modal">
                    <div class="modal-header">
                      <h5 class="modal-title">점포 상세보기</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    
                    <label for="inputCity" class="form-label">매장 이름</label>
                    <input type="text" class="form-control" id="storeName">
                    
                    <label for="inputCity" class="form-label">매장 층</label>
                    <input type="text" class="form-control" id="storefloor">
                    
                    <label for="inputCity" class="form-label">매장 구역</label>
                    <input type="text" class="form-control" id="storePos">
                    
                   	<label for="inputCity" class="form-label">상태</label>
                    <input type="text" class="form-control" id="state">
                    
                    <div style="float: left; margin-right: 20px;">
                    <label for="inputCity" class="form-label">대분류</label>
                    <input type="text" class="form-control" id="Macategory" style="width:100px;" >
                    </div>
                   
                    <div>
                    <label for="inputCity" class="form-label">소분류</label>
                    <input type="text" class="form-control" id="Micategory" style="width:100px">
                   </div>
<!--                     <label for="inputCity" class="form-label">소분류</label> -->
                    
                    
                    <label for="inputCity" class="form-label">담당자</label>
                    <input type="text" class="form-control" id="emp_name">
                    
	                <div class="col-12" style="float: left; margin-right: 20px;">
	                  <label for="inputNanme4" class="form-label">임대 시작일</label>
	                  <input type="date" class="form-control" id="lease_start">
	                </div>
	                
		               <div class="col-12">
		                 <label for="inputNanme4" class="form-label">임대 종료일</label>
		                 <input type="date" class="form-control" id="lease_end">
		               </div>
		               
		            <label for="inputCity" class="form-label">임대료</label>
                    <input type="text" class="form-control" id="money">
                    
                    
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button type="button" class="btn btn-primary">저장</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Disabled Backdrop Modal-->

            </div>
          </div>



</body>

<script>
setBackground();
var floor = 1;
floorCall(floor);




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
			console.log(data);
			console.log(data.list);
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
		
	var section1 = ctx.fillText(list[0].store_name, 415,430, 70);
	var section2 = ctx.fillText(list[1].store_name, 230,440, 70);
	var section3 = ctx.fillText(list[2].store_name, 290,110, 70);
	var section4 = ctx.fillText(list[3].store_name, 635,420, 70);
	var section5 = ctx.fillText(list[4].store_name, 835,415, 70);
	
	storeList = [];
	
	for(i=0; i<list.length; i++){
		console.log(list[i].store_num);
		storeList.push(list[i].store_num);
	}
	
	return storeList;
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
			storeDet(storeList[0]);
			$('#disablebackdrop').modal('show');
		}else if(152 < x && x<303 && 325<y && y<544){
// 			console.log("section 2")
// 			console.log("section 1 store : "+ storeList[i]);
			storeDet(storeList[1]);
			$('#disablebackdrop').modal('show');
		}else if(120< x && x<459 && 37<y && y<169 ){
			console.log("section 3")
			storeDet(storeList[2]);
			$('#disablebackdrop').modal('show');
		}else if(559<x && x<708 && 310<y && y<512){
			console.log("section 4")
			storeDet(storeList[3]);
			$('#disablebackdrop').modal('show');
		}else if(742<x && x<932 && 309<y && y<510){
			console.log("section 5")
			storeDet(storeList[4]);
			$('#disablebackdrop').modal('show');
		}
		
		
}

function storeDet(store_num){
	
	console.log("here: "+store_num);
	
	$.ajax({
		type : 'post',
		url : 'store/storeDet.ajax',
		dataType : 'json',
		data : {'store_num' : store_num},
		success : function(data){
			console.log(data);
			storeDetModal(data.list);
		},
		error : function(e){
			console.log(e);
		}
		
	})
	
}

function storeDetModal(list){
	console.log(typeof list[0].lease_start);
	$('#storeName').val(list[0].store_name);
	$('#storefloor').val(list[0].floor);
	
	
	$('#storePos').val(list[0].section_num);
	$('#state').val(list[0].section_state);
	$('#Macategory').val(list[0].major_category_name);
	$('#Micategory').val(list[0].minor_category_name);
	$('#emp_name').val(list[0].emp_name);
	$('#lease_start').val(list[0].lease_start);
	$('#lease_end').val(list[0].lease_end);
	$('#money').val(list[0].lease_money);

	
	
	
}

/* 캔버스 배경 설정  */
function setBackground(){
	var backImg = new Image();
		
	backImg.onload = function(){
		ctx.drawImage(backImg,1,1,1000,600);
	}
	backImg.src = "assets/img/floor.jpg";

}
	



      
      
      	
</script>

</html>