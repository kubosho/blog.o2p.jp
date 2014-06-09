---
title: Web Audio APIについてLTを2つしていた
date: 2014-05-10 13:30 JST
tags: Web Auido API
---

最近、個人的に注目しているのが[Web Audio API](https://dvcs.w3.org/hg/audio/raw-file/tip/webaudio/specification.html)です。

そのWeb Audio APIについて、[帰ってきたYokohama.js](http://atnd.org/events/48953)と[CodeGrid二周年記念パーティー](http://www.zusaar.com/event/5117005)でLTをしてきたので、その時の発表資料をブログにも貼り付けておきます。

## 帰ってきたYokohama.jsで話したこと

Web Audio APIの概要や何ができるか、ブラウザの対応状況などについて話してきました。

<iframe src="http://www.slideshare.net/slideshow/embed_code/33705589" width="427" height="356" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px 1px 0; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="https://www.slideshare.net/kubosho/web-audio-api-33705589" title="Web Audio APIの初歩" target="_blank">Web Audio APIの初歩</a> </strong> from <strong><a href="http://www.slideshare.net/kubosho" target="_blank">Shota Kubota</a></strong> </div>

Yokohama.jsでLTの募集がおこなわれているのを見て、突然Web Audio APIに力を入れようと思い、いろいろと調べた結果をまとめた資料となっています。

## CodeGrid二周年記念パーティーで話したこと

[可聴域調査](http://kubosho.github.io/hearing-test-app/)という、割と最近のブラウザー(IEとAndroid Browserは除く)に対応した、100Hz〜20,000Hzの範囲でどこまで音を聴けるか確かめられるアプリを作りました。資料内では20Hz〜となっていますが、100Hz〜が正しいです。

<iframe src="http://www.slideshare.net/slideshow/embed_code/34440311" width="427" height="356" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px 1px 0; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="https://www.slideshare.net/kubosho/web-audio-api-34440311" title="Web Audio APIを使って可聴域を調べるアプリをつくってみた" target="_blank">Web Audio APIを使って可聴域を調べるアプリをつくってみた</a> </strong> from <strong><a href="http://www.slideshare.net/kubosho" target="_blank">Shota Kubota</a></strong> </div>

なぜこのアプリを作ろうと思ったかですが、以下のツイートをした後、聴力検査という単語にピンときて、実際につくってみました。

<blockquote class="twitter-tweet" lang="ja"><p>Web Audio API、聴力検査で流れるような音を生成して再生しただけなのに楽しい</p>&mdash; kubosho_ (@kubosho_) <a href="https://twitter.com/kubosho_/statuses/461848719319498752">2014, 5月 1</a></blockquote>

なお、アプリを作成して多少知見を得られたので、今後記事として公開していこうと思います。
