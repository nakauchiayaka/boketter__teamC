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
      },10000);
      setTimeout(function(){
        $("#hayo").fadeOut()
      },15000);

      setTimeout(function(){
        document.getElementById('hayosei').innerHTML = 'ボケったー楽しんでる？';
        $("#hayo").fadeIn()
      },20000);
      setTimeout(function(){
        $("#hayo").fadeOut()
      },25000);

      setTimeout(function(){
        document.getElementById('hayosei').innerHTML = 'ねぇ、30秒たったよ';
        $("#hayo").fadeIn()
      },30000);
      setTimeout(function(){
        $("#hayo").fadeOut()
      },35000);

          setTimeout(function(){
        document.getElementById('hayosei').innerHTML = 'まだー？';
        $("#hayo").fadeIn()
      },40000);
      setTimeout(function(){
        $("#hayo").fadeOut()
      },45000);

      setTimeout(function(){
        document.getElementById('hayosei').innerHTML = '・・・';
        $("#hayo").fadeIn()
      },50000);
      setTimeout(function(){
        $("#hayo").fadeOut()
      },55000);

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
      },60000);

      $('#boke_text').blur(function(){
          console.log('いるよ')
            $(document).on('click', '#boke_text', function(){
              document.getElementById('hayosei').innerHTML = '<span id="ok">はやくしてよぉ〜</span>';
              $("#hayo").fadeOut(3000)
            });
            setTimeout(function(){
              document.getElementById('hayosei').innerHTML = 'どう〜？';
              $("#hayo").fadeIn()
            },20000);
            setTimeout(function(){
              document.getElementById('hayosei').innerHTML = '傑作できちゃった？';
              $("#hayo").fadeIn()
            },40000);
            setTimeout(function(){
              document.getElementById('hayosei').innerHTML = '<span id="oko">はよせい！！</span>';
              $("#hayo").fadeIn()
            },60000);
      });
    }
});

