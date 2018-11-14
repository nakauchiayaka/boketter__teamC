$(function(){
    var menu =`
              <div id="hayo">
                <div class="icon">
                  <div class="baloon">
                    <p id="hayosei">やぁ</p>
                  </div>
                </div>
              </div>
              `
    var hayo = $('#content').append(menu);
    $("#hayo").hide()
    var url = location.href;
    if (url.match(/\/odais\/\d+\/bokes\/new/)){

      setTimeout(function(){
        $("#hayo").fadeIn()
      },1000);
      setTimeout(function(){
        $("#hayo").fadeOut()
      },1500);

      setTimeout(function(){
        document.getElementById('hayosei').innerHTML = 'ボケったー楽しんでる？';
        $("#hayo").fadeIn()
      },2000);
      setTimeout(function(){
        $("#hayo").fadeOut()
      },2500);

      setTimeout(function(){
        document.getElementById('hayosei').innerHTML = 'ねぇ、30秒たったよ';
        $("#hayo").fadeIn()
      },3000);
      setTimeout(function(){
        $("#hayo").fadeOut()
      },3500);

          setTimeout(function(){
        document.getElementById('hayosei').innerHTML = 'まだー？';
        $("#hayo").fadeIn()
      },4000);
      setTimeout(function(){
        $("#hayo").fadeOut()
      },4500);

      setTimeout(function(){
        document.getElementById('hayosei').innerHTML = '・・・';
        $("#hayo").fadeIn()
      },5000);
      setTimeout(function(){
        $("#hayo").fadeOut()
      },5500);

      setTimeout(function(){
        document.getElementById('hayosei').innerHTML = '<span id="oko">はよせい！！</span>';
        $("#hayo").fadeIn()

        if ($("#oko").length !==0){
          console.log('あるよ')
            $(document).on('click', '#boke_text', function(){
              document.getElementById('hayosei').innerHTML = '<span id="ok">がんばー</span>';
              $("#hayo").fadeOut(3000)
            });
        }
      },6000);

      $('#boke_text').blur(function(){
          console.log('いるよ')
            $(document).on('click', '#boke_text', function(){
              document.getElementById('hayosei').innerHTML = '<span id="ok">はやくしてよぉ〜</span>';
              $("#hayo").fadeOut(3000)
            });
            setTimeout(function(){
              document.getElementById('hayosei').innerHTML = 'どう〜？';
              $("#hayo").fadeIn()
            },2000);
            setTimeout(function(){
              document.getElementById('hayosei').innerHTML = '傑作できちゃった？';
              $("#hayo").fadeIn()
            },4000);
            setTimeout(function(){
              document.getElementById('hayosei').innerHTML = '<span id="oko">はよせい！！</span>';
              $("#hayo").fadeIn()
            },6000);
      });
    }
});


