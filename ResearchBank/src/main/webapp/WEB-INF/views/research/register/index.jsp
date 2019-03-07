<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Research!</title>

</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
#opt{
	width:150px;
}
</style>
<script src="/resources/js/research/jQuery.serializeObject.js"></script>

<script type="text/javascript">
	
$(document).ready(function(){
	$('.condition').hide();
	$('#condition').change(function(){
		if(this.checked)
			$('.condition').show();
		else
			$('.condition').hide();
	});
});	
//조건 추가 
var fn_addCon = function(){
			
	var idx = $('.condition').length;
	if(idx<5){
		
		$('.condition').eq(idx-1).after('<div id="condition_subject" class="condition"><strong>조건'+(idx+1)+':</strong><input name="condition_subject'+(idx+1)+'" type="text" >'
		+'<button type="button" id="conAddBtn" onclick="fn_addCon(); return false;">+</button>'
		+'<button type="button" id="conRmBtn" onclick="fn_rmCon('+idx+'); return false;">X</button>'
		+'<div id="condition_option" class="option"><strong>보기1:</strong><input id="opt" name="con_opt'+(idx+1)+'" type="text"></div><div id="condition_option" class="option">'
		+'<strong>보기2:</strong><input id="opt" name="con_opt'+(idx+1)+'" type="text"><button type="button" id="optAddBtn" onclick="fn_addConOpt('+idx+',1); return false;">+</button>	</div></div>');
	 	$('.condition').eq(idx-1).children('button').eq(0).hide(); 
	 	if(idx==4)
	 		$('.condition').eq(idx).children('button').eq(0).hide();
	}else{
		alert("조건은 5개 까지 선택 가능");
	}
}
//조건 제거
var fn_rmCon = function(idx){
	
	
	
	
	$('.condition').eq(idx).remove();
	$('.condition').each(function(idx){
		$(' > strong', this).text('조건'+(idx+1)+':');
		$(' > button', this).eq(1).attr('onclick','fn_rmCon('+idx+')');
		$(' > div', this).each(function(optIdx){
			$(' > input', this).eq(0).attr('name','con_opt'+(idx+1));
			if(optIdx==1){
				$(' > button',this).eq(0).attr('onclick','fn_addConOpt('+idx+','+optIdx+')');
			}else if(optIdx>2){
				$(' > button',this).eq(0).attr('onclick','fn_addConOpt('+idx+','+optIdx+')');
				$(' > button',this).eq(1).attr('onclick','fn_rmConOpt('+idx+','+optIdx+')');
			}
		});
		if($('.condition').eq(idx+1).attr('id') == null){
			$('.condition').eq(idx).children('button').eq(0).show();
		}
	});
		
		
	
}
//조건 보기 추가
var fn_addConOpt = function(conIdx,optIdx){
	if(optIdx<4){
		$('.condition').eq(conIdx).find('div').eq(optIdx).after('<div id="condition_option" class="option">'
			+'<strong>보기'+(optIdx+2)+':</strong>	<input id="opt" name="con_opt'+(conIdx+1)'" type="text">'
			+'<button type="button" id="optAddBtn" onclick="fn_addConOpt('+conIdx+','+(optIdx+1)+'); return false;">+</button>'
			+'<button type="button" id="optRmBtn" onclick="fn_rmConOpt('+conIdx+','+(optIdx+1)+'); return false;">x</button></div>');
		$('.condition').eq(conIdx).find('div').eq(optIdx).find('button').eq(0).hide();
		if(optIdx==3)
			$('.condition').eq(conIdx).find('div').eq(optIdx+1).find('button').eq(0).hide();
	}else{
		alert("보기는 5개 까지 선택 가능");
	}
}
//조건 보기 삭제
var fn_rmConOpt = function(conIdx, optIdx){
	$('.condition').eq(conIdx).find('div').eq(optIdx).remove();
	$('.condition').eq(conIdx).find('div').each(function(idx){
		$(' > strong', this).text('보기'+(idx+1)+':');
		if(idx==2){
			$(' > button',this).eq(0).attr('onclick','fn_addConOpt('+conIdx+','+idx+')');
		}else if(optIdx>2){
			$(' > button',this).eq(0).attr('onclick','fn_addConOpt('+conIdx+','+idx+')');
			$(' > button',this).eq(1).attr('onclick','fn_rmConOpt('+conIdx+','+idx+')');
		}
		
		if($('.condition').eq(conIdx).find('div').eq(idx+1).attr('id') == null){
			$('.condition').eq(conIdx).find('div').eq(idx).children('button').eq(0).show();
		}
	});
	
}
//문항 추가
var fn_addQue = function(){
	var idx = $('.question').length;
	
		
	$('.question').eq(idx-1).after('<div id="question_subject" class="question"><strong>문항'+(idx+1)+':</strong><input name="question[]" type="text" >'
	+'<button type="button" id="queAddBtn" onclick="fn_addQue(); return false;">+</button>'
	+'<button type="button" id="queRmBtn" onclick="fn_rmQue('+idx+'); return false;">X</button>'
	+'<div id="question_option" class="option"><strong>보기1:</strong><input id="opt" name="question[2][]" type="text"></div><div id="question_option" class="option">'
	+'<strong>보기2:</strong><input id="opt" name="question[2][]" type="text"><button type="button" id="optAddBtn" onclick="fn_addQueOpt('+idx+',1); return false;">+</button>	</div>'
	+'<button type="button" id="storeSurvey" onclick="fn_storeSurvey(); return false;">저장</button></div>');
 	$('.question').eq(idx-1).children('button').eq(0).hide(); 
 	$('.question').eq(idx-1).children('button').eq(2).hide(); 
	
}
//문항 제거
var fn_rmQue = function(idx){
	$('.question').eq(idx).remove();
	$('.question').each(function(idx){
		$(' > strong', this).text('문항'+(idx+1)+':');
		$(' > button', this).eq(1).attr('onclick','fn_rmQue('+idx+')');
		$(' > div', this).each(function(optIdx){
			console.log(optIdx+","+idx);
			if(optIdx==1){
				$(' > button',this).eq(0).attr('onclick','fn_addQueOpt('+idx+','+optIdx+')');
			}else if(optIdx>2){
				$(' > button',this).eq(0).attr('onclick','fn_addQueOpt('+idx+','+optIdx+')');
				$(' > button',this).eq(1).attr('onclick','fn_rmQueOpt('+idx+','+optIdx+')');
			}
		});
		if($('.question').eq(idx+1).attr('id') == null){
			$('.question').eq(idx).children('button').eq(0).show();
			$('.question').eq(idx).children('button').eq(2).show();
		}
	});
}
//문항 보기 추가
var fn_addQueOpt = function(queIdx,optIdx){
	if(optIdx<4){
		$('.question').eq(queIdx).find('div').eq(optIdx).after('<div id="question_option" class="option">'
			+'<strong>보기'+(optIdx+2)+':</strong>	<input id="opt" type="text">'
			+'<button type="button" id="optAddBtn" onclick="fn_addQueOpt('+queIdx+','+(optIdx+1)+'); return false;">+</button>'
			+'<button type="button" id="optRmBtn" onclick="fn_rmQueOpt('+queIdx+','+(optIdx+1)+'); return false;">x</button></div>');
		$('.question').eq(queIdx).find('div').eq(optIdx).find('button').eq(0).hide();
		if(optIdx==3)
			$('.question').eq(queIdx).find('div').eq(optIdx+1).find('button').eq(0).hide();
	}else{
		alert("보기는 5개 까지 선택 가능");
	}
}
//문항 보기 제거
var fn_rmQueOpt = function(queIdx, optIdx){
	$('.question').eq(queIdx).find('div').eq(optIdx).remove();
	$('.question').eq(queIdx).find('div').each(function(idx){
		$(' > strong', this).text('보기'+(idx+1)+':');
		if(idx==2){
			$(' > button',this).eq(0).attr('onclick','fn_addQueOpt('+queIdx+','+idx+')');
		}else if(optIdx>2){
			$(' > button',this).eq(0).attr('onclick','fn_addQueOpt('+queIdx+','+idx+')');
			$(' > button',this).eq(1).attr('onclick','fn_rmQueOpt('+queIdx+','+idx+')');
		}
		
		if($('.question').eq(queIdx).find('div').eq(idx+1).attr('id') == null){
			$('.question').eq(queIdx).find('div').eq(idx).children('button').eq(0).show();
		}
	});
}

