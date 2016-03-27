$(document).ready(function() {

  $('.success').delay(2000).fadeOut();

  $('#add-goal-heading').click(function () {
    $('#custom-goal').toggleClass("expanded");
  });

  $('#notifications-button').click(function () {
    $.ajax({
      url: "/users/empty_notifications",
      type: 'POST'
    });
    // Greys out before reading. May need resurrecting with modification
    // $.each($('#notifications-menu li'), function () {
    //   $(this).addClass('read-notification');
    // })
    $('#notifications-button').removeClass('live');
  });

//   $('#add-goal-form').submit(function(e){
//     e.preventDefault();
//     var form = $(this);
//     var post_url = form.attr('action');
//     $.ajax({
//         url: post_url,
//         type: 'POST',
//         dataType: 'html',
//         data: $(this).serialize(),
//         success: function(data) {
//          $('#active-goals-wrapper').load(location.href + " #active-goals-grid");
//         $('#flash-container').load(location.href + " #flash-inner");
//       }
//     });
//    return false;
// });
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
