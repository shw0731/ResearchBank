<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Research!</title>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">
<link href="/resources/css/creative.css" rel="stylesheet">
<link href="/resources/css/board.css" rel="stylesheet">


</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<br />
	<br />
	<br />
	<br />


	<div class="panel-heading" align="center">
		<p style="font-size: 25px;">나의 QNA</p>
		<p style="font-size: 13px;">Research Bank는 회원님의 개인정보를 신중히 취급하며,
			회원님의 동의 없이는 기재하신 회원정보가 공개되지 않습니다.</p>
		<hr />
		<br />
	</div>

	<div class='left-box1' style="font-family: a; font-size: 0.8em;">
		&nbsp;&nbsp;<a href="/mypage">My Page</a>
		<table class="type01">
			<tr>
				<td><a href="/surveyed">참여한 설문조사</a><br /></td>
			</tr>
			<tr>
				<td><a href="/mysurveylist">내가 만든 설문조사</a><br /></td>
			</tr>
			<tr>
				<td><a href="/myqna">나의 QnA</a></td>
			</tr>
			<tr>
				<td><a href="/refundmylist.do">포인트 환전 내역</a><br />
			</tr>
		</table>
	</div>

	<div style="width: 87%">	
		<table class="type04" id="dataTables-example">
		    <colgroup>
		        <col width="15%"/>
		        <col width="*"/>
		        <col width="15%"/>
		        <col width="23%"/>
		    </colgroup>
		    <thead>
		        <tr class="info" align="center"  style="font-size: 0.8em">
		            <th scope="col">글번호</th>
		            <th scope="col">제목</th>
		            <th scope="col">조회수</th>
		            <th scope="col">작성일</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:choose>
		            <c:when test="${fn:length(list) > 0}">
		                <c:forEach items="${list}" var="row">
		                    <tr height="1em" style="font-size: 0.8em">
		                        <td align="center">${row.IDX}</td>
		                         <td class="title"> 
		                         <a href="/inquiry/showInquiryDetail?IDX=${row.IDX }" name="title">${row.TITLE }</a> 
		                         <input type="hidden" id="IDX" value="${row.IDX }"> 
		                          <input type="hidden" id="MEMBER_ID" value="${MEMBER_ID}"> 
		                         </td>    
								
 
		                        <td align="center">${row.HIT_CNT}</td>
		                        <td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${row.REGIST_DATE}" /></td> 
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
	</div>
	<br />
	<br />
	<br />

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

  <!-- <script type="text/javascript">  
$(document).ready(function(){ 
	 $("#write").on("click", function(e){ //글쓰기 버튼 
		e.preventDefault(); fn_openBoardWrite(); }); 
	$("a[name='title']").on("click", function(e){ //제목 
		e.preventDefault(); 
	fn_openBoardDetail($(this)); 
		});  
	}); 
	 function fn_openBoardWrite(){ 
		var comSubmit = new ComSubmit(); 
		comSubmit.setUrl("<c:url value='/sample/openBoardWrite.do' />"); 
		comSubmit.submit(); }  
	function fn_openBoardDetail(obj){ 
			var comSubmit = new ComSubmit(); 
			comSubmit.setUrl("<c:url value='/inquiry/showInquiryDetail' />"); 
			comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();  
			}  
		</script>  -->   
		
<!-- <script type="text/javascript"> 
	$(document).ready(function() {
			      $("a[name='title']").on("click", function(e){ //제목 누르면      
                e.preventDefault();
                fn_openBoard($(this));
            });
            
			      $("#write").on("click", function(e){ //작성하기 버튼
						e.preventDefault();
						fn_insert();
					});
			
			$('#myTab a').click(function (e) {
				  e.preventDefault()
				  $(this).tab('show')
				});
			
			$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
				  e.target // newly activated tab
				  e.relatedTarget // previous active tab
				})
			$("list.REGIST_DATE").val($.format.date(new Date(), 'dd M yy'));
		});
		
		function fn_insert(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/inquiry/storeInquiryWrite' />");
			comSubmit.submit();
		}


		function fn_openBoard(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/inquiry/showInquiryDetail' />");
			comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
			comSubmit.addParam("INQUIRY_STATE", obj.parent().find("#INQUIRY_STATE").val());
			comSubmit.submit();  
		} 
</script>  -->

</body>
</html>