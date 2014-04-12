---
title: AndroidのChromeで見ているページをPCでデバッグする方法
date: 2014-04-12 23:50 JST
tags:
  - Chrome
  - Smartphone
---

AndroidのChromeを用いてデバッグをしたいということがある。その際のデバッグ方法として、自分が知っている限りでは以下の2つがあった。

- Android SDKをダウンロードしてデバッグ
  - [Chrome for Android の USB ウェブデバッグでスマフォWEBサイトをデバッグする | SLUMBERS](http://slumbers99.blogspot.jp/2013/01/chrome-for-android-usb-web.html)
- ChromeにADBという拡張機能をインストールしてデバッグ
  - [SDK不要Android端末のリモートデバッグChrome拡張機能「ADB」 - Intelligent Technology's Technical Blog](http://iti.hatenablog.jp/entry/2013/11/05/182133)

しかしどちらもAndroid SDKのダウンロードと設定や、PCのChromeに拡張機能をインストールしないといけなく、正直めんどいなと思ったら、Chrome 32以上ならは上記のSDKなどをダウンロードしなくてもPCからデバッグが出来るようだ。

[最近のAndroid Chromeのリモートデバッグ - hokaccha.hamalog v2](http://d.hatena.ne.jp/hokaccha/20140109/1389254171)

ということで、[Remote Debugging Chrome on Android - Chrome DevTools — Google Developers](https://developers.google.com/chrome-developer-tools/docs/remote-debugging?hl=ja)や他サイトに沿ってデバッグが行えるようにしたので、やったことを書いていく。

## Android側のUSBデバッグを有効にする

Android 4.2以上のバージョンの場合、開発者向けオプションは初期設定では隠されている。それ以下の場合は設定の下の方に開発者向けオプションがある。

Android 4.2以上で開発者向けオプションを表示するには、設定->システム:端末情報内の項目にある「ビルド番号」を7回タップする必要がある。タップし続けると「デベロッパーになるまであとnステップです」と表示されたり、7回タップすると「あなたは今開発者になりました！」と表示されるので分かりやすい<a href="#note1">*1</a>。

「あなたは今開発者になりました！」と表示されたあと、設定のシステムの所に「開発者向けオプション」が表示されるようになる。そしてそのオプションの中に「USBデバッグ」という項目があるので、チェックを付ける。

それでPCにUSBでAndroidを繋いで無事デバッグ出来るように…というところだが、Windowsの場合は別途[Google USB Driver | Android Developers](http://developer.android.com/sdk/win-usb.html)からUSB Driverをダウンロードする必要がある。

[USBデバッグ](http://android.akjava.com/html5/usbdebug.html)によると、今つないでいるPCでUSBデバッグを許可するかどうかというポップアップが表示される機種もあるようだが、SO-04E Hatsune Mikuモデル(Android 4.2.2)では表示されなかった。

## Chrome側でデバイス検出を有効にする

<q>chrome://inspect/#devices</q>にChromeでアクセスすることにより、以下のような設定画面が出てくる。

<a href="http://imgur.com/RDDvfz2"><img src="http://i.imgur.com/RDDvfz2.png" title="Hosted by imgur.com" /></a>

ここから「Discover USB devices」にチェックを入れ、USBデバッグを有効にしたAndroid端末を繋ぐことにより、以下のように各種操作が出来るようになる。

<a href="http://imgur.com/45dBUuE"><img src="http://i.imgur.com/45dBUuE.png" title="Hosted by imgur.com" /></a>

inspectはChromeのdeveloper toolsがそのまま使えたり、アドレス指定でタブを開かせたり、他にもいろいろと出来るので便利。

---

1. <span id="note1">なお、タップの間隔はいくら遅くても大丈夫そうだが、戻るボタンなどで前の画面に戻ってしまうと、また最初からタップし直しとなってしまう。</span>
