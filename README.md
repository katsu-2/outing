# Outing
url: https://outing-app.herokuapp.com/
email: tester@gmail.com
password: 111111


# 概要
日々新しい技術を学習しているエンジニアが、学んだことを問題形式で投稿することで繰り返し復習をすることが出来、知識の定着を図ることを目的としています。


# 使い方


# 主な機能
○ deviseを用いたユーザー管理機能
　・ 新規ユーザー登録機能
　・ ユーザーログイン機能
　・ ユーザー詳細機能
　・ ユーザー編集機能
　・ deviseの日本語化

○ 問題管理機能
　・ 問題投稿機能
　・ 問題編集機能
　・ 問題削除機能
　・ 問題検索機能(部分検索)
　・ 問題詳細機能
　・ 問題一覧機能

○ 問題集機能
　・ 問題集作成機能
　・ 問題集の中の問題タイトルをクリックすると問題、答えが見れる

○ 問題へのコメント機能
　・ 問題へのコメント(訂正要望)機能

○ 問題へのいいね機能
　・ Ajaxを使ったいいね機能


# 使用技術
○ テスト環境
  ・ RSpec(単体テスト・統合テスト)
○ 本番環境
  ・ Heroku
○ 本番環境DB
  ・ PostgresQL
○ 開発環境DB
  ・ Mysql
○ フロント開発
  ・ haml
  ・ scss
○ ユーザー管理機能
  ・ devise
○ ページネーション
  ・ kaminari


# スペック
Rails: 5.2
Ruby: 2.5.1
