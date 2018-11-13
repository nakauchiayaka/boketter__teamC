$(function(){
  function buildHTML(more){
        var html = `
                    <div class="pin" data-odai-id="${more.odai_id}">
                      <div class="odai-inner">
                        <h3>
                          <b>
                            <a href="odais/${more.odai_id}">${more.boke_count}個のボケ</a>
                          </b>
                        </h3>
                        <div class="odai-photo-warapper">
                          <a class="odai-photo" href="">
                            <img src="${more.odai_phot}">
                          </a>
                        </div>
                        <div class="odai-meta">
                          <div class="clearfix">
                            <div class="pull-left">
                              <a href=""><i class='fas fa-camera'></i>
                                ${more.user}
                              </a>&nbsp;
                              <a href=""><i class='far fa-image'></i>
                                ${more.user}
                              </a>
                            </div>
                          </div>
                          <div class="mt10">
                            <a class="btn btn-default btn-sm btn-block" href="/odais/${more.odai_id}/bokes/new">
                            このお題でボケる
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>
                   `
      return html;
  }
    $('#loadmore').on('click', function(e){
      e.preventDefault();
      var minOdaiId = $('.pin:last').data('odai-id');
      console.log(minOdaiId)
      $.ajax({
      url: '/odais/',
      type: 'GET',
      dataType: 'json',
      data: {id: minOdaiId }
      })
      .done(function(json){
        var insertHTML = ''
        if (json.length !== 0){
            json.forEach(function(odai){
            insertHTML += buildHTML(odai);
        });
        $('.odai-list').append(insertHTML);
        }else{
          $('#loadmore').hide();
        }
      })
      .fail(function(){
        alert('通信失敗したよ')
      })
    })
});
