$(function() {

  function hidden(target) {
    $(target).attr({
      'aria-hidden': 'true',
      'style': 'display: none;'
    });
  }

  function shown(target) {
    $(target).removeAttr('aria-hidden style')
  }


  $(".comment-action-parts").each(function() {
    var comment = $(this).children(".user_comment").data('comment');
    if (comment != null) {
      shown($(this).children("#comment_edit"));
    } else {
      shown($(this).children("#comment_btn"));
    }
  });

  // 「コメントする」ボタン押下
  $("#comment_btn > button").on('click', function(e) {
    var target = $(this).parents("#comment_btn");
    hidden(target);
    shown($(target).siblings(".comment-action"));
  });

  // 「コメントを編集する」ボタン押下
  $(".form-inline > button").on('click', function(e) {
    var target = $(this).parents("#comment_edit");
    hidden(target);
    shown($(target).siblings(".comment-action"));
  });

  // 「×」ボタン押下
  $("button.close").on('click', function(e) {
    var target = $(this).parents(".comment-action");
    hidden(target);
    var comment = $(target).siblings(".user_comment").data('comment');
    if (comment != null) {
      shown($(target).siblings("#comment_edit"));
    } else {
      shown($(target).siblings("#comment_btn"));
    }
  });

  // 「送信」ボタン押下
  $(".input-group").on('submit', function(e) {
    e.preventDefault();
    var target = $(this).parents(".comment-action");
    var url = $(target).siblings(".user_comment").data('url');
    var comment = $(target).siblings(".user_comment").data('comment');
    if (comment != null) {
      var type = "PATCH";
    } else {
      var type = "POST";
    }
    var formData = new FormData(this);

    $.ajax({
      url: url,
      type: type,
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      hidden(target);
      $($(target).find(".btn")).prop('disabled', false);
      var comment_edit = $(target).siblings("#comment_edit");
      shown(comment_edit);
      $($(comment_edit).find("b")).html(`${data.text}`)
    })
    .fail(function(){
      $(target).siblings(".alert.alert-danger").removeAttr("aria-hidden style");
    })
  });
});
