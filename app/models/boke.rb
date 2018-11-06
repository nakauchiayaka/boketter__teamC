class Boke < ApplicationRecord
  belongs_to :odai
  belongs_to :user
  has_many :comments
  has_many :stars
  has_many :boke_tags
  has_many :tags ,through: :boke_tags
  has_many :categorys ,through: :boke_categorys
  has_many :boke_categorys

end
