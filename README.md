# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| birthday         | date   | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |

### Association

- has_many :items
- has_one :destination

## destination テーブル

| Column       | Type       | Options                          |
| ---------    | ---------- |--------------------------------- |
| user_id      | integer    | null: false, foreign_key:true    |
| post_code    | string     | null: false                      |
| prefecture   | string     | null: false                      |
| city         | string     | null: false                      |
| address      | string     | null: false                      |
| phone_number | string     | null: false                      |
| family_name  | string     | null: false                      |
| first_name   | string     | null: false                      |

### Association

- belongs_to :user

## items テーブル

| Column           | Type    | Options                        |
| -------          | ------- | ------------------------------ |
| name             | string  | null: false                    |
| price            | string  | null: false                    |
| description      | string  | null: false                    |
| category         | string  | null: false                    |
| status           | string  | null: false                    |
| shipping_cost    | string  | null: false                    |
| shipping_address | string  | null: false                    |
| shipping_days    | string  | null: false                    |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user