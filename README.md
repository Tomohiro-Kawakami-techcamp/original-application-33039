# 横浜Fマリノスオンラインショップ


# 概要


# テスト用アカウント


# 利用方法


# 目指したい課題解決

### 1 全般的な課題
  有名で人気があり、競争相手も多い中、どのようにして、サポーターを増やし売り上げを伸ばすか？

### 2 課題解決
|ユーザーストーリーから考える課題|解決策|
|:---|:---|
|オーナー側からすると、どのくらいの人が利用しているのか知りたいという課題|ユーザー管理機能で最初に登録させ、権限を付与する。|
|オーナー側からすると、誰が何を買ったのか知りたいという課題、お客さんからは何を注文したか確認したいという課題|注文履歴機能をつける|
|オーナー側では、どういった評判なのかわからないという課題|お客さんにコメントしてもらう機能をつけ、オーナー側にそれを閲覧できる機能をつける|
|お客さん側からすると、単なるショップではつまらないという課題|オーナーがサービス投稿できるようにし、お客さん側は対象に当てはまる場合、それに申し込めるようにする。|
|オーナー側からすると、誰が何を申し込んだのか確認したく、抽選日にお客さんに対して連絡しないといけない課題|サービス応募者一覧機能をつける|
|お客さん側からすると何に申し込んだのか確認したいという課題|サービス応募履歴機能をつける|

# 実装した機能について

|機能|概要|
|:---|:---|
|ユーザー管理機能|新規登録・ログイン・ログアウトが可能|
|ユーザー詳細機能|管理責任者はお客さんの登録状況、お客さんの名前、Eメールアドレスの個人譲歩を閲覧可能、お客さんは自分のユーザー登録情報を閲覧可能|
|商品出品機能|管理責任者のみ画像付きで出品可能|
|商品一覧表示機能|出品された商品を一覧表示する機能|
|商品詳細表示機能|出品された商品のある一品の詳細が閲覧可能|
|商品編集・削除機能|管理責任者のみ編集削除が可能|
|商品情報編集機能|管理責任者のみ編集可能|
|商品購入機能|お客さんのみ購入可能|
|注文履歴機能|管理責任者はお客さん全員が何を注文したか履歴一覧表示する機能、お客さんは何を注文したかの履歴を表示する機能|
|サービス一提供機能|管理責任者のみサービス提供可能|
|サービス応募者一覧機能|管理責任者は誰が何のサービスに申し込んだかの一覧|
|サービス応募機能|お客さんがサービスに申し込む機能|
|サービス応募履歴機能|お客さんが何のサービスに申し込んだかの一覧|
|コメント投稿機能|お客さんのみサービスやお店に対する意見を投稿できる機能|
|コメント一覧表示機能|管理責任者のみお客さんがどのような意見を投稿したか閲覧できる機能|

# 実装予定の機能

- 商品をカテゴリー別に検索する機能
- 売り切れたら表示する機能
- 抽選結果を通知する機能

# ローカルでの動作方法

- $ cd original-application-33039
- $ bundle install
- $ rails db:create
- $ rails db:migrate
- $ rails s
- http://localhost:3000

# DB設計

## users テーブル

| Column             | Type     | Options     |
| ----------------   | -------- | ----------- |
| name               | string   | null: false |
| name_kana          | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| member_id          | integer  | null: false |
| admin              | boolean  |             |

### Association
- has_many :items
- has_many :orders
- has_many :services
- has_many :comments
- has_many :service_orders

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| info                   | text       | null: false                    |
| price                  | integer    | null: false                    |
| price_discrimination   | integer    | null: false                    |
| category_id            | integer    | null: false                    |
| delivery_id            | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## services テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| content                | string     | null: false                    |
| limit_day              | string     | null: false                    |
| target                 | string     | null: false                    |
| release_day            | string     | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :service_orders

## services_orders テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | null: false, foreign_key: true |
| service                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :service

## comments テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| message                | text       | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true | 
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## address テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     |                                |
| prefecture_id       | integer    |                                |
| city                | string     |                                |
| address             | string     |                                |
| building            | string     |                                |
| phone_number        | string     |                                |
| order               | references | null: false, foreign_key: true |

### Association

- belongs_to :order