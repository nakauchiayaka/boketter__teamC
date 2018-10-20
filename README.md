# README

## titlesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|image|text|

### Association
- belongs_to :user
- has_many :bokes
- has_many :categorys ,through: :title_categorys


## title_categorysテーブル
|Column|Type|Options|
|------|----|-------|
|title|references|null: false,index: true, foreign_key: true|
|category|references|null: false,index: true, foreign_key: true|

### Association
- belongs_to :title
- belongs_to :category


## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :titles ,through: :title_categorys





## bokesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
|text|text|

### Association
- belong_to :user
- belong_to :title
- has_many :stars
- has_many :comments
- has_many :tags ,through: :boke_tags

## boke_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|boke|references|null: false,index: true, foreign_key: true|
|tag|references|null: false,index: true, foreign_key: true|

### Association
- belongs_to :boke
- belongs_to :tag

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :tags ,through: :boke_tags





## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|e-mail|text|null: false|
|password|text|null: false|

### Association
- has_many :titles
- has_many :bokes
- has_many :comments
- has_many :stars


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|boke_id|integer|null: false, foreign_key: true|
|text|text|

### Association
- belong_to :user
- belong_to :boke



## starsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|boke_id|integer|null: false, foreign_key: true|

### Association
- belong_to :user
- belong_to :boke





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
