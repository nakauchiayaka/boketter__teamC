$(function() {
  var flag = false;

  function close() {
    $("#user-delete-modal").attr({
      'aria-hidden': 'true',
      'style': 'display: none;'
    });
    $(".modal").removeClass("in");
    $("body").removeClass("modal-open");
    flag = false;
  }

  $(".btn-warning").on('click', function(e) {
    $("#user-delete-modal").attr({
      'aria-hidden': 'false',
      'style': 'display: block;'
    });
    $(".modal").addClass("in");
    $("body").addClass("modal-open");
  });
  $(".close").on('click', function(e) {
    close();
  });
  $(".close-btn").on('click', function(e) {
    close();
  });

  $(document).on('click', function(e) {
    if (!$(e.target).closest('.modal-content').length) {
      if (flag) {
        close();
      } else {
        flag = true;
      }
    }
  });
});
