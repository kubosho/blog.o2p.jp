---
title: masterブランチへの自動コミット時にTravis CIにbuildさせないようにする設定
date: 2014-01-17 11:00 JST
tags: TravisCI
---

とある事情により、このブログのリポジトリを[Organizationアカウント](https://github.com/o2project/o2project.github.io)のほうに移行しました。

GitHub PagesのuserやOrganizationページは、masterブランチに内容をpushする必要があるため、developというブランチを作成し、Travis CI側でビルドした後masterにcommitするようにしました。

しかし、masterへの自動commitをTravis CIがした時に、そのcommitにもTravis CIが反応する事態となってしまいました。

そして開発者曰く、その挙動は抑止できないということです。

<blockquote class="twitter-tweet" lang="ja"><p><a href="https://twitter.com/kubosho_">@kubosho_</a> 今のところその挙動は抑止できません。申し訳ありません。問題自体は熟知していますので出来るだけ早いうちに修正したいとは考えています。</p>&mdash; あさり (@hiro_asari) <a href="https://twitter.com/hiro_asari/statuses/418587151748845569">2014, 1月 2</a></blockquote>

しかし、問題解決できないのかというと、回避する方法はあり、それがコミットメッセージに`[ci skip]`を含めるというものです。

```
git commit -m '[ci skip] Update by Travis CI
```

具体的には[こんな感じ](https://github.com/o2project/o2project.github.io/blob/c2de72f5a08ac2c8cc45780ce11ccd027e5a6974/Rakefile#L46)です。

教えてくださった[@yo_waka](https://twitter.com/yo_waka)には感謝です。
