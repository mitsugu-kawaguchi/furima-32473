# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birthday           | date   | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |

### Association

- has_many :items
- has_one :destination
- has_many :purchase

## destination テーブル

| Column       | Type       | Options                          |
| ------------ | ---------- |--------------------------------- |
| user_id      | references | null: false, foreign_key:true    |
| post_code    | integer(8) | null: false                      |
| prefecture   | string     | null: false                      |
| city         | string     | null: false                      |
| address      | string     | null: false                      |
| phone_number | integer(11)| null: false, unique: true        |
| family_name  | string     | null: false                      |
| first_name   | string     | null: false                      |

### Association

- belongs_to :user

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| price               | integer    | null: false                    |
| description         | string     | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| shipping_cost_id    | integer    | null: false                    |
| shipping_address_id | integer    | null: false                    |
| shipping_days_id    | integer    | null: false                    |
| user_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| buyer_user_id    | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items