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
		
            
            <div id="calendar"></div>
            

</body>
<script>
calendar();
function calendar(){
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	   	  slotMinRows : "09:00",
	   	  slotMaxTim : "18:00",
	   	  editable : 'false',
	   	  allDaySlot : 'false',
	      initialView: 'timeGridWeek',
	      /*events : [
	    	  $.ajax({
	    		  type : 'get',
	    		  url : '/fac/regList.ajax', 
	    		  
	    		  
	    	  });
	      ]*/
	   	  
	    });
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    calendar.render();
	
}





</script>
</html>