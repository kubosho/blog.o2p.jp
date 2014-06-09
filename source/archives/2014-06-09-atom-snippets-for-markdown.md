---
title: Atomでmarkdownのsnippetsを指定する方法
date: 2014-06-09 09:15 JST
tags: Atom
---

Middlemanでブログを書いていると、タイトルや日時などの指定をスニペットにしたくなります。

しかし、<code>Atom -> Open Your Snippets</code>から<code>snippets.cson</code>を開いて、以下のように書いてmarkdown形式のファイルで<code>tab</code>を押してみてもソフトタブが入力されるばかりで、一向に補完されませんでした。

```
'.source.md':
  'meta':
    'prefix': 'meta'
    'body': '---\ntitle:\ndate: 2014-0- 09:00 JST\ntags:\npublished: false\n---'
```

解決方法ですが、[language-gfm/snippets/gfm.cson at master · atom/language-gfm](https://github.com/atom/language-gfm/blob/master/snippets/gfm.cson)にあるように、<code>.source.md</code>ではなく<code>.source.gfm</code>と指定することにより、例えば以下の例でいうと、<code>meta</code>とmarkdown形式のファイルで入力し<code>tab</code>を押すことにより、補完されるようになります。

```
'.source.gfm':
  'meta':
    'prefix': 'meta'
    'body': '---\ntitle:\ndate: 2014-0- 09:00 JST\ntags:\npublished: false\n---'
```
