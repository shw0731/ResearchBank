<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#floatMenu {
	position: absolute;
	width: 48px;
	height: 48px;
	right: 5%;
	top: 90%;
	color: #fff;
	background-image: url("/resources/images/portfolio/top.png");
	background-position: center center;
  	background-size: cover;

}
</style>
<script type="text/javascript">
$(document).ready(function() {

	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		/*  애니메이션 없이 바로 따라감 */
		 $("#floatMenu").css('top', newPosition);
		 

		/* $("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500); */

	}).scroll();
	
	$( '.top' ).click( function() {
        $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
        return false;
      } );

});
</script> 

<a href="#" class="top"><div id="floatMenu"></div></a>

   
    
    <section id="contact">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto text-center">
          <h2 class="section-heading">Let's Get In Touch!</h2>
          <hr class="my-4">
          <p class="mb-5">Ready for perfect service for you</p>
        </div>
      </div>
      <div class="row"src/main/java/com/kh/researchbank/Auth/service/Impl/LoginServiceImpl.java"">
        <div class="col-lg-4 ml-auto text-center">
          <i class="fas fa-phone fa-3x mb-3 sr-contact-1"></i>
          <p>123-456-6789</p>
        </div>
        <div class="col-lg-4 mr-auto text-center">
          <i class="fas fa-envelope fa-3x mb-3 sr-contact-2"></i>
          <p>
            <a href="mailto:your-email@your-domain.com">feedback@startbootstrap.com</a>
          </p>
        </div>
      </div>
    </div>
  </section>