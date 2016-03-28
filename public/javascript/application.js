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
        $('#active-goals-wrapper').load(location.href + " #active-goals", function() {
          if (result == "Goal successfully created!") {
            $('#active-goals .col-md-4:first-child .goal').hide().fadeIn(2000);
          }
        });
        $('#custom-goal input').val("");
        $('#flash p').text(result);
        $('#flash').fadeIn();
        if (result == "Goal successfully created!"){
          $('#flash').fadeOut(4000);
        };
      }
    });
   return false;
});
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
