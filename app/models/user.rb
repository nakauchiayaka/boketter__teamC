class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :odais
  has_many :stars

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,  length: {maximum: 10}
end
