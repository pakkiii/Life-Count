# アプリについて
## Life Countとは
_自分の悩みを投稿し閲覧するシンプルなアプリケーションです。_

## ペルソナ
_昨年の日本での年間自殺者数は２万人を超えており（警視庁ホームページ参照）これは現時点での日本の総人口約1億２千５百万人（2021年１月時点）と比べると約６千人に1人が自ら命を落としているということになります。_

_実際は行方不明者数等確認できていない方を含めるとより多くの方が人に相談できない辛い過去や現状に置かれている中、少しでもそういった方々の気持ちを楽にできるようなアプリを目指して作成しました。_

## 機能説明
_投稿機能としては現状の苦しいことや辛いこと、またそんな状況でも感謝できることを文章で投稿します。_
_またその際に投稿する悩みについてもカテゴリー分けできるようにActive hashを用いて実装しています。_

[![Image from Gyazo](https://i.gyazo.com/a5e2efc7eee420e545c90f1eae0413ec.png)](https://gyazo.com/a5e2efc7eee420e545c90f1eae0413ec)
[![Image from Gyazo](https://i.gyazo.com/966e65541b18bf46c3cb21f775ad6438.png)](https://gyazo.com/966e65541b18bf46c3cb21f775ad6438)

### 投稿機能でこだわったこと

_アプリの方針から考えて画像などはあえて投稿せず文章のみの方針でいかにアプリの機能を充実させられるのかを考えました。_

_そこで上記にも記載があるようカテゴリー分けと同じ箇所に「あなたのライフはあとどのくらいもちそうですか？」という記述で自分が現状どのくらい疲れているのかを確認する欄を設定しました。_

_シンプルな機能だからこそ何を目的としたアプリかを考え、投稿では自分がどれくらい疲れているのかを確認できるように意識し、閲覧では同じ悩みを持つ人がいることで少しでも明日を生きる手助けになれればと思っています。_

## 閲覧機能
_当アプリの主軸となる投稿・閲覧、後者ではよりスムーズに投稿された悩みを見つけられるよう左側の検索ボタンより悩み事の検索ができるようになっています。_
_また過去の自分の悩みを振り返ることも今までの経験を俯瞰して見れるきっかけとなるためマイページでは閲覧できるよう実装しております。_

[![Image from Gyazo](https://i.gyazo.com/719ce6b79f16a1bdf528e4d95193a4f3.png)](https://gyazo.com/719ce6b79f16a1bdf528e4d95193a4f3)


## 追加で実装したいこと

- ビュー関連
_まずは機能メインに実装したためビュー関連のコーディングをより使いやすいように実装したいです。_

_具体的には現状全ての悩みがindexアクションのビューにおいて同じデザインになっているため一目見て何の悩みなのかを認識できるように実装を予定しています。_

- 機能関連

_コメント機能については現状では誰でもできてしまうため当アプリのペルソナを意識した際には許可したユーザーのみコメントできるといった縛りを儲けた方が良いと考えておりどのように実装したら良いか開発中です。_

_実際に使って頂いた後のことを考え、自分と同じような悩みの人とコミニケーションを個別で取れるようにダイレクトメッセージ機能を追加実装予定です。_

_また一覧ページにおいては中身のテキストが見えないため検索フォームなどで文章の箇所を検索できる機能を実装したいと考えております。_

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







