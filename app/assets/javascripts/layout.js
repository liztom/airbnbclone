
$(document).ready(function() {

  if ($('#calendar').length) {
    $('.booking').each(function() {
      $(this).parent().addClass('booked-day');
    })

    $('.other-month').each(function() {
      $(this).parent().addClass('invalid-day');
    })
  };

  $(".fancybox").fancybox({
    'transitionIn'  : 'elastic',
    'transitionOut' : 'elastic',
    'speedIn'   : 600,
    'speedOut'    : 200,
    'overlayShow' : false
  });

})
