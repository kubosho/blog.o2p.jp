---
title: Time-dimensional擬似クラスについて
date: 2013-12-09 21:30 JST
tags:
  - Advent Calendar
---

[CSS Property Advent Calendar 2013](http://www.adventar.org/calendars/57)9日目の記事です。

今日は少し先を見据えて、[Selectors Level 4](http://www.w3.org/TR/2013/WD-selectors4-20130502/)の中から、明日のAdvent Calendar担当でもあるmyakuraさんが書いた文書、[CSS4セレクタ (Selectors Level 4) の新機能](http://myakura.github.io/n/selectors4.html)で触れられていない「:current, :past, :future」の各擬似クラスについて、Working Draftで現在の最新版である2013/5/2版を参照しながら紹介します。

CSS Property Advent Calendarなのにセレクタの話になってしまいましたが、[すでに](http://dskd.jp/archives/37.html)[2人ほど](https://gist.github.com/azusa-tomita/7829371)セレクタの話をしているようなので、3人目になろうと思います。

曖昧なところがあるので、ここはこうだ！というところがありましたら、指摘していただけるとありがたいです。

## 目次

1. Time-dimensional擬似クラスについて
2. :current
3. :past, :future

## Time-dimensional擬似クラスについて

文書が音声で読まれているときや、[WebVTT](http://dev.w3.org/html5/webvtt/)というWeb上の動画に付けられる字幕に使われるようです。[Time-dimensional Pseudo-classes - Selectors Level 4](http://www.w3.org/TR/2013/WD-selectors4-20130502/#time-pseudos)

## :current

文書内で現在読まれているものを示した擬似クラスです。
:matchsと同じように単体セレクタの連なり(compound selectors)を引数に指定できます。以下のように指定した場合、文書内で現在読まれているものの中に引数に指定したセレクタのどれかが含まれていれば、強調して表示されるようです。

```css
:current(p, li, dt, dd) {
    background: yellow;
}
```

## :past, :future

:past, :futureについては、現在の再生位置を元に過去や未来を示す擬似クラスで、WebVTTでも定義されているようですが、それ以上は分からないです。

## :current, :past, :futureが示す部分

文章で書いていても分かりづらいと思うので、現在の自分の認識を画像にしてみました。

<figure>
    <a href="http://imgur.com/nWDAAsu"><img src="http://i.imgur.com/nWDAAsu.jpg" title="Hosted by imgur.com"/></a>
    <figcaption><a href="http://www.html5rocks.com/ja/tutorials/track/basics/">track 要素の基礎 - HTML5 Rocks</a>内の動画より画像を作成</figcaption>
</figure>

上記の画像で、"always"の部分が発音されていた場合、"The Web is"は:past, "always"は:current, "changing"は:futureになるのかなと思います。

## 使い道を妄想してみる

まず:currentについてですが、これは字幕のどこが読まれているか視覚的にも分かりやすくなるという点ではいいと思います。また、:futureについては、文字色を背景と同化させるようにしてまだ読まれていないということを視覚的に分かるようにするという使い方があると思います。

:pastは、:currentより過去を示す擬似クラスということで、カラオケの字幕のように使えるのではと思います。

というわけで、明日はmyakuraさんです。

## 参照したページ

- [Selectors Level 4](http://www.w3.org/TR/2013/WD-selectors4-20130502/#time-pseudos)
- [WebVTT: The Web Video Text Tracks Format](http://dev.w3.org/html5/webvtt/#the-past-and-future-pseudo-classes)
- [WebVTT - HTML | MDN](https://developer.mozilla.org/en-US/docs/HTML/WebVTT)
- [Selectors Level 4（CSS4セレクタ） - innov-staff-blog](http://www.innov-i.co.jp/innov-staff-blog/2013/0611_200000.html)
- [CSS4セレクタ (Selectors Level 4) の新機能](http://myakura.github.io/n/selectors4.html)
- [キャプション メーカーを使った WebVTT ファイルまたは TTML ファイルの作成 (Windows)](http://msdn.microsoft.com/ja-jp/library/ie/jj152136(v=vs.85).aspx)