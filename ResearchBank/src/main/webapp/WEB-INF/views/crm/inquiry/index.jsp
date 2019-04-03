<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link href="/resources/css/creative.css" rel="stylesheet">
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">
<link href="/resources/css/board.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700,900&amp;subset=korean" rel="stylesheet">

<title>Research!</title>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
</head>
<body>
	<br />
	<br />
	<br />


	<!-- Nav tabs -->
	<div role="tabpanel" style="width: 50%; margin: 0% 20% 1% 37%; padding: 1px; text-align: center; font-family: Eng;  font-weight: bold ;font-size: 30px;" id="#box2-1">
	<%@ include file="/WEB-INF/views/crm/inquiry/top.jsp"%>
		</div>
		
		<hr/>
		<!-- Tab panes --><!-- 시작 -->
		<div class="tab-content">
 
 	<!-- 챕터1 -->	
 	<div role="tabpanel" class="tab-pane active" id="home"
 	style=" width: 70%; margin: 3% 25% 2% 15%; padding: 1px; font-family:a">
	<%@ include file="/WEB-INF/views/crm/inquiry/qna.jsp"%>
			</div>
			
 	<div role="tabpanel" class="tab-pane" id="oneone" style="width: 40%; margin: 5% 25% 2% 30%; padding: 1px; text-align: center;">
	<%@ include file="/WEB-INF/views/crm/inquiry/faq.jsp"%>
	</div>
			
	<div role="tabpanel" class="tab-pane" id="profile" style="width: 50%; margin: 5% 25% 2% 35%; padding: 1px;">
	<%@ include file="/WEB-INF/views/crm/inquiry/milige.jsp"%>
	</div>
			
	<div role="tabpanel" class="tab-pane" id="notice" style=" width: 70%; margin: 0% 25% 2% 14%; padding: 1px; font-family:a">
 	<%@ include file="/WEB-INF/views/crm/notice/index.jsp"%>
	</div>



</div>

		<!-- 탭컨텐츠ㅡ누르면 토글하는거 -->

	<!-- </div> -->
	<!-- 탭판넬 ㅡ아코디언-->
	<form id="commonForm" name="commonForm"></form>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	
	<script type="text/javascript">
		$(document).ready(function() {
			      $("a[name='Ititle']").on("click", function(e){ //제목 누르면
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
		
 </script>

</body>
</html>