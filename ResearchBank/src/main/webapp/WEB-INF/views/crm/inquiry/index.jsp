<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link href="/resources/css/creative.css" rel="stylesheet">
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">
<link href="/resources/css/sb-admin-2.css" rel="stylesheet">
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
	<div style="margin:50px; text-align: center;">
	<h2><p class="p">고객지원실</p></h2>
	</div>

	
	<div role="tabpanel" style="width:300px; margin: 10px 635px; padding:1px; text-align: center;" id="#box2-1">
		<!-- Nav tabs -->

	<ul class="nav nav-pill" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
    <li role="presentation"><a href="#oneone" aria-controls="oneone" role="tab" data-toggle="tab">Profile</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
		</ul><br/>
		</div>
		<!-- Tab panes --><!-- 시작 -->
		<div class="tab-content" style="margin:50px;">
 
 <!-- 챕터1 -->
 <div role="tabpanel" class="tab-pane active" id="home" style="width: 800px; margin: 10px 330px; padding:1px; text-align: center; font-family:p.a" align="center" >

				<!-- 	<colgroup >
						<col width="15%"  /> 글번호
						<col width="*" /> 제목
						<col width="15%" /> 조회수
						<col width="30%" /> 작성일
					</colgroup> -->
					
					<img class="small1" src="/resources/images/inquiry/Q.jpg"><br/><br/><br/>
					 <table class="table table-striped table-bordered table-hover"
                        id="dataTables-example">
					<thead>
						<tr class="info" align="center" >
							<th width="15%">글번호</th>
							<th width="*">제목</th>
							<th width="15%">조회수</th>
							<th width="30%">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(list) > 0}">
								<c:forEach items="${list }" var="row">
									<tr>
										<td align="center">${row.IDX }</td>
										<td class="odd gradeX">
										<c:if test="${row.INQUIRY_STATE=='1'}">
                        <img src="/resources/images/icon_secret.gif">
									</c:if>
										<a href="#this" name="title">
										${row.TITLE }</a>
											<input type="hidden" id="IDX" value="${row.IDX }"></td>
										<td align="center">${row.HIT_CNT }</td>
										<td align="center">${row.REGIST_DATE}</td>
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
				<div align="right">
				<a href="/inquiry/storeInquiryWrite" class="btn" id="write">글쓰기</a>
				</div>
				<div class="paging" align="center">
               ${pagingHtml}
            </div>



			</div>
 <div role="tabpanel" class="tab-pane" id="oneone" style="width: 500px; margin: 30px 480px; padding:1px; text-align: center;">

<!-- 아코디언 시작! -->
<img class="small1" src="/resources/images/inquiry/FAQ.jpg"><br/>
지주 묻는 질문과 답변
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">

			로그인 및 회원가입은 어떻게 하나요?
			</a>
			</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
      							Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo. Leggings
								occaecat craft beer farm-to-table, raw denim aesthetic synth
								nesciunt you probably haven't heard of them accusamus labore
								sustainable VHS.
								</div>
						</div>
					</div>

					 <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
         비밀번호를 잊어버렸어요! </a>
							</h4>
						</div>
						   <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
      							Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo. Leggings
								occaecat craft beer farm-to-table, raw denim aesthetic synth
								nesciunt you probably haven't heard of them accusamus labore
								sustainable VHS.</div>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingThree">
							<h4 class="panel-title">
								<a class="collapsed" data-toggle="collapse"
									data-parent="#accordion" href="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree"> 마일리지
									교환은 어디서 하나요? </a>
							</h4>
						</div>
					  <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo. Leggings
								occaecat craft beer farm-to-table, raw denim aesthetic synth
								nesciunt you probably haven't heard of them accusamus labore
								sustainable VHS.</div>
						</div>
					</div>


					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingFour">
							<h4 class="panel-title">
								<a class="collapsed" data-toggle="collapse"
									data-parent="#accordion" href="#collapseFour"
									aria-expanded="false" aria-controls="collapseFour"> 포인트
									결제/환불방법을 알고싶어요 </a>
							</h4>
						</div>
						<div id="collapseFour" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingFour">
							<div class="panel-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo. Leggings
								occaecat craft beer farm-to-table, raw denim aesthetic synth
								nesciunt you probably haven't heard of them accusamus labore
								sustainable VHS.</div>
						</div>
					</div>

					</div>

				</div>
				
				
			
			
			<div role="tabpanel" class="tab-pane" id="profile" style="width: 800px; margin: 50px 330px; padding:1px; text-align:center;">
			<img class="small1" src="/resources/images/inquiry/M.jpg"> <br/>
				RESEARCH BANK 마일리지 프로그램<br /> 1. 포인트 전환 신청 시기: 매월 1일부터 25일까지<br />
				2. 현금 입금 시기: 포인트 전환 신청을 한 다음 달 영업일 초<br /> 3. 포인트 전환 가능 금액:
				10,000원부터 10,000원 단위로 전환 가능 <br /> 4. 포인트 전환 계좌 이체 수수료: 500원<br />
				(참고: 60,000원 이상 전환 시부터 세금이 붙으므로, 포인트 전환은 1회 50,000원 이하로 시도하시는 편이
				좋습니다)<br /> 5. 계좌오류 등으로 포인트 전환 실패 시, 가입 시 등록한 메일로 '안내 메일'이 발송됩니다.<br />


			</div>
</div>



		<!-- 탭컨텐츠ㅡ누르면 토글하는거 -->

	<!-- </div> -->
	<!-- 탭판넬 ㅡ아코디언-->
	<form id="commonForm" name="commonForm"></form>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
/* 			fn_selectBoardList(1); */
			$("a[name='title']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
			
			$('#myTab a').click(function (e) {
				  e.preventDefault()
				  $(this).tab('show')
				})
			$('#myCollapsible').on('hidden.bs.collapse', function () {
  // do something…
})
		});

		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/inquiry/showInquiryDetail' />");
			comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}
 </script>

</body>
</html>