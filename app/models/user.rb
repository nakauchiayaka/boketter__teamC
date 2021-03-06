class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :odais,    dependent: :destroy
  has_many :bokes,    dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :stars
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader

  validates :name,  length: {maximum: 10}
end
