$('.texts > span:nth-of-type(1)').addClass('sone').delay(2000).fadeOut();
$('.texts > span:nth-of-type(3)').addClass('sthr').delay(2000).fadeOut();
$('.devtips').addClass('textin').delay(2000).fadeOut('slow');

$('.links span').click(function(){
  $('.links span').not(this).css('background','transparent');
  $(this).css('background','#00FFA7');
});

$('.aboutt').click(function(){
  $('.sociallinks').fadeOut('slow');
  $('.about').fadeIn();
});
$('.more').click(function(){
  $('.about').fadeOut('slow');
  $('.sociallinks').fadeIn();
});

function after(){
  $('body').css('background','#000000');
  $('.team-wrap').css('display','flex');
  $('.gridcontainer').css('opacity','1');
}
setTimeout("after();", 3400);

var fn_intro = function(e){
	var params ='{"id":"'+e+'"}';
	callAjax('get', true, "/introduction/"+e, 'json', 'json', params, fn_error, fn_success);
};

var fn_error =  function(e) {
	console.log(e);
}

var fn_success =  function(e) {
	console.log(e);
}