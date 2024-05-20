# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| reading_first_name | string  | null: false |
| reading_last_name  | string  | null: false |
| birth_date         | date    | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column                  | Type       | Options     |
| ----------------------- | ---------- | ----------- |
| name                    | string     | null: false |
| description             | text       | null: false |
| category_id             | integer    | null: false |
| condition_id            | integer    | null: false |
| shipping_fee_payer_id   | integer    | null: false |
| prefecture_id           | integer    | null: false |
| days_until_shipping_id  | integer    | null: false |
| price                   | integer    | null: false |
| user                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one  :purchase_record

## purchase_records テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- has_one :shipping_address
- belongs_to :user
- belongs_to :item

## shipping_addresses テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| post_code           | string     | null: false |
| prefecture_id       | integer    | null: false |
| municipalities      | string     | null: false |
| street_address      | string     | null: false |
| building_name       | string     |             |
| phone_number        | string     | null: false |
| purchase_record     | references | null: false, foreign_key: true |

### Association

- belongs_to :shipping_address