---
title: WordPressからGitHub Pages+Middleman+Travis CIに移行したらブログを書く気になれた話
date: 2013-12-17 23:59 JST
tags:
  - Middleman
  - Advent Calendar
---

[Blog #blogadvent Advent Calendar 2013](http://www.adventar.org/calendars/167) 17日目の記事です。

かつて、[WordPressでブログを運営](http://inputxoutput.com/)していましたが、[GitHub Pages](http://pages.github.com/)+[Middleman](http://middlemanapp.com/)([日本語](http://middlemanjp.github.io/))+[Travis CI](https://travis-ci.org/)に移行してみたら捗るようになったので、その移行話を書いてみます。

## なぜ移行したか

移行した理由ですが、簡潔に言うと「記事を公開するまでの流れを楽にしたかった」ということです。そして実際に移行したことによるメリットが2つあります。

1つめは、記事公開するまでの手順を減らせたことです。例えばWordPressの場合、普段使っているエディタで記事を書いた場合、以下の5つの手間が発生してとても面倒くさいものでした。

1. 記事をエディタで書く
2. ブラウザでWordPressのダッシュボードを開く
3. 投稿から新規追加を押す
4. タイトルと本文、タグなどにそれぞれ書いた内容をコピペしたり、スラッグを決める
5. 公開ボタンを押す

しかしmiddlemanに移行後、手順が以下の通り2つ減り、よりブログの記事を書こうという気になっています。

1. 記事をエディタで書く
2. ターミナルやGitをGUIで扱えるソフト(SourceTree)などを開く
3. git add . && git commit && git push origin master

2つめは、普段使っているエディタとmarkdown形式が使えるようになったということです。markdown形式については、[Markdown on Save](http://wordpress.org/plugins/markdown-on-save/)というWordPressのプラグインを使っていましたが、プラグインを追加しなくても標準で対応しているというのが良いと思いました。

とはいえメリットだけでなく、下記の移行までの流れの章で移行にあたり参考にしたサイトを載せていますが、各種サービスの連携が面倒というデメリットはあります。とはいえそれも最初だけで、ブログを書いて公開する時間のほうが移行する準備の時間より長いので、元は取れるかなという感じです。

## 移行までの流れ

MiddlemanのインストールとTravis CIで自動ビルドとGitHubへ自動的にpushする流れを作るのに、[Middleman で作った web サイトを Travis + GitHub pages でお手軽に運用する - tricknotesのぼうけんのしょ](http://tricknotes.hateblo.jp/entry/2013/06/17/020229)を参考にしました。

Middlemanの設定については、[@hokaccha](https://twitter.com/hokaccha)のブログ、[Webtech Walker](http://webtech-walker.com/)の[リポジトリ](https://github.com/hokaccha/webtech-walker)を見て参考にしています。

上の2つのリンクと[公式サイト](http://middlemanapp.com/)のMiddleman Basicsのリンク先を見れば、インストールから設定まで事足りますが、リンクだけ紹介するのも芸がないので、移行にあたり工夫した点を以下に書いていきます。

## テンプレートファイルをSlimにした

ERB形式のテンプレートファイルの場合、Rubyをテンプレートファイルの中に組み込みたいという場合に&lt;% ... %&gt;みたいな感じで、いちいち&lt;&gt;や%を書かないといけなかったり、HTMLの要素を書くときにも&lt;と&gt;を打たないといけないというのが面倒だと感じました(HTMLに関してはEmmetを使えばいい話ですが)。

なので、Slim形式にテンプレートを書き換え、config.rbで以下の2行を追記し、Slimを使うようにしています。

```ruby
set :markdown, :layout_engine => :slim
set :blog_layout_engine, :slim
```

## URLにyyyy/mm/ddの形式で年月日を含めるようにした

Middleman固有の話ではないのですが、URLに年月日を含めるようにしました。というのもこのブログで扱うのがWebの技術に関することという以上、更新しない限り情報は古くなります。

そうなった場合、例えば情報を探している人が検索エンジンなどから自分が書いた古くなった情報が載っている記事にアクセスして、かつその情報を参考にしてしまった場合、その時点で正しくない情報に誘導(して|されて)しまったということでお互いもやっとした気持ちになると思います。

なので、そういうことが減るようURLに年月日を含めることで、もしかしたらこの情報は古いかもしれないという事に気づいてくれたらという期待をこめて、URLに年月日を含めるようにしました。

------

ということで、WordPressからMiddlemanに移行したらブログを書く気になれた話でした。これからもここで記事を書けるよう技術的に精進していきたいと思います。