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

<main id="main" class="main">
	<section class="section">
		<div class="row">
			<div class="col-lg-6"> 
			
			<!-- 시설물 리스트 -->
				<div class="card">
					<div class="card-body">
						 <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
               			 	<div class="carousel-inner">
                  				<div class="carousel-item active">
            
                  					<!-- 모달 -->
                  						<div class="card">
											<div class="card-body" id="meetingRoom">
											</div>
										</div>
                  						<!-- 모달 끝 -->
                  					</div>
                   		 			<img src="assets/img/slides-1.jpg" class="d-block w-100" alt="...">
                  		 		</div>          
                			</div>
              			 </div>
					</div>
				</div> 
			<!-- ======================================================================= -->
			</div>
			
			<div class="col-lg-6"> 
			<!-- 버튼들 -->
			</div>
		</div>
	
	</section>
</main>
</body>

<script>
 facList();
var content = "";
function facList(){
	$.ajax({
		type : 'get',
		dataType : 'json',
		url : '/fac/list.ajax',
		success : function(data){
			console.log(data);
			meetingRoom(data.facList);
		},
		error : function(e){
			console.log(e);
		}
	});
}

function meetingRoom(facList) {
	content="";
	for (var i = 0; i < facList.length; i++) {

		content += '<span><h2>'+facList[i].fac_name+'</h2></span>';
		content += '<span>'+facList[i].fac_state_name+'</span>';
		content += '<button type="button" onclick="facDetail('+facList[i].fac_num+')">보기</button>';
		
	}
	$('#meetingRoom').empty();
	$('#meetingRoom').append(content);
	
} 

function facDetail(fac_num){
	$.ajax({
		type : 'get',
		url : '/fac/detail.go',
		data : {fac_num:fac_num},
		dataType : 'json',
		success : function(data){
			console.log(data);		
		},
		error : function(e){
			console.log(e);
		}
	});
}


</script>

</html>
