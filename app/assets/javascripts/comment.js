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
    var comment = $(this).find(".user_info").attr('data-comment');
    var status = $(this).find(".user_info").attr('data-status');
    if (status != "") {
      shown($(this).find("p"));
      if (comment == null) {
        shown($(this).find(".comment_btn"));
      } else {
        shown($(this).find(".comment_edit"));
      }
    }
  });

  // 星ボタン押下
  $(".star-1, .star-2, .star-3").on('click', function() {
    var comment_action_parts = $(this).parents(".boke-rate").siblings(".comment-action-parts");
    var status = $(comment_action_parts).find(".user_info").attr('data-status');
    if (status == "") {
      shown($(comment_action_parts).find("p"));
      shown($(comment_action_parts).find(".comment_btn"));
    }
    status_class = $(this).attr('class');
    if (status_class.match(/.star-3/)) {
      $(comment_action_parts).find(".user_info").attr('data-status', "3");
    } else if (status_class.match(/.star-2/)) {
      $(comment_action_parts).find(".user_info").attr('data-status', "2");
    } else if (status_class.match(/.star-1/)) {
      $(comment_action_parts).find(".user_info").attr('data-status', "1");
    }
  });

  // 星の「×」ボタン押下
  $(".boke-rate-times").on("click",function() {
    var comment_parent = $(this).parents(".boke-rate").siblings(".comment-action-parts");
    hidden($(comment_parent).find("p, .comment_btn, .comment_edit, .comment-action, .alert-danger"));
    $(comment_parent).find("#comment_text").val("");
    var user_info = $(comment_parent).find(".user_info");
    $(user_info).attr('data-comment', "");
    $(user_info).attr('data-status', "");
    var boke_id = $(user_info).attr('data-boke_id');
    $(user_info).attr('data-url', `/bokes/${boke_id}/comments`);
    $(user_info).attr('data-type', 'POST');
  });

  // 「コメントする」ボタン押下
  $(".comment_btn").on('click', "button", function(e) {
    var comment_btn = $(this).parents(".comment_btn");
    hidden(comment_btn);
    shown($(comment_btn).siblings(".comment-action"));
  });

  // 「コメントを編集する」ボタン押下
  $(".comment_edit").on('click', "button", function(e) {
    var comment_edit = $(this).parents(".comment_edit");
    hidden(comment_edit);
    shown($(comment_edit).siblings(".comment-action"));
  });

  // フォームの「×」ボタン押下
  $(".comment-action").on('click', ".close", function(e) {
    var comment_action = $(this).parents(".comment-action");
    hidden(comment_action);
    hidden($(comment_action).siblings(".alert-danger"))
    var comment = $(comment_action).siblings(".user_info").attr('data-comment');
    if (comment == null || comment == "") {
      shown($(comment_action).siblings(".comment_btn"));
    } else {
      shown($(comment_action).siblings(".comment_edit"));
    }
  });

  // 「送信」ボタン押下
  $(".input-group").on('submit', function(e) {
    e.preventDefault();
    var comment_action = $(this).parents(".comment-action");
    var user_info = $(comment_action).siblings(".user_info");
    var url = $(user_info).attr('data-url');
    var boke_id = $(user_info).attr('data-boke_id');
    var type = $(user_info).attr('data-type');
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
      $($(comment_action).find(".btn")).prop('disabled', false);
      $(user_info).attr('data-type', 'PATCH');
      hidden(comment_action);
      hidden($(comment_action).siblings(".alert-danger"));

      var comment_edit = $(comment_action).siblings(".comment_edit");
      $($(comment_edit).find("b")).html(`${data.text}`);
      shown(comment_edit);
      $(user_info).attr('data-comment', `${data.text}`);
      $(user_info).attr('data-url', `/bokes/${boke_id}/comments/${data.id}`);
    })
    .fail(function(){
      $($(comment_action).find(".btn")).prop('disabled', false);
      $(comment_action).siblings(".alert-danger").removeAttr("aria-hidden style");
    })
  });
});
