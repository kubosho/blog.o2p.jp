---
title: KnockoutJSのtemplete bindingのプロパティにifを使った際、Android 2.xを搭載したSHARP端末の標準ブラウザでSyntax Errorが出る時の対処法
date: 2013-12-13 17:00 JST
published: false
tags:
  - Knockout
  - Android
---

KnockoutJSではtemplate bindingのプロパティにifなどを使うことができます。(詳しくは[Knockout : The "template" binding](http://knockoutjs.com/documentation/template-binding.html)で)

つまりこんな感じで書けて、iOSや大半のAndroidでは条件式を満たす時のみnameのvalueに指定したIDのtemplateがDOMに追加されます。

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