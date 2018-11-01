//ボタンオレンジに変更
$(function () {
    //マウスを乗せたら発動
    $('.boke-information-label,.boke-share-social a,.tag-container .tag-content').hover(function () {
        //マウスを乗せたら色が変わる
        $(this).css('background', '#f4c535');
        //ここにはマウスを離したときの動作を記述
    }, function () {
        //色指定を空欄にすれば元の色に戻る
        $(this).css('background', '');
    });
});

//ボタンカラー濃度濃く変更
$(function () {
    $('.btn-primary').hover(function () {
        $(this).css({ 'background': '#f5bc13', 'border-color': '#e2aa02'});
    }, function () {
        $(this).css({ 'background': '', 'border-color': '' });
    });
});


//リンクテキストがオレンジに変更
$(function () {
    $('.boke-photo-meta a,.photo-meta a,.side-widget-content a,.footer-list a').hover(function () {
        $(this).css('color', '#f4c535');
    }, function () {
        $(this).css('color', '');
    });
});