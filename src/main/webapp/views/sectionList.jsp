<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	nav{
	text-align:center;
	display:inline-block;
	}
	.container{
	display:inline-block;
	}
</style>
<body>

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">구역 관리</h5>

              <!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">층</th>
                    <th scope="col">구역번호</th>
                    <th scope="col">구역상태</th>
                    <th scope="col">담당자</th>
                    <th scope="col">담당팀</th>
                  </tr>
                </thead>
                <tbody id= "list">

                </tbody>
                          <tr id="page">
								<td colspan="5" id="paging" style="text-align:center">
									<div class="container">
										<nav aria-label="Page navigation">
											<ul class = "pagination" id="pagination"></ul>
										</nav>
									</div>
								</td>
							</tr>
              </table>
              <!-- End Default Table Example -->
              
              <select id="sl1" name="category" class="form-select" style="width: 100px; float: left; margin-right: 10px; margin-left: 290px;"> 
              	<option value="emp_name" selected>담당자</option>
              	<option value="team_name" >담당팀</option>
              	<option value="floor" >층</option>
              	
              </select>
              
                            <input type="text" placeholder="검색어 입력" name="detailContent" id="detailContent" class="form-control" style="width: 400px; float: left; margin-right: 10px;">
		         
		              <button onclick="flags(); detailSearch(1)" class="btn btn-primary btn-sm" style="height: 37px;">검색</button>
              

              
              
            </div>
          </div>
          
          
<!--                     <div class="card"> -->
<!--             <div class="card-body"> -->
<!--               <h5 class="card-title">Disabled Backdrop</h5> -->
<%--               <p>You can disable the backdrop by adding <code>data-bs-backdrop="false"</code> to <code>.modal-dialog</code></p> --%>

              <!-- Disabled Backdrop Modal -->
<!--               <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#disablebackdrop"> -->
<!--                 Launch Modal -->
<!--               </button> -->
              <div class="modal fade" id="disablebackdrop" tabindex="-1" data-bs-backdrop="false">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">구역 수정</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    
                 <div class="col-12">
                  <label for="inputNanme4" class="form-label">층</label>
                  <input type="text" id="floor" class="form-control" id="inputNanme4" name="floor" readonly>
                </div>
                
                 <div class="col-12">
                  <label for="inputNanme4" class="form-label">구역번호</label>
                  <input type="text" id="section_num" class="form-control" id="inputNanme4" name="section_num" readonly>
                </div>
                
               <div class="col-md-6">
                  <label for="inputCity" class="form-label">담당팀</label>
                    <select id="teamDrop" class="form-select" aria-label="Default select example" name="teamDrop" >
                      <option selected>팀을 선택해주세요</option>
                     
                    </select>
                </div>
                
                <div class="col-md-6">
                  <label for="inputCity" class="form-label">담당자</label>
                    <select id="empDrop" class="form-select" aria-label="Default select example" name="empDrop" >
                      <option selected>직원을 선택해주세요</option>
                     
                    </select>
                </div>
                


                    
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button type="button" id="saveBtn" class="btn btn-primary" data-bs-dismiss="modal">저장</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Disabled Backdrop Modal-->

<!--             </div> -->
<!--           </div> -->



</body>
<script>
var showPage = 1;
var total = 5;

listCall(showPage);
teamList();


/* 구역 데이터 가져오기 */
function listCall(page){
	$.ajax({
		type : 'post',
		url : 'section/list.ajax',
		data : {'page' : page},
		dataType : 'JSON',
		success : function(data){
			console.log(data);
			drawList(data.list);
			total = data.total;
			
			$("#pagination").twbsPagination({
				startPage:1, // 시작페이지
				totalPages:data.total, // 총 페이지 수
				visiblePages:5, // 기본으로 보여줄 페이지 수
				onPageClick:function(e, page){ // 클릭했을 때 실행 내용
					//console.log(e);
					listCall(page);
				}
			});
		},
		error : function(e){
			console.log(e);
		}
		
	});
}

/* 구역 그리기 */
function drawList(list){
	var content = '';
	
	for(var i=0; i<list.length; i++){
		content += '<tr id="'+list[i].section_num+'" onclick="secClick(this.id)" data-bs-toggle="modal" data-bs-target="#disablebackdrop">';
		content += '<td>'+list[i].floor+'</td>';
		content += '<td>'+list[i].section_num+'</td>';
		content += '<td>'+list[i].section_state+'</td>';
		content += '<td>'+list[i].emp_name+'</td>';
		content += '<td>'+list[i].team_name+'</td>';
		content += '</tr>';

	}
	
	$('#list').empty();
	$('#list').append(content);
	
}


/* 팀리스트 불러오기 */
function teamList(){
	$.ajax({
		type : 'post',
		url : 'section/teamDrop.ajax',
		dataType : 'json',
		success : function(data){
			console.log(data);
			teamDrop(data.teamlist);
			
		},
		error : function(e){
			console.log(e);
		}
	});
}



