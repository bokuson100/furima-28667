# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name_kanji   | string | null: false |
| last_name_kanji    | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many : items
- has_many : purchases 
- has_many : comments 

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | null: false, foreign_key:true |
| item_name          | string     | null: false |
| text               | string     | null: false |
| category_id        | string     | null: false |
| status_id          | integer    | null: false |
| delivery_burden_id | integer    | null: false |
| delivery_area_id   | integer    | null: false |
| delivery_days_id   | integer    | null: false |
| price              | integer    | null: false |

### Association
- belongs_to :user
- has_one :purchase 
- has_one :purchase_history
- has_many :comments


## comments テーブル

| Column       | Type   | Options    |
| ------------ | ------ | ---------- |
| comment_text | string | null:false |

### Association

- belongs_to :item
- belongs_to :user

## purchases テーブル

| Column        | Type    | Options    |
| ------------- | ------- | ---------- |
| postal_code   | string  | null: false|
| prefecture_id | integer | null: false|
| municipality  | string  | null: false|
| address       | integer | null: false|
| building      | string  | 
| phone_number  | string  | null: false|

### Association

- belongs_to :user
- belongs_to :item

## purchases_histories

| Column  | Type    | Options    |
| ------- | ------- | ---------- |
| item_id | integer | null: false, foreign_key:true |
| user_id | integer | null: false, foreign_key:true |

### Association

- belongs_to :item
- belongs_to :user