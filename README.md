io-cloudからの挑戦状
====

## 概要
- io-cloudの業務を遂行する上で最低限必要なスキルを持ち合わせているかチェックするための問題を掲載しています。  
- io-cloudに興味がある方は、是非、トライしてみてください。  
- 解答が分からない時は、ネットで調べながら実施して頂いて構いません。  

## 利用方法
- githubのアカウントをお持ちでない方は、 https://github.com/join?source=header-home からアカウントを作成します。  
- 本リポジトリをforkした上で、問題を解きます。  
  - `Linuxコマンド`の問題は、適当にファイルを作成の上、解答を記載して下さい。  
  - `プログラミング`の問題は、問題文の指示に従って解答して下さい。  
  - git logに会社情報（メールアドレス等）が残らないようにしてください。  
- 問題を解き終わったら、本リポジトリにPull Requestを送信します。  
  - Pull Request送信時は、titleに会社のメールアカウント（メールアドレスではない）を記載して下さい。  
- 後日、io-cloudメンバからPull Requestのcommentを通じて採点結果をお知らせします。  

## 問題

### Linuxコマンド

1. ロードアベレージを表示させるコマンドを記載しなさい

2. 空きメモリサイズを表示させるコマンドを記載しなさい

3. プロセスの親子関係及びプロセス番号を表示させるコマンドを記載しなさい

4. iノードの使用率を表示させるコマンドを記載しなさい

5. httpリクエストを投げて、そのヘッダ情報のみを表示させるコマンドを記載しなさい

6. `dir_1`ディレクトリにある拡張子logとなっているファイルに対して、ファイル毎に末尾5行分を表示させるコマンドを記載しなさい（可能であればワンライナー）

7. `dir_2`ディレクトリにあるファイルの中からファイル名が20180219から始まるファイル内に含まれる文字列`hoge`を全て`fuga`に置換するコマンドを記載しなさい（可能であればワンライナー）

8. `dir_3`ディレクトリにある`access_log`から2018/2/26 20:00～22:59までのユニーク（送信元IP）なアクセス数を出力するコマンドを記載しなさい（可能であればワンライナー）

### プログラミング

9. 以下の条件を満たすスクリプト `chk_zorome.<拡張子>` を作成しなさい
  - 条件
    - 標準入力からカンマ区切りでランダムな文字列or数値を受け取る
    - 受け取った値が、3桁の数字でない場合は、`unmach pattern: <受け取った値>`を表示する
    - 受け取った値が、3桁のぞろ目の数字であった場合は、`zorome: <受け取った値>`を表示する
    - 受け取った値が、上記に当てはまらない場合は、そのまま受け取った値を表示する
    - スクリプトの言語は、お好きにどうぞ
    - pythonとか入れるのめんどくさい方は、こういうのを活用しても良いと思います
      - https://paiza.io/ja/projects/new

  - 例
    - 標準入力で受け取る値
  
      ```
      123,abc,3333,555,321
      ```

    - スクリプトの実行結果

      ```
      123
      unmatch pattern: abc
      unmatch pattern: 3333
      zorome: 555
      321
      ```

10. リポジトリ内、bak.shのコードを読んで、次の問いに答えなさい  
なお、git commitする際は、各問毎に分けて実施すること
  - bak.shは、コードの一部が誤っており、実行すると意図した通りに動作しない。
  どうやら`-b`と`-r`で、オプション使用時の挙動がテレコになっている様だ。
  誤っている部分を修正しなさい
  - 第一引数に、`-b`, `-r`, `-h`以外が指定された場合においても後続処理が実行されてしまっている様だ。  
  想定外の引数が指定された場合にスクリプトを終了させる処理を実装しなさい
ccc