//설문조사 저장
var fn_storeSurvey = function(){



	 console.log($('#frm').serializeObject()); 
	
}
</script>

<div class="wrap">


<h1>설문조사시작</h1>
<hr />
<form id="frm">
	<div id="survey_subject">
		<strong>제목:</strong><input id="survey_subject" name="survey_subject" type="text">
	
		<input type="checkbox" id="condition" name="conCheck" value="Y">조건
	
	</div>
<br/>
	<div id="condition_subject" class="condition">
		<strong>조건1:</strong><input name="condition[]" type="text">
		
		
		<button type="button" id="conAddBtn" onclick="fn_addCon(); return false;">+</button><br/>
		<div id="condition_option" class="option">
			<strong>보기1:</strong>
			<input id="opt" name="condition[2][]" type="text">
	
		</div>
		<div id="condition_option" class="option">
			<strong>보기2:</strong>
			<input id="opt" name="condition[2][]" type="text">
			<button type="button" id="optAddBtn" onclick="fn_addConOpt(0,1); return false;">+</button>
			
			
		</div>
	</div>
<br/>
	<div id="question_subject" class="question">
		<strong>문항:1</strong><input name="question[]" type="text">
		
		<button type="button" id="queAddBtn" onclick="fn_addQue(); return false;">+</button><br/>
		<div id="question_option" class="option">
			<strong>보기1:</strong>
			<input id="opt" name="question[2][]" type="text">
	
		</div>
		<div id="question_option" class="option">
			<strong>보기2:</strong>
			<input id="opt" name="question[2][]" type="text">
			<button type="button" id="optAddBtn" onclick="fn_addQueOpt(0,1); return false;">+</button>
			
			
		</div>
	</div>
</form>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>