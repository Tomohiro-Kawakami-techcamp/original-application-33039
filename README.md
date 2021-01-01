# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ----------------   | -------- | ----------- |
| name               | string   | null: false |
| name_kana          | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| member_id         | integer  | null: false |
| admin              | boolean  |             |

### Association
- has_many :items
- has_many :orders

## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true | 
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

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