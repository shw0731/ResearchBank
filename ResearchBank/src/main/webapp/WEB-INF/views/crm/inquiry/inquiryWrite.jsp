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

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- <link href="/resources/css/sb-admin-2.css" rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700,900&amp;subset=korean" rel="stylesheet">
<title>Research!</title>
<style>
.small1 { width: 250px; }
.small2 { height: 100px; }

/* thead>tr>th{text-align: center;}
   tbody>tr>td:nth-child(1){width:80px; text-align: center;}
   tbody>tr>td:nth-child(3){width:110px; text-align: center;}
   tbody>tr>td:nth-child(4){width:130px; text-align: center;}
   tbody>tr>td:nth-child(5){width:70px; text-align: center;}
   tbody>tr:HOVER{color:#da8c92;cursor: pointer;}
   .menu-wrap{text-align: right;}
   .form-wrap{text-align: center;}
    */
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
	<div style="margin:3% 20% 1% 20%; text-align: center;">
	<h2><p class="p">고객지원실</p></h2>
	</div>
	
		
		<!-- Tab panes --><!-- 시작 -->
		<div class="tab-content" style="margin:50px;">
 
 <!-- 챕터1 -->
<div role="tabpanel" class="tab-pane active" id="home" style="width: 50%; margin: 1% 25% 10% 25%; padding:1px; text-align: center; font-family:p.a" align="center" >
				<form id="frm">

					<!-- 	<colgroup >
						<col width="15%"  /> 글번호
						<col width="*" /> 제목
						<col width="15%" /> 조회수
						<col width="30%" /> 작성일
					</colgroup> -->
					<img class="small1" src="/resources/images/inquiry/Q.jpg"><br/><br/><br/>
		
			<!-- <tbody> -->
			<img src="/resources/images/icon_secret.gif"> 비밀글
			<input type="radio" value="1" name="INQUIRY_STATE" id="INQUIRY_STATE"/>
				일반글<input type="radio" value="0" name="INQUIRY_STATE" id="INQUIRY_STATE"/>
				 <table class="table table-striped table-bordered table-hover"
                        id="dataTables-example"  >
                        <tbody>
				<tr class="info" align="center" >
					<th scope="row">제목</th>
					<td><input type="text" id="TITLE" name="TITLE"  class="wdp_100">
</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="10%" cols="70%" title="내용" id="CONTENTS" name="CONTENTS">
</textarea>
					</td>
				</tr>
			</tbody></table>
			<div align="right">
				<a href="/inquiry" class="btn" id="list">목록으로</a>
	      <a href="#this" class="btn" id="write">작성하기</a>
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
         fn_insertBoard();
         
      });
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

   </script>
</body>
</html>
