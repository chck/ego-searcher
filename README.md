ego-searcher
============
~~エゴ~~友人サーチ

##v01

* Input: twitterId

* Output: フォロワーのプロフィールのワードクラウド(キーワード)

##hope

* フォロワーめちゃ多いと解析がめちゃ遅い...キャッシュ、並列処理
* 特徴語の取り方を工夫する...共通のストップワードをDBで更新する
* ひとつのプロフに同じワードたくさん...プロフごとに原形取って先にuniqかける
* 共通のストップワードをDBで更新する
* mixiId, pixivId, facebookIdに対応
* 解析中に処理中アニメーションを
* 出力をワードクラウドに
* サンプルテキストとして様々な処理方法を用意する...キーワード、次にマルコフ、バスケット、word2vec

##Requirements
```
ruby 2.1.3
```

##Install
```
bundle install --path vendor/bundle