/* 구역 상세 보기 */
function secClick(check_id){	
	section_num = check_id;
	console.log("section_num : "+section_num);
	

	
	/* 구역 번호로 해당 정보 가져오기 */
	$.ajax({
		type : 'post',
		url : 'section/secDetail.ajax',
		data : {'section_num' : section_num},
		dataType : 'json',
		success : function(data){
			console.log(data);
			secDetail(data.list);
		},
		error : function(e){
			console.log(e);
		}
	});
	

	

	
	return section_num;
}


function teamDrop(teamlist){
	var content = '<option>팀을 선택해주세요</option>';
	
	for(var i=0; i <teamlist.length; i++){
		content += '<option value="'+teamlist[i].team_num+'">'+teamlist[i].team_name+'</option>';
	}
	
	$('#teamDrop').empty();
	$('#teamDrop').append(content);
}


/* 팀 드롭다운 변경 시 직원 목록 가져오기 */
$('#teamDrop').change(function(){
	var val = $(this).val();
	
	$.ajax({
		type : 'post',
		url : 'section/empList.ajax',
		data : {'val' : val},
		dataType : 'json',
		success : function(data){
			drawEmp(data.empList);
		},
		error : function(e){
			console.log(e);
		}
		
	});
	
})

function drawEmp(empList){
	content = '<option>직원을 입력해 주세요</option>';
	
	for(i = 0; i<empList.length; i++){
		content += '<option value="'+empList[i].emp_num+'">'+empList[i].emp_name+'</option>';
	}
	
	$('#empDrop').empty();
	$('#empDrop').append(content);
	
}


function secDetail(list){
// 	console.log(list[0].floor);
// 	console.log(list[0].section_num);
// 	console.log(list[0].team_num);
	console.log("here : "+list[0].emp_num);
	
	/* 층, 구역번호 상세보기에 값 넣기 */
	$('#floor').val(list[0].floor);
	$('#section_num').val(list[0].section_num);
	$('#teamDrop').val(list[0].team_num);
	
	var val = list[0].team_num;
	
	$.ajax({
		type : 'post',
		url : 'section/teamlist.ajax',
		data : {val : val},
		dataType : 'json',
		success : function(data){
			drawEmp(data.list);
			console.log(list[0].emp_num);
			$('#empDrop').val(list[0].emp_num);

		},
		error : function(e){
			console.log(e);
		}
		
	});
}

/* 수정하기 */
$('#saveBtn').click(function(){
// 	$floor = $('#floor').val();
	$section_num = $('#section_num').val();
// 	$teamDrop = $('#teamDrop').val();
	$empDrop = $('#empDrop').val();
	
// 	if($teamDrop == ''){
// 		alert("팀을 선택해주세요");
// 	}else 
		
		if($empDrop == ''){
		alert("사원을 선택해주세요")
	}else{
		
		var param = {};
		
		param.section_num = $section_num;
		param.emp_num = $empDrop;
		
		$.ajax({
			type : 'post',
			url : 'section/infoUp.ajax',
			data : param,
			dataType : 'json',
			success : function(data){
				console.log(data);
				location.href = "sectionList.go";
			},
			error : function(e){
				console.log(e);
			}
		});
	}
})

/* 페이징 다시 그리기 */
function drawPage(){
	var paging = "";
	$('#page').empty();
	paging += '<td colspan="8" id="paging" style="text-align:center">';
	paging += '<div class="container">';
	paging += '<nav aria-label="Page navigation">';
	paging += '<ul class="pagination" id="pagination"></ul>';
	paging += '</nav></div></td>';
	
	$('#page').append(paging);
}

/* 검색 */
var flag = true;

function flags(){
	if(!flag){
		flag = true;
	}
}

function detailSearch(page){
	if(flag){
		drawPage();
	}
	flag = false;
	var detailContent = $('#detailContent').val();
	var sl1 = document.getElementById("sl1");
	console.log(sl1.options[sl1.selectedIndex].value);
	
	$.ajax({
		type: 'post',
		url : 'store/searchList.ajax',
		data : {
			'detailContent' : detailContent,
			'sl1' : sl1.options[sl1.selectedIndex].value,
			'page' : page
		},
		dataType : 'json',
		success: function(data){
			console.log(data.list);
			drawList(data.list);
			
			if(data.total >= 1){
				$('#pagination').twbsPagination({
					startPage : 1,
					totalPages : data.total,
					visiblePages : 5,
					onPageClick : function(e, page){
						detailSearch(page);
						flag = false;
						console.log("data.total : "+data.total);
					}
				});
			}
		},
		error : function(e){
			console.log(e);
		}		
	});	
}

</script>
</html>