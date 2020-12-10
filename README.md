# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false, unique: true |
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
| phone_number | string     | null: false, unique: true        |
| family_name  | string     | null: false                      |
| first_name   | string     | null: false                      |

### Association

- belongs_to :user

## items テーブル

| Column           | Type    | Options                        |
| -------          | ------- | ------------------------------ |
| name             | string  | null: false                    |
| price            | integer | null: false                    |
| description      | string  | null: false                    |
| category         | integer | null: false                    |
| status           | integer | null: false                    |
| shipping_cost    | integer | null: false                    |
| shipping_address | integer | null: false                    |
| shipping_days    | integer | null: false                    |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user