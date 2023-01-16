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
                      	<p>층</p>
                    </button>
                  </h2>
                  <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
					<table class="table table-striped">
						<tr>
							<td>7층</td>
						</tr>
						<tr>
							<td>6층</td>
						</tr>
						<tr>
							<td>5층</td>
						</tr>
						<tr>
							<td>4층</td>
						</tr>
						<tr>
							<td>3층</td>
						</tr>
						<tr>
							<td>2층</td>
						</tr>
						<tr>
							<td>1층</td>
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
                    
                    <label for="inputCity" class="form-label">매장위치</label>
                    <input type="text" class="form-control" id="inputCity">
                    
                   	<label for="inputCity" class="form-label">상태</label>
                    <input type="text" class="form-control" id="inputCity">
                    
                    <label for="inputCity" class="form-label">분류</label>
                    <input type="text" class="form-control" id="inputCity">
                    
                    <label for="inputCity" class="form-label">담당자</label>
                    <input type="text" class="form-control" id="inputCity">
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

/* 캔버스 설정 */
	canvas = document.getElementById('canvas');
	ctx = canvas.getContext('2d');

	ctx.strokeRect(1,1,100,100);
	ctx.strokeRect(110,110,100,100);
	
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


/* 구역 구분 */
function click(x,y){
	
	
	
	if(352 <x && x<478 && 375 < y && y < 493){
		console.log("section 1")
		$('#disablebackdrop').modal('show')
	}else if(152 < x && x<303 && 325<y && y<544){
		console.log("section 2")
	}else if(120< x && x<459 && 37<y && y<169 ){
		console.log("section 3")
	}else if(559<x && x<708 && 310<y && y<512){
		console.log("section 4")
	}else if(742<x && x<932 && 309<y && y<510){
		console.log("section 5")
	}
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