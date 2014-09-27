$(document).ready(function(){
	// tooltips
	$('[data-toggle="tooltip"]').tooltip();
	// popover demo
	$('[data-toggle="popover"]').popover();
	// dismiss alerts
	$(".alert").alert();
	// icheck
	$(".icheck").iCheck({
		checkboxClass: 'icheckbox_flat',
		radioClass: 'iradio_flat'
	});
	$('.selectpicker').selectpicker();
	// the sidebar button
  $("[data-toggle=page-sidebar]").click(function(e) {
      e.preventDefault();
      $(".page-wrapper").toggleClass("sidebar-on");
  });
  // summernote RTF editor
  $(".rtf-editor").summernote({
  	height: 100
  });
  // date time picker
	
	$('.datetime-picker').datetimepicker();
	
});
// isotope filtering
$(window).load(function() {
	// define isotope container
	var $container = $('.isotope-container').isotope({});
	// define options
	$container.isotope({
		resizable: false,
		layoutMode : 'masonry',
		itemSelector : '.isotope-item'
	});
	$('#filters a').click(function(){
		// define selector
		var selector = $(this).attr('data-filter');
		// define options
		$container.isotope({ filter: selector });
		// remove `active` class
		$(this).parent().parent().find('.active').removeClass('active');
		// reassign `active` class to selected filter
		$(this).parent().addClass('active');
		return false;
	});
	// countdown
	var countdownDate = $(".countdown").attr("data-date");
	$('.countdown').countdown(countdownDate, function(event) {
		$(this).html(event.strftime(
			  '<li><span class="date-digit">%D</span> <span class="date-text">Days</span></li>'
			+ '<li><span class="date-digit">%H</span> <span class="date-text">Hours</span></li>'
			+ '<li><span class="date-digit">%M</span> <span class="date-text">Minutes</span></li>'
			+ '<li><span class="date-digit">%S</span> <span class="date-text">Seconds</span></li>'
		));
	}).on('finish.countdown', function(event) {
		// redirect on finish
		window.location = "index.html";
	});
});
