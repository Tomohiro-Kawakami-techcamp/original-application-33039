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
|オーナー側からすると、どのくらいの人が利用しているのか知りたいという課題|管理機能をつける|
|オーナー側では、どういった評判なのかわからないという課題|お客さんにコメントしてもらう機能をつけ、オーナー側にそれを閲覧できる機能をつける|
|お客さん目線では、単なるショップではつまらないという課題|オーナーがサービス投稿できるようにし、お客さん側は対象に当てはまる場合、それに申し込めるようにする。|


# 実装した機能について


# 実装予定の機能


# ローカルでの動作方法


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