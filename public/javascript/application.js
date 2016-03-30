$(document).ready(function() {

  var $flash = $('#flash');

  function setUpFlash(type) {
    $flash
      .show()
      .removeClass('failure')
      .removeClass('success')
      .find('p').text("Submitting " + type + "...");
  }

  function displayFlash(data) {
    $flash
      .find('p').text(data.message)
    if (data.success == true) {
      $flash
        .addClass('success')
        .fadeOut(4000);
    } else {
       $flash.addClass('failure');
    }
  }

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


  $(document).on('click', '#submit-goal-button', function() {
    $('#add-goal-form').submit(function(e){
      e.preventDefault();
      var form = $(this);
      var post_url = form.attr('action');
      $.ajax({
          url: post_url,
          type: 'POST',
          dataType: 'json',
          data: $(this).serialize(),
          success: function(res) {
            var data = res.data;
            setUpFlash("goal");
            $('#active-goals-wrapper').load(location.href + " #active-goals", function() {
              displayFlash(data)
              if (data.success) {
                $('#active-goals .row:first-child .col-md-4:nth-child(2) .goal').hide().fadeIn(2000);
              }
            });
            $('#custom-goal input').val("");
            $('#custom-goal input#quantity').val(1);
        }
      });
     return false;
    });
  });

    $('.submit-bet-form').click(function(e){
      e.preventDefault();
      var form = $(this);
      var post_url = form.attr('action');
      setUpFlash("bet");
      $.ajax({
          url: post_url,
          type: 'POST',
          dataType: 'json',
          data: $(this).serialize(),
          success: function(res) {
            var data = res.data;
                     
            $(form).parent().load(location.href + "  #" + form.attr("id"), function() {
              displayFlash(data);
              if (data.success == true ){
                $('#active-goals .row:first-child .col-md-4:nth-child(2) .goal').hide().fadeIn(2000);
              }
            });
        }
      });
     return false;
    });
});
