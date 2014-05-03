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
});

// chart examples
// -------------------------------
$(window).load(function() {
// morris charts
  Morris.Area({
    element: 'morris-1',
    data: [
      { y: '2006', a: 100, b: 90 },
      { y: '2007', a: 75,  b: 65 },
      { y: '2008', a: 50,  b: 40 },
      { y: '2009', a: 75,  b: 65 },

      { y: '2010', a: 50,  b: 40 },
      { y: '2011', a: 75,  b: 65 },
      { y: '2012', a: 100, b: 90 }
    ],
    xkey: 'y',
    ykeys: ['a', 'b'],
    labels: ['Series A', 'Series B'],
    smooth: false,
    lineColors: ['#252931', '#3498db',]
  });

  Morris.Line({
    element: 'morris-2',
    data: [
      { y: '2006', a: 10, b: 30 },
      { y: '2007', a: 50,  b: 65 },
      { y: '2008', a: 50,  b: 40 },
      { y: '2009', a: 75,  b: 65 },
      { y: '2010', a: 50,  b: 40 },
      { y: '2011', a: 85,  b: 65 },
      { y: '2012', a: 100, b: 80 }
    ],
    xkey: 'y',
    ykeys: ['a', 'b'],
    labels: ['Series A', 'Series B'],
    smooth: false,
    lineColors: ['#3498db', '#252931',]
  });

  Morris.Donut({
    element: 'morris-3',
    data: [
      {label: "Download Sales", value: 12},
      {label: "In-Store Sales", value: 30},
      {label: "Mail-Order Sales", value: 20}
    ],
    colors: [ '#3b414e', '#0f1114', '#252931']
  });

  Morris.Bar({
    element: 'morris-4',
    data: [
      { y: '2006', a: 100, b: 90 },
      { y: '2007', a: 75,  b: 65 },
      { y: '2008', a: 50,  b: 40 },
      { y: '2009', a: 75,  b: 65 },
      { y: '2010', a: 50,  b: 40 },
      { y: '2011', a: 75,  b: 65 },
      { y: '2012', a: 100, b: 90 }
    ],
    xkey: 'y',
    ykeys: ['a', 'b'],
    labels: ['Series A', 'Series B'],
    barColors: ['#1276b9', '#3498db']
  });

  Morris.Area({
    element: 'morris-line-white',
    data: [
      { y: '2006', a: 0},
      { y: '2007', a: 15},
      { y: '2008', a: 50},
      { y: '2009', a: 60},
      { y: '2010', a: 50},
      { y: '2011', a: 75},
      { y: '2012', a: 90}
    ],
    xkey: 'y',
    ykeys: ['a'],
    labels: ['Series A'],
    lineColors: ['#fff'],
    gridTextColor: '#fff',
    grid: false,
    fillOpacity: 0.0,
    smooth: false
  });

  Morris.Area({
    element: 'morris-line-white-2',
    data: [
      { y: '2006', a: 0},
      { y: '2007', a: 15},
      { y: '2008', a: 50},
      { y: '2009', a: 60},
      { y: '2010', a: 50},
      { y: '2011', a: 75},
      { y: '2012', a: 80}
    ],
    xkey: 'y',
    ykeys: ['a'],
    labels: ['Series A'],
    lineColors: ['#fff'],
    gridTextColor: '#fff',
    grid: true,
    fillOpacity: 0.0,
    smooth: false
  });
});
