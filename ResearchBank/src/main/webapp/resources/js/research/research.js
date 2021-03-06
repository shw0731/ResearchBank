
(function($){
    $.fn.serializeObject = function(){

        var self = this,
            json = {},
            push_counters = {},
            patterns = {
                "validate": /^[a-zA-Z][a-zA-Z0-9_]*(?:\[(?:\d*|[a-zA-Z0-9_]+)\])*$/,
                "key":      /[a-zA-Z0-9_]+|(?=\[\])/g,
                "push":     /^$/,
                "fixed":    /^\d+$/,
                "named":    /^[a-zA-Z0-9_]+$/
            };


        this.build = function(base, key, value){
            base[key] = value;
            return base;
        };

        this.push_counter = function(key){
            if(push_counters[key] === undefined){
                push_counters[key] = 0;
            }
            return push_counters[key]++;
        };

        $.each($(this).serializeArray(), function(){

            // skip invalid keys
            if(!patterns.validate.test(this.name)){
                return;
            }

            var k,
                keys = this.name.match(patterns.key),
                merge = this.value,
                reverse_key = this.name;

            while((k = keys.pop()) !== undefined){

                // adjust reverse_key
                reverse_key = reverse_key.replace(new RegExp("\\[" + k + "\\]$"), '');

                // push
                if(k.match(patterns.push)){
                    merge = self.build([], self.push_counter(reverse_key), merge);
                }

                // fixed
                else if(k.match(patterns.fixed)){
                    merge = self.build([], k, merge);
                }

                // named
                else if(k.match(patterns.named)){
                    merge = self.build({}, k, merge);
                }
            }

            json = $.extend(true, json, merge);
        });

        return json;
    };
})(jQuery);

