---
title: WordPressからGitHub Pages+Middleman+Travis CIに移行したらブログを書く気になれた話
date: 2013-12-17 17:00 JST
published: false
tags:
  - middleman
---

[Blog #blogadvent Advent Calendar 2013](http://www.adventar.org/calendars/167) 17日目の記事です。

かつて、[WordPressでブログを運営](http://inputxoutput.com/)していましたが、[GitHub Pages](http://pages.github.com/)+[Middleman](http://middlemanapp.com/)([日本語](http://middlemanjp.github.io/))+[Travis CI](https://travis-ci.org/)に移行してみたら捗るようになったので、その移行話を書いてみます。

## なぜ移行したか

移行した理由ですが、WordPressだと例え普段使っているエディタで記事を書いても以下の5つの手間が発生してとても面倒くさいものでした。

1. 記事をエディタで書く
2. ブラウザでWordPressのダッシュボードを開く
3. 投稿から新規追加を押す
4. タイトルと本文、タグなどにそれぞれ書いた内容をコピペしたり、スラッグを決める
5. 公開ボタンを押す

しかしmiddlemanに移行後、手順が以下の通り2つ減り、よりブログの記事を書こうという気になっています。

1. 記事をエディタで書く
2. ターミナルやGitをGUIで扱えるソフト(SourceTree)などを開く
3. git add . && git commit && git push origin master

あとは、普段使っているエディタとmarkdown形式が使えるというのも、移行した理由になります。

## 移行までの流れ

MiddlemanのインストールとTravis CIで自動ビルドとGitHubへ自動的にpushする流れを作るのに、[Middleman で作った web サイトを Travis + GitHub pages でお手軽に運用する - tricknotesのぼうけんのしょ](http://tricknotes.hateblo.jp/entry/2013/06/17/020229)を参考にしました。

Middlemanの設定については、@hokacchaの[webtech-walker/source](https://github.com/hokaccha/webtech-walker/tree/master/source)以下を見て参考にしています。

上の2つのリンクと[公式サイト](http://middlemanapp.com/)のMiddleman Basicsのリンク先を見れば事足りますが、リンクだけ紹介するのも芸がないので、工夫した点を以下に書いていきます。

## テンプレートファイルをSlimにした

ERB形式のテンプレートファイルの場合、Rubyをテンプレートファイルの中に組み込みたいという場合に&lt;% ... %&gt;みたいな感じで、いちいち&lt;&gt;や%を書かないといけなかったり、HTMLの要素を書くときにも&lt;と&gt;を打たないといけないというのが面倒だと感じました(HTMLに関してはEmmetを使えばいい話ですが)。

なので、Slim形式にテンプレートを書き換え、config.rbで以下の2行を追記し、Slimを使うようにしています。

```ruby
set :markdown, :layout_engine => :slim
set :blog_layout_engine, :slim
```