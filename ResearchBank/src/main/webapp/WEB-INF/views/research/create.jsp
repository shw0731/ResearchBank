<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>
<meta charset="UTF-8">
<title>Research!</title>

<style>
input[type=text] {
  width: 80%;
  padding: 6px 8px;
  margin: 4px 0;
  box-sizing: border-box;
}


.button {
  display: block;
  font-size: $font_size;
  text-align: center;
  line-height: $height;
  text-decoration: none;
  color: $txt_color;
  background-color: $bg;
  border-radius: 4px;
  @include middle($width, $height);
  @include text-shadow(0 -1px -1px darken($bg, 7%));
  @include box-shadow(
    0 4px 0 darken($bg, 7%),
    0 5px 5px 1px $bg_shadow);
  @include transition(all .15s ease-in-out);
  
  &:hover{
    background-color: $bg_hover;
    @include text-shadow(0 -1px -1px darken($bg_hover, 7%));
    @include box-shadow(
      0 4px 0 darken($bg_hover, 7%),
      0 5px 5px 1px $bg_shadow);
  }
  &:active {
    margin-top: (-$height)/2 + 4;
    @include box-shadow(none);
  }
}
</style>


</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
#opt{
	width:70%;
}

</style>

<script src="/resources/js/research/jquery.serializeObject.js"></script>
<script src="/resources/js/research/research.js"></script>
<script type="text/javascript">
	
$(document).ready(function(){
	$('.condition').hide();
	$('#condition').change(function(){
		if(this.checked){
			$('.condition').show();
			
				$('#conCheck').attr('value','Y');
		}else{
			$('.condition').hide();
			
				$('#conCheck').attr('value','N');
			
		}
	});
	$.ajaxSetup({
	    headers: {
	      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
	    }
	  });
});	
function Doconfirm() {
	var inputchk = $("#conCheck").val();
	var inputSubject = $("input[name=survey_subject]").val();
	var inputDdate = $("#deadline_date").val();
	var inputPoint = $("#survey_point").val();
	var inputMaxPart = $("#maximum_part").val();

	
	if (inputSubject.length == 0) {
		alert("설문제목을 입력하여 주십시오.");
		$("#survey_subject").focus();
		return;
	}
	if (inputDdate.length == 0) {
		alert("설문 마감일을 입력하여 주십시오.");
		$("#deadline_date").focus();
		return;
	}
	if (inputPoint.length == 0) {
		alert("설문조사 포인트를 입력하여 주십시오.");
		$("#survey_point").focus();
		return;
	}
	if (inputMaxPart.length == 0) {
		alert("총 참여자수를 입력하여 주십시오.");
		$("#maximum_part").focus();
		return;
	}
	
	if (confirm("설문조사 작성을 완료하시겠습니까?")) {
		alert("설문조사를 전송하였습니다!");
		fn_storeSurvey(); return false;
	}
}
</script>



<div class="wrap" style="margin:5% 20% 1% 30%;">

<h1>설문조사등록</h1>
<hr />
<form id="frm" class="form-horizontal">
	<div class="row">
	
		<label for="survey_subject" class="col-sm-2 control-label">제목:</label>
		<div class="col-sm-8">
			<input id="survey_subject" class="form-control" name="survey_subject" type="text"><br/>
		</div>
		<div class="col-sm-2">
			<input type="checkbox" id="condition" value="Y">조건<br/>
		</div>
		<label for="deadline_date" class="col-sm-2 control-label">마감일:</label>
		<div class="col-sm-10">
			<input type="date" class="form-control" id="deadline_date" name="deadline_date"><br/>
		</div>
		<label for="survey_point" class="col-sm-2 control-label">설문조사 포인트:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="survey_point" name="survey_point"><br/>
		</div>
		<label for="maximum_part" class="col-sm-2 control-label">총 참여자 수:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="maximum_part" name="maximum_part"><br/>
		</div>
	
	</div>	
		
		<input type="hidden" name="member_id" value="${MEMBER_ID}">
		<input type="hidden" id="conCheck" name="conCheck" value="N">
		
	
<br/>
	
	<div id="condition_subject" class="condition">
		남자,여자 등 구분하는 항목을 넣으세요 <br/>
		<strong>조건 1:</strong>
		<input name="condition[0][condition_subject]" type="text" >
		<input type="hidden" name="condition[0][condition_order]" value=0>
		<input type="hidden" name="condition[0][conOpt_num]" value=2>
		<button type="button" id="conAddBtn" onclick="fn_addCon(); return false;">+</button><br/>
		<div id="condition_option" class="option">
			<strong>보기1:</strong>
			<input id="opt" name="condition[0][con_opt][0]" type="text">
	
		</div>
		<div id="condition_option" class="option">
			<strong>보기2:</strong>
			<input id="opt" name="condition[0][con_opt][1]" type="text">
			<button type="button" id="optAddBtn" onclick="fn_addConOpt(0,1); return false;">+</button>
			
			
		</div>
	</div>
<br/>
	<div id="question_subject" class="question">
		<strong>문항:1</strong><input name="question[0][question_subject]" type="text">
		<input type="hidden" name="question[0][question_order]" value=0>
		<input type="hidden" name="question[0][queOpt_num]" value=2>
		<button type="button" id="queAddBtn" onclick="fn_addQue(); return false;">+</button><br/>
		<div id="question_option" class="option">
			<strong>보기1:</strong>
			<input id="opt" name="question[0][que_opt][0]" type="text">
	
		</div>
		<div id="question_option" class="option">
			<strong>보기2:</strong>
			<input id="opt" name="question[0][que_opt][1]" type="text">
			<button type="button" id="optAddBtn" onclick="fn_addQueOpt(0,1); return false;">+</button>
			
			
		</div>
		<button type="button" id="storeSurvey" onclick="Doconfirm();">저장</button>
	</div>
	
</form>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
