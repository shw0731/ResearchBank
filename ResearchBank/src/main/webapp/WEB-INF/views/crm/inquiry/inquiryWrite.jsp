<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link href="/resources/css/creative.css" rel="stylesheet">
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">
<script type="text/javascript" src="ttps://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
<script type="text/javascript" src="/inquiry/jquery.validate.min.js"></script>
<link href="/resources/css/board.css" rel="stylesheet">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- <link href="/resources/css/sb-admin-2.css" rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700,900&amp;subset=korean" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js">
<title>Research!</title>
<style>
.small1 { width: 250px; }
.small2 { height: 100px; }


#wrap .box{ 
    width:300px;
    height:300px;
    margin:0 auto;
}

p{
font-family: 'Noto Sans KR', sans-serif;
}
p.a{
 font-weight: 300;
}

</style>
</head>
<body>
	
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
<br />
	<br />
	<br />
<div role="tabpanel" style="width: 50%; margin: 0% 20% 1% 30%; padding: 1px; text-align: center; font-family: Eng;  font-weight: bold ;font-size: 30px;" id="#box2-1">
		<!-- Nav tabs -->
	<%@ include file="/WEB-INF/views/crm/inquiry/top.jsp"%>
		</div>
		
			<hr/>
		
		 
 <!-- 챕터1 -->		<div class="tab-content">
<div role="tabpanel" class="tab-pane active" id="home"
 	style=" width: 70%; margin: 3% 25% 2% 15%; padding: 1px; font-family:a">
 		<div class='left-box' style="font-family:a">1:1 QnA</div>
 		
				<form id="frm" name="frm" action="/inquiry/createInquiry">
			<!-- <tbody> -->
			<img src="/resources/images/icon_secret.gif"> 비밀글
			<input type="checkbox" name="INQUIRY_STATE" id="INQUIRY_STATE" value="1"/>
				  <table class="type04"
                        id="dataTables-example">
                        <tbody>
				<tr class="info" align="center" >
					<th scope="row" width="8%">제목</th>
					<td><input type="text" id="TITLE" name="TITLE"  style="width:100%;">
</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="10%" cols="100%" title="내용" id="CONTENTS" name="CONTENTS" >
</textarea>
<input type="hidden" name="MEMBER_ID" value="${MEMBER_ID}">
  <input type="hidden" id="INQUIRY_STATE" value="${row.INQUIRY_STAT}">
					</td>
				</tr>
			</tbody></table>
			<div align="right">
				<a href="/inquiry" class="btn" id="list">목록으로</a>
	   <!--    <a href="#this" class="btn" id="write">작성하기</a> -->
			<input type="button" class="btn" value="작성하기" onclick="fn_error();" />

		</div>
 		</form>
	</div>
	
	</div>
	
		<form id="commonForm" name="commonForm"></form>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
  <script type="text/javascript">
  $(document).ready(function(){
      $("#write").on("click", function(e){ //작성하기 버튼
         e.preventDefault();
      	fn_error();
         fn_insertBoard();
         
      });
      
      $('#write').val().replaceAll(/\n/g, "<br>");
      $('#text').val().replace(/\n/g, "<br>")
   });
 

   function fn_openBoardList(){
      var comSubmit = new ComSubmit();
      comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
      comSubmit.submit();
   }
   
   function fn_insertBoard(){
      var comSubmit = new ComSubmit("frm");
      comSubmit.setUrl("<c:url value='/inquiry/createInquiry' />");
      comSubmit.submit();
   }
   
   function fn_error() {
		var title= $("#TITLE").val;
		var contents= $("#CONTENTS").val;
		
		if(document.frm.TITLE.value == "") { alert("제목을 입력해 주세요."); $("#TITLE").focus(); return; }
		
		if(document.frm.CONTENTS.value == "") { alert("내용을 입력해 주세요."); $("#CONTENTS").focus(); return; }
		
		
		
		if(confirm("등록 하시겠습니까?")) {
			alert("등록되었습니다.");
			document.frm.submit();
		}

	   
   }
 
   </script>
</body>
</html>
