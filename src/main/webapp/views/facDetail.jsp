<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 -->

</head>
<body>
		<!-- 모달부분 -->
		<div class="modal" id="myModal" tabindex="-1">
                <div class="modal-dialog modal-dialog-scrollable">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    
                    <div class="modal-body">
                   	 <div class="col md-6">
                  		<label class="col-sm-2 col-form-label">회의실</label>
                  	<div class="col-sm-10">
                    	<select class="form-select" aria-label="Default select example" id="facility">
                     		<option selected>==회의실을 선택하세요==</option>
                    	</select>
                  </div>
                </div>
                     	<div class="row mb-3" id="facName">
                     	
                  			<label id="date" for="inputDate" class="col-sm-2 col-form-label">날짜</label>
                  		<div class="col-sm-10">
                   		 	<input type="date" id="book_date" class="form-control">
                  		</div>
                	</div>
               
                  <div class="col-md-6" style="float:left" id="book_start">
                  <label class="col-sm-2 col-form-label">시작</label>
                    <select class="form-select" aria-label="Default select example">
                      <option selected>==시작시간==</option>
                      <option value="09:00:00">09:00</option>
                      <option value="10:00:00">10:00</option>
                      <option value="11:00:00">11:00</option>
                      <option value="12:00:00">12:00</option>
                      <option value="14:00:00">14:00</option>
                      <option value="15:00:00">15:00</option>
                      <option value="16:00:00">16:00</option>
                      <option value="17:00:00">17:00</option>
                    </select>
                  </div>
                        
                  <div class="col-md-6" style="float:left" id="book_end">
                  <label class="col-sm-2 col-form-label">종료</label>
                    <select class="form-select" aria-label="Default select example">
                      <option selected>==종료시간==</option>
                      <option value="10:00:00">10:00</option>
                      <option value="11:00:00">11:00</option>
                      <option value="12:00:00">12:00</option>
                      <option value="14:00:00">14:00</option>
                      <option value="15:00:00">15:00</option>
                      <option value="16:00:00">16:00</option>
                      <option value="17:00:00">17:00</option>
                      <option value="18:00:00">18:00</option>
                    </select>
                  </div>
              
                <br>
                <div class="row mb-3" id="bookContent">
                  <label class="col-sm-2 col-form-label">예약 내용</label>
                  <div class="col-sm-10">
                    <input type="text" id="bookCont" class="form-control">
                  </div>
                </div>              
                
                  <h5 class="card-title">참여자</h5>
          
                <div class="col md-6">
                  <label class="col-sm-2 col-form-label">부서</label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example" id="departure">
                     	<option selected>==부서를 선택하세요==</option>
                    </select>
                  </div>
                </div>
                <div class="col md-6">
                  <label class="col-sm-2 col-form-label">팀</label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example" id="teamList">
						<option selected>==팀을 선택하세요==</option>
                    </select>
                  </div>
                </div>
                <div class="col md-6">
                  	<div class="col-sm-10"  id="empList">
                    <div class="form-check form-switch">
                      <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
                      <label class="form-check-label" for="flexSwitchCheckDefault"></label>
                    </div>
                    </div>
                </div>
                    	
                    </div>
                    <div class="modal-footer">
                    <c:if test="${sessionScope.loginInfo.emp_num eq sessionScope.loginInfo.emp_num}">
                    	<button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">뒤로가기</button>
                      <button type="button" class="btn btn-primary" id="book-btn">수정하기</button>
                    </c:if>
                    <c:if test="${sessionScope.loginInfo.emp_num ne sessionScope.loginInfo.emp_num}">
                    	<button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">뒤로가기</button>
                      <button type="button" class="btn btn-primary" aria-label="Close">확인</button>
                    </c:if>
                      
                    </div>
                  </div>
                </div>
              </div>
            
            <div id="calendar"></div>
            

</body>
<script>
calendar();
function calendar(){
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	   	  slotMinTime : "09:00",
	   	  slotMaxTime : "18:00",
	   	  navLinks:true,
	   	  allDaySlot:true,
	   	  editable:false,
	   	  locale : 'ko',
	   	  headerToolbar : {
	   		  left : 'prev,next today',
	   		  center : 'title',
	   		  right : 'dayGridMonth,timeGridWeek,timeGridDay'
	   	  }, 
	   	  initialView: 'timeGridWeek',
	      events : [
	    	  $.ajax({
	    		  type : 'get',
	    		  url : '/fac/bookList.ajax', 
	    		  dataType:'json',
	    		  success : function(data){
	    			  console.log(data);
	    			  for (var i = 0; i < data.bookList.length; i++) {
						calendar.addEvent({
							id : data.bookList[i].fac_num,
							title : data.bookList[i].fac_name,
							start : data.bookList[i].book_start,
							end : data.bookList[i].book_end
						})
					}
	    		  },
	    		  error:function(e){
	    			  console.log
	    		  }
	    		  
	    	  })], 
	   	  		eventClick : function(){
					$('#myModal').modal('show'); // 제이쿼리 중복으로 뜨지 않았어음
					var emp_num = '${sessionScope.loginInfo.emp_num}';//세션스코프로 내가 작성한 리스트만 수정하기 버튼생성
					$.ajax({
						type : 'get',
						dataType : 'json',
						data : {emp_num:emp_num},
						url : '/fac/update.ajax',
						success : function(data){
							console.log(data);
						},
						error:function(e){
							console.log(e);
						}
					})
	   	  		}
   	  
	    });
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    calendar.render();
	
}





</script>
</html>