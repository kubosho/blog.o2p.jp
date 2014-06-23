---
title: Web Audio APIを触り始めた人が最初にハマりそうなところ
date: 2014-06-18 01:00 JST
tags: Web Auido API
---

初めてWeb Audio APIを用いてサービスだったりアプリを開発する際に、ハマるであろう点を2つほど書きます。ちなみに以下の2点は実際に自分がハマったこととなります。

## AudioContextはベンダープレフィックスが必要

[Web Audio APIのCan I use](http://caniuse.com/#search=web%20audio%20api)を見ると分かるのですが、Safariがまだベンダープレフィックスを必要としています。

どんな場面でベンダープレフィックスが必要かというと、AudioContextのインスタンスを作る際に必要になります。そのため、以下のように一手間加えてあげる必要があります。

```
// Safariでは動かない
var context = new window.AudioContext();
// Safariでも動く
var AudioContext = window.AudioContext || window.webkitAudioContext,
    context      = new AudioContext();
```

これは、実際に[可聴域調査](http://kubosho.github.io/hearing-test-app/)というサービスを作って、[CodeGrid二周年記念パーティー](http://www.zusaar.com/event/5117005)でLTをした際に、iPhoneだと動いてなくて「あれ、あれ？」となったのですが、原因がこれだったというオチでした。

ちなみに、AudioContextのインスタンスを作る以外にも、他のところでもベンダープレフィックスが必要になるかもしれません。もしあれば教えていただけると幸いです。

## OscillatorNodeは使い捨て

[サウンドの生成 | Web Audio APIの基本処理 | WEB SOUNDER - Web Audio API 解説 -](http://curtaincall.weblike.jp/portfolio-web-sounder/webaudioapi-basic/oscillator)や、[Web Audio APIを使って可聴域を調べるアプリをつくってみた](http://www.slideshare.net/kubosho/web-audio-api-34440311)というスライドの11ページでも書いたのですが、OscillatorNodeは使い捨てです。

どんな時にOscillatorNodeが捨てられるか。一番分かりやすいのは「音が停止したとき」です。他にも条件はありますが、自分がまだ他の条件を理解していない部分があるので、[サウンドの生成 | Web Audio APIの基本処理 | WEB SOUNDER - Web Audio API 解説 -](http://curtaincall.weblike.jp/portfolio-web-sounder/webaudioapi-basic/oscillator)のガベージコレクションの章に説明を譲りたいと思います。

OscillatorNodeが使い捨てなことは以下のJS Binで確認できます。Playを押した後、Stopを押し、再度Playを押すと、"Uncaught InvalidStateError: Failed to execute 'start' on 'OscillatorNode': cannot call start more than once. "というエラーがコンソール上で表示されると思います。

<a class="jsbin-embed" href="http://jsbin.com/qeluv/7/embed?js,console,output">Web Audio API Sample</a><script src="http://static.jsbin.com/js/embed.js"></script>

では、「再生ボタンが押されたら音を再生し、停止ボタンが押されたら音を停止する。その後再生ボタンが押されたら再び音の再生をおこなう」という、ミュージックプレイヤーにとっては当たり前の動作はどう実装したらいいかというと、[hearing-test-app/src/app.js at master · kubosho/hearing-test-app](https://github.com/kubosho/hearing-test-app/blob/master/src/app.js#L17-L21)の17〜21行目に答えはあります。

該当の行数のソースは以下の通りです。

```
this.$watch('isPlaySound', function (isPlaySound) {
                if (!isPlaySound) {
                    this.$options.sound = hearingTest.init(this.frequency);
                }
            });
```

Vue.js側で音が再生されているかどうかというフラグ(isPlaySound)を監視し、isPlaySoundがfalseだったら、[hearing-test-app/src/hearing-test.js at master · kubosho/hearing-test-app](https://github.com/kubosho/hearing-test-app/blob/master/src/hearing-test.js#L12-L14)の12〜14行目にあるように、OscillatorNodeを生成し、AudioContext.destinationに接続しています。

```
var sound = context.createOscillator();
sound.connect(context.destination);
```

これで、「再生ボタンが押されたら音を再生し、停止ボタンが押されたら音を停止する。その後再生ボタンが押されたら再び音の再生をおこなう」という動作が可能になります。
