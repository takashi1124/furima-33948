furima

## Usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

-has_many :items
-has_many :Orders

## Itemsテーブル

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| name                         | string     | null: false                    |
| category_id                  | text       | null: false                    |
| price                        | integer    | null: false                    |
| seller                       | text       | null: false                    |
| information                  | text       | null: false                    |
| state_id                     | integer    | null: false                    |
| shipment_source_id           | integer    | null: false                    |
| item-shipping-fee-status_id  | integer    | null: false                    |
| item-prefecture_id           | integer    | null: false                    |
| item-scheduled-delivery_id   | integer    | null: false                    |
| user                         | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :order

## Ordersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-has_one :shipping_addresses

## Shipping_addressesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| prefecture   | string     | null: false                    |
| postal_code  | string     | null: false                    |
| address      | string     | null: false                    |
| city         | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association

-belongs_to :order
