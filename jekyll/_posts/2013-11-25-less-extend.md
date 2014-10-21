---
title: LESSのextend機能の使い方について
date: 2013-11-25 09:00 JST
tags: LESS
---

LESSのバージョン1.4.0 Beta 1 & 2から実装された「extend」について、サンプルコードを交えながら使い方を紹介します。

## extendとは

その前にextendという機能についておさらいします。これについては[Sass の @extend はどこがすごいのか – terkel.jp](http://terkel.jp/archives/2011/12/sass-extend/)という記事で短く分かりやすい説明がされていたので引用します。

> @extend される側として一連のスタイルを定義したセレクタがあり、そのセレクタを @extend で継承しつつプロパティを追加したりして、新しいセレクタを作ります

## サンプルコード  

```
.test-base {
    background-color: #393939;

    div {
        color: #f0f0f0;
    }
}

.test-01 {
    // 指定したセレクタを継承。内包されているセレクタは継承されない。
    &:extend(.test-base);
}

.test-02 {
    // 指定したセレクタを内包されているセレクタも含め継承。
    &:extend(.test-base all);
}

.test-03 {
    // 指定したセレクタに内包されているセレクタを指定しそれを継承。
    &:extend(.test-base div);
}

.test-04 {
    // 指定したセレクタを継承し、新たにプロパティと値、内包されるルールセットを指定。
    &:extend(.test-base);
    background-color: #666;

    div {
        color: #ccc;
    }
}
```

これをCSSにコンパイルすると以下のようなコードになります。

```css
.test-base,
.test-01,
.test-02,
.test-04 {
    background-color: #393939;
}
.test-base div,
.test-02 div,
.test-03 {
    color: #f0f0f0;
}
.test-04 {
    background-color: #666;
}
.test-04 div {
    color: #ccc;
}
```

とこんな感じに、共通のプロパティと値の指定は1つのルールセットにまとまり、セレクタごとに独自に指定したプロパティと値は別になるといういい感じのコードが生成されます。

LESSのextendの記法については、[Sassのドキュメント](http://sass-lang.com/documentation/file.SASS_REFERENCE.html#extend)を見ればなんとなく把握できると思います(ただし、@extend-Only Selectorsみたいに対応していない記法もありますが)。

## マメ知識

LESSのextend機能は[@hokaccha](https://twitter.com/hokaccha)により、[less.jsのリポジトリにPull Request](https://github.com/less/less.js/pull/509)され、その時の記法は「+」を使ったものでした。

> ```
> .foo {
>   width: 100px;
> }
> .bar {
>   +.foo;
> }
> ```

ただこの記法だと、[隣接セレクタみたいで分かりにくい](https://github.com/less/less.js/pull/509#issuecomment-9153449)という意見が出て、いったん「++」を使った記法になり、その後上記で説明した「&:extend(selector)」という記法に落ち着いたようです。

(このマメ知識部分は[最近のLessのextendの進捗 - Webtech Walker](http://webtech-walker.com/archive/2012/12/less_extend.html)を参考にしつつ書きました)
