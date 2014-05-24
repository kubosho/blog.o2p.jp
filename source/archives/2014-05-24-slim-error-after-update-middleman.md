---
title: Middlemanのアップデート後に記事を見ようとしたらundefined method `safe_concat'(略)というエラーが出た場合の対処法
date: 2014-05-24 18:30 JST
tags:
  - Middleman
  - Slim
---

昨夜、gemのバージョンが古いと[Gemnasium](https://gemnasium.com/)で表示されていたので、<code>gem update</code>をしました。

そうした結果、<code>undefined method `safe_concat' for "":String Ruby path/to/foo.slim: in block (2 levels) in singleton class</code>というエラーが出てしまい、下記に示すような暴言を吐いてました。

<blockquote class="twitter-tweet" lang="ja"><p>ああああああああああああああああああああああRubyくそがあああああああああああああああ</p>&mdash; kubosho_ (@kubosho_) <a href="https://twitter.com/kubosho_/statuses/469901415209381888">2014, 5月 23</a></blockquote>

<blockquote class="twitter-tweet" lang="ja"><p>もうmiddlemanでなくていい気がしてきた</p>&mdash; kubosho_ (@kubosho_) <a href="https://twitter.com/kubosho_/statuses/469903646176452608">2014, 5月 23</a></blockquote>

<blockquote class="twitter-tweet" lang="ja"><p>よく考えたらRubyがほげと言ってしまったけど、Middlemanがほげな事例だった</p>&mdash; kubosho_ (@kubosho_) <a href="https://twitter.com/kubosho_/statuses/469914746456899586">2014, 5月 23</a></blockquote>

ここまで言って、本気ではてなブログの料金プランを見ていたりしたのですが、[@yterajima](https://twitter.com/yterajima)より、以下のmentionが来ました。

<blockquote class="twitter-tweet" lang="ja"><p><a href="https://twitter.com/kubosho_">@kubosho_</a> padrinoのバージョンがあがって一部 - を使っていた部分が = にしないとエラー、とかですかね？<a href="http://t.co/P9u1RNGtmW">http://t.co/P9u1RNGtmW</a>　のSllim and Haml〜のとこですが</p>&mdash; Yuya Terajima (@yterajima) <a href="https://twitter.com/yterajima/statuses/469917424725151744">2014, 5月 23</a></blockquote>

<blockquote class="twitter-tweet" lang="ja"><p><a href="https://twitter.com/kubosho_">@kubosho_</a> 同様のエラーがissueで報告されているようです。<a href="https://t.co/ThoVLZq38D">https://t.co/ThoVLZq38D</a></p>&mdash; Yuya Terajima (@yterajima) <a href="https://twitter.com/yterajima/statuses/469917863071866880">2014, 5月 23</a></blockquote>

まさにこの通りで、今までlayouts/post.slim内の<code>wrap_layout :layout do</code>という部分の前に書いていた記号が"-"でした。(["-"を"="に変更したコミット](https://github.com/o2project/blog.o2p.jp/commit/6519d196d3d1610409ee2257364982f0a3bded5f))

[Blog Upgrading Padrino from 0.11.X to 0.12.0 Guide - Padrino Ruby Web Framework](http://www.padrinorb.com/blog/upgrading-padrino-from-0-11-x-to-0-12-0-guide)[Blog Upgrading Padrino from 0.11.X to 0.12.0 Guide - Padrino Ruby Web Framework](http://www.padrinorb.com/blog/upgrading-padrino-from-0-11-x-to-0-12-0-guide)内の、Slim and Haml Content Blocks内にも書かれているのですが、テンプレートやタグヘルパーを作成する際に"-"を使っていた場合があったのですが、それが"="しか書けないようになったみたいです。

そして、互換性に影響のある変更なので、この新しい記述に更新する必要がある旨も注意として書かれています。

ということで、Padrinoに変更が加わり、今までテンプレートやタグヘルパーを作成する際に使えた"-"が使えなくなり、"="のみになったため、"-"を使っていたpost.slimでエラーが起きたという事でした。

暴言を吐く前に、GitHubのissueを見たりしないといけないなと思った事例でした。そして[@yterajima](https://twitter.com/yterajima)、ありがとうございました。
