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
    $('#notifications-button').removeClass('live');
  });
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
