$(function() {
  $(".star-1").on("click", function() {
    var id = $(this).data('id');
    console.log(id);
    star_function(id, $(this));
  });

  function star_function(id, button) {
  if (button.hasClass("decrement")){
    //   $.ajax({url: "/bokes/" + id + "/stars/" + id,
    //           type: "delete",
    //           data: {boke_id: id},
    //           dataType: "json"
    //         })
    // .done(function(data){
    //   console.log("ttt")
    //   button.removeClass("decrement").addClass("increment")
    //   button.removeClass('fas fa-star').addClass('far fa-star');
    // });

    }else{
      console.log("cccc");
      $.ajax({url: "/bokes/" + id + "/stars" ,
              type: "post",
              data: {boke_id: id},
              dataType: "json"
            })
      .done(function(data){
      button.removeClass("increment").addClass("decrement")
      button.removeClass('far fa-star').addClass('fas fa-star');
      })
    }
}


$(".boke-rate-times").on("click",function(){
  var id = $(this).data('id');
  console.log(id);
  star_delete_function(id,$(this));

});

  function star_delete_function(id,button){
  var star1 = button.parent().find('.star-1');
  if (star1.hasClass("decrement")){

    $.ajax({url: "/bokes/" + id + "/stars/" + id,
              type: "delete",
              data: {boke_id: id},
              dataType: "json"
            })
    .done(function(data){
      console.log("ttt")
      star1.removeClass("decrement").addClass("increment")
      star1.removeClass('fas fa-star').addClass('far fa-star');
    });
  }

  }




});
