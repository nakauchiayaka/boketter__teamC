$(function () {
    var search_list = $(".odai-list");

    function appendProduct(odai) {
        var html = `
                    <div class="pin" data-odai-id="${odai.odai_id}">
                      <div class="odai-inner">
                        <h3>
                          <b>
                            <a href="">${odai.boke_count}個のボケ</a>
                          </b>
                        </h3>
                        <div class='pull-left'>
                            <b>
                              ${odai.title}
                            </b>
                        </div>
                        <div class="odai-photo-warapper">
                          <a class="odai-photo" href="">
                            <img src="${odai.odai_phot}">
                          </a>
                        </div>
                        <div class="odai-meta">
                          <div class="clearfix">
                            <div class="pull-left">
                              <a href=""><i class='fas fa-camera'></i>
                                ${odai.user}
                              </a>&nbsp;
                              <a href=""><i class='far fa-image'></i>
                                ${odai.user}
                              </a>
                            </div>
                          </div>
                          <div class="mt10">
                            <a class="btn btn-default btn-sm btn-block" href="/odais/${odai.odai_id}/bokes/new">
                            このお題でボケる
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>
                   `
        search_list.append(html);
    }
    function appendNoProduct(odai) {
        var html = `
                  <i class="fas fa-exclamation-circle"></i> <label>${odai}</label>
                `
        search_list.append(html);
    }
    $("#search.odai-list").empty();
    $("#search").on("keyup", function () {
        var input = $("#search").val();
        $.ajax({
            url: '/odais/search',
            type: 'GET',
            dataType: 'json',
            data: { keyword: input },
        })
        .done(function (odais) {
            $(".odai-list").empty();
            if (odais.length !== 0) {
                odais.forEach(function (odai) {
                appendProduct(odai);
                });
            }
            else {
                appendNoProduct(" 一致するお題はありません");
            }
        })
        .fail(function () {
            alert('検索に失敗しました');
        })
    })
});
