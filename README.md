# README

## odaisテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|image|text|
|title|text|

### Association
- belongs_to :user
- has_many :bokes
- has_many :categorys ,through: :odai_categorys
- has_many :odai_categorys


## odai_categorysテーブル
|Column|Type|Options|
|------|----|-------|
|odai|references|null: false,index: true, foreign_key: true|
|category|references|null: false,index: true, foreign_key: true|

### Association
- belongs_to :odai
- belongs_to :category


## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :odais ,through: :odai_categorys
- has_many :odai_categorys






## bokesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|tag|references|null: false, foreign_key: true|
|text|text|

### Association
- belong_to :user
- belong_to :odai
- has_many :stars
- has_many :comments
- has_many :tags ,through: :boke_tags
- has_many :boke_tags

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
- has_many :bokes ,through: :boke_tags
- has_many :boke_tags





## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|e-mail|string|null: false|
|password|string|null: false|

### Association
- has_many :odais
- has_many :bokes
- has_many :comments
- has_many :stars


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|boke|references|null: false, foreign_key: true|
|text|text|

### Association
- belong_to :user
- belong_to :boke
/Users/owner/Desktop/README push


## starsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|boke|references|null: false, foreign_key: true|

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

