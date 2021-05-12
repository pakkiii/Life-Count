# テーブル設計


## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| age                 | integer | null: false               |
| nick_name           | string  | null: false               |

### Association

- has_many :lives


##  lifeテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| bad_thing   | text       | null: false                    |
| hope        | text       | null: false                    |
| tired_id    | integer    | null: false                    |
| how_long_id | integer    | null: false                    |
| want_id     | integer    | null: false                    |
| month_id    | integer    | null: false                    |
### Association

- belongs_to :user

