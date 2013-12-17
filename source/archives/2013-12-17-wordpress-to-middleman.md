---
title: WordPressからGitHub Pages+Middleman+Travis CIに移行したらブログを書く気になれた話
date: 2013-12-17 17:00 JST
published: false
tags:
  - middleman
---

[Blog #blogadvent Advent Calendar 2013](http://www.adventar.org/calendars/167) 17日目の記事です。

かつて、[WordPressでブログを運営](http://inputxoutput.com/)していましたが、[GitHub Pages](http://pages.github.com/)+[Middleman](http://middlemanapp.com/)([日本語](http://middlemanjp.github.io/))+[Travis CI](https://travis-ci.org/)に移行してみたら捗るようになったので、その移行話を書いてみます。

## 移行しようと思った理由

### 記事を公開するまでの手間が少なくなる

WordPressだと例え普段使っているエディタで記事を書いても、以下の手順が発生します。

1. 記事をエディタで書く
2. ブラウザでWordPressのダッシュボードを開く
3. 投稿から新規追加を押す
4. タイトルと本文、タグなどにそれぞれ書いた内容をコピペしたり、スラッグを決める
5. 公開ボタンを押す

面倒くさいです。しかしmiddlemanなら、以下の手順で記事が公開できます。

1. 記事をエディタで書く
2. ターミナルやGitをGUIで扱えるソフト(SourceTree)などを開く
3. git add . && git commit && git push origin master

手順が2つ減りました。素晴らしいです。

## 編集履歴を公開できる

記事を追記した場合、記事内に「いついつに更新しました」と書くのは面倒です。その点GitHubにpushするようにしていれば、編集履歴が公開されるので[History for source/archives/2013-12-17-wordpress-to-middleman.md - kubosho/tech.o2p.jp](https://github.com/kubosho/tech.o2p.jp/commits/master/source/archives/2013-12-17-wordpress-to-middleman.md)