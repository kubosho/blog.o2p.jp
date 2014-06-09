---
title: awk みたいなことを PowerShell 上から実行する
date: 2014-04-21 18:00 JST
tags: PowerShell
published: false
---

[git stash save で一時退避した変更を、誤って git stash clear で消してしまったときの回復法 - t-wadaの日記](http://d.hatena.ne.jp/t-wada/20090407/p1)

```PowerShell
git fsck | ?($_ -match "dangling commit")
```

なお、元のスクリプトは以下の通りです。

```shell
git fsck | awk '/dangling commit/ {print $3}'
```
