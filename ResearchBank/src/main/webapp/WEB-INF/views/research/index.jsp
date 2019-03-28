<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Research!</title>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">
<link href="/resources/css/creative.css" rel="stylesheet">
<link href="/resources/css/board.css" rel="stylesheet">

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<script src="/resources/js/research/research.js"></script>
	<br />
	<br />
		<br />
	<div class="row">
		<div class="col-lg-8 mx-auto text-center">
			<h2 class="section-heading">Let's Get Survey!</h2>
			<p class="mb-5">Do it and make some money</p>
		</div> 
	</div>
	<hr />
	
	
	<div style="margin: 5% 15% 10% 15%" align="center">
		<h1 align="center">설문조사 리스트</h1>
		<br>
		<table class="type04" id="dataTables-example">
			<thead>
				<tr class="info" align="center" style="font-size: 0.9em">
					<th width="13%">포인트</th>
					<th width="*">제목</th>
					<th width="13%">참여수</th>
					<th width="18%">마감일</th>
					<th width="13%">작성자</th>
					<th width="11%">조회수</th>
					 
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach items="${list }" var="row">
						
							<tr  height="3em" style="font-size: 1em">
								<td align="center">${row.SURVEY_POINT}</td>
								<td class="odd gradeX">
								<a	href="/research/resultShow?survey_idx=${row.SURVEY_IDX }&member_id=${MEMBER_ID}" name="title">
									${row.SURVEY_SUBJECT }
								</a> 
								<input type="hidden" id="survey_idx" value="${row.SURVEY_IDX }"></td>
								<td align="center">${row.CURRENT_PART }/${row.MAXIMUM_PART }</td>
								<td align="center"><fmt:formatDate pattern="yyy-MM-dd" value="${row.DEADLINE_DATE}"/></td>
								<td align="center">${row.MEMBER_NICKNAME}</td>
								<td align="center">${row.SURVEY_HITCOUNT}</td>
								
								
							</tr>
						</c:forEach>
					</c:when>

					<c:otherwise>
						<tr>
							<td colspan="4">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>


				</c:choose>
			</tbody>

		</table>
		<br />


		<div class="paging" align="center">${pagingHtml}</div>
<br />
		<form id="search" align="center">
			<select class="slcte" name="searchNum" id="searchNum">
				<option value="0">제목</option>
				<option value="1">작성자</option>
			</select> <input class="txte" type="text" name="isSearch" id="isSearch" /> <span
				class="btn btnC_03 btnP_04 mr10">
				<button type="button" onclick="fn_search();">검색</button>
			</span>
		</form>



	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>