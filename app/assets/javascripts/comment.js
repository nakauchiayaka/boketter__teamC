$(function() {

  // 非表示
  function hidden(target) {
    $(target).attr({
      'aria-hidden': 'true',
      'style': 'display: none;'
    });
  }
  // 表示
  function shown(target) {
    $(target).removeAttr('aria-hidden style');
  }

  $(".comment-action-parts").each(function() {
    var comment = $(this).children("#user_rate").data('comment');
    var status = $(this).children("#user_rate").data('status');
    if ($(status)[0]) {
      shown($(this).children("p"));
      if (comment != null) {
        shown($(this).children(".comment_edit"));
      } else {
        shown($(this).children(".comment_btn"));
      }
    }
  });

  // 星ボタン押下
  $(".star-1, .star-2, .star-3").on('click', function() {
    var status = $(this).children("#user_rate").data('status');
    var comment_btn = $(this).parents(".boke-rate").siblings(".comment-action-parts").find(".comment_btn");
    if (status == null) {
      shown(comment_btn);
    }
  });

  // 星の「×」ボタン押下
  $(".boke-rate-times").on("click",function() {
    var comment_parent = $(this).parents(".boke-rate").siblings(".comment-action-parts");
    hidden($(comment_parent).find("p, .comment_btn, .comment_edit, .comment-action, .alert-danger"));
  });

  // 「コメントする」ボタン押下
  $(".comment_btn > button").on('click', function(e) {
    var target = $(this).parents(".comment_btn");
    hidden(target);
    shown($(target).siblings(".comment-action"));
  });

  // 「コメントを編集する」ボタン押下
  $(".form-inline > button").on('click', function(e) {
    var target = $(this).parents(".comment_edit");
    hidden(target);
    shown($(target).siblings(".comment-action"));
  });

  // フォームの「×」ボタン押下
  $("button.close").on('click', function(e) {
    var target = $(this).parents(".comment-action");
    hidden(target);
    var comment = $(target).siblings("#user_rate").data('comment');
    if (comment != null) {
      shown($(target).siblings(".comment_edit"));
    } else {
      shown($(target).siblings(".comment_btn"));
    }
  });

  // 「送信」ボタン押下
  $(".input-group").on('submit', function(e) {
    e.preventDefault();
    var target = $(this).parents(".comment-action");
    var url = $(target).siblings("#user_rate").data('url');
    var comment = $(target).siblings("#user_rate").data('comment');
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
      var comment_edit = $(target).siblings(".comment_edit");
      shown(comment_edit);
      $($(comment_edit).find("b")).html(`${data.text}`);
      hidden($(target).siblings(".alert-danger"));
    })
    .fail(function(){
      $($(target).find(".btn")).prop('disabled', false);
      $(target).siblings(".alert-danger").removeAttr("aria-hidden style");
    })
  });
});
