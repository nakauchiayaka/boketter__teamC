$(function() {
// 退会ポップアップ
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


// 画像プレビュー
  $(".user-img").on("change", function(){
    var inputFiles = $(this)[0].files[0];
    if (inputFiles) {
      var fileReader = new FileReader();
      fileReader.onload = function(e){
        var imgURI = event.target.result;
        $(".drag-area").attr('style', `background-image:url(${imgURI});`);
      }
      fileReader.readAsDataURL(inputFiles);
    }
  });
});
