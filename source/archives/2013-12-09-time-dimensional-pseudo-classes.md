---
title: Time-dimensional擬似クラスについて(CSS Property Advent Calendar 2013 9日目)
published: false
---

[CSS Property Advent Calendar 2013](http://www.adventar.org/calendars/57)9日目の記事です。

今日は少し先を見据えて、[Selectors Level 4](http://www.w3.org/TR/2013/WD-selectors4-20130502/)の中から、明日のAdvent Calendar担当でもあるmyakuraさんが書いた文書、[CSS4セレクタ (Selectors Level 4) の新機能](http://myakura.github.io/n/selectors4.html)でも触れられていない「:current」「:past」「:future」について、Working Draftで現在の最新版である2013/5/2版を参照しながら紹介します。

CSS Property Advent Calendarなのにセレクタの話になってしまいましたが、[すでに](http://dskd.jp/archives/37.html)[2人ほど](https://gist.github.com/azusa-tomita/7829371)セレクタの話をしているようなので、3人目になろうと思います。

曖昧なところがあるので、ここはこうだ！というところがありましたら、指摘していただけるとありがたいです。

## 目次

1. Time-dimensional擬似クラスについて
2. :current
3. :past
4. :feature

## Time-dimensional擬似クラスについて

文書が音声で読まれているときや、[WebVTT](http://dev.w3.org/html5/webvtt/)というWeb上の動画に付けられる字幕に使われるようです。[Time-dimensional Pseudo-classes - Selectors Level 4](http://www.w3.org/TR/2013/WD-selectors4-20130502/#time-pseudos)

## :current

:matchsと同じように単体セレクタの連なり(compound selectors)を引数に指定できます。以下のように指定した場合、字幕として表示している場合は背景色が黄色になり、音声で読まれている場合は強調されて読まれるようです。

```
:current(p, li, dt, dd) {
    background: yellow;
}
```