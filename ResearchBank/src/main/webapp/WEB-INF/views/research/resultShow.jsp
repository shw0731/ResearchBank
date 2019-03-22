<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사 결과</title>

<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      
      
      
     
      
      
      function drawChart() {
    	
    	  //조건 결과 차트 그리기
    	  <c:choose>
  			<c:when test="${fn:length(map.conList) > 0}">
  				<c:forEach items="${map.conList }" var="row"  varStatus="status">
  			  		var options = {
  	                  title: '${row.CONDITION_SUBJECT}',
  	                  pieHole: 0.4,
  	                };
  					var data = google.visualization.arrayToDataTable([
  		          		['조건항목', '선택수'],
  		          		['${row.CON_OPT0 }', ${map.conAList[status.index].CONDITION0 }],
  		          		['${row.CON_OPT1 }', ${map.conAList[status.index].CONDITION1 }]
  		          	<c:choose>
						<c:when test="${row.CON_OPT2 !=null}">
						,['${row.CON_OPT2 }', ${map.conAList[status.index].CONDITION2 }]
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${row.CON_OPT3 !=null}">
						,['${row.CON_OPT3 }', ${map.conAList[status.index].CONDITION3 }]	
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${row.CON_OP4 !=null}">
						,['${row.CON_OPT4 }', ${map.conAList[status.index].CONDITION4 }]	
						</c:when>
					</c:choose>
  		          		
  		          		
  		          		
  		        	]);
  					
  					var conChart${status.index} = new google.visualization.PieChart(document.getElementById('conChart${status.index}'));
        			conChart${status.index}.draw(data, options);
  				</c:forEach>
  			</c:when>
  		</c:choose>
  	<c:choose>
		<c:when test="${fn:length(map.queList) > 0}">
			
			<c:forEach items="${map.queList }" var="row"  varStatus="status">
					var options = {
	                  title: '${row.QUESTION_SUBJECT}',
	                  pieHole: 0.4,
	                };
					var data = google.visualization.arrayToDataTable([
  		          		['문항항목', '선택수'],
  		          		['${row.QUE_OPT0 }', ${map.queAList[status.index].QUESTION0 }],
  		          		['${row.QUE_OPT1 }', ${map.queAList[status.index].QUESTION1 }]
  		          	<c:choose>
						<c:when test="${row.QUE_OPT2 !=null}">
						,['${row.QUE_OPT2 }', ${map.queAList[status.index].QUESTION2 }]
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${row.QUE_OPT3 !=null}">
						,['${row.QUE_OPT3 }', ${map.queAList[status.index].QUESTION3 }]	
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${row.QUE_OPT4 !=null}">
						,['${row.QUE_OPT4 }', ${map.queAList[status.index].QUESTION4 }]	
						</c:when>
					</c:choose>
					]);
					var queChart${status.index} = new google.visualization.PieChart(document.getElementById('queChart${status.index}'));
					queChart${status.index}.draw(data, options);
				
				
			</c:forEach>
		</c:when>
	</c:choose>
      }
      
    	 
		
      
    </script>
  
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
	.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 15% auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  width: 90%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}
a{
	padding:15px;
}
.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
</style>
<div class="wrap" style="margin:5% 20% 1% 30%;">
	설문조사 제목 : ${map.SURVEY_SUBJECT }<a href="/research/show?survey_idx=${map.SURVEY_IDX }&partmember_id=${MEMBER_ID}" name="part">참여하기</a><br/>
	작성자 : ${map.SURVEY_SUBJECT }<br/>
	참여율 : ${map.CURRENT_PART } / ${map.MAXIMUM_PART } <br/>
	포인트 : ${map.SURVEY_POINT } <br/>
		<c:choose>
			<c:when test="${fn:length(map.conList) > 0}">
				<c:forEach items="${map.conList }" var="row"  varStatus="status">
								
					<div id="conChart${status.index }" style="width: 800px; height: 500px;"></div>
										
				</c:forEach>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${fn:length(map.queList) > 0}">
				
				<c:forEach items="${map.queList }" var="row"  varStatus="status">
					
					<div id="queChart${status.index }" style="width: 800px; height: 500px;" onclick="fn_detail(${status.index},${row.QUESTION_IDX }); return false"></div>
				
				</c:forEach>
			
			</c:when>
		</c:choose>
		<br/>
	
