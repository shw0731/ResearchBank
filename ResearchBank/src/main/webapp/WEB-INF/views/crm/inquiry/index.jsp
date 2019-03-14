<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link href="/resources/css/creative.css" rel="stylesheet">
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">
<link href="/resources/css/board.css" rel="stylesheet">

<!-- <link href="/resources/css/sb-admin-2.css" rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700,900&amp;subset=korean" rel="stylesheet">
<title>Research!</title>

<style>
.small1 { width: 250px; }
.small2 { height: 60px; }

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
#box1-1{ background-color: #e2e2e2; }
}
p{
font-family: 'Noto Sans KR', sans-serif;
}
p.a{
 font-weight: 300;
}

</style>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
</head>
<body>
<div >
	<br />
	<br />
	<br />


	
	<div role="tabpanel" style="width: 50%; margin: 5% 20% 1% 30%; padding: 1px; text-align: center; font-family: Eng; font-size: 25px;" id="#box2-1">

		<!-- Nav tabs -->

	<ul class="nav nav-pill" role="tablist">
    <li role="presentation" class="active">
    <a href="#home" aria-controls="home" role="tab" data-toggle="tab">QNA</a></li>
    <li role="presentation">
    <a href="#oneone" aria-controls="oneone" role="tab" data-toggle="tab">FAQ</a></li>
    <li role="presentation">
    <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Milige</a></li>
    <li role="presentation">
    <a href="#notice" aria-controls="notice" role="tab" data-toggle="tab">Notice</a></li>
    <li role="presentation">
    <a href="#notice2" aria-controls="notice2" role="tab" data-toggle="tab">Operation</a></li>
		</ul><br/>
	
		</div>
		<!-- Tab panes --><!-- 시작 -->
		<div class="tab-content">
 
 <!-- 챕터1 -->
 <div role="tabpanel" class="tab-pane active" id="home"
 style=" width: 50%; margin: 1% 25% 2% 26%; padding: 1px; font-family:p.a" align="center" >

				<!-- 	<colgroup >
			
						<col width="15%"  /> 글번호
						<col width="*" /> 제목
						<col width="15%" /> 조회수
						<col width="30%" /> 작성일
					</colgroup> -->
		
					<form id=frm>
					 <table class="type04"
                        id="dataTables-example">
					<thead>
						<tr class="info" align="center" >
				<!-- 			<th scope="row" width="15%">글번호</th> -->
							<th scope="row" width="*">제목</th>
							<th scope="row" width="10%">조회수</th>
							<th scope="row" width="10%">직성자</th>
							<th scope="row" width="25%">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(list) > 0}">
								<c:forEach items="${list }" var="row">
							
									<tr>
										<%-- <td align="center">${row.IDX }</td> --%>
										<td class="odd gradeX">
										<c:if test="${row.INQUIRY_STATE=='1'}">
                        <img src="/resources/images/icon_secret.gif">
									</c:if>
							
    						   <c:choose>
                                <c:when test="${row.INQUIRY_STATE == '0'}">
                               		 <a href="#this" name="title">${row.TITLE }</a>
                                     <input type="hidden" id="IDX" value="${row.IDX }">
                                     <input type="hidden" id="MEMBER_ID" value="${row.MEMBER_ID}">
                                </c:when>
                                <c:when test="${MEMBER_ID == null}">
                                	${row.TITLE }
                                </c:when>
                                
                                <c:otherwise><!-- 비밀글이면 -->
									<c:choose>
                                		<c:when test="${row.MEMBER_ID == MEMBER_ID  || ROLE_ID == '1' || row.PARENTS_ID == MEMBER_ID}"> <!-- 비밀글인데 관리자거나 아이디 같으면 -->
                                		 <a href="#this" name="title">${row.TITLE }</a>
                              	 	    <input type="hidden" id="IDX" value="${row.IDX }">
                             		     <input type="hidden" id="MEMBER_ID" value="${row.MEMBER_ID}">
                            	        <input type="hidden" id="INQUIRY_STATE" value="${row.INQUIRY_STATE}">
                                		</c:when>
                                		<c:otherwise> <!-- 비밀글인데 관리자도 아니고 아이디도 같지 않으면 -->
                                			 ${row.TITLE }
                                		</c:otherwise>
                                </c:choose>
                                		</c:otherwise>
                                		</c:choose>
		</td>					
										<td align="center">${row.HIT_CNT }</td>
										<td align="center">${row.MEMBER_NICKNAME}</td>
										<td align="center"><fmt:formatDate value="${row.REGIST_DATE}" pattern="yyyy-MM-dd"/></td>
									</tr>

								</c:forEach>
							</c:when>

							 <c:otherwise>
								<tr>
									<td colspan="5">조회된 결과가 없습니다.</td>
								</tr>
							</c:otherwise>
							
							
						</c:choose>
					</tbody>
					
				</table>
				</form>
				 <c:if test="${MEMBER_ID != null }">
				<div align="right">
				<a href="#this" class="btn" id="write">작성하기</a>
				</div>
				</c:if>
				<div class="paging" align="center">
               ${pagingHtml}
            </div>
<form id="commonForm" name="commonForm"></form>


			</div>
 <div role="tabpanel" class="tab-pane" id="oneone" style="width: 40%; margin: 2% 25% 2% 30%; padding: 1px; text-align: center;">

<!-- 아코디언 시작! -->
<br/>
지주 묻는 질문과 답변<br/>
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">

			로그인 및 회원가입은 어떻게 하나요?
			</a>
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
				
			
			<div role="tabpanel" class="tab-pane" id="profile" style="width: 50%; margin: 5% 25% 2% 26%; padding: 1px; text-align: center;">
						
				RESEARCH BANK 마일리지 프로그램<br /> 1. 포인트 전환 신청 시기: 매월 1일부터 25일까지<br />
				2. 현금 입금 시기: 포인트 전환 신청을 한 다음 달 영업일 초<br /> 3. 포인트 전환 가능 금액:
				10,000원부터 10,000원 단위로 전환 가능 <br /> 4. 포인트 전환 계좌 이체 수수료: 500원<br />
				(참고: 60,000원 이상 전환 시부터 세금이 붙으므로, 포인트 전환은 1회 50,000원 이하로 시도하시는 편이
				좋습니다)<br /> 5. 계좌오류 등으로 포인트 전환 실패 시, 가입 시 등록한 메일로 '안내 메일'이 발송됩니다.<br />


			</div>
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
			      $("a[name='title']").on("click", function(e){ //제목 
                e.preventDefault();
                fn_openBoardDetail($(this));
            });
            
			      $("#write").on("click", function(e){ //작성하기 버튼
						e.preventDefault();
						fn_insertBoard();
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
		
		function fn_insertBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/inquiry/storeInquiryWrite' />");
			comSubmit.submit();
		}


		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/inquiry/showInquiryDetail' />");
			comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
			comSubmit.addParam("INQUIRY_STATE", obj.parent().find("#INQUIRY_STATE").val());
			comSubmit.submit();
		}
		
 </script>

</body>
</html>