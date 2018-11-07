$(function() {
  $(".star-1").on("click", function() {
    var id = $(this).data('id');
    console.log(id);
    star_function_1(id, $(this));
  });

  function star_function_1(id, button) {
  if (button.hasClass("decrement")){

    }else{
      console.log("cccc");
      $.ajax({url: "/bokes/" + id + "/stars" ,
              type: "post",
              data: {boke_id: id,status:1},
              dataType: "json"
            })
      .done(function(data){
      button.removeClass("increment").addClass("decrement")
      button.removeClass('far fa-star').addClass('fas fa-star');
      })
    }
  }


  $(".star-2").on("click", function() {
    var id = $(this).data('id');
    console.log(id);
    star_function_2(id, $(this));
  });

  function star_function_2(id, button) {
  if (button.hasClass("decrement")){

    }else{
      console.log("cccc");
      $.ajax({url: "/bokes/" + id + "/stars" ,
              type: "post",
              data: {boke_id: id,status:2},
              dataType: "json"
            })
      .done(function(data){
      var star1 = button.parent().find('.star-1');
      button.removeClass("increment").addClass("decrement")
      button.removeClass('far fa-star').addClass('fas fa-star');
      star1.removeClass('far fa-star').addClass('fas fa-star');
      })
    }
  }

  $(".star-3").on("click", function() {
    var id = $(this).data('id');
    console.log(id);
    star_function_3(id, $(this));
  });

  function star_function_3(id, button) {
  if (button.hasClass("decrement")){

    }else{
      console.log("cccc");
      $.ajax({url: "/bokes/" + id + "/stars" ,
              type: "post",
              data: {boke_id: id,status:3},
              dataType: "json"
            })
      .done(function(data){
      var star1 = button.parent().find('.star-1');
      var star2 = button.parent().find('.star-2');
      button.removeClass("increment").addClass("decrement")
      button.removeClass('far fa-star').addClass('fas fa-star');
      star1.removeClass('far fa-star').addClass('fas fa-star');
      star2.removeClass('far fa-star').addClass('fas fa-star');
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
  var star2 = button.parent().find('.star-2');
  var star3 = button.parent().find('.star-3');
  if (star1.hasClass("decrement")){

    $.ajax({url: "/bokes/" + id + "/stars/" + id,
              type: "delete",
              data: {boke_id: id,status:1},
              dataType: "json"
            })
    .done(function(data){
      console.log("ttt")
      star1.removeClass("decrement").addClass("increment")
      star2.removeClass("decrement").addClass("increment");
      star3.removeClass("decrement").addClass("increment");
      star1.removeClass('fas fa-star').addClass('far fa-star');
      star2.removeClass('fas fa-star').addClass('far fa-star');
      star3.removeClass('fas fa-star').addClass('far fa-star');
    });
  }
  else if (star2.hasClass("decrement")){
    $.ajax({url: "/bokes/" + id + "/stars/" + id,
              type: "delete",
              data: {boke_id: id,status:2},
              dataType: "json"
            })
    .done(function(data){
      console.log("ttt")
      star1.removeClass("decrement").addClass("increment")
      star2.removeClass("decrement").addClass("increment");
      star3.removeClass("decrement").addClass("increment");
      star1.removeClass('fas fa-star').addClass('far fa-star');
      star2.removeClass('fas fa-star').addClass('far fa-star');
      star3.removeClass('fas fa-star').addClass('far fa-star');
    });
  }
  else if (star3.hasClass("decrement")){
    $.ajax({url: "/bokes/" + id + "/stars/" + id,
              type: "delete",
              data: {boke_id: id,status:3},
              dataType: "json"
            })
    .done(function(data){
      console.log("ttt")
      star1.removeClass("decrement").addClass("increment")
      star2.removeClass("decrement").addClass("increment");
      star3.removeClass("decrement").addClass("increment");
      star1.removeClass('fas fa-star').addClass('far fa-star');
      star2.removeClass('fas fa-star').addClass('far fa-star');
      star3.removeClass('fas fa-star').addClass('far fa-star');
    });
  }

  }




});
