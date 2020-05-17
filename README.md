# README

# アプリ名
## Todo−APP

# リンク
### https://blooming-cliffs-19410.herokuapp.com/
#### ベーシック認証をかけていますので、ご覧の際は以下のIDとPassを入力してください。
#### ID:admin
#### パスワード:s517

# テストアカウント
#### メールアドレス:todo@app.com
#### パスワード:todoapp5

## このアプリについて
#### 個人やグループでタスクの管理が簡単にできるアプリケーションです。
#### プログラミング学習のアウトプットとして、シンプルかつ使いやすさを自分なりに意識して作成しました。

## アプリ概要
#### deviseを用いたユーザー機能(新規登録機能、ログイン機能、ユーザー編集機能、ログアウト機能)
#### ログイン後、ユーザーのタスクを表示できる画面に遷移します。ヘッダーのアイコンからタスクの投稿が行えます。タスク作成にはカレンダー機能があり、素早く日時を入力することができます。投稿されたタスクをクリックするとタスクの詳細を閲覧、編集することができます。
#### またユーザー個人のタスクページにはグループを作成できる機能もあり、登録しているユーザーだけでグループを作成することができます。グループを作成すると個人のタスクページにグループ名が表示され、この名前をクリックするとグループのタスク管理ページに遷移します。このページではユーザー間のでタスクの共有が可能です。グループの編集をしてメンバーを増やすことや、解散をすることもできます。

# Todo-APP DB設計

## usersテーブル
|Column|Type|Option|
|------|----|------|
|nickname|string|null: false|
|email|string|null: false, unipue: true|
|password|string|null: false|
|user_image|string||

### association
has_many :tasks
has_many :groups, through: :groups_users
has_many :groups_users

## groupsテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|

### association
has_many :tasks
has_many :users, through: :groups_users
has_many :groups_users

## tasksテーブル
|Column|Type|Option|
|------|----|------|
|title|string|null: false|
|content|text||
|start_date|date||
|end_date|date||
|start_time_hour|integer||
|start_time_minute|integer||
|end_time_hour|integer||
|end_time_minute|integer||
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### association
belongs_to :user
belongs_to :group

## group_usersテーブル
|Column|Type|Option|
|------|----|------|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### association
belongs_to :user
belongs_to :group
