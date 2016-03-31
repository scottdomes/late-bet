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
        .fadeOut(2000);
    } else {
       $flash.addClass('failure');
    }
  }

  function submitForm(form) {
    $.ajax({
        url: form.attr('action'),
        type: 'POST',
        dataType: 'json',
        data: form.serialize(),
        success: function(res) {
          var data = res.data;
          if (data.success) {
            if (form.attr("class") == "submit-bet-form") {
              reloadBetSubmitArea(form);
            } else if (form.attr("id") == "add-goal-form") {
              loadNewGoal(form);
              resetCustomGoal();
            } else if (form.attr("class") == "complete-goal-form" && form.parents('.main-page-grid').length != 0) {
              removeGoal(form);
            } else if (form.attr("class") == "complete-goal-form" && form.parents('.user-goal-grid').length != 0) {
              displayGoalResult(form, data);
            }
          }
          displayFlash(data);
        },
        error: function(res) {
          var data = res.data
          displayFlash(data)
        }
    });
  }

  function reloadBetSubmitArea(form) {
    $(form).parent('.bet-submit-area').load(location.href + "  #" + form.attr("id"));
  }

  function loadNewGoal(form) {
    $('#active-goals-wrapper').load(location.href + " #active-goals", function() {
      $('#active-goals .row:first-child .col-md-4:nth-child(2) .goal').hide().fadeIn(2000);
    });
  }

  function resetCustomGoal() {
    $('#custom-goal input').val("");
    $('#custom-goal input#quantity').val(1);
  }

  function removeGoal(form) {
    var goalPanel = $(form).parents('col-md-4');
    goalPanel.fadeOut(2000);
    $('#active-goals-wrapper').load(location.href + " #active-goals");
  }

  function displayGoalResult(form, data) {
    reloadBetSubmitArea(form);
    $(form).parents('.goal').addClass(data.user_succeeded ? 'successful-goal' : 'failed-goal');
  }

  
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

  function formSubmitter(flashText) {
    return function(e) {
      e.preventDefault();
      setUpFlash(flashText);
      var form = $(this);
      submitForm(form);
    }
  }

  $(document).on('click', '#submit-goal-button', function() {
    $('#add-goal-form').submit(formSubmitter("goal"));
  });

  $(document).on('click', '.complete-goal-button', function() {
    $('.complete-goal-form').submit(formSubmitter("goal"));
  });

  $('.submit-bet-form').click(formSubmitter("bet"));
});
