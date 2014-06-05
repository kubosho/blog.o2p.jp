---
title: html5j パフォーマンス部 第二回勉強会 メモ
date: 2014-06-05 22:00 JST
tags:
  - 勉強会
published: false
---

[html5j パフォーマンス部 第二回勉強会](http://atnd.org/events/50870)に参加したのでそのメモです。

# Session 1. 品質管理と統計学 ― IT業界へどうつなぐ？

## 個人の品質を高める

- 遅刻してしまうのはなぜかを考える
- 生活の中でも品質を高めることを考える

## 品質管理の考え方

- PDCAサイクル
- 品質管理のスローガン: 安全第一、品質第二、生産第三
  - 昔は逆の順番だったが労働者が疲れてしまった
  - 安全を第一にしたら品質もよくなった
- シックスシグマ: 抜き出したのがMAIC(測定、分析、改善、定着)
- 改善4法則: ECRS(排除、結合、交換、簡素化)
- ヒヤリハット: KY(危険予知)
- 品質の中の統計

## 統計的思考の問題解決法

- PPDACサイクル
  - Problem(問題の明確化)
  - Plan(実験・調査の計画)
  - Data(データ調査)
  - Analysis(データ分析)
  - Conclusion(問題解決)

## 品質管理と統計学

- ばらつきの科学
- 1mのものを作るときは完全に1mということはないので許される範囲を定義

## 特性要因図

<blockquote class="twitter-tweet" lang="ja"><p>パフォーマンスの向上を考える際に、特性要因図を作成して、管理可能な変数と管理不可能な変数を考えなければならない。<a href="https://twitter.com/search?q=%23html5j_perf&amp;src=hash">#html5j_perf</a></p>&mdash; Yoichiro Takehora (@takehora) <a href="https://twitter.com/takehora/statuses/474503940520697856">2014, 6月 5</a></blockquote>

## コントロールできる要因を特定

- ブレストで考えられることをあげる
- 要因グループを考えてまとめる
- コントロールできる要因の特定
- 重要な問題から解決

最終的にコントロールできない要因が残る

<blockquote class="twitter-tweet" lang="ja"><p>Webパフォーマンスについて言えば、ユーザの端末の性能、回線スピードは、コントロール不可能な要因。<a href="https://twitter.com/search?q=%23html5j_perf&amp;src=hash">#html5j_perf</a></p>&mdash; Yoichiro Takehora (@takehora) <a href="https://twitter.com/takehora/statuses/474505325656023041">2014, 6月 5</a></blockquote>

## 層別

2011年冬〜2012年冬までのドラマの視聴率を例に、視聴率層、時間層に分けて説明

- 外れ値
- いろいろな側面で層に分けると有効になってくる
- ビッグデータ時代には層別は有効

<blockquote class="twitter-tweet" lang="ja"><p>この時間帯で層別して分析するというのは、Webパフォーマンスでも大事。時間帯で層別するためには、定常的に計測するしかない。<a href="https://twitter.com/search?q=%23html5j_perf&amp;src=hash">#html5j_perf</a></p>&mdash; Yoichiro Takehora (@takehora) <a href="https://twitter.com/takehora/statuses/474505975404036097">2014, 6月 5</a></blockquote>

## 正規分布の基礎

- 変曲点

## 品質管理

- A社は技術力を高める
- B社は不良品を出さない仕組みを考える
- C社は検知するのは無理なので、保証を考える

これらはリスクマネジメントにつながる

## 工程能力指数

- 1.33(=100万個の中の30個)を目指す -> 32ppm

## 今日の話の注意

- 正規分布である必要はない
- 両側に規格がある必要はない
- 品質管理のシステムはISO9001が基本
- リスクマネジメントを考える必要がある

<blockquote class="twitter-tweet" lang="ja"><p>Webパフォーマンスの場合、自社のサイトのパフォーマンス状況をきちんと考えないと、どのような「リスク管理」をすべきかがわからない。分析もせずに、配信上のリスク管理を考えているとしたら、意味がない。システムの二重化とかがリスク管理ではない。 <a href="https://twitter.com/search?q=%23html5j_perf&amp;src=hash">#html5j_perf</a></p>&mdash; Yoichiro Takehora (@takehora) <a href="https://twitter.com/takehora/statuses/474509760507555840">2014, 6月 5</a></blockquote>

# Session 2. ソフトウェア工学の基礎を学ぶ

## ソフトウェア工学とは？

### ソフトウェアの本質的な難しさ

- 難しいので理論や手法が必要
- 化学、機械、電子工学には科学という強力な理論がある
- ソフトウェアの理論はソフトウェア科学？
  - 数学が理論になっている

### 見積もり手法の種類

- 単純推論
  - 過去の開発実績から推測
- 作業展開積み上げ
  - 作業を細かく分割して、各作業のコストを積み上げる

## ソフトウェア工学の潮流

- ライフサイクル論争
  - 工業的
  - 大人数を投入すればソフトウェアは作れる
  - 標準化の波
- アジャイル
  - 知働的

### アジャイルの大事なこと

<strong>明確になった事項を、明確になったものだけ、すみやかに実装する</strong>

### 内製化

システムフローが外にあるのではなく、社内にあってエンジニアも社内にいる企業が増えている

### 品質とは

ユーザーやスポンサーの要求を満たすためにソフトウェアが持つべき特性

### リファクタリングの効果

リファクタリングすることにより、コストが抑えられる

## 知識主導社会のソフトウェア工学

- 人働説から知働説(「私はこんなことができる」から「私はこんな価値が生み出せる」)へ
- 実装したものを見せて、こんなものができるのか、これも実装してくれという声が上がる
  - 作ったものから次が生まれる

### パフォーマンス改善のプロセス

1. 仮説をたてる
2. 実装する
3. 計測する
4. 分析する

このプロセスを回す

## もっと先のソフトウェア工学

[アジャイルプロセス協議会](http://www.agileprocess.jp/)

# 締めくくりの挨拶

- 何かを早くすることにより、どこかに影響がある。影響範囲を考えないといけない(全体の最適)
- パフォーマンスを早くしたことにより、ネットワーク機器に影響が来たり、TTLが5分に設定されていたことによりキャッシュがそのたびに消えるため耐え切れなくなる
- [html5j パフォーマンス部 Webサイト](http://perf.html5j.org/)

<blockquote class="twitter-tweet" lang="ja"><p>部長：パフォーマンス改善は部分最適やっても意味がなくて、全体最適やんなきゃ意味がない。FE早くしたらBEついてこないとかの例もある。全体最適をするためにはどんな理論や知識体系・手法があるかをしることが必要。問題の本質が理解できる　<a href="https://twitter.com/search?q=%23html5j_perf&amp;src=hash">#html5j_perf</a></p>&mdash; stwhabout (@stwhabout) <a href="https://twitter.com/stwhabout/statuses/474523265440808960">2014, 6月 5</a></blockquote>

<blockquote class="twitter-tweet" lang="ja"><p>たとえばDNSのTTLが短く設定されている場合。いっぱいDNS解決のパケットが飛んで、キャリアは死ぬしユーザ体験もわるくなる。全体的な対応の勘所を押さえるために知識体系を学ぶことが大事　<a href="https://twitter.com/search?q=%23html5j_perf&amp;src=hash">#html5j_perf</a></p>&mdash; stwhabout (@stwhabout) <a href="https://twitter.com/stwhabout/statuses/474523991848144896">2014, 6月 5</a></blockquote>