</div>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
			<div role="tabpanel">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
				
  						<c:forEach items="${map.conList }" var="row"  varStatus="status">
  							<li role="presentation" class="active"><a href="#con${status.index }"
							aria-controls="con${status.index }" role="tab" data-toggle="tab" padding="15px">${row.CONDITION_SUBJECT } </a></li>
  						</c:forEach>
					
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<c:forEach items="${map.conList }" var="row"  varStatus="status">
						<c:choose>
							<c:when test="${status.index == 0 }">
								<div role="tabpanel" class="tab-pane active" id="con${status.index }">
									
									<div id="detailCon${status.index }" style="width: 600px; height: 350px;"></div>
									
								</div>
							</c:when>
							<c:otherwise>
								<div role="tabpanel" class="tab-pane" id="con${status.index }">
									<div id="detailCon${status.index }" style="width: 600px; height: 350px;"></div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>

			</div>
		</div>

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script src=<c:url value='/resources/js/common.js'/>></script>
<script src=<c:url value='/resources/js/research/jquery.serializeObject.js'/>></script>
<script type="text/javascript">

  
  
	var fn_detail = function(idx, question_idx){
		<c:choose>
			<c:when test="${!(fn:length(map.conList) > 0)}">
				return false;
			</c:when>
		</c:choose>
		var json ={
			"survey_idx":${map.SURVEY_IDX},
			"question_idx":question_idx,
			"idx":idx
		};
		
		var jsonData = JSON.stringify(json);
		console.log(jsonData);
		$.ajax({
			type: "POST",
			url: "/research/resultShowDetail",
			dataType: "json",
			data: jsonData,
			contentType:"application/json;charset=UTF-8",
			success: function(data,idx){
				fn_success(data);
				console.log(idx);
			},
			error:function(xhr,status, err){
				alert("error: "+err);
			}
		});
	}
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	var modal = document.getElementById('myModal');
	
	function fn_success(data){
		console.log(data);
		var html = "";
		
		for(var i in data.conList ){
			for(var j=i*5 ;j<(i+1)*5;j++ ){
				
				if(data.conList[i].CON_OPT+j ==null){
					break;
				}
				var options = {									
	  	                  title: eval('data.conList['+i+'].CON_OPT'+j),
	  	                  pieHole: 0.4,
	  	                };
				var data = google.visualization.arrayToDataTable([
		          		['조건에따른 답변', '선택수'],
		          		[data.question.QUE_OPT0, eval('data.detailList['+j+'].CON'+i+'QUESTION0')],
		          		[data.question.QUE_OPT1, eval('data.detailList['+j+'].CON'+i+'QUESTION1')],
						[data.question.QUE_OPT2, eval('data.detailList['+j+'].CON'+i+'QUESTION2')],
						[data.question.QUE_OPT3, eval('data.detailList['+j+'].CON'+i+'QUESTION3')],
						[data.question.QUE_OPT4, eval('data.detailList['+j+'].CON'+i+'QUESTION4')]
				
		          		
		        	]);
					
					console.log(eval('detailCon'+j));
					var conChart${status.index} = new google.visualization.PieChart(document.getElementById('detailCon'+j));
    				conChart${status.index}.draw(data, options);
			}
		}
		
		
		
		modal.style.display = "block";
		
		
	}
	span.onclick = function() {
		  modal.style.display = "none";
		}
	window.onclick = function(event) {
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
		}
</script>
</html>