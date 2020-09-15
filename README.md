# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| id               | integer | null: false |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday         | integer | null: false |

### Association

- has_many :items
- has_one  :buyer

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| id            | integer    | null: false                    |
| name          | string     | null: false                    |
| explanation   | text       | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| delivery_fee  | string     | null: false                    |
| shipping_area | string     | null: false                    |
| shipping_days | string     | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## buyers テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| id           | integer    | null: false                    |
| postal_code  | string     | null: false                    |
| prefectures  | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| phone_number | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many   :orders

## orders テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| id       | integer    | null: false                    |
| price    | string     | null: false                    |
| token    | string     | null: false                    |
| buyer_id | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
- belongs_to :item