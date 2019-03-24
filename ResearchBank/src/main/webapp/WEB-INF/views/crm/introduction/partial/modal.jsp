<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="modal">
	<div>
		<div class="topStripe">
			<div class="half">
				<h3 id="modal_title"></h3>
			</div>
			<div id="half" class="half">

				<button id="close">
					<div>
						<div class="stripe"></div>
						<div class="stripe"></div>
					</div>
				</button>
			</div>
		</div>
		<div class="plate">
			<p id="modal_content"></p>
		</div>
		<div class="modal_footer">
			<div id="savebtn" style="display: none;">
				<button type="button" class="btn" onclick="fn_save(); return false;">Save</button>
			</div>
		</div>
	</div>
	<form id="profile">
		<input type="hidden" id="team_name" name="team_name" /> <input
			type="hidden" id="team_id" name="team_id" />
		<textarea name="team_context" id="team_context" style="display: none;"></textarea>
	</form>
</div>
<script type="text/javascript">
var fn_save =  function(){
	var team_id = document.getElementById('team_id').value;
	var team_name = document.getElementById('get_name').value;
	var team_context = document.getElementsByClassName('editable')[0].innerHTML;
	console.log(team_id);
	var params ='{"team_id":"'+team_id+'","team_id":"'+team_name+'","team_id":"'+team_context+'"}';
	
	document.getElementById('team_name').value = document.getElementById('get_name').value;
	document.getElementById('team_context').value = document.getElementsByClassName('editable')[0].innerHTML;
	document.getElementById('profile').method ="POST";
	document.getElementById('profile').action="/introduction";
	if(confirm("저장하시겠습니까?")){
	  	document.getElementById('profile').submit();	
	}else {
		return false;
	}
	return false;
}


</script>