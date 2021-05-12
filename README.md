# アプリについて
## Life Countとは
_自分の悩みを投稿し閲覧するシンプルなアプリケーションです。_

## ターゲットとペルソナ
_昨年の日本での年間自殺者数は２万人を超えており（警視庁ホームページ参照）これは現時点での日本の総人口約1億２千５百万人（2021年１月時点）と比べると約６千人に1人が自ら命を落としているということになります。_
_実際は行方不明者数等確認できていない方を含めるとより多くの方が人に相談できない辛い過去や現状に置かれていると予測した私は_
_ターゲットとなるエンドユーザーのペルソナを辛い思いをしている方々に絞りました。_

## 機能説明

[![Image from Gyazo](https://i.gyazo.com/a5e2efc7eee420e545c90f1eae0413ec.png)](https://gyazo.com/a5e2efc7eee420e545c90f1eae0413ec)






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







