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
- has_many :yells
- has_many :likes
- has_many :relationships



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
- has_many :yells
- has_many :likes



##  likeテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| life        | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :life



##  relationshipテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user


##  yellテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| life        | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :life







