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

  // $('#submit-goal-button').click(function () {
  //   $("#add-goal-form").ajaxForm({url: '/goals', type: 'post'});
  //   $("#active-goals").load(location.href);
  // })

    // $('#add-goal-form').submit(function(e){
    //       e.preventDefault();
    //       var form = $(this);
    //       var post_url = form.attr('action');
    //       var post_data = form.serialize();
    //       $.ajax({
    //           type: 'POST',
    //           url: post_url, 
    //           data: post_data,
    //           success: function(msg) {
    //               $(form).fadeOut(800, function(){
    //                   form.html(msg).fadeIn().delay(1000);
    //               });
                
    //           }
    //       });
    //   });

  $('#add-goal-form').submit(function(e){
    e.preventDefault();
    var form = $(this);
    var post_url = form.attr('action');
    $.ajax({
        url: post_url,
        type: 'POST',
        dataType: 'html',
        data: $(this).serialize(),
        success: function(data) {
         $('#active-goals-wrapper').load(location.href + " #active-goals-grid"); 
      }
    });
   return false;
});
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
