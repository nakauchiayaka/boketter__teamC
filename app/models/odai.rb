class Odai < ApplicationRecord
   # mount_uploader :image, ImageUploader
   belongs_to :user
   has_many :bokes
   mount_uploader :image, ImageUploader
end
