$(document).ready(function() {

  var $flash = $('#flash');

  function setUpFlash(type) {
    $flash
      .removeClass('failure')
      .removeClass('success')
      .find('p').text("Submitting " + type + "...")
      .show();
  }

  function displayFlash(result) {
    $('#flash p').text(result);
    if (result == "Goal successfully created!") {
      $('#flash').addClass('success');
      $('#flash').fadeOut(4000);
    } else {
      $('#flash').addClass('failure');
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
              $flash.find('p').text(data.message);
              if (data.success) {
                $flash.addClass('success');
                $('#active-goals .row:first-child .col-md-4:nth-child(2) .goal').hide().fadeIn(2000);
                $flash.fadeOut(4000);
              } else {
                $flash.addClass('failure');
              }
            });
            $('#custom-goal input').val("");
            $('#custom-goal input#quantity').val(1);
        }
      });
     return false;
    });
  });

  $(document).on('click', '.submit-bet', function() {
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
            $(form).parent().load(location.href + "  #" + form.attr("id"), function() {
              displayFlash(result)
              if (result.success == true ){
                $('#active-goals .row:first-child .col-md-4:nth-child(2) .goal').hide().fadeIn(2000);
              }
            });
        }
      });
     return false;
    });
  });
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
