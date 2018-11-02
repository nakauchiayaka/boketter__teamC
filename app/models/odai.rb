class Odai < ApplicationRecord
   # mount_uploader :image, ImageUploader
   belongs_to :user

   has_many :bokes
   has_many :categorys ,through: :odai_categorys
   has_many :odai_categorys

   mount_uploader :image, ImageUploader
end
