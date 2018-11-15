$(function(){
    var url = location.href;
    if (url.match(/\/odais\/\d+\/bokes\/new/)){
    var html =`
              <div id="hayo">
                <div class="icon">
                  <div class="baloon">
                    <p id="hayosei">やぁ</p>
                  </div>
                </div>
              </div>
              `
    var hayo = $('#content').append(html);
    $("#hayo").hide()


      // setTimeout(function(){
      //   $("#hayo").fadeIn()
      // },5000);
      // setTimeout(function(){
      //   $("#hayo").fadeOut()
      // },7000);

      setTimeout(function(){
        document.getElementById('hayosei').innerHTML = 'ボケったー楽しんでる？';
        $("#hayo").fadeIn()
      },5000);
      setTimeout(function(){
        $("#hayo").fadeOut()
      },7000);

      // setTimeout(function(){
      //   document.getElementById('hayosei').innerHTML = 'ねぇ、30秒たったよ（倍速）';
      //   $("#hayo").fadeIn()
      // },15000);
      // setTimeout(function(){
      //   $("#hayo").fadeOut()
      // },17000);

          setTimeout(function(){
        document.getElementById('hayosei').innerHTML = 'まだー？';
        $("#hayo").fadeIn()
      },10000);
      setTimeout(function(){
        $("#hayo").fadeOut()
      },12000);

      // setTimeout(function(){
      //   document.getElementById('hayosei').innerHTML = '・・・';
      //   $("#hayo").fadeIn()
      // },25000);
      // setTimeout(function(){
      //   $("#hayo").fadeOut()
      // },27000);

      setTimeout(function(){
        document.getElementById('hayosei').innerHTML = '<span id="oko">はよせい！！</span>';
        $("#hayo").fadeIn()

        if ($("#oko").length !==0){
            $(document).on('click', '#boke_text', function(){
              document.getElementById('hayosei').innerHTML = '<span id="ok">がんばー</span>';
              $("#hayo").fadeOut(3000)
            });
        }
      },15000);

      $('#boke_text').blur(function(){
            $(document).on('click', '#boke_text', function(){
              document.getElementById('hayosei').innerHTML = '<span id="ok">はやくしてよぉ〜</span>';
              $("#hayo").fadeOut(3000)
            });
            setTimeout(function(){
              document.getElementById('hayosei').innerHTML = 'どう〜？';
              $("#hayo").fadeIn()
            },5000);
            setTimeout(function(){
              document.getElementById('hayosei').innerHTML = '傑作できちゃった？';
              $("#hayo").fadeIn()
            },10000);
            setTimeout(function(){
              document.getElementById('hayosei').innerHTML = '<span id="oko">はよせい！！</span>';
              $("#hayo").fadeIn()
            },15000);
      });
    }
});


