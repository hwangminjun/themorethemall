<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

</style>
<body>



<div class="row align-items-top">

	<div class="col-lg-4">
		<div class="card">
            <div class="card-body" style="margin-top: 30px;">
              <h5 class="card-title">조직도</h5>
              
              <hr>
              <br><br>

              <!-- Default Accordion -->
              <div class="accordion" id="accordionExample" style="width: 300px;">
              
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                      대표
                    </button>
                  </h2>
                  <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div id="chairMan" class="accordion-body">
                    
                    
                    
                    </div>
                  </div>
                </div>
                
                
                
                
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                      MD본부
                    </button>
                  </h2>
                  <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                    <div class="accordion-body" id="md">
                    
                    
                    
                    </div>
                  </div>
                </div>
                
               
                
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                      인사부
                    </button>
                  </h2>
                  <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                    <div class="accordion-body" id="hr">
                    
                    
                    </div>
                  </div>
                </div>
                
                
                
                  <div class="accordion-item">
                  <h2 class="accordion-header" id="headingFour">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                      총무부
                    </button>
                  </h2>
                  <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                    <div id="secretary" class="accordion-body">
                    
                    
                    </div>
                  </div>
                </div>
                
                
                
                
                  <div class="accordion-item">
                  <h2 class="accordion-header" id="headingFive">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                     영업지원부
                    </button>
                  </h2>
                  <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
                    <div id="sales" class="accordion-body">
                    
                    
                    </div>
                  </div>
                </div>
                
              
                
                  <div class="accordion-item">
                  <h2 class="accordion-header" id="headingSix">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                      운영지원부
                    </button>
                  </h2>
                  <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionExample">
                    <div id="operate" class="accordion-body">
                    
                    
                    </div>
                  </div>
                </div>
                
              </div><!-- End Default Accordion Example -->
              
            <br><br><br>
           

              
            </div>
	</div>
	</div>

	
	
	
	
	<div class="col-lg-8">
		<div class="card">
		
			<div class="card-body" style="margin-top: 30px;">
			<h6 class="card-title" id="teamHead"></h6>
			<hr>
			<div class="col-lg-2" style="float:left; margin-right: 70px;">
				
				
				<h6 class="card-title">직원 사진</h6>
				
				
				<img id="empImg" alt="empImg" width="100" src="ImageURL" name="ImageURL"> 
<%-- 				<c:if test="${sessionScope.profileImg == null }"> --%>
<!--                   <img src="default_image/no-profile.png" alt="Profile" width="100"> -->
<%--                </c:if> --%>

<%--                <c:if test="${sessionScope.profileImg != null }"> --%>
<!--                   <img src="assets/img/11.jpg" alt="Profile"  width="100"> -->
<%--                </c:if> --%>
				
				<div class="tab-pane fade show active profile-overview" id="profile-overview" role="tabpanel"></div>
				
				</div>		
				
			
				
				<div class="col-lg-7" style="float:left;">
                  <h6 class="card-title">직원 프로필</h6>
                  <br>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">이 름</div>
                    <div class="col-lg-9 col-md-8" id="empName"></div>
                  </div>
					<br>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">부 서</div>
                    <div class="col-lg-9 col-md-8" id="dep"></div>
                  </div>
					<br>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">팀</div>
                    <div class="col-lg-9 col-md-8" id="team"></div>
                  </div>
					<br>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">직 책</div>
                    <div class="col-lg-9 col-md-8" id="pos"></div>
                  </div>
					<br>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">직 급</div>
                    <div class="col-lg-9 col-md-8" id="rank"></div>
                  </div>
					<br>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">전화번호</div>
                    <div class="col-lg-9 col-md-8" id="phone"></div>
                  </div>
					<br>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">이메일</div>
                    <div class="col-lg-9 col-md-8" id="email"></div>
                  </div>
                  	
                  </div>
					
					
					
                </div>
                <br><br><br>
			
			</div>
		<br>
		
		</div>
		
		
	</div>
	
	



</body>
<script>
orgList();
chairInfo();

function chairInfo(){
	
	$.ajax({
		type : 'post',
		url : 'org/chairInfo.ajax',
		dataType : 'json',
		success : function(data){
			console.log(data);
			drawChair(data.list);
			ChairName(data.list);
		},
		error: function(e){
			console.log(e);
		}
	})
}

