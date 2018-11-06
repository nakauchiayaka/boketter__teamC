$(function() {
  $(".star-1").on("click", function() {
    var id = $(this).data('id');
    console.log(id);
    star_function(id, $(this));
  });

  function star_function(id, button) {
  if (button.hasClass("decrement")){
      $.ajax({url: "/bokes/" + id + "/stars/" + id,
              type: "delete",
              data: {boke_id: id},
              dataType: "json"
            })
    .done(function(data){
      console.log("ttt")
      button.removeClass("decrement").addClass("increment")
      button.removeClass('fas fa-star').addClass('far fa-star');
    });

    }else{
      console.log("cccc");
      $.ajax({url: "/bokes/" + id + "/stars" ,
              type: "post",
              data: {boke_id: id},
              dataType: "json"
            })
      .done(function(data){
      button.removeClass("increment").addClass("decrement")
      button.empty();
      button.addClass('fas fa-star');
      })
    }
}


// $(".boke-rate-times").on("click",function(){
//   id = $('.now-boke_id').val();
//   star_delete_function(id,$(this));

// });

//   function star_delete_function(id,button){
//   if (button.hasClass("decrement")){

//     $.ajax({url: "/bokes/" + id + "/stars/" + id,
//               type: "delete",
//               data: {boke_id: id},
//               dataType: "json"
//             })
//     .done(function(data){
//       console.log("ttt")
//       button.removeClass("decrement").addClass("increment")
//       button.empty();
//       button.addClass('far fa-star');
//     });
//   }
//   }




});
