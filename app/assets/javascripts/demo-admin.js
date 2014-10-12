$(document).ready(function(){
  // bootstrap tooltips
  // ----------------------------
  $('[data-toggle="tooltip"]').tooltip();
  // bootstrap alerts
  // ----------------------------
  $(".alert").alert();
  // icheck checkboxes
  // ----------------------------
  $(".icheck").iCheck({
    checkboxClass: 'icheckbox_flat',
    radioClass: 'iradio_flat'
  });
  // custom dropdown select
  // ----------------------------
  $('.selectpicker').selectpicker();
  // admin sidebar toggle
  // ----------------------------
  $("[data-toggle=admin-sidebar]").click(function(e) {
      e.preventDefault();
      $(".admin-wrapper").toggleClass("sidebar-toggle");
  });
  // RTF text editor
  // ----------------------------
  $(".rtf-editor").summernote({
    height: 300
  });
  // text area auto resize
  // ----------------------------
  $('textarea').on('focus', function(){
    $(this).autosize();
  });
  // credit card recognition
  // ----------------------------
  $('#credit-card-number').validateCreditCard(function(e) {
    // clear all
    $("#credit-card-number").closest(".form-group").removeClass("has-success")
    $(".card").removeClass("valid non-valid");
    $(".valid-card").removeClass("show");
    // validate card issuer
    if (e.card_type) {
      $(".card").addClass("non-valid");
      $(".card-"+e.card_type.name).removeClass("non-valid").addClass("valid");
    }
    // validadte format
    if (e.length_valid && e.luhn_valid) {
      $("#credit-card-number").closest(".form-group").addClass("has-success");
    }
  });
});

// isotope filtering
// ----------------------------
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
  // ----------------------------
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

  if (typeof(gon) != "undefined") {
    var months  = gon.months;
    var numbers = gon.numbers;
    var classified_numbers = gon.classified_numbers;

    Morris.Bar({
      element: 'new_words_per_month',
      data: [
        { y: months[0], a: numbers[0] },
        { y: months[1], a: numbers[1] },
        { y: months[2], a: numbers[2] },
        { y: months[3], a: numbers[3] },
        { y: months[4], a: numbers[4] },
        { y: months[5], a: numbers[5] },
        { y: months[6], a: numbers[6] }
      ],
      xkey: 'y',
      ykeys: ['a'],
      labels: ['Words'],
      barColors: ['#3498db']
    });

    Morris.Donut({
      element: 'morris-3',
      data: [
      {label: classified_numbers[0][0], value: classified_numbers[0][1]},
      {label: classified_numbers[1][0], value: classified_numbers[1][1]},
      {label: classified_numbers[2][0], value: classified_numbers[2][1]},
      {label: classified_numbers[3][0], value: classified_numbers[3][1]},
      {label: classified_numbers[4][0], value: classified_numbers[4][1]}
      ],
      colors: [ '#1ccdaa', '#16a085', '#107360', '#3b414e', '#f39c12']
    });
  }
});