function ChairName(list){
// 	console.log(list[0].team_num);
	var content = '';
	for(i=0; i<list.length; i++){
		content +='<table class="table"><tr id="'+list[i].emp_num+'" onclick="empNum(this.id)">';
		content +='<td>'+list[i].emp_name+' | '+list[i].pos_name+'</td>';
		content +='</tr></table>';
	
	}
	
	$('#chairMan').empty();
	$('#chairMan').append(content);
	
}

function drawChair(list){
	$('#empName').empty();
	$('#dep').empty();
	$('#team').empty();
	$('#pos').empty();
	$('#rank').empty();
	$('#phone').empty();
	$('#email').empty();
	$('#teamHead').empty();
	
	$('#empName').append(list[0].emp_name);
	$('#dep').append(list[0].dep_name);
	$('#team').append(list[0].team_name);
	$('#pos').append(list[0].pos_name);
	$('#rank').append(list[0].rank_name);
	$('#phone').append(list[0].phone);
	$('#email').append(list[0].email);
	$('#teamHead').append(list[0].team_name);
	
	console.log("here : "+list[0].new_filename);
	
// 	const img = document.getElementById('empImg');
// 	const src = img.src;
// 	console.log(src);
	
	const img = document.getElementById('empImg');
	img.src = "/photo.do?path="+list[0].new_filename; 
	console.log(img.src);
	
}


function orgList(){
	
	$.ajax({
		type : 'post',
		url : 'org/orgList.ajax',
		dataType: 'json',
		success : function(data){
			console.log(data.mdList);
			console.log(data.hrList);
			console.log(data.secretaryList);
			console.log(data.salesList);
			console.log(data.operateList);
			drawMd(data.mdList);
			drawHr(data.hrList);
			drawSec(data.secretaryList);
			drawSales(data.salesList);
			drawOper(data.operateList);
		},
		error : function(e){
			console.log(data);
		}
	})
	
}

function drawMd(list){
	var content = '';

	for(i=0; i<list.length; i++){
		
		content += '<div class="accordion-item">';
		content += ' <h2 class="accordion-header" id="heading'+list[i].team_num+'">';
		content += '<button id="'+list[i].team_num+'" onclick="teamNum(this.id)" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse'+list[i].team_num+'" aria-expanded="false" aria-controls="collapse'+list[i].team_num+'">'
		content += list[i].team_name;
		content += '</button></h2>';
		content += '<div id="collapse'+list[i].team_num+'" class="accordion-collapse collapse" aria-labelledby="heading'+list[i].team_num+'">';
		content += '<div id="body'+list[i].team_num+'" class="accordion-body">';
		content += '</div></div></div>';
		
	}
	
	$('#md').empty();
	$('#md').append(content);
	
}

function drawHr(list){
	var content = '';

	for(i=0; i<list.length; i++){
		
		content += '<div class="accordion-item">';
		content += ' <h2 class="accordion-header" id="heading'+list[i].team_num+'">';
		content += '<button id="'+list[i].team_num+'" onclick="teamNum(this.id)" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse'+list[i].team_num+'" aria-expanded="false" aria-controls="collapse'+list[i].team_num+'">'
		content += list[i].team_name;
		content += '</button></h2>';
		content += '<div id="collapse'+list[i].team_num+'" class="accordion-collapse collapse" aria-labelledby="heading'+list[i].team_num+'">';
		content += '<div id="body'+list[i].team_num+'" class="accordion-body">';
		content += '</div></div></div>';
		
	}
	
	$('#hr').empty();
	$('#hr').append(content);
	
}

function drawSec(list){
	var content = '';

	for(i=0; i<list.length; i++){
		
		content += '<div class="accordion-item">';
		content += ' <h2 class="accordion-header" id="heading'+list[i].team_num+'">';
		content += '<button id="'+list[i].team_num+'" onclick="teamNum(this.id)" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse'+list[i].team_num+'" aria-expanded="false" aria-controls="collapse'+list[i].team_num+'">'
		content += list[i].team_name;
		content += '</button></h2>';
		content += '<div id="collapse'+list[i].team_num+'" class="accordion-collapse collapse" aria-labelledby="heading'+list[i].team_num+'">';
		content += '<div id="body'+list[i].team_num+'" class="accordion-body">';
		content += '</div></div></div>';
		
	}
	
	$('#secretary').empty();
	$('#secretary').append(content);
	
}

