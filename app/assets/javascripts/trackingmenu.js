$(function(){
    var odai = $("#header-news-stats b:eq(1)").text();
    var odaino = parseInt( odai );
    var random = Math.floor(Math.random()*( odaino - 1) + 1);
    console.log(random);

    var html =`
              <div id="trackingmenu">
                <ul id="trackingmenu-list">
                  <li id="accordion">Menu</li>
                    <ul id="toggelemenu">
                      <li><a href="/odais/${random}/bokes/new"><i class="fas fa-random"></i>&nbsp;無茶振り</a></li>
                      <li><a href="/odais/search"><i class="fas fa-search"></i>&nbsp;お題検索</a></li>
                      <li><a href="/odais/new"><i class="fas fa-upload"></i>&nbsp;お題投稿</a></li>
                    </ul>
                  <li id=trackingmenu-scroll-top>Top</li>
                </ul>
              </div>
              `
    var menu = $('#content').append(html);
    $("#trackingmenu").hide()
    $(window).scroll(function(){
      if ($(this).scrollTop() > 350){
        $("#trackingmenu").fadeIn()
      }else{
        $("#trackingmenu").fadeOut()
        $("#toggelemenu").slideUp();
      }
    })
    $("#trackingmenu li").hover(function(){
      $(this).css({'background': 'rgba(255,255,255,0.5)'});
      }, function(){
        $(this).css({'background': ''});
    })
    $("#accordion").on('click', function(){
      $("#toggelemenu").slideToggle();
    });
    $("#trackingmenu-scroll-top").on('click', function(){
      $("#toggelemenu").slideUp();
      $("html, body").animate({scrollTop:$("#top-bar")});
    });
});


