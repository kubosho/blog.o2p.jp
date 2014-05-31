---
title: Web Audio APIのハマりどころ
date: 2014-05-21 14:30 JST
tags:
  - Web Auido API
published: false
---

## AudioContextはベンダープレフィックスが必要

```
window.AudioContext = window.AudioContext || window.webkitAudioContext;
```

