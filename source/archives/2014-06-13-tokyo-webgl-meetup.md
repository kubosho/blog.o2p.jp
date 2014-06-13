---
title: Tokyo WebGL Meetup メモ
date: 2014-06-13 01:50 JST
tags: 勉強会, WebGL
published: false
---

## WebGL のことはじめ

- WebGLを触ったことある人は会場の半分くらい。
- カヤックのサイコロ給をデジタルサイネージとして会社入り口に置くためにWebGLでコンテンツを作成

## ゴール

WebGLに興味はあるけど3Dと聞いてハードルが高そうと思っている人がWebGLにやってみようかなと思う

## 概要

- WebGLはJavaScriptとネイティブのOpenGL ES2.0のバインディング
  - ハードウェアでアクセラレートされた(GPUを使った)高速なレンダリング能力を得られる
  - 3Dに限らない
- iOS8がWebGLが動くので、2DのゲームもWebGLになるのではという予測を立てている

## 何をしているか

- WebGLにはパイプラインという仕組みがある
  - データに一連の処理を施し出力する
- 変換パイプライン
  - 行列
- モデル座標変換
  - 世界のどこに置くか
- ビュー座標変換
  - どこから撮影しているか
- プロジェクション座標変換
  - どんなレンズで撮影しているか
- 行列
  - 複雑な座標計算をまとめられる
- グラフィクスパイプライン
  - 重要なのはラスタライザの部分
  - 頂点シェーダとフラグメントシェーダがいじれる部分

- GLSL
  - JavaScriptはWebGLのAPIを叩く
  - あとはOS側で処理
- シェーダはGPUを操作する
 - 1pxごとに計算するのがフラグメントシェーダ

サンプル: [edom18/WebGL-Meetup-sample](https://github.com/edom18/WebGL-Meetup-sample)

<blockquote class="twitter-tweet" data-partner="tweetdeck"><p>「これだけ長いコードを書いて、三角形が1個だけ書けます」 by <a href="https://twitter.com/edo_m18">@edo_m18</a> <a href="https://twitter.com/search?q=%23webgl_tokyo&amp;src=hash">#webgl_tokyo</a></p>&mdash; Takuo Kihira (@tkihira) <a href="https://twitter.com/tkihira/statuses/477397618046148608">June 13, 2014</a></blockquote>

- WebGLは準備が大変。準備さえできればデータの追加はできる(頂点の位置情報変更など)
- ライブラリを使えば手軽にWebGLで表現できる
  - [three.js - JavaScript 3D library](http://threejs.org/)

## WebGL on IE11

## WebGL in iOS (with Ejecta)

## GLSL ray marching
