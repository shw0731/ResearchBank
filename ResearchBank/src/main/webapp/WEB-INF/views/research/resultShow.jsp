<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사 결과</title>
<style>
	span{color:red}
</style>
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

<div class="wrap" style="margin:5% 20% 1% 30%;">
	설문조사 제목 : ${map.SURVEY_SUBJECT }<a href="/research/show?survey_idx=${map.SURVEY_IDX }&partmember_id=${MEMBER_ID}" name="part">참여하기</a><br/>
	작성자 : ${map.SURVEY_SUBJECT }<br/>
	참여율 : ${map.CURRENT_PART } / ${map.MAXIMUM_PART } <br/>
	포인트 : ${map.SURVEY_POINT } <br/>
		<c:choose>
			<c:when test="${fn:length(map.conList) > 0}">
				<c:forEach items="${map.conList }" var="row"  varStatus="status">
								
					<div id="conChart${status.index }" style="width: 900px; height: 500px;"></div>
										
				</c:forEach>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${fn:length(map.queList) > 0}">
				
				<c:forEach items="${map.queList }" var="row"  varStatus="status">
					
					<div id="queChart${status.index }" style="width: 900px; height: 500px;" onclick="fn_detail(${status.index},${row.QUESTION_IDX }); return false"></div>
				
				</c:forEach>
			
			</c:when>
		</c:choose>
		<br/>
	
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script src=<c:url value='/resources/js/common.js'/>></script>
<script src=<c:url value='/resources/js/research/jquery.serializeObject.js'/>></script>
<script type="text/javascript">

  
  
	var fn_detail = function(idx, question_idx){
		
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
	function fn_success(data){
		console.log(data);
		var html = "";
		
		
		
	}
</script>
</html>