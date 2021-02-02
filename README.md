furima

## Usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_date      | date   | null: false |

### Association

-has_many :items
-has_many :Orders

## Itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | text       | null: false                    |
| image           |            |                                |
| category        | text       | null: false                    |
| price           | integer    | null: false                    |
| seller          | text       | null: false                    |
| information     | text       | null: false                    |
| state           | text       | null: false                    |
| shipment_source | text       | null; false                    |
| user            | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :order

## Ordersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | integer    | null: false                    |
| expiration_date | date       | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |
| image           | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-has_many :shipping_addresses

## Shipping_addressesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| prefecture   | string     | null: false                    |
| postal_code  | integer    | null: false                    |
| address      | text       | null: false                    |
| city         | text       | null: false                    |
| building     | text       | null: false                    |
| phone_number | integer    | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association

-belongs_to :order
