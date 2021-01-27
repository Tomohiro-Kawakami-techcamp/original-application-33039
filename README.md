# テーブル設計

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