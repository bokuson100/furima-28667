# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| mail_address     | string | null: false |
| password         | string | null: false |
| first_name_kanji | string | null: false |
| last_name_kanji  | string | null: false |
| first_name_kana  | string | null: false |
| last_name_kana   | string | null: false |
| birth_year       | string | null: false |
| birth_month      | string | null: false |
| birth_day        | string | null: false |

### Association

- has_many : items
- has_many : purchases 
- has_many : comments 

## items テーブル

| Column          | Type    | Options                      |
| --------------- | ------- | ---------------------------- |
| image           | text    | null: false, foreign_key:true|
| item_name       | string  | null: false, foreign_key:true|
| text            | string  | null: false, foreign_key:true|
| category        | string  | null: false, foreign_key:true|
| status          | string  | null: false, foreign_key:true|
| delivery_burden | string  | null: false, foreign_key:true|
| delivery_area   | string  | null: false, foreign_key:true|
| delivery_days   | string  | null: false, foreign_key:true|
| price           | integer | null: false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :purchase
- has_many :comments


## comments テーブル

| Column       | Type   | Options                      |
| ------------ | ------ | ---------- |
| comment_text | string | null:false, foreign_key:true|

### Association

- belongs_to :item
- belongs_to :user

## purchases テーブル

| Column        | Type    | Options                      |
| ------------- | ------- | ---------------------------- |
| card_number   | integer | null: false, foreign_key:true|
| card_deadline | integer | null: false, foreign_key:true|
| security_code | integer | null: false, foreign_key:true|
| postal_code   | integer | null: false, foreign_key:true|
| prefecture    | string  | null: false, foreign_key:true|
| municipality  | string  | null: false, foreign_key:true|
| address       | integer | null: false, foreign_key:true|
| building      | string  | 
| phone_number  | integer | null: false, foreign_key:true|

### Association

- belongs_to :user
- belongs_to :item
