
/*자기소개 데이터가져오기*/
var fn_intro = function(e){
	
	var id = e;
	var params ='{"id":"'+id+'"}';
	callAjax('get', true, "/introduction/"+e, 'json', 'json', params, fn_intro_error, fn_intro_success);
};

var fn_intro_error = function(request, status, error) {
	console.log("code = " + request.status + " message = "
			+ request.responseText + " error = " + error);
}
var editor;
var fn_intro_success = function(e) {
	
	if (e.result == null || e.result == 'undefined' || e.result == '') {
		if (e.roleId == 1) {
			document.getElementById('modal').classList.toggle('active');
			document.getElementById('modal_title').innerHTML = '<input id="get_name" name="get_name" placeholder="타이틀을 입력해주세요.">';
			document.getElementById('modal_content').innerHTML = '<div class="editable"></div>';
			document.getElementById('savebtn').style.display ="block"; 
			editor = new MediumEditor('.editable' ,{
				placeholder: {
			        text: '내용를 입력해 주세요!',
			        hideOnClick: true
			    },
			});
		} else {
			document.getElementById('modal').classList.toggle('active');
			document.getElementById('modal_title').innerText = "데이터가 존재하지 않습니다.";
			document.getElementById('modal_content').innerText = "데이터가 존재하지 않습니다.";
			document.getElementById('intro_image').innerHTML = '<img src="#" alt="img" />';
		}
	} else {
		if (e.roleId == 1) {
			console.log(e.result);
			document.getElementById('modal').classList.toggle('active');
			document.getElementById('savebtn').style.display ="block"; 
			document.getElementById('team_id').value = e.result.ID;
			document.getElementById('modal_title').innerHTML = '<input id="get_name" name="get_name" value="'+e.result.TEAM_NAME+'">';
			document.getElementById('modal_content').innerHTML = '<div class="editable"></div>';
			var editor = new MediumEditor('.editable');
			editor.setContent(e.result.TEAM_CONTEXT);
			console.log(editor.id);
		} else {
			console.log(e.result);
			document.getElementById('modal').classList.toggle('active');
			document.getElementById('team_id').value = e.result.ID; 
			document.getElementById('modal_title').innerText = e.result.TEAM_NAME;
			document.getElementById('modal_content').innerText = e.result.TEAM_CONTEXT;
		}
	}
}


/*모달 Close 버튼 이벤트*/
document.getElementById('close').addEventListener('click', function(){
	document.getElementById('team_id').value = null;
	document.getElementById('modal').classList.toggle('active');
})
