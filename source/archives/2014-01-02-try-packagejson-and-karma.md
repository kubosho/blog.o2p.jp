---
title: package.jsonとKarmaの設定を行う
date: 2014-01-02 00:50 JST
tags: Karma
---

あけましておめでとうございます。今年もよろしくお願いします。

さて、今年最初に何をやろうかと考えたところ、今までほとんどやってこなかったJavaScriptのテスト周りを触れてみようという結論に達し、[Mocha](http://visionmedia.github.io/mocha/)+[Karma](https://github.com/karma-runner/karma)という組み合わせを構築しようとしています。

まだ構築は完了していないですが、ここまでやったことを書いていきます。

## package.jsonの設定

おもむろに<code>npm init</code>を実行すると以下のことを聞かれます。ちなみに、[npmとpackage.json使い方 - Kokudoriing](http://kokudori.hatenablog.com/entry/2013/04/04/025521)がよくまとまっていて分からない設定項目があった時に参考にしました。

- name
- version
- description
- entry point
- test command
- git repository
- keywords
- author
- license

答えると、<q>About to write to /path/to/package.json:</q>と表示され、package.jsonの内容が表示されます。

その後、<q>Is this ok? (yes)</q>と聞かれるのでOKならそのままEnterを押してしまいましょう。

今回は自動生成されたpackage.jsonにKarmaのために以下の記述を追加しています。具体例は[jquery-gameText/package.json at master · kubosho/jquery-gameText](https://github.com/kubosho/jquery-gameText/blob/master/package.json)になります。

```json
"devDependencies": {
  "karma": "~0.10",
  "karma-mocha": "~0.1"
}
```

## Karmaの設定

KarmaのReadmeに書かれているように、<code>karma init</code>を実行すると以下のことを聞かれます。デフォルト値が設定されている質問についてはだいたいそのままで大丈夫だと思います。

- Which testing framework do you want to use ?
- Do you want to use Require.js ?
- Do you want to capture a browser automatically ?
  - なおSafariを選ぶと、karma-safari-launcherがインストールされていない場合は、無いというWarningメッセージが出ます。
- What is the location of your source and test files ? You can use glob patterns, eg. "js/*.js" or "test/**/*Spec.js".
- Should any of the files included by the previous patterns be excluded ? You can use glob patterns, eg. "**/*.swp".
- Do you want Karma to watch all the files and run the tests on change ?

これらの質問に答えると、<q>Config file generated at "/path/to/karma.conf.js".</q>というメッセージが表示され、karma.conf.jsが作成されています。

[karma/test/client/karma.conf.js at master · karma-runner/karma](https://github.com/karma-runner/karma/blob/master/test/client/karma.conf.js)を見つつ、karma.conf.jsを自分で作成・設定するという手もあると思いますが、<code>karma init</code>を実行するほうが楽だと思います。