//조건 추가 
var fn_addCon = function(){
			
	var idx = $('.condition').length;
	if(idx<5){
		
		$('.condition').eq(idx-1).after('<div id="condition_subject" class="condition"><strong>조건'+(idx+1)+':</strong><input name="condition['+idx+'][condition_subject]" type="text" >'
		+'<input type="hidden" name="condition['+idx+'][condition_order]" value='+idx+'>'
		+'<input type="hidden" name="condition['+idx+'][conOpt_num]" value=2>'
		+'<button type="button" id="conAddBtn" onclick="fn_addCon(); return false;">+</button>'
		+'<button type="button" id="conRmBtn" onclick="fn_rmCon('+idx+'); return false;">X</button>'
		+'<div id="condition_option" class="option"><strong>보기1:</strong><input id="opt" name="condition['+idx+'][con_opt][0]" type="text"></div><div id="condition_option" class="option">'
		+'<strong>보기2:</strong><input id="opt" name="condition['+idx+'][con_opt][1]" type="text"><button type="button" id="optAddBtn" onclick="fn_addConOpt('+idx+',1); return false;">+</button>	</div></div>');
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
		$(' > input', this).eq(0).attr('name', 'condition['+idx+'][condition_subject]');
		$(' > input', this).eq(1).attr('name', 'condition['+idx+'][condition_order]');
		$(' > input', this).eq(2).attr('name', 'condition['+idx+'][conOpt_num]');
		$(' > button', this).eq(1).attr('onclick','fn_rmCon('+idx+')');
		$(' > div', this).each(function(optIdx){
			$(' > input', this).eq(0).attr('name','condition['+idx+'][con_opt]['+optIdx+']');
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
			+'<strong>보기'+(optIdx+2)+':</strong>	<input id="opt" name="condition['+conIdx+'][con_opt]['+(optIdx+1)+']" type="text">'
			+'<button type="button" id="optAddBtn" onclick="fn_addConOpt('+conIdx+','+(optIdx+1)+'); return false;">+</button>'
			+'<button type="button" id="optRmBtn" onclick="fn_rmConOpt('+conIdx+','+(optIdx+1)+'); return false;">x</button></div>');
		$('.condition').eq(conIdx).find('input').eq(2).attr('value',(optIdx+2));
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
	$('.condition').eq(conIdx).find('input').eq(2).attr('value', optIdx);
	$('.condition').eq(conIdx).find('div').each(function(idx){
		$(' > strong', this).text('보기'+(idx+1)+':');
		$(' > input', this).eq(0).attr('name','condition['+conIdx+'][con_opt]['+idx+']');
		if(idx==1){
			$(' > button',this).eq(0).attr('onclick','fn_addConOpt('+conIdx+','+idx+')');
		}else if(optIdx>=2){
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
	
		
	$('.question').eq(idx-1).after('<div id="question_subject" class="question"><strong>문항'+(idx+1)+':</strong><input name="question['+idx+'][question_subject]" type="text" >'
	+'<input type="hidden" name="question['+idx+'][question_order]" value='+idx+'>'
	+'<input type="hidden" name="question['+idx+'][queOpt_num]" value=2>'
	+'<button type="button" id="queAddBtn" onclick="fn_addQue(); return false;">+</button>'
	+'<button type="button" id="queRmBtn" onclick="fn_rmQue('+idx+'); return false;">X</button>'
	+'<div id="question_option" class="option"><strong>보기1:</strong><input id="opt" name="question['+idx+'][que_opt][0]" type="text"></div><div id="question_option" class="option">'
	+'<strong>보기2:</strong><input id="opt" name="question['+idx+'][que_opt][1]" type="text"><button type="button" id="optAddBtn" onclick="fn_addQueOpt('+idx+',1); return false;">+</button>	</div>'
	+'<button type="button" id="storeSurvey" onclick="fn_storeSurvey(); return false;">저장</button></div>');
	if(idx==1){
 		$('.question').eq(idx-1).children('button').eq(0).hide(); 
 		$('.question').eq(idx-1).children('button').eq(1).hide(); 
	}else{
		$('.question').eq(idx-1).children('button').eq(0).hide(); 
 		$('.question').eq(idx-1).children('button').eq(2).hide(); 
	}
}
//문항 제거
var fn_rmQue = function(idx){
	$('.question').eq(idx).remove();
	$('.question').each(function(idx){
		$(' > strong', this).text('문항'+(idx+1)+':');
		$(' > input', this).eq(0).attr('name','question['+idx+'][question_subject]');
		$(' > input', this).eq(1).attr('name','question['+idx+'][question_order]');
		$(' > input', this).eq(2).attr('name','question['+idx+'][queOpt_num]');
		$(' > button', this).eq(1).attr('onclick','fn_rmQue('+idx+')');
		$(' > div', this).each(function(optIdx){
			$(' > input', this).eq(0).attr('name', 'question['+idx+'][que_opt]['+optIdx+']');
			if(optIdx==1){
				$(' > button',this).eq(0).attr('onclick','fn_addQueOpt('+idx+','+optIdx+')');
			}else if(optIdx>2){
				$(' > button',this).eq(0).attr('onclick','fn_addQueOpt('+idx+','+optIdx+')');
				$(' > button',this).eq(1).attr('onclick','fn_rmQueOpt('+idx+','+optIdx+')');
			}
		});
		if($('.question').eq(idx+1).attr('id') == null){
			if(idx==0){
				$('.question').eq(idx).children('button').eq(0).show();
				$('.question').eq(idx).children('button').eq(1).show();
				
			}else{
				$('.question').eq(idx).children('button').eq(0).show();
				$('.question').eq(idx).children('button').eq(2).show();
			}
		}
	});
}
//문항 보기 추가
var fn_addQueOpt = function(queIdx,optIdx){
	if(optIdx<4){
		$('.question').eq(queIdx).find('div').eq(optIdx).after('<div id="question_option" class="option">'
			+'<strong>보기'+(optIdx+2)+':</strong>	<input id="opt" name="question['+queIdx+'][que_opt]['+(optIdx+1)+']" type="text">'
			+'<button type="button" id="optAddBtn" onclick="fn_addQueOpt('+queIdx+','+(optIdx+1)+'); return false;">+</button>'
			+'<button type="button" id="optRmBtn" onclick="fn_rmQueOpt('+queIdx+','+(optIdx+1)+'); return false;">x</button></div>');
		$('.question').eq(queIdx).find('div').eq(optIdx).find('button').eq(0).hide();
		$('.question').eq(queIdx).find('input').eq(2).attr('value',(optIdx+2));
		if(optIdx==3)
			$('.question').eq(queIdx).find('div').eq(optIdx+1).find('button').eq(0).hide();
	}else{
		alert("보기는 5개 까지 선택 가능");
	}
}
//문항 보기 제거
var fn_rmQueOpt = function(queIdx, optIdx){
	$('.question').eq(queIdx).find('div').eq(optIdx).remove();
	$('.question').eq(queIdx).find('input').eq(2).attr('value', optIdx);
	$('.question').eq(queIdx).find('div').each(function(idx){
		$(' > strong', this).text('보기'+(idx+1)+':');
		$(' > input', this).eq(0).attr('name', 'question['+idx+'][que_opt]['+idx+']');
		if(idx==1){
			$(' > button',this).eq(0).attr('onclick','fn_addQueOpt('+queIdx+','+idx+')');
		}else if(optIdx>=2){
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
	var form=document.createElement("form");
	form.name='tempPost';
	    form.method='post';
	form.action="/research/store";  
	  
 	var input=document.createElement("input");
	input.type="hidden";
	input.name='json';
	input.value= JSON.stringify($('#frm').serializeObject());
	console.log(JSON.stringify($('#frm').serializeObject()));
	$(form).append(input);
	$('#frm').after(form); 
	form.submit();

}

var fn_search = function(){

	this.formId ="commonForm";
    
	
	this.url = "/research/index";
    
	 var frm = $("#search")[0];        
     frm.action = this.url;
     frm.method = "get";
     frm.submit();  
}

