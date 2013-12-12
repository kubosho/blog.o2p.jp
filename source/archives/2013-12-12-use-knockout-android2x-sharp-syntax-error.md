---
title: Android 2.xなSHARP端末の標準ブラウザでKnockoutJSでSyntax Errorが出た時の対処法
date: 2013-12-03 17:00 JST
published: false
tags:
  - Knockout
---

KnockoutJSではtemplate bindingのparameterにifなどを使うことができます。

[Knockout : The "template" binding](http://knockoutjs.com/documentation/template-binding.html)

つまりこんな感じで書けて、iOSや大半のAndroidでは条件式を満たす時のみnameのvalueに指定したIDのtemplateがDOMに追加されます。

TODO: JS Binでデモ書く

```
<!-- ko template: { if: 条件式, name: 'テンプレート名' } --><!-- /ko -->
```

> Uncaught Syntax Error: Unable to parse bindings.
Bidings value: template: { if: 条件式, name: 'テンプレート名' }
Message: Unexpected token if

こうしたら直りました。

```
<!-- ko if: 条件式 -->
<!-- ko template: { name: 'テンプレート名' } --><!-- /ko -->
<!-- /ko -->
```

about:configを紹介しているサイトを追加する