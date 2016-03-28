$(document).ready(function() {

  $('.success').delay(2000).fadeOut();
  
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

  $('#add-goal-form').submit(function(e){
    e.preventDefault();
    var form = $(this);
    var post_url = form.attr('action');
    $.ajax({
        url: post_url,
        type: 'POST',
        dataType: 'html',
        data: $(this).serialize(),
        success: function(result) {
        $('#flash').removeClass('failure');
        $('#flash').removeClass('success');
        $('#flash p').text("Submitting goal...");
        $('#flash').show();
        $('#active-goals-wrapper').load(location.href + " #active-goals", function() {
          $('#flash p').text(result);
          if (result == "Goal successfully created!") {
            $('#flash').addClass('success');
            $('#active-goals .col-md-4:first-child .goal').hide().fadeIn(2000);
            $('#flash').fadeOut(4000);
          } else {
            $('#flash').addClass('failure');
          }
        });
        $('#custom-goal input').val("");
        $('#custom-goal input#quantity').val(1);
      }
    });
   return false;
});
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
