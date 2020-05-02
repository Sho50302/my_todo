# README

# my_todo DB設計

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
|start_date|datetime||
|end_date|datetime||
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### association
belongs_to :user
belongs_to :group

## groups_usersテーブル
|Column|Type|Option|
|------|----|------|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### association
belongs_to :user
belongs_to :group