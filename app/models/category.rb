class Category < ApplicationRecord
  has_many :odais ,through: :odai_categorys
  has_many :odai_categorys
  has_many :bokes ,through: :boke_categorys
  has_many :boke_categorys
end
