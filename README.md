# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column               | Type      | Options     |
| -------------------- | --------- | ----------- |
| name                 | string    | null: false |
| description          | string    | null: false |
| category             | string    | null: false |
| condition            | string    | null: false |
| shipping-fee-payer   | string    | null: false |
| ship-from            | string    | null: false |
| days-until-shipping  | string    | null: false |
| price                | integer   | null: false |
| user                 | reference | null: false, foreign_key: true |

### Association

- belong_to :user
- has_one  :purchase_records

## purchase_records テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| item_name      | string     | null: false |
| user_name      | string     | null: false |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- has_one :shipping_address
- belongs_to :user

## shipping_address テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| post_code           | string     |             |
| prefecture          | string     | null: false |
| municipalities      | string     | null: false |
| streer_address      | string     | null: false |
| building_name       | string     | null: false |
| phone_number        | integer    | null: false |
| purchase_records    | references | null: false, foreign_key: true |

### Association

- belongs_to :shipping_address