function setUpFlash(type) {
  $('#flash').removeClass('failure');
  $('#flash').removeClass('success');
  $('#flash p').text("Submitting " + type + "...");
  $('#flash').show();
}

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
          setUpFlash("goal");
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

  $('.submit-bet-form').submit(function(e){
    e.preventDefault();
    var form = $(this);
    var post_url = form.attr('action');
    $.ajax({
        url: post_url,
        type: 'POST',
        dataType: 'html',
        data: $(this).serialize(),
        success: function(result) {
          setUpFlash("bet");
          console.log(form);
          console.log($(form).parent().parent());
          $(form).parent().load(location.href + "  #" + form.attr("id"), function() {
            $('#flash p').text(result);
            if (result == "Bet successfully added!") {
              $('#flash').addClass('success');
              $('#flash').fadeOut(4000);
            } else {
              $('#flash').addClass('failure');
            }
          });
      }
    });
   return false;
  });
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
