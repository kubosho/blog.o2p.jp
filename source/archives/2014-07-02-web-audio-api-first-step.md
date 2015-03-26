---
title: Web Audio APIでとりあえず音を鳴らす
date: 2014-07-02 12:00 JST
tags: Web Audio API
---

Web Audio APIの中でも、AudioContextで定義されている`createOscillator()`を使って、正弦波(サイン波)で周波数が440Hzの音をとりあえず鳴らしてみます。

## 今回説明するソースの全体像

```javascript
var AudioContext = window.AudioContext || window.webkitAudioContext,
ctx = new AudioContext();

var oscillator = ctx.createOscillator();
oscillator.connect(ctx.destination);

oscillator.start()
```

では細かく分けて説明します。

### AudioContextのインスタンス作成

```javascript
var AudioContext = window.AudioContext || window.webkitAudioContext,
ctx = new AudioContext();
```

今回、音を鳴らしたり、出力するために必要なAudioContextのインスタンスを作成しています。

AudioContextにベンダープレフィックスが必要なのは、[Web Audio APIを触り始めた人が最初にハマりそうなところ](http://blog.o2p.jp/2014/06/18/trap-web-audio-api)でも書いていますが、Safari(PC, モバイル共に)がまだベンダープレフィックスを必要としているためです。また、少し古いChromeを使っている人も必要になります。とはいえ、Chromeは自動アップデートされるので今後は無視できる範囲です。

### OscillatorNodeの生成

```javascript
var oscillator = ctx.createOscillator();
```

周期的な波形を生成しています。これによって生成される`OscillatorNode`が今回鳴らす音の元となるものです。ここではcreateOscillator()に引数を指定していないので、正弦波(サイン波)で440Hzの音が生成されます。

### 音の出力先と接続

先ほど生成した音源(正弦波で440Hzの音)と、音の出力先を示すAudioDestinationNodeを接続します。AudioDestinationNodeはAudioContextのプロパティとして、各AudioContextに一つだけ存在しています。

```javascript
oscillator.connect(ctx.destination);
```

この入力と出力という話は、[Channel up-mixing and down-mixing](http://webaudio.github.io/web-audio-api/#channel-up-mixing-and-down-mixing)に詳しく書かれてそうですが、まだ内容を理解できてないです。

### 音を再生

生成した正弦波(サイン波)の周波数が440Hzという音を再生します。なお、connect()で音の出力先と接続する前にstart()を呼び出しても、音は再生されません。

```javascript
oscillator.start()
```

---

これらをまとめたものが以下のソースになります。

```javascript
var AudioContext = window.AudioContext || window.webkitAudioContext,
ctx = new AudioContext();

var oscillator = ctx.createOscillator();
oscillator.connect(ctx.destination);

oscillator.start()
```

また、サンプルも用意しておきました。リンク先を開くと正弦波(サイン波)の周波数が440Hzという音をいきなり再生するので注意してください。また、iOSは音が鳴らないと思います。

[createOscillator()サンプル - JS Bin](http://jsbin.com/samoxepe/4/edit?html,js,output)(音が鳴ります)
