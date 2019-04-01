<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사 결과</title>

<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
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
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
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
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
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

a {
	padding: 15px;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
	<div class="wrap" style="margin: 5% 20% 1% 30%;">
		설문조사 제목 : ${map.SURVEY_SUBJECT }<a
			href="/research/show?survey_idx=${map.SURVEY_IDX }&partmember_id=${MEMBER_ID}"
			name="part">참여하기</a>
			
			<form name="clipboard"><input name="url" type="text"></form>
<a href="javascript:urlClipCopy()">현재 URL을 Clipboard에 복사하기</a>
			
			<br /> 작성자 : ${map.MEMBER_NICKNAME }<br /> 참여율 :
		${map.CURRENT_PART } / ${map.MAXIMUM_PART } <br /> 포인트 :
		${map.SURVEY_POINT } <br />
		참여 비율
		<c:choose>
			<c:when test="${fn:length(map.conList) > 0}">
				<c:forEach items="${map.conList }" var="row" varStatus="status">

					<div id="conChart${status.index }"
						style="width: 800px; height: 500px;"></div>

				</c:forEach>
			</c:when>
		</c:choose>
		문항 <br/>
		<c:choose>
			<c:when test="${fn:length(map.queList) > 0}">

				<c:forEach items="${map.queList }" var="row" varStatus="status">

					<div id="queChart${status.index }"
						style="width: 800px; height: 500px;"
						onclick="fn_detail(${status.index},${row.QUESTION_IDX }); return false"></div>

				</c:forEach>

			</c:when>
		</c:choose>
		<br />

	</div>

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<div role="tabpanel">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">

					<c:forEach items="${map.conList }" var="row" varStatus="status">
						<li role="presentation" class="active"><a
							href="#con${status.index }" aria-controls="con${status.index }"
							role="tab" data-toggle="tab" padding="15px">${row.CONDITION_SUBJECT }
						</a></li>
					</c:forEach>

				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<c:forEach items="${map.conList }" var="row" varStatus="status">
						<c:choose>
							<c:when test="${status.index == 0 }">
								<div role="tabpanel" class="tab-pane active"
									id="con${status.index }">
									<div class="container-fluid">
										<div class="row">
											<div class="col-xs-12 .col-sm-6 .col-md-8">
												<div id="detailAnswer${status.index }" style="width:60%; height:15%;"></div>
											</div>
											<c:forEach var="i" begin="0" end="${row.CONOPT_NUM -1 }">
												<div class="col-md-4">
													<div id="detailCon${status.index }${i}"
														style="width: 30%; height: 15%;"></div>
												</div>

											</c:forEach>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div role="tabpanel" class="tab-pane" id="con${status.index }">
									<div class="container-fluid">
										<div class="row">
									<div class="col-xs-12 .col-sm-6 .col-md-8">
												<div id="detailAnswer${status.index }" style="width:60%; height:15%;"></div>
											</div>
									<c:forEach var="i" begin="0" end="${row.CONOPT_NUM-1 }">

										<div class="col-md-4">
										<div id="detailCon${status.index }${i}"
											style="width: 30%; height: 15%;"></div>
										</div>
									</c:forEach>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>

			</div>
		</div>

	</div>
	
	
<%@ include file="/WEB-INF/views/research/comment.jsp" %>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

<script src=<c:url value='/resources/js/common.js'/>></script>
<script
	src=<c:url value='/resources/js/research/jquery.serializeObject.js'/>></script>
	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script src="/resources/js/research/clipboard.min.js"></script>
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
	
	var detailChart = [];
	for(var idx=0; idx<${fn:length(map.queList)} ; idx++){
		detailChart[idx] = new Array();
		for(var conIdx=0; conIdx<${fn:length(map.conList)}; conIdx++){
			detailChart[idx][conIdx] = new Array();
			for(var i=0; i <5;i++){
				detailChart[idx][conIdx][i]="";
			}
		}
	}
	var queAnswer = new Array();
	for(var idx=0; idx<${fn:length(map.queList)} ; idx++){
		queAnswer[idx] =new Array();
		for(var conIdx=0; conIdx<${fn:length(map.conList)}; conIdx++){
			queAnswer[idx][conIdx] = "";
		}
	}
	function fn_success(data){
		console.log(data);
		
		var html = "";
		google.charts.load("current", {packages:["corechart"]});
		google.charts.setOnLoadCallback(drawDetail(data));
		
		
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
	function drawDetail(data){

		var tmp = 0;
		for(var i in data.conList ){
			console.log(i);
			if(i!=0){
				tmp += data.conList[(i-1)].CONOPT_NUM;
			}
			for(var j=tmp ;j<tmp+(data.conList[i].CONOPT_NUM);j++ ){
				
				
				var answerSum =0;
				for(var k =0 ; k<5 ; k++){
					answerSum += eval('data.detailList['+j+'].CON'+i+'_QUESTION'+k);
				}
				if(answerSum==0){
					break;
				}
				var options = {									
	  	                  title: eval('data.conList['+i+'].CON_OPT'+(j-tmp)),
	  	                  pieHole: 0.4,
	  	                  width:300
	  	                };
				var dataChart = google.visualization.arrayToDataTable([
		          		['조건에따른 답변', '선택수'],
		          		[data.question[0].QUE_OPT0, eval('data.detailList['+j+'].CON'+i+'_QUESTION0')],
		          		[data.question[0].QUE_OPT1, eval('data.detailList['+j+'].CON'+i+'_QUESTION1')],
						[data.question[0].QUE_OPT2, eval('data.detailList['+j+'].CON'+i+'_QUESTION2')],
						[data.question[0].QUE_OPT3, eval('data.detailList['+j+'].CON'+i+'_QUESTION3')],
						[data.question[0].QUE_OPT4, eval('data.detailList['+j+'].CON'+i+'_QUESTION4')]
				
		          		
		        	]);
					console.log(eval('detailCon'+i+(j-tmp)));	
				
					
					
					detailChart[data.idx][i][j-tmp] = new google.visualization.PieChart(document.getElementById('detailCon'+i+(j-tmp)));
					detailChart[data.idx][i][j-tmp].draw(dataChart, options);
			}
			
			
			var options = {
					title: eval('data.question[0].QUESTION_SUBJECT'),
					pieHole:0.4
			}
			var dataChart = google.visualization.arrayToDataTable([
	      		['조건에따른 답변', '선택수'],
	      		[data.question[0].QUE_OPT0, data.queAnswer.ANSWER0],
	      		[data.question[0].QUE_OPT1, data.queAnswer.ANSWER1],
				[data.question[0].QUE_OPT2, data.queAnswer.ANSWER2],
				[data.question[0].QUE_OPT3, data.queAnswer.ANSWER3],
				[data.question[0].QUE_OPT4, data.queAnswer.ANSWER4]
		
	      		
	    	]);
			
			queAnswer[data.idx][i]=new google.visualization.PieChart(document.getElementById('detailAnswer'+i));
			queAnswer[data.idx][i].draw(dataChart, options);
		}
		
		
	}
	
	  function urlClipCopy() { 
    	  var f = document.clipboard.url;
    	  f.value = document.location.href;
    	  f.select() ;
    	  therange=f.createTextRange() ;
    	  therange.execCommand("Copy");
    	  alert("클립보드로 URL이 복사되었습니다.");
    	  }
	  
	  
</script>
</html>