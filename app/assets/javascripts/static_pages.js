function is_touch_device() {
  return 'ontouchstart' in window // works on most browsers 
      || 'onmsgesturechange' in window; // works on ie10
};

// text area functions
function updateCountdown() {
    // 500 is the max message length
		var limit = 241;
		var wordCount = $('#explanation-text').val().trim().split(" ").length;
		var remainingWords = limit - $('#explanation-text').val().trim().split(" ").length;
    $('#counter-text').text(remainingWords + ' words remaining.');
		
		$('#explanation-text').keypress(function(e) {
			if (wordCount > limit) {
				e.preventDefault();
			} else if (wordCount < limit) {
				$('#explanation-text').unbind('keypress');
			}
		});
}

function textAreaAdjust(o) {
    o.style.height = "1px";
    o.style.height = (25+o.scrollHeight)+"px";
}

function goToByScroll(element){
	$('html,body').animate({
		scrollTop: $(element).offset().top},
		'slow');
}

//legacy functions to hide and show things
var hide_element = function(element) {
	$( element ).stop().animate( {opacity : 0 }, 300, function(){
		$( element ).css('display', 'none');
	});
}

var show_element = function(element) {
	$( element ).stop().animate( {opacity : 1 }, 300, function(){
	});
	$( element ).css('display', 'inline');
}

var fadeThis = function(element) {
	$(element).stop().animate({ opacity: 0.5 }, 300, function(){
	});
}
var fadeThisIn = function(element) {
	$(element).stop().animate({ opacity: 1.0 }, 300, function(){
	});
}

var ready = function() {
	$('.phone-field').mask('(000) 000-0000');
	
	$('.cta-button2').click(function(){
	  $('html, body').animate({scrollTop:0}, 1000, 'easeOutCubic');
	  $('#user_email').focus();
	});
	
  $(function() {
	  $( "#accordion" ).accordion({header: "h3", collapsible: true, active: false, heightStyle: "content"});
  });
	
	if (is_touch_device()) {
		var arrowDown = $('.arrow-down')
		arrowDown.on( 'touchend', function(){
			goToByScroll(".signup-panel");
		});
	}
	
	//updating countdown on explanation for therapist
	$('#explanation-text').change(updateCountdown);
	$('#explanation-text').keyup(updateCountdown);
	
	$('.current_therapist_name').css('display', 'none');
	$('#user_current_therapist').change(function(){
		if ($(this).val() == "Yes") {
			$('.current_therapist_name').css('display', 'block');
			$('.current_therapist_name').css('opacity', '0');
			$('.current_therapist_name').stop().animate({ opacity: 1.0 }, 400, function(){
	});
		}
		else {
			$('.current_therapist_name').css('display', 'none');
		}
	});
}

$( document ).ready(ready);
$( document ).on('page:load', ready);