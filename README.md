# アプリについて
## Life Countとは
自分の悩みを投稿し閲覧するシンプルなアプリケーションです。

## ペルソナ
昨年の日本での年間自殺者数は２万人を超えており（警視庁ホームページ参照）これは現時点での日本の総人口約1億２千５百万人（2021年１月時点）と比べると約６千人に1人が自ら命を落としているということになります。

実際は行方不明者数等確認できていない方を含めるとより多くの方が人に相談できない辛い過去や現状に置かれている中、少しでもそういった方々の気持ちを楽にできるようなアプリを目指して作成しました。

## 機能説明
投稿機能としては現状の苦しいことや辛いこと、またそんな状況でも感謝できることを文章で投稿します。
またその際に投稿する悩みについてもカテゴリー分けできるようにActive hashを用いて実装しています。

[![Image from Gyazo](https://i.gyazo.com/a5e2efc7eee420e545c90f1eae0413ec.png)](https://gyazo.com/a5e2efc7eee420e545c90f1eae0413ec)
[![Image from Gyazo](https://i.gyazo.com/966e65541b18bf46c3cb21f775ad6438.png)](https://gyazo.com/966e65541b18bf46c3cb21f775ad6438)

### 投稿機能でこだわったこと

アプリの方針から考えて画像などはあえて投稿せず文章のみの方針でいかにアプリの機能を充実させられるのかを考えました。

そこで上記にも記載があるようカテゴリー分けと同じ箇所に「あなたのライフはあとどのくらいもちそうですか？」という記述で自分が現状どのくらい疲れているのかを確認する欄を設定しました。

シンプルな機能だからこそ何を目的としたアプリかを考え、投稿では自分がどれくらい疲れているのかを確認できるように意識し、閲覧では同じ悩みを持つ人がいることで少しでも明日を生きる手助けになれればと思っています。

## 閲覧機能
当アプリの主軸となる投稿・閲覧、後者ではよりスムーズに投稿された悩みを見つけられるよう左側の検索ボタンより悩み事の検索ができるようになっています。
また過去の自分の悩みを振り返ることも今までの経験を俯瞰して見れるきっかけとなるためマイページでは閲覧できるよう実装しております。

[![Image from Gyazo](https://i.gyazo.com/1e3b4e999e20d0972dc8d16ce05637bd.png)](https://gyazo.com/1e3b4e999e20d0972dc8d16ce05637bd)

## 検索機能
簡易的ではありますが投稿された文章を検索できるように実装しました。
この実装で苦労したことは二つの文章から情報を検索できるようにしたことです。また検索した情報が存在しない場合のビューもif文で用意しております。
[![Image from Gyazo](https://i.gyazo.com/b286cbe50805a23d1f61949bec462191.png)](https://gyazo.com/b286cbe50805a23d1f61949bec462191)

## その他いいね・フォロー・コメント機能の実装
アプリの機能の代表的な存在としていいね機能（当アプリではmee too!機能）とフォロー機能も実装しております。
投稿に関するいいね機能では自分の投稿を表示している際は共感してくれた人の数を表示し他者の投稿ではいいねができるようにif文を用いて実装しております。
[![Image from Gyazo](https://i.gyazo.com/3677f2df19fc63b4f301e6ac7fca48cb.gif)](https://gyazo.com/3677f2df19fc63b4f301e6ac7fca48cb)


## 追加で実装したいこと

- 機能関連

実際に使って頂いた後のことを考え、自分と同じような悩みの人とコミニケーションを個別で取れるようにダイレクトメッセージ機能を追加実装予定です。
またマイページの情報が少し物足りないためグラフなどを表示できるgemを導入し過去の悩みからどのような変化があったのか一眼で伝わるような機能を実装中です。

# dio図

[![Image from Gyazo](https://i.gyazo.com/ea71182b55ca1b9eeb53738fd7b110c2.png)](https://gyazo.com/ea71182b55ca1b9eeb53738fd7b110c2)

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







