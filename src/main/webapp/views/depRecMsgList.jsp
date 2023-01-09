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
<h4>전달사항 리스트</h4>
<a onclick="mainGo('depRecMsgList')">수신함</a>
&nbsp;
<a onclick="mainGo('depSendMsgList')">발신함</a>

<button>글쓰기</button>
<button>삭제</button>

<table>
	<thead>
		<tr>
			<th><input type="checkbox"></th>
			<th>제목</th>
			<th>점포</th>
			<th>작성일</th>		
		</tr>
	</thead>

</table>



<div class="card">
            <div class="card-body">
              <h5 class="card-title"></h5>

              <!-- Disabled and active states -->
              <nav aria-label="...">
                <ul class="pagination">
                  <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item active" aria-current="page">
                    <a class="page-link" href="#">2</a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                  </li>
                </ul>
              </nav><!-- End Disabled and active states -->

            </div>
          </div>

</body>

<script type="text/javascript">

var page = 1;

listCall(page);

function listCall(page){
	$.ajax({
		type:"post",
		url:"/message/list.ajax",
		dataType: "json",
		data : {page},
		sussess:function(data){
			console.log(data);
			drawList(data.list);
			
			$('#pagination').twbsPagination({
				startPage:1,
				totalPages : data.total,
				visiblePages : 5,
				onPageClick : function(e,page){
					listCall(page);
				}
				
			});
		},
		error:function(e){
			console.log(e);
		}
		
	});
}

function drawList(list){
	var content = '';
	
	for(var i=0; i<list.length; i++){
		console.log(list[i]);
		content += '<tr>';
		
		content += '</tr>';
		
	}
	
}


</script>

</html>
