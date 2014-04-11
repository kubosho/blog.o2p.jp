---
title: AndroidのChromeで見ているページをPCでデバッグする方法
date: 2014-04-11 15:00 JST
tags:
  - Chrome
  - Smartphone
published: false
---

AndroidのChromeを用いてデバッグをしたいということがある。

その際のデバッグ方法としては自分が知っている限りでは以下の2つがあった。

- Android SDKをダウンロードしてデバッグ
  - [Chrome for Android の USB ウェブデバッグでスマフォWEBサイトをデバッグする | SLUMBERS](http://slumbers99.blogspot.jp/2013/01/chrome-for-android-usb-web.html)
- ChromeにADBという拡張機能をインストールしてデバッグ
  - [SDK不要Android端末のリモートデバッグChrome拡張機能「ADB」 - Intelligent Technology's Technical Blog](http://iti.hatenablog.jp/entry/2013/11/05/182133)

しかしどちらもAndroid SDKのダウンロードと設定や、PCのChromeに拡張機能をインストールしないといけなく、正直めんどい。

と思ったら、Chrome 32は上記のSDKなどをダウンロードしなくてもデバッグが出来るようだ。

[最近のAndroid Chromeのリモートデバッグ - hokaccha.hamalog v2](http://d.hatena.ne.jp/hokaccha/20140109/1389254171)

Android側でUSBデバッグを有効にすればChrome側でAndroidの端末が認識されていろいろと出来る

Android 4.2以上のバージョンの場合、設定->システム:端末情報内の項目にある「ビルド番号」を7回タップする必要がある。タップし続けると「デベロッパーになるまであとnステップです」と表示されたり、7回タップすると「あなたは今開発者になりました！」と表示されるので分かりやすい<a href="#note1">*1</a>。

「あなたは今開発者になりました！」と表示されたあと、設定のシステムの所に「開発者向けオプション」が表示されるようになる。そしてそのオプションの中に「USBデバッグ」という項目があるので、チェックを付ける。

それでPCにUSBでAndroidを繋いで無事デバッグ出来るように…というところだが、Windowsの場合は別途[Google USB Driver | Android Developers](http://developer.android.com/sdk/win-usb.html)からUSB Driverをダウンロードする必要がある。

[USBデバッグ](http://android.akjava.com/html5/usbdebug.html)によると、今つないでいるPCでUSBデバッグを許可するかどうかというポップアップが表示される機種もあるようだが、SO-04E Hatsune Mikuモデル(Android 4.2.2)では表示されなかった。

<a href="http://imgur.com/RDDvfz2"><img src="http://i.imgur.com/RDDvfz2.png" title="Hosted by imgur.com" /></a>

<a href="http://imgur.com/45dBUuE"><img src="http://i.imgur.com/45dBUuE.png" title="Hosted by imgur.com" /></a>

---

1. <span id="note1">なお、タップの間隔はいくら遅くても大丈夫そうだが、戻るボタンなどで前の画面に戻ってしまうと、また最初からタップし直しとなってしまう。</span>
