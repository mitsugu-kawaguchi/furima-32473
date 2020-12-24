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
- has_many :purchases
- has_many :comments
- has_many :sns_credentials
- has_one :card

## destination テーブル

| Column        | Type       | Options                          |
| ------------- | ---------- |--------------------------------- |
| post_code     | string     | null: false                      |
| prefecture_id | integer    | null: false                      |
| city          | string     | null: false                      |
| address       | string     | null: false                      |
| phone_number  | string     | null: false                      |
| purchase      | references | null: false, foreign_key: true   |
| building_name | string     |                                  |

### Association

- belongs_to :purchase

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| price               | integer    | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| shipping_cost_id    | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| shipping_day_id     | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- has_many :comments,dependent: :destroy
- has_many_attached :images

## purchase テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## comment テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| text             | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item

## sns_credential テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| provider         | string     |                                |
| uid              | string     |                                |
| user             | references | foreign_key: true              |

### Association

- belongs_to :user

## card テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| token            | string     | null: false                    |
| customer_token   | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user