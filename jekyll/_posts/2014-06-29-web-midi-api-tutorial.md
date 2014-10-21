---
title: 初めてのWeb MIDI API
date: 2014-06-29 09:00 JST
tags: Web MIDI API
published: false
---

基本は[Web MIDI API (日本語訳)](http://g200kg.github.io/web-midi-api-ja/#requestmidiaccess)を参照しています。

## requestMIDIAccess()

以下のように書くと、Promiseオブジェクトを返します。

```javascript
navigator.requestMIDIAccess();
```