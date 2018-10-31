class Category < ApplicationRecord
  has_many :odais ,through: :odai_categorys
  has_many :odai_categorys
end