function drawSales(list){
	var content = '';

	for(i=0; i<list.length; i++){
		
		content += '<div class="accordion-item">';
		content += ' <h2 class="accordion-header" id="heading'+list[i].team_num+'">';
		content += '<button id="'+list[i].team_num+'" onclick="teamNum(this.id)" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse'+list[i].team_num+'" aria-expanded="false" aria-controls="collapse'+list[i].team_num+'">'
		content += list[i].team_name;
		content += '</button></h2>';
		content += '<div id="collapse'+list[i].team_num+'" class="accordion-collapse collapse" aria-labelledby="heading'+list[i].team_num+'">';
		content += '<div id="body'+list[i].team_num+'" class="accordion-body">';
		content += '</div></div></div>';
		
	}
	
	$('#sales').empty();
	$('#sales').append(content);
	
}

function drawOper(list){
	
	var content = '';

	for(i=0; i<list.length; i++){
// 		console.log(list[i].team_num);
		content += '<div class="accordion-item">';
		content += ' <h2 class="accordion-header" id="heading'+list[i].team_num+'">';
		content += '<button id="'+list[i].team_num+'" onclick="teamNum(this.id)" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse'+list[i].team_num+'" aria-expanded="false" aria-controls="collapse'+list[i].team_num+'">'
		content += list[i].team_name;
		content += '</button></h2>';
		content += '<div id="collapse'+list[i].team_num+'" class="accordion-collapse collapse" aria-labelledby="heading'+list[i].team_num+'">';
		content += '<div id="body'+list[i].team_num+'" class="accordion-body">';
		content += '</div></div></div>';
		
	}
	
	$('#operate').empty();
	$('#operate').append(content);
	
}

function teamNum(team){
// 	console.log("팀 : "+team);
	var team_num = team;
	
	$.ajax({
		type : 'post',
		url : 'org/empName.ajax',
		data : {'team_num' :team_num},
		dataType : 'json',
		success : function(data){
			console.log(data);
			drawEmp(data.list);
		},
		error : function(e){
			console.log(e);
		}
	})
}


function drawEmp(list){
// 	console.log(list[0].team_num);
	var content = '';
	for(i=0; i<list.length; i++){
		content +='<table class="table"><tr id="'+list[i].emp_num+'" onclick="empNum(this.id)">';
		content +='<td>'+list[i].emp_name+' | '+list[i].pos_name+'</td>';
		content +='</tr></table>';
	
	}
	
	$('#body'+list[0].team_num+'').empty();
	$('#body'+list[0].team_num+'').append(content);
	
}

function empNum(empNum){
	console.log("직원 : "+emp_num);
	var emp_num = empNum;
	
	$.ajax({
		type : 'post',
		url : 'org/empInfo.ajax',
		data : {emp_num:emp_num},
		dataType : 'json',
		success : function(data){
// 			console.log(data.list);
			drawProfile(data.list);
		},
		error : function(e){
			console.log(e);
		}
	})
}

function drawProfile(list){
	$('#empName').empty();
	$('#dep').empty();
	$('#team').empty();
	$('#pos').empty();
	$('#rank').empty();
	$('#phone').empty();
	$('#email').empty();
	$('#teamHead').empty();
	$('#empImg').empty();
	
	console.log("사진 넘버 : "+list[0].new_filename);
	const img = document.getElementById('empImg');
	
	if(!list[0].new_filename){
		img.src = "default_image/no-profile.png";
	}else{
		
		img.src = "/photo.do?path="+list[0].new_filename; 
		console.log(img.src);
		
	}
	

	
	$('#empName').append(list[0].emp_name);
	$('#dep').append(list[0].dep_name);
	$('#team').append(list[0].team_name);
	$('#pos').append(list[0].pos_name);
	$('#rank').append(list[0].rank_name);
	$('#phone').append(list[0].phone);
	$('#email').append(list[0].email);
	$('#teamHead').append(list[0].team_name);
}


</script>
</html>