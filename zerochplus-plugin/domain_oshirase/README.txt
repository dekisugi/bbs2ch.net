# 0ch_domain_oshirase.plに関する雑多なメモです


## プラグイン作成前に行った実験


    http://friend.ship.jp/grkt/20170910_domain-env-test.pl
    
    SERVER_NAME:	friend.ship.jp
    HTTP_HOST:	friend.ship.jp
    
    --------------------------------------------------
    
    http://www.bbs2ch.net/grkt/20170910_domain-env-test.pl
    
    SERVER_NAME:	www.bbs2ch.net
    HTTP_HOST:	www.bbs2ch.net
    
    --------------------------------------------------
    
    http://bbs2ch.net/grkt/20170910_domain-env-test.pl
    
    SERVER_NAME:	bbs2ch.net
    HTTP_HOST:	bbs2ch.net
    
    --------------------------------------------------
    
    return 0 if ( $ENV{'SERVER_NAME' eq 'friend.ship.jp' );
    本文 .= ' <hr> お知らせ <br> メッセージ ';
    # 実行タイミング16でこんなプラグインを作ればいいと思うよ
    # 実行タイミング1|2はやめておけ、NormalizationContentsとかIsRegulationとかの前だから



## 既知の問題等のメモ


    open my $fh, '>', $path;
    close $fh;
    ↑はこう↓するべきだったかな
    if (open my $fh, '>', $path) {
      close $fh;
    }
    
    
    ・実行タイミングが16なので、スレッドを立てようとした人が立てられなくなってしまっていた
      ・IP.cgi(スレ立てログ)記録→1063(bbs2ch.netドメイン廃止)エラーで書き込めず→IP.cgiにはすでに記録があるので、以降ドメインを切り替えたか否かに関わらず500(スレッド立てすぎ)エラー
