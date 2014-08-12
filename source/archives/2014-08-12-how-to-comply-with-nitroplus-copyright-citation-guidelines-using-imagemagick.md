---
title: ImageMagickを使ってニトロプラスの著作権引用ガイドラインに準拠する
date: 2014-08-12 10:30 JST
tags: ImageMagick
---

コミックマーケット86で、[Steins;Git](http://sg.o2p.jp/)という書籍を頒布すべく、この3ヶ月間くらいコミケに向けて作業をしていました。

作業の際、気をつけたことの一部として、[ニトロプラスの著作物転載ガイドライン](http://www.nitroplus.co.jp/license/)に準拠するということでした。

ただ、ガイドラインに準拠するために、画像に著作権表示を入れたりリサイズしないといけなかったりして面倒そうだったので、ImageMagickを使ってガイドラインに準拠するように画像を加工することにしました。

## 方針

画像加工するにあたって、以下の方針で作業しています。

- /Ch*/img/以下の「nitro-」という接頭辞がついた画像に対して処理
- 元画像に処理後の画像を上書きする「mogrify」というコマンドを使用

前提として、[o2project/steins-git](https://github.com/o2project/steins-git)のリポジトリでは、Ch1\_WhatsGit、Ch2\_WhyGit…のように「Ch」が接頭辞として付いているディレクトリがあり、その中に各章で使うためのimgディレクトリがあります。

それらのimgディレクトリに対して「nitro-」という接頭辞が名前についている画像があったら、下記に書くような著作権表示の追加だったり、画像縮小などをおこなうようにしました。

また、処理後のファイルを別ファイルとして保存できる「[convert](http://www.imagemagick.org/script/convert.php)」というコマンドもあるのですが、それでも「mogrify」を使った理由としては、面倒だったからというのがあります。

ただし、処理後の画像を見て「こうじゃない」と思って、画像を再度処理したくなることはあると思うので、mogrifyよりもconvertを使うようにしたほうがいいと思います。

## 著作権表示を追加する

著作権表示についてですが、ガイドラインには<q>転載した画像の側もしくは画像内に著作権表示を含めてください</q>と書いてあります。Steins;Gateの場合だと<q>(C)MAGES./5pb./Nitroplus</q>を含めなくてはいけないことになります。

というわけで、以下のようなシェルスクリプトを書いてみました。

```shell
#!/bin/bash

declare parentDir=$(cd $(dirname $(cd $(dirname $0);pwd));pwd)
declare fontDir=$parentDir/font
declare copyright="(C)MAGES./5pb./Nitroplus"

for img in `ls $parentDir/Ch*/img/nitro-*.*`
do
    mogrify -font $fontDir/mplus-1c-regular.ttf -pointsize 15 -gravity southwest -annotate 0 $copyright -fill "#ffffff" -quality 100 $img
done
```

このスクリプトの仕様としては以下のようになっています。

- フォントは[M+ OUTLINE FONTS](http://mplus-fonts.sourceforge.jp/mplus-outline-fonts/index.html)を使用
- フォントサイズは15pt
- 著作権表示は左下に追加
- 文字色は#ffffff

## 画像を縮小する

画像サイズについてですが、ガイドラインには<q>画面キャプチャーを使用する場合は横640px、縦480px以下に縮小してください</q>と書いてあります。

というわけで、以下のようなシェルスクリプトを書いてみました。

```shell
#!/bin/bash

declare parentDir=$(cd $(dirname $(cd $(dirname $0);pwd));pwd)

for img in `ls $parentDir/Ch*/img/nitro-*.*`
do
    mogrify -resize 56.3% -quality 100 -unsharp 2x1.4+0.5+0 $img
done
```

-resizeオプションで指定している「56.3%」というのは、iPhone 5の画面解像度(1136*640)をガイドライン上で定められている最大値である、横640pxにするために指定している数値です。

unsharpオプションの指定は[コマンドラインで画像を縮小する：ImageMagick convert mogrify - Linux Memo: Vine Linux 5 設定 tips](http://d.hatena.ne.jp/weblinuxmemo/20090929/p1)を参考にしています。

---

というわけで、以上の加工をほどこした画像が[Steins;GitのHTML版のプレビュー](http://o2project.github.io/steins-git/)で見られます。

ちなみに、上のプレビューを見てもらうと分かるのですが、ゲームのスクリーンショットを使っている箇所は1ヶ所しかありません。なので、手作業でやったほうが実は早かったんじゃないか説がありますが、気にしないことにします。
