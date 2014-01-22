---
title: カラーコードやRGB値に一致する正規表現の書き方
date: 2014-01-23 09:00 JST
tags:
  - regexp
published: false
---

## カラーコードに一致する正規表現

[カラーコードかどうかを判定する正規表現 - Qiita [キータ]](http://qiita.com/kubosho_/items/a2157ac1f022b20de92f)

```
^#([\da-fA-F]{6}|[\da-fA-F]{3})
```

## RGB値に一致する正規表現

[RGB値かどうかを判定する正規表現 - Qiita [キータ]](http://qiita.com/kubosho_/items/eb7ee54c78146eb26565)```

```
^((2[0-4]\d|25[0-5]|1\d{1,2}|[1-9]\d|\d)( ?, ?)){2}(2[0-4]\d|25[0-5]|1\d{1,2}|[1-9]\d|\d)
```
